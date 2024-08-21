/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGAppInfoMonitor = record
  end;
  PGAppInfoMonitor = ^TGAppInfoMonitor;

  TGAppLaunchContextPrivate = record
  end;
  PGAppLaunchContextPrivate = ^TGAppLaunchContextPrivate;

  TGAppLaunchContext = record
    parent_instance: TGObject;
    priv: PGAppLaunchContextPrivate;
  end;
  PGAppLaunchContext = ^TGAppLaunchContext;

  TGAppLaunchContextClass = record
    parent_class: TGObjectClass;
    get_display: function(context: PGAppLaunchContext; info: PGAppInfo; files: PGList): PChar; cdecl;
    get_startup_notify_id: function(context: PGAppLaunchContext; info: PGAppInfo; files: PGList): PChar; cdecl;
    launch_failed: procedure(context: PGAppLaunchContext; startup_notify_id: PChar); cdecl;
    launched: procedure(context: PGAppLaunchContext; info: PGAppInfo; platform_data: PGVariant); cdecl;
    launch_started: procedure(context: PGAppLaunchContext; info: PGAppInfo; platform_data: PGVariant); cdecl;
    _g_reserved1: procedure; cdecl;
    _g_reserved2: procedure; cdecl;
    _g_reserved3: procedure; cdecl;
  end;
  PGAppLaunchContextClass = ^TGAppLaunchContextClass;

  TGAppInfoIface = record
    g_iface: TGTypeInterface;
    dup: function(appinfo: PGAppInfo): PGAppInfo; cdecl;
    equal: function(appinfo1: PGAppInfo; appinfo2: PGAppInfo): Tgboolean; cdecl;
    get_id: function(appinfo: PGAppInfo): PChar; cdecl;
    get_name: function(appinfo: PGAppInfo): PChar; cdecl;
    get_description: function(appinfo: PGAppInfo): PChar; cdecl;
    get_executable: function(appinfo: PGAppInfo): PChar; cdecl;
    get_icon: function(appinfo: PGAppInfo): PGIcon; cdecl;
    launch: function(appinfo: PGAppInfo; files: PGList; context: PGAppLaunchContext; error: PPGError): Tgboolean; cdecl;
    supports_uris: function(appinfo: PGAppInfo): Tgboolean; cdecl;
    supports_files: function(appinfo: PGAppInfo): Tgboolean; cdecl;
    launch_uris: function(appinfo: PGAppInfo; uris: PGList; context: PGAppLaunchContext; error: PPGError): Tgboolean; cdecl;
    should_show: function(appinfo: PGAppInfo): Tgboolean; cdecl;
    set_as_default_for_type: function(appinfo: PGAppInfo; content_type: PChar; error: PPGError): Tgboolean; cdecl;
    set_as_default_for_extension: function(appinfo: PGAppInfo; extension: PChar; error: PPGError): Tgboolean; cdecl;
    add_supports_type: function(appinfo: PGAppInfo; content_type: PChar; error: PPGError): Tgboolean; cdecl;
    can_remove_supports_type: function(appinfo: PGAppInfo): Tgboolean; cdecl;
    remove_supports_type: function(appinfo: PGAppInfo; content_type: PChar; error: PPGError): Tgboolean; cdecl;
    can_delete: function(appinfo: PGAppInfo): Tgboolean; cdecl;
    do_delete: function(appinfo: PGAppInfo): Tgboolean; cdecl;
    get_commandline: function(appinfo: PGAppInfo): PChar; cdecl;
    get_display_name: function(appinfo: PGAppInfo): PChar; cdecl;
    set_as_last_used_for_type: function(appinfo: PGAppInfo; content_type: PChar; error: PPGError): Tgboolean; cdecl;
    get_supported_types: function(appinfo: PGAppInfo): PPchar; cdecl;
    launch_uris_async: procedure(appinfo: PGAppInfo; uris: PGList; context: PGAppLaunchContext; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
      user_data: Tgpointer); cdecl;
    launch_uris_finish: function(appinfo: PGAppInfo; Result: PGAsyncResult; error: PPGError): Tgboolean; cdecl;
  end;
  PGAppInfoIface = ^TGAppInfoIface;


