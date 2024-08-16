unit Streamer;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, glib2, gst;

type
  TPipelineElement = record
    pipeline,
    filesrc,
    mpegaudioparse,
    mpg123audiodec,
    audioconvert,
    audioresample,
    volume,
    autoaudiosink: PGstElement;
    state: TGstState;
    Duration: Tgint64;
  end;
  PPipelineElement=^TPipelineElement;

type
  TStreamer = class(TObject)
  public
    constructor Create(const AsongPath: string);
    procedure Start;
    procedure Play;
    procedure Pause;
    procedure Stop;
    procedure spring(ms: integer);
    function GetPosition: integer;
    function GetDuration: integer;
    procedure SetVolume(vol: gdouble);
    procedure SetMute(mute:Boolean);
    procedure printInfo;
    function getState: string;
  private
    fsongPath: string;
    pipelineElement: TPipelineElement;
  end;

const
  G_USEC_PER_SEC = 1000000;


implementation

procedure TestIO(element: Pointer; const s: string);
begin
  if element = nil then begin
    WriteLn(s, ': error !');
  end else begin
    WriteLn(s, ': io.');
  end;
end;

procedure test_cb(bus: PGstBus; msg: PGstMessage; Data: Pointer);
begin
//  WriteLn(GST_MESSAGE_TYPE(msg));
end;

procedure duration_cb(bus: PGstBus; msg: PGstMessage; Data: Pointer);
var
  pE: PPipelineElement absolute Data;
begin
  gst_element_query_duration(pE^.pipeline, GST_FORMAT_TIME, @pE^.Duration);
  WriteLn('duration');
end;

procedure state_changed_cb(bus: PGstBus; msg: PGstMessage; Data: Pointer);
var
  pE: PPipelineElement absolute Data;
  old_state, new_state, pending_state: TGstState;
begin
  gst_message_parse_state_changed(msg, @old_state, @new_state, @pending_state);
  pE^.state := new_state;
end;

procedure eos_cb(bus: PGstBus; msg: PGstMessage; Data: Pointer);
var
  pE: PPipelineElement absolute Data;
begin
  gst_element_set_state(pE^.pipeline, GST_STATE_READY);
end;

// =========================

constructor TStreamer.Create(const AsongPath: string);
var
  mp: PGstElement;
  bus: PGstBus;
begin
  pipelineElement.pipeline := nil;
  fsongPath := AsongPath;
  pipelineElement.Duration:=-1;

  if pipelineElement.pipeline = nil then begin
    pipelineElement.pipeline := gst_pipeline_new('audio-player');
    TestIO(pipelineElement.pipeline, 'pipeline');

    pipelineElement.filesrc := gst_element_factory_make('filesrc', 'filesrc');
    TestIO(pipelineElement.filesrc, 'filesrc');

    pipelineElement.mpegaudioparse := gst_element_factory_make('mpegaudioparse', 'mpegaudioparse');
    TestIO(pipelineElement.mpegaudioparse, 'mpegaudioparse');

    pipelineElement.mpg123audiodec := gst_element_factory_make('mpg123audiodec', 'mpg123audiodec');
    TestIO(pipelineElement.mpg123audiodec, 'mpg123audiodec');

    pipelineElement.audioconvert := gst_element_factory_make('audioconvert', 'audioconvert');
    TestIO(pipelineElement.audioconvert, 'audioconvert');

    pipelineElement.audioresample := gst_element_factory_make('audioresample', 'audioresample');
    TestIO(pipelineElement.audioresample, 'audioresample');

    pipelineElement.volume := gst_element_factory_make('volume', 'volume');
    TestIO(pipelineElement.volume, 'volume');

    pipelineElement.autoaudiosink := gst_element_factory_make('autoaudiosink', 'autoaudiosink');
    TestIO(pipelineElement.autoaudiosink, 'autoaudiosink');

    g_object_set(pipelineElement.filesrc, 'location', PChar(fsongPath), nil);

    with pipelineElement do begin
      gst_bin_add_many(GST_BIN(pipeline), filesrc, [mpegaudioparse, mpg123audiodec, audioconvert, audioresample, volume, autoaudiosink, nil]);

      WriteLn('filesrc        -> mpegaudioparse: ', gst_element_link(filesrc, mpegaudioparse));
      WriteLn('mpegaudioparse -> mpg123audiodec: ', gst_element_link(mpegaudioparse, mpg123audiodec));
      WriteLn('mpg123audiodec -> audioconvert  : ', gst_element_link(mpg123audiodec, audioconvert));
      WriteLn('audioconvert   -> audioresample : ', gst_element_link(audioconvert, audioresample));
      WriteLn('audioresample  -> volume        : ', gst_element_link(audioresample, volume));
      WriteLn('volume         -> autoaudiosink : ', gst_element_link(volume, autoaudiosink));
    end;
  end;
  bus := gst_element_get_bus(pipelineElement.pipeline);
  gst_bus_add_signal_watch(bus);
  g_signal_connect(G_OBJECT(bus), 'message::state-changed', TGCallback(@state_changed_cb), @pipelineElement);
  g_signal_connect(G_OBJECT(bus), 'message::eos', TGCallback(@eos_cb), @pipelineElement);
  g_signal_connect(G_OBJECT(bus), 'message', TGCallback(@test_cb), @pipelineElement);
  g_signal_connect(G_OBJECT(bus), 'message::duration-changed', TGCallback(@duration_cb), @pipelineElement);
  gst_object_unref(bus);
