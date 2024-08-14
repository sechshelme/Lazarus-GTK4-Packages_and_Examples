
unit test;
interface

{
  Automatically converted by H2Pas 1.0.0 from test.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    test.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
PGParamSpecChar  = ^GParamSpecChar;
PGParamSpecUChar  = ^GParamSpecUChar;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


type
  PGParamSpecChar = ^TGParamSpecChar;
  TGParamSpecChar = record
      {undefined structure}
    end;

  PGParamSpecUChar = ^TGParamSpecUChar;
  TGParamSpecUChar = record
      {undefined structure}
    end;

(* error 
typedef struct GParamSpecBoolean   ;

implementation


end.
