unit Streamer;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, gst;

type

  { TStreamer }

  TStreamer = class(TObject)
  public
    constructor Create(const song: string);
    procedure Start;
    procedure Play;
    procedure Pause;
    procedure Stop;
    procedure spring(ms: Integer);
    function GetPosition: integer;
    function GetDuration:Integer;
  private
    fsong: string;
    pipeline: PGstElement;
  end;

const
  G_USEC_PER_SEC = 1000000;


implementation

constructor TStreamer.Create(const song: string);
begin
  pipeline := nil;
  fsong := song;
end;

procedure TStreamer.Start;
begin
  if pipeline = nil then begin
    pipeline := gst_parse_launch(PChar(fsong), nil);
    //    pipeline := gst_parse_launch('filesrc location=test.flac ! decodebin3 ! audioconvert ! audioresample ! autoaudiosink', nil);
  end;
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

procedure TStreamer.spring(ms:Integer);
begin
  gst_element_seek_simple(pipeline, GST_FORMAT_TIME, TGstSeekFlags(int64(GST_SEEK_FLAG_FLUSH) or int64(GST_SEEK_FLAG_KEY_UNIT)), ms * G_USEC_PER_SEC); // 6s
end;

function TStreamer.GetPosition: integer;
var
  current: Tgint64;
begin
  gst_element_query_position(pipeline, GST_FORMAT_TIME, @current);
  Result := current div G_USEC_PER_SEC;
end;

function TStreamer.GetDuration: Integer;
var
  current: Tgint64;
begin
  gst_element_query_duration(pipeline, GST_FORMAT_TIME, @current);
  Result := current div G_USEC_PER_SEC;
end;

begin
  gst_init(@argc, @argv);
end.
