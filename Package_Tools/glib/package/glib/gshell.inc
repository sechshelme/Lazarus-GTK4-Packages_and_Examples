/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}



type
  PGShellError = ^TGShellError;
  TGShellError = longint;

const
  G_SHELL_ERROR_BAD_QUOTING = 0;
  G_SHELL_ERROR_EMPTY_STRING = 1;
  G_SHELL_ERROR_FAILED = 2;

function g_shell_error_quark: TGQuark; cdecl; external libglib2;
function g_shell_quote(unquoted_string: Pgchar): Pgchar; cdecl; external libglib2;
function g_shell_unquote(quoted_string: Pgchar; error: PPGError): Pgchar; cdecl; external libglib2;
function g_shell_parse_argv(command_line: Pgchar; argcp: Pgint; argvp: PPPgchar; error: PPGError): Tgboolean; cdecl; external libglib2;


function G_SHELL_ERROR: TGQuark;

// === Konventiert am: 11-8-24 19:33:06 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_SHELL_ERROR: TGQuark;
begin
  G_SHELL_ERROR := g_shell_error_quark;
end;


{$ENDIF read_implementation}
