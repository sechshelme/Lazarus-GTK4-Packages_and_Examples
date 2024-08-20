unit gsubprocess;

interface

uses
  common_GLIB, gtypes, gerror, garray, gtype, giotypes, gobject, gioenums, goutputstream, ginputstream
  ;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGSubprocess = record
  end;
  PGSubprocess = ^TGSubprocess;


function g_subprocess_get_type: TGType; cdecl; external libgio2;
function g_subprocess_new(flags: TGSubprocessFlags; error: PPGError; argv0: Pgchar; args: array of const): PGSubprocess; cdecl; external libgio2;
function g_subprocess_new(flags: TGSubprocessFlags; error: PPGError; argv0: Pgchar): PGSubprocess; cdecl; external libgio2;
function g_subprocess_newv(argv: PPgchar; flags: TGSubprocessFlags; error: PPGError): PGSubprocess; cdecl; external libgio2;
function g_subprocess_get_stdin_pipe(subprocess: PGSubprocess): PGOutputStream; cdecl; external libgio2;
function g_subprocess_get_stdout_pipe(subprocess: PGSubprocess): PGInputStream; cdecl; external libgio2;
function g_subprocess_get_stderr_pipe(subprocess: PGSubprocess): PGInputStream; cdecl; external libgio2;
function g_subprocess_get_identifier(subprocess: PGSubprocess): Pgchar; cdecl; external libgio2;
{$ifdef linux}
procedure g_subprocess_send_signal(subprocess: PGSubprocess; signal_num: Tgint); cdecl; external libgio2;
{$endif}

procedure g_subprocess_force_exit(subprocess: PGSubprocess); cdecl; external libgio2;
function g_subprocess_wait(subprocess: PGSubprocess; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libgio2;
procedure g_subprocess_wait_async(subprocess: PGSubprocess; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_subprocess_wait_finish(subprocess: PGSubprocess; Result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_subprocess_wait_check(subprocess: PGSubprocess; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libgio2;
procedure g_subprocess_wait_check_async(subprocess: PGSubprocess; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_subprocess_wait_check_finish(subprocess: PGSubprocess; Result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_subprocess_get_status(subprocess: PGSubprocess): Tgint; cdecl; external libgio2;
function g_subprocess_get_successful(subprocess: PGSubprocess): Tgboolean; cdecl; external libgio2;
function g_subprocess_get_if_exited(subprocess: PGSubprocess): Tgboolean; cdecl; external libgio2;
function g_subprocess_get_exit_status(subprocess: PGSubprocess): Tgint; cdecl; external libgio2;
function g_subprocess_get_if_signaled(subprocess: PGSubprocess): Tgboolean; cdecl; external libgio2;
function g_subprocess_get_term_sig(subprocess: PGSubprocess): Tgint; cdecl; external libgio2;
function g_subprocess_communicate(subprocess: PGSubprocess; stdin_buf: PGBytes; cancellable: PGCancellable; stdout_buf: PPGBytes; stderr_buf: PPGBytes;
  error: PPGError): Tgboolean; cdecl; external libgio2;
procedure g_subprocess_communicate_async(subprocess: PGSubprocess; stdin_buf: PGBytes; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_subprocess_communicate_finish(subprocess: PGSubprocess; Result: PGAsyncResult; stdout_buf: PPGBytes; stderr_buf: PPGBytes; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_subprocess_communicate_utf8(subprocess: PGSubprocess; stdin_buf: PChar; cancellable: PGCancellable; stdout_buf: PPchar; stderr_buf: PPchar;
  error: PPGError): Tgboolean; cdecl; external libgio2;
procedure g_subprocess_communicate_utf8_async(subprocess: PGSubprocess; stdin_buf: PChar; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_subprocess_communicate_utf8_finish(subprocess: PGSubprocess; Result: PGAsyncResult; stdout_buf: PPchar; stderr_buf: PPchar; error: PPGError): Tgboolean; cdecl; external libgio2;

// === Konventiert am: 20-8-24 13:58:41 ===

function G_TYPE_SUBPROCESS: TGType;
function G_SUBPROCESS(obj: Pointer): PGSubprocess;
function G_IS_SUBPROCESS(obj: Pointer): Tgboolean;

implementation

function G_TYPE_SUBPROCESS: TGType;
begin
  G_TYPE_SUBPROCESS := g_subprocess_get_type;
end;

function G_SUBPROCESS(obj: Pointer): PGSubprocess;
begin
  Result := PGSubprocess(g_type_check_instance_cast(obj, G_TYPE_SUBPROCESS));
end;

function G_IS_SUBPROCESS(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_SUBPROCESS);
end;



end.
