unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  ComCtrls, gst, Streamer;

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
    TrackBar1: TTrackBar;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
  private
    st: TStreamer;
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
  min := t div 60000;
  s := (t mod 60000) div 1000;
  ms := t mod 1000;
  WriteStr(Result, min, ':', s: 2, ':', ms: 3);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  st := TStreamer.Create('filesrc location=../test.mp3 !  mpegaudioparse ! mpg123audiodec ! audioconvert ! audioresample ! pulsesink');
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  st.Free;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  current: Integer;
  oldChange: TNotifyEvent;
begin
  current := st.GetPosition;
  oldChange:=TrackBar1.OnChange;
  TrackBar1.OnChange:=nil;
  TrackBar1.Max:=st.GetDuration;
  TrackBar1.Position:=current;
  TrackBar1.OnChange:=oldChange;
end;

procedure TForm1.TrackBar1Change(Sender: TObject);
var
  oldChange: TNotifyEvent;
begin
//  Timer1.Enabled:=False;
  st.spring(TrackBar1.Position);
  WriteLn('change');
//  Timer1.Enabled:=True;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  st.Play;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  st.Pause;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  st.spring(6000);;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  st.Stop;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  st.Start;
  TrackBar1.Position:=0;
  Timer1.Enabled := True;
end;

end.
