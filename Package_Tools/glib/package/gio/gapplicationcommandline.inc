/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}


type
  TGApplicationCommandLinePrivate = record
  end;
  PGApplicationCommandLinePrivate = ^TGApplicationCommandLinePrivate;

  TGApplicationCommandLine = record
    parent_instance: TGObject;
    priv: PGApplicationCommandLinePrivate;
  end;
  PGApplicationCommandLine = ^TGApplicationCommandLine;

  TGApplicationCommandLineClass = record
    parent_class: TGObjectClass;
    print_literal: procedure(cmdline: PGApplicationCommandLine; message: Pgchar); cdecl;
    printerr_literal: procedure(cmdline: PGApplicationCommandLine; message: Pgchar); cdecl;
    get_stdin: function(cmdline: PGApplicationCommandLine): PGInputStream; cdecl;
    done: procedure(cmdline: PGApplicationCommandLine); cdecl;
    padding: array[0..9] of Tgpointer;
  end;
  PGApplicationCommandLineClass = ^TGApplicationCommandLineClass;


function g_application_command_line_get_type: TGType; cdecl; external libgio2;
function g_application_command_line_get_arguments(cmdline: PGApplicationCommandLine; argc: Plongint): PPgchar; cdecl; external libgio2;
function g_application_command_line_get_options_dict(cmdline: PGApplicationCommandLine): PGVariantDict; cdecl; external libgio2;
function g_application_command_line_get_stdin(cmdline: PGApplicationCommandLine): PGInputStream; cdecl; external libgio2;
function g_application_command_line_get_environ(cmdline: PGApplicationCommandLine): PPgchar; cdecl; external libgio2;
function g_application_command_line_getenv(cmdline: PGApplicationCommandLine; Name: Pgchar): Pgchar; cdecl; external libgio2;
function g_application_command_line_get_cwd(cmdline: PGApplicationCommandLine): Pgchar; cdecl; external libgio2;
function g_application_command_line_get_is_remote(cmdline: PGApplicationCommandLine): Tgboolean; cdecl; external libgio2;
procedure g_application_command_line_print_literal(cmdline: PGApplicationCommandLine; message: Pgchar); cdecl; external libgio2;
procedure g_application_command_line_printerr_literal(cmdline: PGApplicationCommandLine; message: Pgchar); cdecl; external libgio2;
procedure g_application_command_line_print(cmdline: PGApplicationCommandLine; format: Pgchar; args: array of const); cdecl; external libgio2;
procedure g_application_command_line_print(cmdline: PGApplicationCommandLine; format: Pgchar); cdecl; external libgio2;
procedure g_application_command_line_printerr(cmdline: PGApplicationCommandLine; format: Pgchar; args: array of const); cdecl; external libgio2;
procedure g_application_command_line_printerr(cmdline: PGApplicationCommandLine; format: Pgchar); cdecl; external libgio2;
function g_application_command_line_get_exit_status(cmdline: PGApplicationCommandLine): longint; cdecl; external libgio2;
procedure g_application_command_line_set_exit_status(cmdline: PGApplicationCommandLine; exit_status: longint); cdecl; external libgio2;
function g_application_command_line_get_platform_data(cmdline: PGApplicationCommandLine): PGVariant; cdecl; external libgio2;
function g_application_command_line_create_file_for_arg(cmdline: PGApplicationCommandLine; arg: Pgchar): PGFile; cdecl; external libgio2;
procedure g_application_command_line_done(cmdline: PGApplicationCommandLine); cdecl; external libgio2;

// === Konventiert am: 19-8-24 18:04:44 ===

function G_TYPE_APPLICATION_COMMAND_LINE: TGType;
function G_APPLICATION_COMMAND_LINE(obj: Pointer): PGApplicationCommandLine;
function G_APPLICATION_COMMAND_LINE_CLASS(klass: Pointer): PGApplicationCommandLineClass;
function G_IS_APPLICATION_COMMAND_LINE(obj: Pointer): Tgboolean;
function G_IS_APPLICATION_COMMAND_LINE_CLASS(klass: Pointer): Tgboolean;
function G_APPLICATION_COMMAND_LINE_GET_CLASS(obj: Pointer): PGApplicationCommandLineClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_TYPE_APPLICATION_COMMAND_LINE: TGType;
begin
  G_TYPE_APPLICATION_COMMAND_LINE := g_application_command_line_get_type;
end;

function G_APPLICATION_COMMAND_LINE(obj: Pointer): PGApplicationCommandLine;
begin
  Result := PGApplicationCommandLine(g_type_check_instance_cast(obj, G_TYPE_APPLICATION_COMMAND_LINE));
end;

function G_APPLICATION_COMMAND_LINE_CLASS(klass: Pointer): PGApplicationCommandLineClass;
begin
  Result := PGApplicationCommandLineClass(g_type_check_class_cast(klass, G_TYPE_APPLICATION_COMMAND_LINE));
end;

function G_IS_APPLICATION_COMMAND_LINE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_APPLICATION_COMMAND_LINE);
end;

function G_IS_APPLICATION_COMMAND_LINE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_APPLICATION_COMMAND_LINE);
end;

function G_APPLICATION_COMMAND_LINE_GET_CLASS(obj: Pointer): PGApplicationCommandLineClass;
begin
  Result := PGApplicationCommandLineClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
