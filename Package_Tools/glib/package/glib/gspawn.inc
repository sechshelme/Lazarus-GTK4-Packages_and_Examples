/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}


type
  PGSpawnError = ^TGSpawnError;
  TGSpawnError = longint;

const
  G_SPAWN_ERROR_FORK = 0;
  G_SPAWN_ERROR_READ = 1;
  G_SPAWN_ERROR_CHDIR = 2;
  G_SPAWN_ERROR_ACCES = 3;
  G_SPAWN_ERROR_PERM = 4;
  G_SPAWN_ERROR_TOO_BIG = 5;
  G_SPAWN_ERROR_2BIG = G_SPAWN_ERROR_TOO_BIG;
  G_SPAWN_ERROR_NOEXEC = (G_SPAWN_ERROR_TOO_BIG) + 1;
  G_SPAWN_ERROR_NAMETOOLONG = (G_SPAWN_ERROR_TOO_BIG) + 2;
  G_SPAWN_ERROR_NOENT = (G_SPAWN_ERROR_TOO_BIG) + 3;
  G_SPAWN_ERROR_NOMEM = (G_SPAWN_ERROR_TOO_BIG) + 4;
  G_SPAWN_ERROR_NOTDIR = (G_SPAWN_ERROR_TOO_BIG) + 5;
  G_SPAWN_ERROR_LOOP = (G_SPAWN_ERROR_TOO_BIG) + 6;
  G_SPAWN_ERROR_TXTBUSY = (G_SPAWN_ERROR_TOO_BIG) + 7;
  G_SPAWN_ERROR_IO = (G_SPAWN_ERROR_TOO_BIG) + 8;
  G_SPAWN_ERROR_NFILE = (G_SPAWN_ERROR_TOO_BIG) + 9;
  G_SPAWN_ERROR_MFILE = (G_SPAWN_ERROR_TOO_BIG) + 10;
  G_SPAWN_ERROR_INVAL = (G_SPAWN_ERROR_TOO_BIG) + 11;
  G_SPAWN_ERROR_ISDIR = (G_SPAWN_ERROR_TOO_BIG) + 12;
  G_SPAWN_ERROR_LIBBAD = (G_SPAWN_ERROR_TOO_BIG) + 13;
  G_SPAWN_ERROR_FAILED = (G_SPAWN_ERROR_TOO_BIG) + 14;

type
  TGSpawnChildSetupFunc = procedure(Data: Tgpointer); cdecl;

  PGSpawnFlags = ^TGSpawnFlags;
  TGSpawnFlags = longint;

const
  G_SPAWN_DEFAULT = 0;
  G_SPAWN_LEAVE_DESCRIPTORS_OPEN = 1 shl 0;
  G_SPAWN_DO_NOT_REAP_CHILD = 1 shl 1;
  G_SPAWN_SEARCH_PATH = 1 shl 2;
  G_SPAWN_STDOUT_TO_DEV_NULL = 1 shl 3;
  G_SPAWN_STDERR_TO_DEV_NULL = 1 shl 4;
  G_SPAWN_CHILD_INHERITS_STDIN = 1 shl 5;
  G_SPAWN_FILE_AND_ARGV_ZERO = 1 shl 6;
  G_SPAWN_SEARCH_PATH_FROM_ENVP = 1 shl 7;
  G_SPAWN_CLOEXEC_PIPES = 1 shl 8;
  G_SPAWN_CHILD_INHERITS_STDOUT = 1 shl 9;
  G_SPAWN_CHILD_INHERITS_STDERR = 1 shl 10;
  G_SPAWN_STDIN_FROM_DEV_NULL = 1 shl 11;

function g_spawn_error_quark: TGQuark; cdecl; external libglib2;
function g_spawn_exit_error_quark: TGQuark; cdecl; external libglib2;
function g_spawn_async(working_directory: Pgchar; argv: PPgchar; envp: PPgchar; flags: TGSpawnFlags; child_setup: TGSpawnChildSetupFunc;
  user_data: Tgpointer; child_pid: PGPid; error: PPGError): Tgboolean; cdecl; external libglib2;
function g_spawn_async_with_pipes(working_directory: Pgchar; argv: PPgchar; envp: PPgchar; flags: TGSpawnFlags; child_setup: TGSpawnChildSetupFunc;
  user_data: Tgpointer; child_pid: PGPid; standard_input: Pgint; standard_output: Pgint; standard_error: Pgint;
  error: PPGError): Tgboolean; cdecl; external libglib2;
function g_spawn_async_with_pipes_and_fds(working_directory: Pgchar; argv: PPgchar; envp: PPgchar; flags: TGSpawnFlags; child_setup: TGSpawnChildSetupFunc;
  user_data: Tgpointer; stdin_fd: Tgint; stdout_fd: Tgint; stderr_fd: Tgint; source_fds: Pgint;
  target_fds: Pgint; n_fds: Tgsize; child_pid_out: PGPid; stdin_pipe_out: Pgint; stdout_pipe_out: Pgint;
  stderr_pipe_out: Pgint; error: PPGError): Tgboolean; cdecl; external libglib2;
function g_spawn_async_with_fds(working_directory: Pgchar; argv: PPgchar; envp: PPgchar; flags: TGSpawnFlags; child_setup: TGSpawnChildSetupFunc;
  user_data: Tgpointer; child_pid: PGPid; stdin_fd: Tgint; stdout_fd: Tgint; stderr_fd: Tgint;
  error: PPGError): Tgboolean; cdecl; external libglib2;
function g_spawn_sync(working_directory: Pgchar; argv: PPgchar; envp: PPgchar; flags: TGSpawnFlags; child_setup: TGSpawnChildSetupFunc;
  user_data: Tgpointer; standard_output: PPgchar; standard_error: PPgchar; wait_status: Pgint; error: PPGError): Tgboolean; cdecl; external libglib2;
function g_spawn_command_line_sync(command_line: Pgchar; standard_output: PPgchar; standard_error: PPgchar; wait_status: Pgint; error: PPGError): Tgboolean; cdecl; external libglib2;
function g_spawn_command_line_async(command_line: Pgchar; error: PPGError): Tgboolean; cdecl; external libglib2;
function g_spawn_check_wait_status(wait_status: Tgint; error: PPGError): Tgboolean; cdecl; external libglib2;
function g_spawn_check_exit_status(wait_status: Tgint; error: PPGError): Tgboolean; cdecl; external libglib2;
procedure g_spawn_close_pid(pid: TGPid); cdecl; external libglib2;

function G_SPAWN_ERROR: TGQuark;
function G_SPAWN_EXIT_ERROR: TGQuark;

// === Konventiert am: 8-8-24 17:33:16 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_SPAWN_ERROR: TGQuark;
begin
  G_SPAWN_ERROR := g_spawn_error_quark;
end;

function G_SPAWN_EXIT_ERROR: TGQuark;
begin
  G_SPAWN_EXIT_ERROR := g_spawn_exit_error_quark;
end;


{$ENDIF read_implementation}
