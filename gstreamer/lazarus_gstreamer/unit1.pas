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
const
  song: array of PChar =
    (('/n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/test.wav'),
    ('/n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/test.flac'),
    ('/n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/test.mp3'),
    ('/n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/test.ogg'),
    ('/n4800/Multimedia/Music/Disco/Boney M/1981 - Boonoonoonoos/01 - Boonoonoonoos.flac'),
    ('/n4800/Multimedia/Music/Diverses/MP3 Diverse/DJ_Shaolin-Popcorn_(Hot_Butter_cover).mp3'));
begin
  SetLength(playpanel, Length(song));
  for i := 0 to Length(playpanel) - 1 do begin
    playpanel[i] := TPlayerPanel.Create(self);
    with playpanel[i] do begin
      Parent := Self;
      Width := self.ClientWidth;
      Top := 100 * i;
      Anchors := [akLeft, akTop, akRight];
      CreateSound(song[i]);
    end;
  end;
  Timer1.Enabled := True;
  Timer1.Interval := 100;
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
