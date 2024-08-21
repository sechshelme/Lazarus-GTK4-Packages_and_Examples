/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGDBusProxyPrivate = record
  end;
  PGDBusProxyPrivate = ^TGDBusProxyPrivate;

  TGDBusProxy = record
    parent_instance: TGObject;
    priv: PGDBusProxyPrivate;
  end;
  PGDBusProxy = ^TGDBusProxy;

  TGDBusProxyClass = record
    parent_class: TGObjectClass;
    g_properties_changed: procedure(proxy: PGDBusProxy; changed_properties: PGVariant; invalidated_properties: PPgchar); cdecl;
    g_signal: procedure(proxy: PGDBusProxy; sender_name: Pgchar; signal_name: Pgchar; parameters: PGVariant); cdecl;
    padding: array[0..31] of Tgpointer;
  end;
  PGDBusProxyClass = ^TGDBusProxyClass;

function g_dbus_proxy_get_type: TGType; cdecl; external libgio2;
procedure g_dbus_proxy_new(connection: PGDBusConnection; flags: TGDBusProxyFlags; info: PGDBusInterfaceInfo; Name: Pgchar; object_path: Pgchar;
  interface_name: Pgchar; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_dbus_proxy_new_finish(res: PGAsyncResult; error: PPGError): PGDBusProxy; cdecl; external libgio2;
function g_dbus_proxy_new_sync(connection: PGDBusConnection; flags: TGDBusProxyFlags; info: PGDBusInterfaceInfo; Name: Pgchar; object_path: Pgchar;
  interface_name: Pgchar; cancellable: PGCancellable; error: PPGError): PGDBusProxy; cdecl; external libgio2;
procedure g_dbus_proxy_new_for_bus(bus_type: TGBusType; flags: TGDBusProxyFlags; info: PGDBusInterfaceInfo; Name: Pgchar; object_path: Pgchar;
  interface_name: Pgchar; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_dbus_proxy_new_for_bus_finish(res: PGAsyncResult; error: PPGError): PGDBusProxy; cdecl; external libgio2;
function g_dbus_proxy_new_for_bus_sync(bus_type: TGBusType; flags: TGDBusProxyFlags; info: PGDBusInterfaceInfo; Name: Pgchar; object_path: Pgchar;
  interface_name: Pgchar; cancellable: PGCancellable; error: PPGError): PGDBusProxy; cdecl; external libgio2;
function g_dbus_proxy_get_connection(proxy: PGDBusProxy): PGDBusConnection; cdecl; external libgio2;
function g_dbus_proxy_get_flags(proxy: PGDBusProxy): TGDBusProxyFlags; cdecl; external libgio2;
function g_dbus_proxy_get_name(proxy: PGDBusProxy): Pgchar; cdecl; external libgio2;
function g_dbus_proxy_get_name_owner(proxy: PGDBusProxy): Pgchar; cdecl; external libgio2;
function g_dbus_proxy_get_object_path(proxy: PGDBusProxy): Pgchar; cdecl; external libgio2;
function g_dbus_proxy_get_interface_name(proxy: PGDBusProxy): Pgchar; cdecl; external libgio2;
function g_dbus_proxy_get_default_timeout(proxy: PGDBusProxy): Tgint; cdecl; external libgio2;
procedure g_dbus_proxy_set_default_timeout(proxy: PGDBusProxy; timeout_msec: Tgint); cdecl; external libgio2;
function g_dbus_proxy_get_interface_info(proxy: PGDBusProxy): PGDBusInterfaceInfo; cdecl; external libgio2;
procedure g_dbus_proxy_set_interface_info(proxy: PGDBusProxy; info: PGDBusInterfaceInfo); cdecl; external libgio2;
function g_dbus_proxy_get_cached_property(proxy: PGDBusProxy; property_name: Pgchar): PGVariant; cdecl; external libgio2;
procedure g_dbus_proxy_set_cached_property(proxy: PGDBusProxy; property_name: Pgchar; Value: PGVariant); cdecl; external libgio2;
function g_dbus_proxy_get_cached_property_names(proxy: PGDBusProxy): PPgchar; cdecl; external libgio2;
procedure g_dbus_proxy_call(proxy: PGDBusProxy; method_name: Pgchar; parameters: PGVariant; flags: TGDBusCallFlags; timeout_msec: Tgint;
  cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_dbus_proxy_call_finish(proxy: PGDBusProxy; res: PGAsyncResult; error: PPGError): PGVariant; cdecl; external libgio2;
function g_dbus_proxy_call_sync(proxy: PGDBusProxy; method_name: Pgchar; parameters: PGVariant; flags: TGDBusCallFlags; timeout_msec: Tgint;
  cancellable: PGCancellable; error: PPGError): PGVariant; cdecl; external libgio2;
{$ifdef Linux}
procedure g_dbus_proxy_call_with_unix_fd_list(proxy: PGDBusProxy; method_name: Pgchar; parameters: PGVariant; flags: TGDBusCallFlags; timeout_msec: Tgint;
  fd_list: PGUnixFDList; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_dbus_proxy_call_with_unix_fd_list_finish(proxy: PGDBusProxy; out_fd_list: PPGUnixFDList; res: PGAsyncResult; error: PPGError): PGVariant; cdecl; external libgio2;
function g_dbus_proxy_call_with_unix_fd_list_sync(proxy: PGDBusProxy; method_name: Pgchar; parameters: PGVariant; flags: TGDBusCallFlags; timeout_msec: Tgint;
  fd_list: PGUnixFDList; out_fd_list: PPGUnixFDList; cancellable: PGCancellable; error: PPGError): PGVariant; cdecl; external libgio2;
{$endif}

// === Konventiert am: 16-8-24 20:18:12 ===

function G_TYPE_DBUS_PROXY: TGType;
function G_DBUS_PROXY(obj: Pointer): PGDBusProxy;
function G_DBUS_PROXY_CLASS(klass: Pointer): PGDBusProxyClass;
function G_IS_DBUS_PROXY(obj: Pointer): Tgboolean;
function G_IS_DBUS_PROXY_CLASS(klass: Pointer): Tgboolean;
function G_DBUS_PROXY_GET_CLASS(obj: Pointer): PGDBusProxyClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_TYPE_DBUS_PROXY: TGType;
begin
  G_TYPE_DBUS_PROXY := g_dbus_proxy_get_type;
end;

function G_DBUS_PROXY(obj: Pointer): PGDBusProxy;
begin
  Result := PGDBusProxy(g_type_check_instance_cast(obj, G_TYPE_DBUS_PROXY));
end;

function G_DBUS_PROXY_CLASS(klass: Pointer): PGDBusProxyClass;
begin
  Result := PGDBusProxyClass(g_type_check_class_cast(klass, G_TYPE_DBUS_PROXY));
end;

function G_IS_DBUS_PROXY(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_DBUS_PROXY);
end;

function G_IS_DBUS_PROXY_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_DBUS_PROXY);
end;

function G_DBUS_PROXY_GET_CLASS(obj: Pointer): PGDBusProxyClass;
begin
  Result := PGDBusProxyClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
