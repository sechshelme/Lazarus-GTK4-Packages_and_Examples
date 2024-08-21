unit gbacktrace;

interface

uses
  common_GLIB, gtypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

procedure g_on_error_query(prg_name: Pgchar); cdecl; external libglib2;
procedure g_on_error_stack_trace(prg_name: Pgchar); cdecl; external libglib2;

// === Konventiert am: 11-8-24 15:34:10 ===


implementation


end.
