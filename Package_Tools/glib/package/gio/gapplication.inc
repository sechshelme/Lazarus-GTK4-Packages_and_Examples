/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGApplicationPrivate = record
  end;
  PGApplicationPrivate = ^TGApplicationPrivate;

  PGApplication = ^TGApplication;

  TGApplication = record
    parent_instance: TGObject;
    priv: PGApplicationPrivate;
  end;

  PGApplicationClass = ^TGApplicationClass;

  TGApplicationClass = record
    parent_class: TGObjectClass;
    startup: procedure(application: PGApplication); cdecl;
    activate: procedure(application: PGApplication); cdecl;
    Open: procedure(application: PGApplication; files: PPGFile; n_files: Tgint; hint: Pgchar); cdecl;
    command_line: function(application: PGApplication; command_line: PGApplicationCommandLine): longint; cdecl;
    local_command_line: function(application: PGApplication; arguments: PPPgchar; exit_status: Plongint): Tgboolean; cdecl;
    before_emit: procedure(application: PGApplication; platform_data: PGVariant); cdecl;
    after_emit: procedure(application: PGApplication; platform_data: PGVariant); cdecl;
    add_platform_data: procedure(application: PGApplication; builder: PGVariantBuilder); cdecl;
    quit_mainloop: procedure(application: PGApplication); cdecl;
    run_mainloop: procedure(application: PGApplication); cdecl;
    shutdown: procedure(application: PGApplication); cdecl;
    dbus_register: function(application: PGApplication; connection: PGDBusConnection; object_path: Pgchar; error: PPGError): Tgboolean; cdecl;
    dbus_unregister: procedure(application: PGApplication; connection: PGDBusConnection; object_path: Pgchar); cdecl;
    handle_local_options: function(application: PGApplication; options: PGVariantDict): Tgint; cdecl;
    name_lost: function(application: PGApplication): Tgboolean; cdecl;
    padding: array[0..6] of Tgpointer;
  end;

function g_application_get_type: TGType; cdecl; external libgio2;
function g_application_id_is_valid(application_id: Pgchar): Tgboolean; cdecl; external libgio2;
function g_application_new(application_id: Pgchar; flags: TGApplicationFlags): PGApplication; cdecl; external libgio2;
function g_application_get_application_id(application: PGApplication): Pgchar; cdecl; external libgio2;
procedure g_application_set_application_id(application: PGApplication; application_id: Pgchar); cdecl; external libgio2;
function g_application_get_version(application: PGApplication): Pgchar; cdecl; external libgio2;
procedure g_application_set_version(application: PGApplication; version: Pgchar); cdecl; external libgio2;
function g_application_get_dbus_connection(application: PGApplication): PGDBusConnection; cdecl; external libgio2;
function g_application_get_dbus_object_path(application: PGApplication): Pgchar; cdecl; external libgio2;
function g_application_get_inactivity_timeout(application: PGApplication): Tguint; cdecl; external libgio2;
procedure g_application_set_inactivity_timeout(application: PGApplication; inactivity_timeout: Tguint); cdecl; external libgio2;
function g_application_get_flags(application: PGApplication): TGApplicationFlags; cdecl; external libgio2;
procedure g_application_set_flags(application: PGApplication; flags: TGApplicationFlags); cdecl; external libgio2;
function g_application_get_resource_base_path(application: PGApplication): Pgchar; cdecl; external libgio2;
procedure g_application_set_resource_base_path(application: PGApplication; resource_path: Pgchar); cdecl; external libgio2;
procedure g_application_set_action_group(application: PGApplication; action_group: PGActionGroup); cdecl; external libgio2;
procedure g_application_add_main_option_entries(application: PGApplication; entries: PGOptionEntry); cdecl; external libgio2;
procedure g_application_add_main_option(application: PGApplication; long_name: PChar; short_name: char; flags: TGOptionFlags; arg: TGOptionArg;
  description: PChar; arg_description: PChar); cdecl; external libgio2;
procedure g_application_add_option_group(application: PGApplication; group: PGOptionGroup); cdecl; external libgio2;
procedure g_application_set_option_context_parameter_string(application: PGApplication; parameter_string: Pgchar); cdecl; external libgio2;
procedure g_application_set_option_context_summary(application: PGApplication; summary: Pgchar); cdecl; external libgio2;
procedure g_application_set_option_context_description(application: PGApplication; description: Pgchar); cdecl; external libgio2;
function g_application_get_is_registered(application: PGApplication): Tgboolean; cdecl; external libgio2;
function g_application_get_is_remote(application: PGApplication): Tgboolean; cdecl; external libgio2;
function g_application_register(application: PGApplication; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libgio2;
procedure g_application_hold(application: PGApplication); cdecl; external libgio2;
procedure g_application_release(application: PGApplication); cdecl; external libgio2;
procedure g_application_activate(application: PGApplication); cdecl; external libgio2;
procedure g_application_open(application: PGApplication; files: PPGFile; n_files: Tgint; hint: Pgchar); cdecl; external libgio2;
function g_application_run(application: PGApplication; argc: longint; argv: PPchar): longint; cdecl; external libgio2;
procedure g_application_quit(application: PGApplication); cdecl; external libgio2;
function g_application_get_default: PGApplication; cdecl; external libgio2;
procedure g_application_set_default(application: PGApplication); cdecl; external libgio2;
procedure g_application_mark_busy(application: PGApplication); cdecl; external libgio2;
procedure g_application_unmark_busy(application: PGApplication); cdecl; external libgio2;
function g_application_get_is_busy(application: PGApplication): Tgboolean; cdecl; external libgio2;
procedure g_application_send_notification(application: PGApplication; id: Pgchar; notification: PGNotification); cdecl; external libgio2;
procedure g_application_withdraw_notification(application: PGApplication; id: Pgchar); cdecl; external libgio2;
procedure g_application_bind_busy_property(application: PGApplication; obj: Tgpointer; _property: Pgchar); cdecl; external libgio2;
procedure g_application_unbind_busy_property(application: PGApplication; obj: Tgpointer; _property: Pgchar); cdecl; external libgio2;

// === Konventiert am: 19-8-24 18:01:20 ===

function G_TYPE_APPLICATION: TGType;
function G_APPLICATION(obj: Pointer): PGApplication;
function G_APPLICATION_CLASS(klass: Pointer): PGApplicationClass;
function G_IS_APPLICATION(obj: Pointer): Tgboolean;
function G_IS_APPLICATION_CLASS(klass: Pointer): Tgboolean;
function G_APPLICATION_GET_CLASS(obj: Pointer): PGApplicationClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_TYPE_APPLICATION: TGType;
begin
  G_TYPE_APPLICATION := g_application_get_type;
end;

function G_APPLICATION(obj: Pointer): PGApplication;
begin
  Result := PGApplication(g_type_check_instance_cast(obj, G_TYPE_APPLICATION));
end;

function G_APPLICATION_CLASS(klass: Pointer): PGApplicationClass;
begin
  Result := PGApplicationClass(g_type_check_class_cast(klass, G_TYPE_APPLICATION));
end;

function G_IS_APPLICATION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_APPLICATION);
end;

function G_IS_APPLICATION_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_APPLICATION);
end;

function G_APPLICATION_GET_CLASS(obj: Pointer): PGApplicationClass;
begin
  Result := PGApplicationClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
