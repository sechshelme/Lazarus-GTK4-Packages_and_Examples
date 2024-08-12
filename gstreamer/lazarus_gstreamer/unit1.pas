unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  ComCtrls, gst, Streamer, PlayPanel;

  // https://forums.developer.nvidia.com/t/pipeline-ends-after-4-seconds-with-gst-message-eos/253486

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    playpanel: array of TPlayerPanel;
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
var
  i: integer;
begin
  SetLength(playpanel, 5);
  for i := 0 to Length(playpanel) - 1 do begin
    playpanel[i] := TPlayerPanel.Create(self);
    with playpanel[i] do begin
      Parent := Self;
      Width := self.ClientWidth;
      Top := 100 * i;
      Anchors := [akLeft, akTop, akRight];
      CreateSound('filesrc location=../test.mp3 !  mpegaudioparse ! mpg123audiodec ! audioconvert ! audioresample ! autoaudiosink ! volume volume=0.1');
    end;
  end;
  Timer1.Enabled := True;
  ClientWidth := 600;
  ClientHeight := Length(playpanel) * 100;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to Length(playpanel) - 1 do begin
    playpanel[i].Timer;
  end;
end;

end.
