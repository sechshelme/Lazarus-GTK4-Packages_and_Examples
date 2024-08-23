unit PlayPanel;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  ComCtrls, gst, Streamer;

const
  cmPlay = 1001;
  cmPause = 1002;
  cmStop = 1003;
  cmSpring = 1004;

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
    PlayBtn, PauseBtn, StopBtn, SpringBtn: TButton;
    MuteCheckBox: TCheckBox;
    TrackBar, VolumeBar: TTrackBar;
    DurLabel, PosLabel, StateLabel: TLabel;
    st: TStreamer;
    IsChange: boolean;
    sinCounter: int64;
    procedure BtnClick(Sender: TObject);
    procedure MuteClick(Sender: TObject);
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
    end;
  end;
end;

procedure TPlayerPanel.MuteClick(Sender: TObject);
begin
  if st <> nil then  begin
    st.SetMute(MuteCheckBox.Checked);
  end;
end;

procedure TPlayerPanel.TrackBarChange(Sender: TObject);
begin
  IsChange := True;
  //  st.spring(TrackBar.Position);
end;

constructor TPlayerPanel.Create(TheOwner: TComponent);
const
  w = 50;
  t = 50;
begin
  inherited  Create(TheOwner);
  Height := 100;
  IsChange := False;

  PosLabel := TLabel.Create(Self);
  with PosLabel do begin
    Top := t;
    Left := 370;
    Caption := 'Postime';
    Parent := Self;
  end;

  DurLabel := TLabel.Create(Self);
  with DurLabel do begin
    Top := t;
    Left := 470;
    Caption := 'Durtime';
    Parent := Self;
  end;

  StateLabel := TLabel.Create(Self);
  with StateLabel do begin
    Top := t + 25;
    Left := 470;
    Caption := 'State';
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

  VolumeBar := TTrackBar.Create(Self);
  with VolumeBar do begin
    Left := 5 * w + 5;
    Width := w * 2;
    Top := t;
    Caption := 'volume';
    Parent := Self;
    Max := 1000;
    Position := 1000;
  end;

  MuteCheckBox := TCheckBox.Create(Self);
  with MuteCheckBox do begin
    Top := t + 25;
    Left := 370;
    Caption := 'Mute';
    Parent := Self;
    OnChange := @MuteClick;
  end;

end;

destructor TPlayerPanel.Destroy;
begin
  st.Free;
  inherited Destroy;
end;

procedure TPlayerPanel.CreateSound(const song: string);
begin
  st := TStreamer.Create(song);
end;

procedure TPlayerPanel.Timer;
var
  oldChange: TNotifyEvent;
  p, d: integer;
  s: string;
  si: single;
begin
    st.SetVolume(VolumeBar.Position / 1000);
  //si := sin(sinCounter / 4) / 2 + 0.5;
  //Inc(sinCounter);
  //WriteLn(si: 4: 2);
  //st.SetVolume(si);
  //VolumeBar.Position := Trunc(si * 1000);



  if IsChange then  begin
    st.spring(TrackBar.Position);
    IsChange := False;
  end else begin
    oldChange := TrackBar.OnChange;
    TrackBar.OnChange := nil;
    p := st.GetPosition;
    d := st.GetDuration;
    TrackBar.Max := d;
    TrackBar.Position := p;
    TrackBar.OnChange := oldChange;
    PosLabel.Caption := GstClockToStr(p);
    DurLabel.Caption := GstClockToStr(d);
    WriteStr(s, st.getState);
    StateLabel.Caption := s;
  end;
  //  if p=d then st.Stop;
end;

procedure TPlayerPanel.printTime(time: integer);
begin
end;


end.