end;

procedure TStreamer.Start;
begin
  gst_element_set_state(pipelineElement.pipeline, GST_STATE_READY);
end;

procedure TStreamer.Play;
begin
  gst_element_set_state(pipelineElement.pipeline, GST_STATE_PLAYING);
end;

procedure TStreamer.Pause;
begin
  gst_element_set_state(pipelineElement.pipeline, GST_STATE_PAUSED);
end;

procedure TStreamer.Stop;
begin
  gst_element_set_state(pipelineElement.pipeline, GST_STATE_READY);
end;

procedure TStreamer.spring(ms: integer);
begin
  //  gst_element_seek_simple(pipelineElement, GST_FORMAT_TIME, TGstSeekFlags(int64(GST_SEEK_FLAG_FLUSH) or int64(GST_SEEK_FLAG_KEY_UNIT)), ms * G_USEC_PER_SEC);
  gst_element_seek_simple(pipelineElement.pipeline, GST_FORMAT_TIME, TGstSeekFlags(0), ms * G_USEC_PER_SEC);
end;

function TStreamer.GetPosition: integer;
var
  current: Tgint64;
begin
  gst_element_query_position(pipelineElement.pipeline, GST_FORMAT_TIME, @current);
  Result := current div G_USEC_PER_SEC;
end;

function TStreamer.GetDuration: integer;
var
  current: Tgint64;
begin
//  gst_element_query_duration(pipelineElement.pipeline, GST_FORMAT_TIME, @current);
//  Result := current div G_USEC_PER_SEC;
  Result := pipelineElement.Duration div G_USEC_PER_SEC;
end;

procedure TStreamer.SetVolume(vol: gdouble);
begin
  g_object_set(pipelineElement.volume, 'volume', vol, nil);
end;

procedure TStreamer.SetMute(mute: Boolean);
begin
    g_object_set(pipelineElement.volume, 'mute', gboolean(mute), nil);
end;

procedure TStreamer.printInfo;
var
  n_audio, n_text: gint;
begin
  g_object_get(pipelineElement.pipeline, 'n-audio', @n_audio, nil);
  WriteLn('n-audio: ', n_audio);
  g_object_get(pipelineElement.pipeline, 'n-text', @n_text, nil);
  WriteLn('n-text: ', n_text);
end;

function TStreamer.getState: string;
begin
  WriteStr(Result, pipelineElement.state);
end;

begin
  gst_init(@argc, @argv);
end.
