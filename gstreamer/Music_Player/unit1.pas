unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, LCLType,
  Buttons, ExtCtrls, ComCtrls, Menus, Types, FileUtil,
  Common, MenuBar, SoundListBox, PlayBox, AddSongs,
  Streamer;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Timer1: TTimer;
    TrackBar1: TTrackBar;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
  private
    MainMenu: TMenuBar;
    EditBox: TEditBox;
    PlayBox: TPlayBox;
    music: TStreamer;
    procedure LoadNewMusic(const titel: string; TrackPos: integer);
    procedure BoxEventProc(cmd: Tcommand);
  public
    ListBoxSongs: TSoundListBox;
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

procedure TForm1.BoxEventProc(cmd: Tcommand);
var
  index: integer;
  s: string;
begin
  case cmd of
    cmNone: begin
    end;
    cmNew: begin
      //      ListBoxSongs.Add;
    end;
    cmSave: begin
      ListBoxSongs.SaveToXML;
    end;
    cmOpen: begin
      ListBoxSongs.LoadToXML;
    end;
    cmClose: begin
      Close;
    end;

    cmAdd: begin
      SoundAddForm.SongListBox := ListBoxSongs;
      SoundAddForm.ShowModal;
    end;
    cmRemove: begin
      ListBoxSongs.Remove;
    end;
    cmRemoveAll: begin
      if MessageDlg('Songs Löschen', 'Alle Einträge entfernen ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
        ListBoxSongs.RemoveAll;
      end;
    end;
    cmUp: begin
      ListBoxSongs.Up;
    end;
    cmDown: begin
      ListBoxSongs.Down;
    end;

    cmPlay: begin
      if music = nil then begin
        index := ListBoxSongs.ItemIndex;
        if ListBoxSongs.Count > 0 then begin
          if index < 0 then begin
            index := 0;
            ListBoxSongs.ItemIndex := index;
          end;
          s := ListBoxSongs.Items[index];
          LoadNewMusic(s, TrackBar1.Position);
        end;
      end else begin
        music.Play;
      end;
    end;
    cmStop: begin
      if music <> nil then begin
        music.Stop;
        FreeAndNil(music);
        TrackBar1.Position := 0;
        TrackBar1.Max := 1000;
      end;
    end;
    cmNext: begin
      if (music <> nil) and (music.Duration > 0) then begin
        if not music.isPlayed then begin
          FreeAndNil(music);
        end;
        if ListBoxSongs.Next then  begin
          if (music <> nil) and (music.isPlayed) then begin
            LoadNewMusic(ListBoxSongs.GetTitle, 0);
          end;
        end;
      end;
    end;
    cmPrev: begin
      if music <> nil then begin
        if not music.isPlayed then begin
          FreeAndNil(music);
        end;
        if ListBoxSongs.Prev(music) then begin
          LoadNewMusic(ListBoxSongs.GetTitle, 0);
        end;
      end;
    end;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  music := nil;

  MainMenu := TMenuBar.Create(Self);
  MainMenu.OnMenuBarEvent := @BoxEventProc;
  Menu := MainMenu;

  ListBoxSongs := TSoundListBox.Create(self);
  ListBoxSongs.Anchors := [akTop, akLeft, akBottom, akRight];
  ListBoxSongs.Width := ClientWidth - 150;
  ListBoxSongs.Height := ClientHeight - 70;
  ListBoxSongs.Parent := self;

  EditBox := TEditBox.Create(Self);
  EditBox.Parent := Self;
  EditBox.OnPlayBoxEvent := @BoxEventProc;

  PlayBox := TPlayBox.Create(Self);
  PlayBox.Parent := Self;
  PlayBox.OnPlayBoxEvent := @BoxEventProc;

  ListBoxSongs.Items.Add('/n4800/Multimedia/Music/Disco/Boney M/1981 - Boonoonoonoos/01 - Boonoonoonoos.flac');
  ListBoxSongs.Items.Add('/n4800/Multimedia/Music/Disco/Boney M/1981 - Boonoonoonoos/01 - Boonoonoonoos.flac');
  ListBoxSongs.Items.Add('/n4800/Multimedia/Music/Disco/Boney M/1981 - Boonoonoonoos/01 - Boonoonoonoos.flac');
  ListBoxSongs.Items.Add('/n4800/Multimedia/Music/Disco/Boney M/1981 - Boonoonoonoos/01 - Boonoonoonoos.flac');
  ListBoxSongs.Items.Add('/n4800/Multimedia/Music/Disco/Boney M/1981 - Boonoonoonoos/01 - Boonoonoonoos.flac');
  ListBoxSongs.Items.Add('/n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/SDL-3/examples/Audio/Boing_1.wav');
  ListBoxSongs.Items.Add('/n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/SDL-3/examples/Audio/Boing_2.wav');
  ListBoxSongs.Items.Add('/n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/SDL-3/examples/Audio/Boing_3.wav');
  ListBoxSongs.Items.Add('/n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/SDL-3/examples/Audio/Boing_4.wav');
  ListBoxSongs.Items.Add('/n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/SDL-3/examples/Audio/Boing_6.wav');
  ListBoxSongs.Items.Add('/n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/SDL-3/examples/Audio/Boing_7.wav');

  Timer1.Interval := 100;
  TrackBar1.TickStyle := tsNone;
  TrackBar1.Max := 1000;
  Width := 1024;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  if music <> nil then begin
    FreeAndNil(music);
  end;
end;

procedure TForm1.LoadNewMusic(const titel: string; TrackPos: integer);
begin
  if music <> nil then begin
    FreeAndNil(music);
  end;
  music := TStreamer.Create(titel);

//  TrackBar1.Max := music.Duration;
  TrackBar1.Max := 1000;
  TrackBar1.Position := TrackPos;

  //  Mix_PlayMusic(music, 1);
  //  Mix_FadeInMusic(music, 1, 3000);
  music.Play;

  //  Mix_SetMusicPosition(Mix_MusicDuration(music) / TrackBarDivider * TrackPos);
end;

procedure TForm1.TrackBar1Change(Sender: TObject);
begin
  if music <> nil then begin
    music.Position := TrackBar1.Position;
  end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  t_length, t_pos: double;
  s: string;
  ChangeProc: TNotifyEvent;
begin
  if ListBoxSongs.Count > 0 then begin
    if music <> nil then begin
      t_length := music.Duration;
      WriteStr(s, t_length: 6: 1);
      Label1.Caption := s;
      t_pos := music.Position;
      WriteStr(s, t_pos: 6: 1);
      Label3.Caption := s;
      ChangeProc := TrackBar1.OnChange;
      TrackBar1.OnChange := nil;
      TrackBar1.Max := music.Duration;
      TrackBar1.Position := music.Position;
      TrackBar1.OnChange := ChangeProc;

      if t_pos >= t_length then begin
        if ListBoxSongs.Next then  begin
          LoadNewMusic(ListBoxSongs.GetTitle, 0);
        end;
      end;
    end;
  end;
end;

end.
