unit gdbusobjectmanagerclient;

interface

uses
  common_GLIB, gtypes, gobject, gerror, gtype, gvariant, giotypes, gioenums, gdbusobjectproxy, gdbusproxy;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGDBusObjectManagerClientClass = record
    parent_class: TGObjectClass;
    interface_proxy_signal: procedure(manager: PGDBusObjectManagerClient; object_proxy: PGDBusObjectProxy; interface_proxy: PGDBusProxy; sender_name: Pgchar; signal_name: Pgchar;
      parameters: PGVariant); cdecl;
    interface_proxy_properties_changed: procedure(manager: PGDBusObjectManagerClient; object_proxy: PGDBusObjectProxy; interface_proxy: PGDBusProxy; changed_properties: PGVariant; invalidated_properties: PPgchar); cdecl;
    padding: array[0..7] of Tgpointer;
  end;
  PGDBusObjectManagerClientClass = ^TGDBusObjectManagerClientClass;


function g_dbus_object_manager_client_get_type: TGType; cdecl; external libgio2;
procedure g_dbus_object_manager_client_new(connection: PGDBusConnection; flags: TGDBusObjectManagerClientFlags; Name: Pgchar; object_path: Pgchar; get_proxy_type_func: TGDBusProxyTypeFunc;
  get_proxy_type_user_data: Tgpointer; get_proxy_type_destroy_notify: TGDestroyNotify; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_dbus_object_manager_client_new_finish(res: PGAsyncResult; error: PPGError): PGDBusObjectManager; cdecl; external libgio2;
function g_dbus_object_manager_client_new_sync(connection: PGDBusConnection; flags: TGDBusObjectManagerClientFlags; Name: Pgchar; object_path: Pgchar; get_proxy_type_func: TGDBusProxyTypeFunc;
  get_proxy_type_user_data: Tgpointer; get_proxy_type_destroy_notify: TGDestroyNotify; cancellable: PGCancellable; error: PPGError): PGDBusObjectManager; cdecl; external libgio2;
procedure g_dbus_object_manager_client_new_for_bus(bus_type: TGBusType; flags: TGDBusObjectManagerClientFlags; Name: Pgchar; object_path: Pgchar; get_proxy_type_func: TGDBusProxyTypeFunc;
  get_proxy_type_user_data: Tgpointer; get_proxy_type_destroy_notify: TGDestroyNotify; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_dbus_object_manager_client_new_for_bus_finish(res: PGAsyncResult; error: PPGError): PGDBusObjectManager; cdecl; external libgio2;
function g_dbus_object_manager_client_new_for_bus_sync(bus_type: TGBusType; flags: TGDBusObjectManagerClientFlags; Name: Pgchar; object_path: Pgchar; get_proxy_type_func: TGDBusProxyTypeFunc;
  get_proxy_type_user_data: Tgpointer; get_proxy_type_destroy_notify: TGDestroyNotify; cancellable: PGCancellable; error: PPGError): PGDBusObjectManager; cdecl; external libgio2;
function g_dbus_object_manager_client_get_connection(manager: PGDBusObjectManagerClient): PGDBusConnection; cdecl; external libgio2;
function g_dbus_object_manager_client_get_flags(manager: PGDBusObjectManagerClient): TGDBusObjectManagerClientFlags; cdecl; external libgio2;
function g_dbus_object_manager_client_get_name(manager: PGDBusObjectManagerClient): Pgchar; cdecl; external libgio2;
function g_dbus_object_manager_client_get_name_owner(manager: PGDBusObjectManagerClient): Pgchar; cdecl; external libgio2;

// === Konventiert am: 16-8-24 20:10:29 ===

function G_TYPE_DBUS_OBJECT_MANAGER_CLIENT: TGType;
function G_DBUS_OBJECT_MANAGER_CLIENT(obj: Pointer): PGDBusObjectManagerClient;
function G_DBUS_OBJECT_MANAGER_CLIENT_CLASS(klass: Pointer): PGDBusObjectManagerClientClass;
function G_IS_DBUS_OBJECT_MANAGER_CLIENT(obj: Pointer): Tgboolean;
function G_IS_DBUS_OBJECT_MANAGER_CLIENT_CLASS(klass: Pointer): Tgboolean;
function G_DBUS_OBJECT_MANAGER_CLIENT_GET_CLASS(obj: Pointer): PGDBusObjectManagerClientClass;

implementation

function G_TYPE_DBUS_OBJECT_MANAGER_CLIENT: TGType;
begin
  G_TYPE_DBUS_OBJECT_MANAGER_CLIENT := g_dbus_object_manager_client_get_type;
end;

function G_DBUS_OBJECT_MANAGER_CLIENT(obj: Pointer): PGDBusObjectManagerClient;
begin
  Result := PGDBusObjectManagerClient(g_type_check_instance_cast(obj, G_TYPE_DBUS_OBJECT_MANAGER_CLIENT));
end;

function G_DBUS_OBJECT_MANAGER_CLIENT_CLASS(klass: Pointer): PGDBusObjectManagerClientClass;
begin
  Result := PGDBusObjectManagerClientClass(g_type_check_class_cast(klass, G_TYPE_DBUS_OBJECT_MANAGER_CLIENT));
end;

function G_IS_DBUS_OBJECT_MANAGER_CLIENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_DBUS_OBJECT_MANAGER_CLIENT);
end;

function G_IS_DBUS_OBJECT_MANAGER_CLIENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_DBUS_OBJECT_MANAGER_CLIENT);
end;

function G_DBUS_OBJECT_MANAGER_CLIENT_GET_CLASS(obj: Pointer): PGDBusObjectManagerClientClass;
begin
  Result := PGDBusObjectManagerClientClass(PGTypeInstance(obj)^.g_class);
end;



end.
