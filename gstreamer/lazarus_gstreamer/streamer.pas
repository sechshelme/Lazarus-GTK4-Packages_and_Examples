unit Streamer;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, glib2, gst;

type
  TCustomData = record
    index: integer;
    state: TGstState;
    volume: PGstElement;
  end;
  PCustomData = ^TCustomData;

type

  { TStreamer }

  TStreamer = class(TObject)
  public
    constructor Create(const song: string);
    procedure Start;
    procedure Play;
    procedure Pause;
    procedure Stop;
    procedure spring(ms: integer);
    function GetPosition: integer;
    function GetDuration: integer;
    procedure SetVolume(vol: gdouble);
    procedure printInfo;
    function getState: string;
  private
    customData: TCustomData;
    fsong: string;
    pipeline: PGstElement;
  end;

const
  G_USEC_PER_SEC = 1000000;


implementation

procedure state_changed_cb(bus: PGstBus; msg: PGstMessage; Data: Pointer);
var
  CustomData: PCustomData absolute Data;
  old_state, new_state, pending_state: TGstState;
begin
  gst_message_parse_state_changed(msg, @old_state, @new_state, @pending_state);
  //  WriteLn('index: ', CustomData^.Index, '   state Changed; ',  new_state);
  CustomData^.state := new_state;
end;

constructor TStreamer.Create(const song: string);
begin
  pipeline := nil;
  fsong := song;
end;

procedure TStreamer.Start;
var
  mp: PGstElement;
  bus: PGstBus;
begin
//  fsong := 'filesrc location=../test.mp3 !  mpegaudioparse ! mpg123audiodec ! audioconvert ! audioresample ! autoaudiosink';
//  fsong := 'filesrc location=../test.mp3 !  mpegaudioparse ! mpg123audiodec ! audioconvert ! audioresample ! autoaudiosink ! volume volume=0.5';

  if pipeline = nil then begin
    pipeline := gst_parse_launch(PChar(fsong), nil);

    //    mp := gst_element_factory_make('mpg123audiodec', 'decoder');

    //    gst_bin_add_many(GST_BIN(pipeline), mp, [nil]);
    //    gst_element_link_many( mp,nil);

    //    g_object_set(pipeline, 'location', '../test.mp3', nil);


    //    pipeline := gst_parse_launch('filesrc location=test.flac ! decodebin3 ! audioconvert ! audioresample ! autoaudiosink', nil);


//customData.volume := gst_bin_get_by_name(GST_BIN(pipeline), 'volume0');
customData.volume := gst_element_factory_make('volume', 'volume-control');
    if customData.volume = nil then begin
      WriteLn('Volume Error');
    end;
    gst_bin_add_many(GST_BIN(pipeline), customData.volume,[nil]);



  end;


  customData.index := 1234;
  bus := gst_element_get_bus(pipeline);
  gst_bus_add_signal_watch(bus);
  g_signal_connect(G_OBJECT(bus), 'message::state-changed', TGCallback(@state_changed_cb), @customData);
  gst_object_unref(bus);
end;

procedure TStreamer.Play;
begin
  gst_element_set_state(pipeline, GST_STATE_PLAYING);
end;

procedure TStreamer.Pause;
begin
  gst_element_set_state(pipeline, GST_STATE_PAUSED);
end;

procedure TStreamer.Stop;
begin
  gst_element_set_state(pipeline, GST_STATE_READY);
end;

procedure TStreamer.spring(ms: integer);
begin
  //  gst_element_seek_simple(pipeline, GST_FORMAT_TIME, TGstSeekFlags(int64(GST_SEEK_FLAG_FLUSH) or int64(GST_SEEK_FLAG_KEY_UNIT)), ms * G_USEC_PER_SEC);
  gst_element_seek_simple(pipeline, GST_FORMAT_TIME, TGstSeekFlags(0), ms * G_USEC_PER_SEC);
end;

function TStreamer.GetPosition: integer;
var
  current: Tgint64;
begin
  gst_element_query_position(pipeline, GST_FORMAT_TIME, @current);
  Result := current div G_USEC_PER_SEC;
end;

function TStreamer.GetDuration: integer;
var
  current: Tgint64;
begin
  gst_element_query_duration(pipeline, GST_FORMAT_TIME, @current);
  Result := current div G_USEC_PER_SEC;
end;

procedure TStreamer.SetVolume(vol: gdouble);
begin
  g_object_set(customData.volume, 'volume', vol, nil);
//  g_object_set(customData.volume, 'mute', gTRUE, nil);
  WriteLn('volume: ',vol:4:2);
end;

procedure TStreamer.printInfo;
var
  n_audio, n_text: gint;
begin
  g_object_get(pipeline, 'n-audio', @n_audio, nil);
  WriteLn('n-audio: ', n_audio);
  g_object_get(pipeline, 'n-text', @n_text, nil);
  WriteLn('n-text: ', n_text);
end;

function TStreamer.getState: string;
begin
  WriteStr(Result, customData.state);
end;

begin
  gst_init(@argc, @argv);
end.
