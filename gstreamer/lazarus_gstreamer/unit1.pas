unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  gst;

  // https://forums.developer.nvidia.com/t/pipeline-ends-after-4-seconds-with-gst-message-eos/253486

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    pipeline: PGstElement;

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

function GstClockToStr(t: TGstClockTime): string;
var
  ms, s, min: TGstClockTime;
begin
  t := t div 1000000;
  min := t div 60000;
  s := (t mod 60000) div 1000;
  ms := t mod 1000;
  WriteStr(Result, min, ':', s: 2, ':', ms: 3);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  gst_init(@argc, @argv);
  pipeline := nil;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  current: Tgint64;
begin
  gst_element_query_position(pipeline, GST_FORMAT_TIME, @current);
  Caption := GstClockToStr(current);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  gst_element_set_state(pipeline, GST_STATE_PLAYING);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
    gst_element_set_state(pipeline, GST_STATE_PAUSED);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  gst_element_seek_simple(pipeline, GST_FORMAT_TIME, TGstSeekFlags(int64(GST_SEEK_FLAG_FLUSH) or int64(GST_SEEK_FLAG_KEY_UNIT)), 6000000000); // 6s
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
    gst_element_set_state(pipeline, GST_STATE_READY);
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  //  pipeline := gst_parse_launch('playbin uri=file:/n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/GTK2/gstreamer/test.mp3', nil);
  if pipeline = nil then begin
    pipeline := gst_parse_launch('filesrc location=../test.mp3 !  mpegaudioparse ! mpg123audiodec ! audioconvert ! audioresample ! pulsesink', nil);
    //    pipeline := gst_parse_launch('filesrc location=test.flac ! decodebin3 ! audioconvert ! audioresample ! autoaudiosink', nil);
  end;
  Timer1.Enabled := True;
end;

end.
