unit Streamer;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, glib2, gst;

type
  TPipelineElement = record
    pipeline,
    volume: PGstElement;
    Elements: array of PGstElement;
    state: TGstState;
    Duration: Tgint64;
  end;
  PPipelineElement = ^TPipelineElement;

type
  TStreamer = class(TObject)
  public
    constructor Create(const AsongPath: string);
    destructor Destroy; override;
    procedure Play;
    procedure Pause;
    procedure Stop;
    procedure spring(ms: integer);
    function GetPosition: integer;
    function GetDuration: integer;
    procedure SetVolume(vol: gdouble);
    procedure SetMute(mute: boolean);
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
  case GST_MESSAGE_TYPE(msg) of
    GST_MESSAGE_ERROR: begin
      WriteLn('Fehler');
    end;
  end;
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
  bus: PGstBus;
  len: SizeInt;
  i: integer;
  pc: PChar;
  pipelines: array of PChar;
const
  mp3Pipeline: array of PChar = ('filesrc', 'mpegaudioparse', 'mpg123audiodec', 'audioconvert', 'audioresample', 'volume', 'autoaudiosink');
  flacPipeline: array of PChar = ('filesrc', 'flacparse', 'flacdec', 'audioconvert', 'audioresample', 'volume', 'autoaudiosink');
begin

  WriteLn('path: ', ExtractFileExt(AsongPath));
  WriteLn('path: ', AsongPath);
  case ExtractFileExt(AsongPath) of
    '.flac': begin
      pipelines := flacPipeline;
    end;
    '.mp3': begin
      pipelines := mp3Pipeline;
    end;
    else begin
      Exit;
    end;
  end;

  pipelineElement.pipeline := nil;
  fsongPath := AsongPath;
  pipelineElement.Duration := -1;

  pipelineElement.pipeline := gst_pipeline_new('pipeline');
  TestIO(pipelineElement.pipeline, 'pipeline');

  len := Length(pipelines);
  SetLength(pipelineElement.Elements, len);
  for i := 0 to len - 1 do begin
    pc := pipelines[i];
    pipelineElement.Elements[i] := gst_element_factory_make(pc, pc);
    TestIO(pipelineElement.Elements[i], pc);
    gst_bin_add(GST_BIN(pipelineElement.pipeline), pipelineElement.Elements[i]);
  end;
  pipelineElement.volume := pipelineElement.Elements[len - 2];

  for i := 0 to len - 1 - 1 do begin
    WriteLn('link: ', pipelines[i]: 16, ' -> ', pipelines[i + 1]: 16, '  ', gst_element_link(pipelineElement.Elements[i], pipelineElement.Elements[i + 1]));
  end;
  g_object_set(pipelineElement.Elements[0], 'location', PChar(fsongPath), nil);

  bus := gst_element_get_bus(pipelineElement.pipeline);
  gst_bus_add_signal_watch(bus);
  g_signal_connect(G_OBJECT(bus), 'message::state-changed', TGCallback(@state_changed_cb), @pipelineElement);
  g_signal_connect(G_OBJECT(bus), 'message::eos', TGCallback(@eos_cb), @pipelineElement);
  g_signal_connect(G_OBJECT(bus), 'message', TGCallback(@test_cb), @pipelineElement);
  g_signal_connect(G_OBJECT(bus), 'message::duration-changed', TGCallback(@duration_cb), @pipelineElement);
  gst_object_unref(bus);
end;

destructor TStreamer.Destroy;
var
  i: integer;
begin
  gst_object_unref(pipelineElement.pipeline);
  inherited Destroy;
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
  Result := pipelineElement.Duration div G_USEC_PER_SEC;
end;

procedure TStreamer.SetVolume(vol: gdouble);
begin
  g_object_set(pipelineElement.volume, 'volume', vol, nil);
end;

procedure TStreamer.SetMute(mute: boolean);
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
