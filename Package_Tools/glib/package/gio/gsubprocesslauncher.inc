/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}


type
  TGSubprocessLauncher = record
  end;
  PGSubprocessLauncher = ^TGSubprocessLauncher;

function g_subprocess_launcher_get_type: TGType; cdecl; external libgio2;
function g_subprocess_launcher_new(flags: TGSubprocessFlags): PGSubprocessLauncher; cdecl; external libgio2;
function g_subprocess_launcher_spawn(self: PGSubprocessLauncher; error: PPGError; argv0: Pgchar; args: array of const): PGSubprocess; cdecl; external libgio2;
function g_subprocess_launcher_spawn(self: PGSubprocessLauncher; error: PPGError; argv0: Pgchar): PGSubprocess; cdecl; external libgio2;
function g_subprocess_launcher_spawnv(self: PGSubprocessLauncher; argv: PPgchar; error: PPGError): PGSubprocess; cdecl; external libgio2;
procedure g_subprocess_launcher_set_environ(self: PGSubprocessLauncher; env: PPgchar); cdecl; external libgio2;
procedure g_subprocess_launcher_setenv(self: PGSubprocessLauncher; variable: Pgchar; Value: Pgchar; overwrite: Tgboolean); cdecl; external libgio2;
procedure g_subprocess_launcher_unsetenv(self: PGSubprocessLauncher; variable: Pgchar); cdecl; external libgio2;
function g_subprocess_launcher_getenv(self: PGSubprocessLauncher; variable: Pgchar): Pgchar; cdecl; external libgio2;
procedure g_subprocess_launcher_set_cwd(self: PGSubprocessLauncher; cwd: Pgchar); cdecl; external libgio2;
procedure g_subprocess_launcher_set_flags(self: PGSubprocessLauncher; flags: TGSubprocessFlags); cdecl; external libgio2;
{$ifdef Linux}
procedure g_subprocess_launcher_set_stdin_file_path(self: PGSubprocessLauncher; path: Pgchar); cdecl; external libgio2;
procedure g_subprocess_launcher_take_stdin_fd(self: PGSubprocessLauncher; fd: Tgint); cdecl; external libgio2;
procedure g_subprocess_launcher_set_stdout_file_path(self: PGSubprocessLauncher; path: Pgchar); cdecl; external libgio2;
procedure g_subprocess_launcher_take_stdout_fd(self: PGSubprocessLauncher; fd: Tgint); cdecl; external libgio2;
procedure g_subprocess_launcher_set_stderr_file_path(self: PGSubprocessLauncher; path: Pgchar); cdecl; external libgio2;
procedure g_subprocess_launcher_take_stderr_fd(self: PGSubprocessLauncher; fd: Tgint); cdecl; external libgio2;
procedure g_subprocess_launcher_take_fd(self: PGSubprocessLauncher; source_fd: Tgint; target_fd: Tgint); cdecl; external libgio2;
procedure g_subprocess_launcher_close(self: PGSubprocessLauncher); cdecl; external libgio2;
procedure g_subprocess_launcher_set_child_setup(self: PGSubprocessLauncher; child_setup: TGSpawnChildSetupFunc; user_data: Tgpointer; destroy_notify: TGDestroyNotify); cdecl; external libgio2;
{$endif}

// === Konventiert am: 20-8-24 16:03:00 ===

function G_TYPE_SUBPROCESS_LAUNCHER: TGType;
function G_SUBPROCESS_LAUNCHER(obj: Pointer): PGSubprocessLauncher;
function G_IS_SUBPROCESS_LAUNCHER(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_TYPE_SUBPROCESS_LAUNCHER: TGType;
begin
  G_TYPE_SUBPROCESS_LAUNCHER := g_subprocess_launcher_get_type;
end;

function G_SUBPROCESS_LAUNCHER(obj: Pointer): PGSubprocessLauncher;
begin
  Result := PGSubprocessLauncher(g_type_check_instance_cast(obj, G_TYPE_SUBPROCESS_LAUNCHER));
end;

function G_IS_SUBPROCESS_LAUNCHER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_SUBPROCESS_LAUNCHER);
end;



{$ENDIF read_implementation}
