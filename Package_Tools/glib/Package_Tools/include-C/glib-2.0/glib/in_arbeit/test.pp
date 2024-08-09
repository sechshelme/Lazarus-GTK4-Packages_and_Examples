
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


(* error 
#define		g_scanner_add_symbol( scanner, symbol, value ) g_scanner_scope_add_symbol ((scanner), 0, (symbol), (value)); 
in declaration at line 1 *)
(* error 
#define		g_scanner_remove_symbol( scanner, symbol ) g_scanner_scope_remove_symbol ((scanner), 0, (symbol)); 
in declaration at line 2 *)
(* error 
#define		g_scanner_foreach_symbol( scanner, func, data ) g_scanner_scope_foreach_symbol ((scanner), 0, (func), (data)); 
in declaration at line 3 *)

implementation


end.