function g_app_info_get_type: TGType; cdecl; external libgio2;
function g_app_info_create_from_commandline(commandline: PChar; application_name: PChar; flags: TGAppInfoCreateFlags; error: PPGError): PGAppInfo; cdecl; external libgio2;
function g_app_info_dup(appinfo: PGAppInfo): PGAppInfo; cdecl; external libgio2;
function g_app_info_equal(appinfo1: PGAppInfo; appinfo2: PGAppInfo): Tgboolean; cdecl; external libgio2;
function g_app_info_get_id(appinfo: PGAppInfo): PChar; cdecl; external libgio2;
function g_app_info_get_name(appinfo: PGAppInfo): PChar; cdecl; external libgio2;
function g_app_info_get_display_name(appinfo: PGAppInfo): PChar; cdecl; external libgio2;
function g_app_info_get_description(appinfo: PGAppInfo): PChar; cdecl; external libgio2;
function g_app_info_get_executable(appinfo: PGAppInfo): PChar; cdecl; external libgio2;
function g_app_info_get_commandline(appinfo: PGAppInfo): PChar; cdecl; external libgio2;
function g_app_info_get_icon(appinfo: PGAppInfo): PGIcon; cdecl; external libgio2;
function g_app_info_launch(appinfo: PGAppInfo; files: PGList; context: PGAppLaunchContext; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_app_info_supports_uris(appinfo: PGAppInfo): Tgboolean; cdecl; external libgio2;
function g_app_info_supports_files(appinfo: PGAppInfo): Tgboolean; cdecl; external libgio2;
function g_app_info_launch_uris(appinfo: PGAppInfo; uris: PGList; context: PGAppLaunchContext; error: PPGError): Tgboolean; cdecl; external libgio2;
procedure g_app_info_launch_uris_async(appinfo: PGAppInfo; uris: PGList; context: PGAppLaunchContext; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
  user_data: Tgpointer); cdecl; external libgio2;
function g_app_info_launch_uris_finish(appinfo: PGAppInfo; Result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_app_info_should_show(appinfo: PGAppInfo): Tgboolean; cdecl; external libgio2;
function g_app_info_set_as_default_for_type(appinfo: PGAppInfo; content_type: PChar; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_app_info_set_as_default_for_extension(appinfo: PGAppInfo; extension: PChar; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_app_info_add_supports_type(appinfo: PGAppInfo; content_type: PChar; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_app_info_can_remove_supports_type(appinfo: PGAppInfo): Tgboolean; cdecl; external libgio2;
function g_app_info_remove_supports_type(appinfo: PGAppInfo; content_type: PChar; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_app_info_get_supported_types(appinfo: PGAppInfo): PPChar; cdecl; external libgio2;
function g_app_info_can_delete(appinfo: PGAppInfo): Tgboolean; cdecl; external libgio2;
function g_app_info_delete(appinfo: PGAppInfo): Tgboolean; cdecl; external libgio2;
function g_app_info_set_as_last_used_for_type(appinfo: PGAppInfo; content_type: PChar; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_app_info_get_all: PGList; cdecl; external libgio2;
function g_app_info_get_all_for_type(content_type: PChar): PGList; cdecl; external libgio2;
function g_app_info_get_recommended_for_type(content_type: Pgchar): PGList; cdecl; external libgio2;
function g_app_info_get_fallback_for_type(content_type: Pgchar): PGList; cdecl; external libgio2;
procedure g_app_info_reset_type_associations(content_type: PChar); cdecl; external libgio2;
function g_app_info_get_default_for_type(content_type: PChar; must_support_uris: Tgboolean): PGAppInfo; cdecl; external libgio2;
procedure g_app_info_get_default_for_type_async(content_type: PChar; must_support_uris: Tgboolean; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_app_info_get_default_for_type_finish(Result: PGAsyncResult; error: PPGError): PGAppInfo; cdecl; external libgio2;
function g_app_info_get_default_for_uri_scheme(uri_scheme: PChar): PGAppInfo; cdecl; external libgio2;
procedure g_app_info_get_default_for_uri_scheme_async(uri_scheme: PChar; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_app_info_get_default_for_uri_scheme_finish(Result: PGAsyncResult; error: PPGError): PGAppInfo; cdecl; external libgio2;
function g_app_info_launch_default_for_uri(uri: PChar; context: PGAppLaunchContext; error: PPGError): Tgboolean; cdecl; external libgio2;
procedure g_app_info_launch_default_for_uri_async(uri: PChar; context: PGAppLaunchContext; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_app_info_launch_default_for_uri_finish(Result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libgio2;

function g_app_launch_context_get_type: TGType; cdecl; external libgio2;
function g_app_launch_context_new: PGAppLaunchContext; cdecl; external libgio2;
procedure g_app_launch_context_setenv(context: PGAppLaunchContext; variable: PChar; Value: PChar); cdecl; external libgio2;
procedure g_app_launch_context_unsetenv(context: PGAppLaunchContext; variable: PChar); cdecl; external libgio2;
function g_app_launch_context_get_environment(context: PGAppLaunchContext): PPChar; cdecl; external libgio2;
function g_app_launch_context_get_display(context: PGAppLaunchContext; info: PGAppInfo; files: PGList): PChar; cdecl; external libgio2;
function g_app_launch_context_get_startup_notify_id(context: PGAppLaunchContext; info: PGAppInfo; files: PGList): PChar; cdecl; external libgio2;
procedure g_app_launch_context_launch_failed(context: PGAppLaunchContext; startup_notify_id: PChar); cdecl; external libgio2;

function g_app_info_monitor_get_type: TGType; cdecl; external libgio2;
function g_app_info_monitor_get: PGAppInfoMonitor; cdecl; external libgio2;

// === Konventiert am: 18-8-24 17:23:03 ===

function G_TYPE_APP_INFO: TGType;
function G_APP_INFO(obj: Pointer): PGAppInfo;
function G_IS_APP_INFO(obj: Pointer): Tgboolean;
function G_APP_INFO_GET_IFACE(obj: Pointer): PGAppInfoIface;

function G_TYPE_APP_LAUNCH_CONTEXT: TGType;
function G_APP_LAUNCH_CONTEXT(obj: Pointer): PGAppLaunchContext;
function G_APP_LAUNCH_CONTEXT_CLASS(klass: Pointer): PGAppLaunchContextClass;
function G_IS_APP_LAUNCH_CONTEXT(obj: Pointer): Tgboolean;
function G_IS_APP_LAUNCH_CONTEXT_CLASS(klass: Pointer): Tgboolean;
function G_APP_LAUNCH_CONTEXT_GET_CLASS(obj: Pointer): PGAppLaunchContextClass;

function G_TYPE_APP_INFO_MONITOR: TGType;
function G_APP_INFO_MONITOR(obj: Pointer): PGAppInfoMonitor;
function G_IS_APP_INFO_MONITOR(obj: Pointer): Tgboolean;


{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_TYPE_APP_INFO: TGType;
begin
  G_TYPE_APP_INFO := g_app_info_get_type;
end;

function G_APP_INFO(obj: Pointer): PGAppInfo;
begin
  Result := PGAppInfo(g_type_check_instance_cast(obj, G_TYPE_APP_INFO));
end;

function G_IS_APP_INFO(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_APP_INFO);
end;

function G_APP_INFO_GET_IFACE(obj: Pointer): PGAppInfoIface;
begin
  Result := g_type_interface_peek(obj, G_TYPE_APP_INFO);
end;

// ====

function G_TYPE_APP_LAUNCH_CONTEXT: TGType;
begin
  G_TYPE_APP_LAUNCH_CONTEXT := g_app_launch_context_get_type;
end;

function G_APP_LAUNCH_CONTEXT(obj: Pointer): PGAppLaunchContext;
begin
  Result := PGAppLaunchContext(g_type_check_instance_cast(obj, G_TYPE_APP_LAUNCH_CONTEXT));
end;

function G_APP_LAUNCH_CONTEXT_CLASS(klass: Pointer): PGAppLaunchContextClass;
begin
  Result := PGAppLaunchContextClass(g_type_check_class_cast(klass, G_TYPE_APP_LAUNCH_CONTEXT));
end;

function G_IS_APP_LAUNCH_CONTEXT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_APP_LAUNCH_CONTEXT);
end;

function G_IS_APP_LAUNCH_CONTEXT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_APP_LAUNCH_CONTEXT);
end;

function G_APP_LAUNCH_CONTEXT_GET_CLASS(obj: Pointer): PGAppLaunchContextClass;
begin
  Result := PGAppLaunchContextClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function G_TYPE_APP_INFO_MONITOR: TGType;
begin
  G_TYPE_APP_INFO_MONITOR := g_app_info_monitor_get_type;
end;

function G_APP_INFO_MONITOR(obj: Pointer): PGAppInfoMonitor;
begin
  Result := PGAppInfoMonitor(g_type_check_instance_cast(obj, G_TYPE_APP_INFO_MONITOR));
end;

function G_IS_APP_INFO_MONITOR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_APP_INFO_MONITOR);
end;


{$ENDIF read_implementation}
