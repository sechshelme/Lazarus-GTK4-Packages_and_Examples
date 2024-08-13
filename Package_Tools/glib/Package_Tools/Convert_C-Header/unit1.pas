unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, FileUtil;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    function DeleteLines(const s, delStr: string): string;
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

function TForm1.DeleteLines(const s, delStr: string): string;
begin
  if Pos(delStr, s) = 1 then begin
    Result := '';
  end else begin
    Result := s;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  slFile, slHeader: TStringList;
  i, j, k: integer;
begin
  Memo1.Clear;
  slFile := FindAllFiles('/n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/GTK4/Package_Tools/glib/Package_Tools/include-C', '*.h', True);
  Memo1.Lines := slFile;

  for i := 0 to slFile.Count - 1 do begin
    slHeader := TStringList.Create;
    slHeader.LoadFromFile(slFile[i]);
    for j := 0 to slHeader.Count - 1 do begin
      slHeader[j] := StringReplace(slHeader[j], 'G_BEGIN_DECLS', '', [rfReplaceAll]);
      slHeader[j] := StringReplace(slHeader[j], 'G_GNUC_CONST', '', [rfReplaceAll]);
      slHeader[j] := StringReplace(slHeader[j], 'GIO_AVAILABLE_IN_ALL', '', [rfReplaceAll]);
      slHeader[j] := StringReplace(slHeader[j], 'GIO_AVAILABLE_IN_ALL', '', [rfReplaceAll]);
      slHeader[j] := StringReplace(slHeader[j], 'GIO_AVAILABLE_IN_2_28', '', [rfReplaceAll]);
      slHeader[j] := StringReplace(slHeader[j], 'GIO_AVAILABLE_IN_2_30', '', [rfReplaceAll]);
      slHeader[j] := StringReplace(slHeader[j], 'GIO_AVAILABLE_IN_2_38', '', [rfReplaceAll]);

      slHeader[j] := StringReplace(slHeader[j], 'GLIB_AVAILABLE_IN_ALL', '', [rfReplaceAll]);
      slHeader[j] := StringReplace(slHeader[j], 'GOBJECT_AVAILABLE_IN_ALL', '', [rfReplaceAll]);
      k := 30;
      repeat
        slHeader[j] := StringReplace(slHeader[j], 'GLIB_AVAILABLE_IN_2_' + IntToStr(k), '', [rfReplaceAll]);
        slHeader[j] := StringReplace(slHeader[j], 'GOBJECT_AVAILABLE_IN_2_' + IntToStr(k), '', [rfReplaceAll]);
        Inc(k, 2);
      until k >= 82;


      slHeader[j] := StringReplace(slHeader[j], 'G_GNUC_MALLOC', '', [rfReplaceAll]);
//      slHeader[j] := StringReplace(slHeader[j], 'GLIB_VAR', '', [rfReplaceAll]);
      slHeader[j] := StringReplace(slHeader[j], 'G_GNUC_PURE', '', [rfReplaceAll]);

      slHeader[j] := StringReplace(slHeader[j], 'GLIB_DEPRECATED', '', [rfReplaceAll]);
      slHeader[j] := StringReplace(slHeader[j], 'G_GNUC_WARN_UNUSED_RESULT', '', [rfReplaceAll]);
      slHeader[j] := StringReplace(slHeader[j], 'G_GNUC_BEGIN_IGNORE_DEPRECATIONS', '', [rfReplaceAll]);
      slHeader[j] := StringReplace(slHeader[j], 'G_GNUC_END_IGNORE_DEPRECATIONS', '', [rfReplaceAll]);

      slHeader[j] := StringReplace(slHeader[j], 'G_GNUC_NULL_TERMINATED', '', [rfReplaceAll]);



      slHeader[j] := DeleteLines(slHeader[j], '_IN_2_62_FOR(');
      slHeader[j] := DeleteLines(slHeader[j], '_IN_2_66_FOR(');
      slHeader[j] := DeleteLines(slHeader[j], '_IN_2_68_FOR(');
      slHeader[j] := DeleteLines(slHeader[j], 'G_DEFINE_AUTOPTR_CLEANUP_FUNC(');
      slHeader[j] := DeleteLines(slHeader[j], 'GLIB_DEPRECATED_IN_2_38_FOR(');

    end;
    slHeader.SaveToFile(slFile[i]);
    slHeader.Free;
  end;

  slFile.Free;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Height := 1000;
  Width := 1000;
end;


end.
