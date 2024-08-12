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

const
  SIGTRAP = 5;

function raise_(__sig: longint): longint; cdecl; external libglib2 Name 'raise';

function G_BREAKPOINT: longint;
begin
//  Result := raise_(SIGTRAP);
end;


end.
