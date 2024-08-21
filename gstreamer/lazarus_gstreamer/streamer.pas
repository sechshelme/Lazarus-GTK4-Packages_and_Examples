unit Streamer;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, glib2, gst;

type
  TPipelineElement = record
    pipeline,
    volume: PGstElement;
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

function gst_stream_volume_get_type(): GType; cdecl; external 'gstaudio-1.0';


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
  stat: TGboolean;
  ct: integer = 0;
begin
  repeat
    sleep(1);
    stat := gst_element_query_duration(pE^.pipeline, GST_FORMAT_TIME, @pE^.Duration);
    WriteLn(ct: 4, ' stat:', stat, '  duration: ', pE^.Duration);
    Inc(ct);
  until stat or (ct > 100);
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

begin
  pipelineElement.pipeline := nil;
  fsongPath := AsongPath;
  pipelineElement.Duration := -1;

  pipelineElement.pipeline := gst_parse_launch(PChar('filesrc location="' + fsongPath + '" ! decodebin ! audioconvert ! audioresample ! volume ! autoaudiosink'), nil);
  pipelineElement.volume := gst_bin_get_by_interface(GST_BIN(pipelineElement.pipeline), gst_stream_volume_get_type());

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
