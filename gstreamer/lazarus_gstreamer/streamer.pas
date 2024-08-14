unit Streamer;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, glib2, gst;

type
  TCustomData = record
    index: integer;
    state: TGstState;
    //    volume: PGstElement;
  end;
  PCustomData = ^TCustomData;

  TPipelineElement = record
    pipeline,
    filesrc,
    mpegaudioparse,
    mpg123audiodec,
    audioconvert,
    audioresample,
    volume,
    autoaudiosink: PGstElement;
  end;

type

  { TStreamer }

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
    customData: TCustomData;
    fsongPath: string;
    pipeline: TPipelineElement;
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

procedure state_changed_cb(bus: PGstBus; msg: PGstMessage; Data: Pointer);
var
  CustomData: PCustomData absolute Data;
  old_state, new_state, pending_state: TGstState;
begin
  gst_message_parse_state_changed(msg, @old_state, @new_state, @pending_state);
  //  WriteLn('index: ', CustomData^.Index, '   state Changed; ',  new_state);
  CustomData^.state := new_state;
end;

constructor TStreamer.Create(const AsongPath: string);
begin
  pipeline.pipeline := nil;
  fsongPath := AsongPath;
  Start;
end;

procedure TStreamer.Start;
var
  mp: PGstElement;
  bus: PGstBus;
begin
  if pipeline.pipeline = nil then begin
    //    pipeline := gst_parse_launch(PChar(fsongPath), nil);

    pipeline.pipeline := gst_pipeline_new('audio-player');
    TestIO(pipeline.pipeline, 'pipeline');

    pipeline.filesrc := gst_element_factory_make('filesrc', 'filesrc');
    TestIO(pipeline.filesrc, 'filesrc');

    pipeline.mpegaudioparse := gst_element_factory_make('mpegaudioparse', 'mpegaudioparse');
    TestIO(pipeline.mpegaudioparse, 'mpegaudioparse');

    pipeline.mpg123audiodec := gst_element_factory_make('mpg123audiodec', 'mpg123audiodec');
    TestIO(pipeline.mpg123audiodec, 'mpg123audiodec');

    pipeline.audioconvert := gst_element_factory_make('audioconvert', 'audioconvert');
    TestIO(pipeline.audioconvert, 'audioconvert');

    pipeline.audioresample := gst_element_factory_make('audioresample', 'audioresample');
    TestIO(pipeline.audioresample, 'audioresample');

    pipeline.volume := gst_element_factory_make('volume', 'volume');
    TestIO(pipeline.volume, 'volume');

    pipeline.autoaudiosink := gst_element_factory_make('autoaudiosink', 'autoaudiosink');
    TestIO(pipeline.autoaudiosink, 'autoaudiosink');

    g_object_set(pipeline.filesrc, 'location', PChar(fsongPath), nil);

    with pipeline do begin
      gst_bin_add_many(GST_BIN(pipeline), filesrc, [mpegaudioparse, mpg123audiodec, audioconvert, audioresample, volume, autoaudiosink, nil]);

      WriteLn('filesrc        -> mpegaudioparse: ', gst_element_link(filesrc, mpegaudioparse));
      WriteLn('mpegaudioparse -> mpg123audiodec: ', gst_element_link(mpegaudioparse, mpg123audiodec));
      WriteLn('mpg123audiodec -> audioconvert  : ', gst_element_link(mpg123audiodec, audioconvert));
      WriteLn('audioconvert   -> audioresample : ', gst_element_link(audioconvert, audioresample));
      WriteLn('audioresample  -> volume        : ', gst_element_link(audioresample, volume));
      WriteLn('volume         -> autoaudiosink : ', gst_element_link(volume, autoaudiosink));
    end;
  end;
  customData.index := 1234;
  bus := gst_element_get_bus(pipeline.pipeline);
  gst_bus_add_signal_watch(bus);
  g_signal_connect(G_OBJECT(bus), 'message::state-changed', TGCallback(@state_changed_cb), @customData);
  gst_object_unref(bus);
end;

procedure TStreamer.Play;
begin
  gst_element_set_state(pipeline.pipeline, GST_STATE_PLAYING);
end;

procedure TStreamer.Pause;
begin
  gst_element_set_state(pipeline.pipeline, GST_STATE_PAUSED);
end;

procedure TStreamer.Stop;
begin
  gst_element_set_state(pipeline.pipeline, GST_STATE_READY);
end;

procedure TStreamer.spring(ms: integer);
begin
  //  gst_element_seek_simple(pipeline, GST_FORMAT_TIME, TGstSeekFlags(int64(GST_SEEK_FLAG_FLUSH) or int64(GST_SEEK_FLAG_KEY_UNIT)), ms * G_USEC_PER_SEC);
  gst_element_seek_simple(pipeline.pipeline, GST_FORMAT_TIME, TGstSeekFlags(0), ms * G_USEC_PER_SEC);
end;

function TStreamer.GetPosition: integer;
var
  current: Tgint64;
begin
  gst_element_query_position(pipeline.pipeline, GST_FORMAT_TIME, @current);
  Result := current div G_USEC_PER_SEC;
end;

function TStreamer.GetDuration: integer;
var
  current: Tgint64;
begin
  gst_element_query_duration(pipeline.pipeline, GST_FORMAT_TIME, @current);
  Result := current div G_USEC_PER_SEC;
end;

procedure TStreamer.SetVolume(vol: gdouble);
begin
  g_object_set(pipeline.volume, 'volume', vol, nil);
  //  g_object_set(customData.volume, 'mute', gTRUE, nil);
  WriteLn('volume: ', vol: 4: 2);
end;

procedure TStreamer.SetMute(mute: Boolean);
begin
    g_object_set(pipeline.volume, 'mute', gboolean(mute), nil);
end;

procedure TStreamer.printInfo;
var
  n_audio, n_text: gint;
begin
  g_object_get(pipeline.pipeline, 'n-audio', @n_audio, nil);
  WriteLn('n-audio: ', n_audio);
  g_object_get(pipeline.pipeline, 'n-text', @n_text, nil);
  WriteLn('n-text: ', n_text);
end;

function TStreamer.getState: string;
begin
  WriteStr(Result, customData.state);
end;

begin
  gst_init(@argc, @argv);
end.
