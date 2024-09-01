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
    fsong: string;
    PlayBtn, PauseBtn, StopBtn, SpringBtn: TButton;
    MuteCheckBox: TCheckBox;
    TrackBar, VolumeBar: TTrackBar;
    EqualizerBar: array[0..2] of TTrackBar;
    DurLabel, PosLabel, StateLabel: TLabel;
    st: TStreamer;
    IsChange: boolean;
    sinCounter: int64;
    procedure BtnClick(Sender: TObject);
    procedure MuteClick(Sender: TObject);
    procedure TrackBarChange(Sender: TObject);
    function CreateLevelTrackBar(Aleft: integer): TTrackBar;
  end;

implementation

procedure TPlayerPanel.BtnClick(Sender: TObject);
begin
  case TButton(Sender).Tag of
    cmPlay: begin
      if st = nil then begin
        st := TStreamer.Create(fsong);
      end;
      st.Play;
    end;
    cmPause: begin
      if st <> nil then  begin
        st.Pause;
      end;
    end;
    cmStop: begin
      if st <> nil then begin
        st.Stop;
        FreeAndNil(st);
      end;
    end;
    cmSpring: begin
      if st <> nil then  begin
        st.Position := 6000;
      end;
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
end;

function TPlayerPanel.CreateLevelTrackBar(Aleft: integer): TTrackBar;
begin
  Result := TTrackBar.Create(Self);
  with Result do begin
    Orientation := trVertical;
    ScalePos := trRight;
    Reversed := True;
    Left := Aleft;
    Width := 50;
    Height := 40;
    Top := 50;
    Caption := 'volume';
    Parent := Self;
    Max := 10;
    Position := 10;
  end;
end;

constructor TPlayerPanel.Create(TheOwner: TComponent);
const
  w = 50;
  t = 50;
var
  i: integer;
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
    max:=0;
    Position:=0;
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

  VolumeBar := CreateLevelTrackBar(5 * w + 5);

  for i := 0 to Length(EqualizerBar) - 1 do begin
    EqualizerBar[i] := CreateLevelTrackBar(5 * w + i * 15 + 20);
    EqualizerBar[i].Max := 12;
    EqualizerBar[i].Min := -24;
    EqualizerBar[i].Position := -0;
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
  if st <> nil then begin
    st.Stop;
    st.Free;
  end;
  inherited Destroy;
end;

procedure TPlayerPanel.CreateSound(const song: string);
begin
  fsong := song;
end;

procedure TPlayerPanel.Timer;
var
  oldChange: TNotifyEvent;
  p, d: integer;
  s: string;
  si: single;
begin
  if st <> nil then begin
    st.SetVolume(VolumeBar.Position / 10);

    st.SetEqualizer0(EqualizerBar[0].Position);
    st.SetEqualizer1(EqualizerBar[1].Position);
    st.SetEqualizer2(EqualizerBar[2].Position);

    //si := sin(sinCounter / 4) / 2 + 0.5;
    //Inc(sinCounter);
    //WriteLn(si: 4: 2);
    //st.SetVolume(si);
    //VolumeBar.Position := Trunc(si * 1000);



    if IsChange then  begin
      st.Position := TrackBar.Position;
      IsChange := False;
    end else begin
      oldChange := TrackBar.OnChange;
      TrackBar.OnChange := nil;
      p := st.Position;
      d := st.Duration;
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
end;

procedure TPlayerPanel.printTime(time: integer);
begin
end;


end.
