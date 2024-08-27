unit SoundListBox;

interface

uses
  Classes, SysUtils, StdCtrls, Controls, Dialogs,
  Laz2_XMLCfg,
  Streamer;

type

  { TSoundListBox }

  TSoundListBox = class(TListBox)
  public
    constructor Create(TheOwner: TComponent); override;
    procedure Add(const song: string);
    procedure Remove;
    procedure RemoveAll;
    procedure Down;
    procedure Up;
    function Next: boolean;
    function Prev(music: TStreamer): boolean;
    function GetTitle: string;
    procedure SaveToXML;
    procedure LoadToXML;
  end;

implementation

constructor TSoundListBox.Create(TheOwner: TComponent);
begin
  inherited Create(TheOwner);
  Anchors := [akTop, akLeft, akBottom, akRight];
  Top := 50;
  Left := 16;
end;

procedure TSoundListBox.Add(const song: string);
begin
  Items.AddStrings(song);
end;

procedure TSoundListBox.Remove;
var
  index: integer;
begin
  index := ItemIndex;
  if (index > 0) and (index < Count) then  begin
    Items.Delete(index);
  end;
end;

procedure TSoundListBox.RemoveAll;
begin
  Clear;
end;

procedure TSoundListBox.Down;
var
  index: integer;
begin
  index := ItemIndex;
  if index = -1 then begin
    Exit;
  end;
  if index < Count - 1 then  begin
    Items.Move(index, index + 1);
    ItemIndex := index + 1;
  end;
end;

procedure TSoundListBox.Up;
var
  index: integer;
begin
  index := ItemIndex;
  if index = -1 then begin
    Exit;
  end;
  if index > 0 then  begin
    Items.Move(index, index - 1);
    ItemIndex := index - 1;
  end;
end;

function TSoundListBox.Next: boolean;
var
  index: integer;
begin
  if Count <= 0 then begin
    Result := False;
    Exit;
  end else begin
    Result := True;
  end;
  index := ItemIndex;
  Inc(index);
  if index >= Items.Count then begin
    index := 0;
  end;
  ItemIndex := index;
end;

function TSoundListBox.Prev(music: TStreamer): boolean;
var
  musicPos: Integer;
begin
  if Count <= 0 then begin
    Result := False;
    Exit;
  end else begin
    Result := True;
  end;
  musicPos := music.Position;
  if musicPos > 1000 then begin
    music.Position:=100;
    Result := False;
  end else begin
    if ItemIndex = 0 then begin
      ItemIndex := Count - 1;
    end else begin
      ItemIndex := ItemIndex - 1;
    end;
  end;
end;

function TSoundListBox.GetTitle: string;
begin
  if ItemIndex >= 0 then begin
    Result := Items[ItemIndex];
  end else begin
    Result := '';
  end;
end;

procedure TSoundListBox.SaveToXML;
var
  xml: TXMLConfig;
  i: integer;
begin
  xml := TXMLConfig.Create(nil);
  xml.Filename := 'test.xml';
  xml.Clear;
  for i := 1 to Count do begin
    xml.SetValue('songs/items[' + IntToStr(i) + ']/song', Items[i - 1]);
  end;
  xml.Free;
end;

procedure TSoundListBox.LoadToXML;
var
  i, cnt: integer;
  xml: TXMLConfig;
  s: string;
begin
  xml := TXMLConfig.Create(nil);
  xml.Filename := 'test.xml';

  cnt := xml.GetChildCount('songs');
  for i := 1 to cnt do begin
    s := xml.GetValue('songs/items[' + IntToStr(i) + ']/song', '');
    WriteLn(s);
  end;
  xml.Free;
end;

end.
