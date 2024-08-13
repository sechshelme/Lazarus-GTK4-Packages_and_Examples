
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

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function GPOINTER_TO_TYPE(p : longint) : TGType;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GTYPE_TO_POINTER(t : longint) : Tgpointer;


implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GPOINTER_TO_TYPE(p : longint) : TGType;
begin
  GPOINTER_TO_TYPE:=TGType(Tguintptr(p));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GTYPE_TO_POINTER(t : longint) : Tgpointer;
begin
  GTYPE_TO_POINTER:=Tgpointer(Tguintptr(t));
end;


end.
