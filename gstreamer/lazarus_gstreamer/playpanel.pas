unit PlayPanel;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  ComCtrls, gst, Streamer;

const
  cmStart = 1000;
  cmPlay = 1001;
  cmPause = 1002;
  cmStop = 1003;
  cmSpring = 1004;
  cmVolume = 1005;

type

  { TPlayerPanel }

  TPlayerPanel = class(TPanel)
  public
    constructor Create(TheOwner: TComponent); override;
    destructor Destroy; override;
    procedure CreateSound(const song: string);

    procedure Timer;
    procedure printTime(time: integer);
  private
    StartBtn, PlayBtn, PauseBtn, StopBtn, SpringBtn, VolumeBtn: TButton;
    TrackBar: TTrackBar;
    TimeLabel: TLabel;
    st: TStreamer;
    procedure BtnClick(Sender: TObject);
    procedure TrackBarChange(Sender: TObject);
  end;

implementation


function GstClockToStr(t: TGstClockTime): string;
var
  ms, s, min: TGstClockTime;
  i: integer;
begin
  min := t div 60000;
  s := (t mod 60000) div 1000;
  ms := t mod 1000;
  WriteStr(Result, min: 3, ':', s: 2, ':', ms: 3);
  for i := 1 to Length(Result) do begin
    if Result[i] = ' ' then begin
      Result[i] := '0';
    end;
  end;
end;


procedure TPlayerPanel.BtnClick(Sender: TObject);
begin
  case TButton(Sender).Tag of
    cmStart: begin
      st.Start;
      TrackBar.Position := 0;
    end;
    cmPlay: begin
      st.Play;
    end;
    cmPause: begin
      st.Pause;
    end;
    cmStop: begin
      st.Stop;
    end;
    cmSpring: begin
      st.spring(6000);
      ;
    end;
    cmVolume: begin
      st.SetVolume(0.1);
    end;
  end;
end;

procedure TPlayerPanel.TrackBarChange(Sender: TObject);
begin
  st.spring(TrackBar.Position);
  WriteLn('change');
end;


constructor TPlayerPanel.Create(TheOwner: TComponent);
const
  w = 50;
  t = 50;
begin
  inherited  Create(TheOwner);
  Height := 100;

  TimeLabel := TLabel.Create(Self);
  with TimeLabel do begin
    Top := t;
    Left := 320;
    Caption := 'time';
    Parent := Self;
  end;

  TrackBar := TTrackBar.Create(Self);
  with TrackBar do begin
    Left := 5;
    Top := 5;
    Width := Self.Width - 10;
    Anchors := [akLeft, akTop, akRight];
    OnChange := @TrackBarChange;
    Parent := Self;
  end;

  StartBtn := TButton.Create(Self);
  with StartBtn do begin
    Left := 0 * w + 5;
    Width := w;
    Top := t;
    Caption := 'start';
    Parent := Self;
    tag := cmStart;
    OnClick := @BtnClick;
  end;

  PlayBtn := TButton.Create(Self);
  with PlayBtn do begin
    Left := 1 * w + 5;
    Width := w;
    Top := t;
    Caption := 'play';
    Parent := Self;
    tag := cmPlay;
    OnClick := @BtnClick;
  end;

  PauseBtn := TButton.Create(Self);
  with PauseBtn do begin
    Left := 2 * w + 5;
    Width := w;
    Top := t;
    Caption := 'pause';
    Parent := Self;
    tag := cmPause;
    OnClick := @BtnClick;
  end;

  StopBtn := TButton.Create(Self);
  with StopBtn do begin
    Left := 3 * w + 5;
    Width := w;
    Top := t;
    Caption := 'stop';
    Parent := Self;
    tag := cmStop;
    OnClick := @BtnClick;
  end;

  SpringBtn := TButton.Create(Self);
  with SpringBtn do begin
    Left := 4 * w + 5;
    Width := w;
    Top := t;
    Caption := 'spring';
    Parent := Self;
    tag := cmSpring;
    OnClick := @BtnClick;
  end;

  VolumeBtn := TButton.Create(Self);
  with VolumeBtn do begin
    Left := 5 * w + 5;
    Width := w;
    Top := t;
    Caption := 'volume';
    Parent := Self;
    tag := cmVolume;
    OnClick := @BtnClick;
  end;

end;

destructor TPlayerPanel.Destroy;
begin
  st.Free;
  inherited Destroy;
end;

procedure TPlayerPanel.CreateSound(const song: string);
begin
  //  st := TStreamer.Create('filesrc location=../test.mp3 !  mpegaudioparse ! mpg123audiodec ! audioconvert ! audioresample ! autoaudiosink ! volume volume=0.5');
  st := TStreamer.Create(song);
end;

procedure TPlayerPanel.Timer;
var
  oldChange: TNotifyEvent;
  p, d: integer;
begin
  oldChange := TrackBar.OnChange;
  TrackBar.OnChange := nil;
  p := st.GetPosition;
  d := st.GetDuration;
  TrackBar.Max := d;
  TrackBar.Position := p;
  TrackBar.OnChange := oldChange;
  WriteLn('dur: ', d, '   pos: ', p, '  state: ', st.getState);
  TimeLabel.Caption := GstClockToStr(p);

end;

procedure TPlayerPanel.printTime(time: integer);
begin
end;


end.
