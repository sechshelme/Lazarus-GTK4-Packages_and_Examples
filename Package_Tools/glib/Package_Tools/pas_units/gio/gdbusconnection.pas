unit gdbusconnection;

interface

uses
  common_GLIB, gtypes, gerror, gvariant, gvarianttype, gclosure, gtype, giotypes, gioenums, giostream, gunixfdlist, gdbusintrospection;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function g_dbus_connection_get_type: TGType; cdecl; external libgio2;
procedure g_bus_get(bus_type: TGBusType; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_bus_get_finish(res: PGAsyncResult; error: PPGError): PGDBusConnection; cdecl; external libgio2;
function g_bus_get_sync(bus_type: TGBusType; cancellable: PGCancellable; error: PPGError): PGDBusConnection; cdecl; external libgio2;
procedure g_dbus_connection_new(stream: PGIOStream; guid: Pgchar; flags: TGDBusConnectionFlags; observer: PGDBusAuthObserver; cancellable: PGCancellable;
  callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_dbus_connection_new_finish(res: PGAsyncResult; error: PPGError): PGDBusConnection; cdecl; external libgio2;
function g_dbus_connection_new_sync(stream: PGIOStream; guid: Pgchar; flags: TGDBusConnectionFlags; observer: PGDBusAuthObserver; cancellable: PGCancellable;
  error: PPGError): PGDBusConnection; cdecl; external libgio2;
procedure g_dbus_connection_new_for_address(address: Pgchar; flags: TGDBusConnectionFlags; observer: PGDBusAuthObserver; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
  user_data: Tgpointer); cdecl; external libgio2;
function g_dbus_connection_new_for_address_finish(res: PGAsyncResult; error: PPGError): PGDBusConnection; cdecl; external libgio2;
function g_dbus_connection_new_for_address_sync(address: Pgchar; flags: TGDBusConnectionFlags; observer: PGDBusAuthObserver; cancellable: PGCancellable; error: PPGError): PGDBusConnection; cdecl; external libgio2;
procedure g_dbus_connection_start_message_processing(connection: PGDBusConnection); cdecl; external libgio2;
function g_dbus_connection_is_closed(connection: PGDBusConnection): Tgboolean; cdecl; external libgio2;
function g_dbus_connection_get_stream(connection: PGDBusConnection): PGIOStream; cdecl; external libgio2;
function g_dbus_connection_get_guid(connection: PGDBusConnection): Pgchar; cdecl; external libgio2;
function g_dbus_connection_get_unique_name(connection: PGDBusConnection): Pgchar; cdecl; external libgio2;
function g_dbus_connection_get_peer_credentials(connection: PGDBusConnection): PGCredentials; cdecl; external libgio2;
function g_dbus_connection_get_last_serial(connection: PGDBusConnection): Tguint32; cdecl; external libgio2;
function g_dbus_connection_get_exit_on_close(connection: PGDBusConnection): Tgboolean; cdecl; external libgio2;
procedure g_dbus_connection_set_exit_on_close(connection: PGDBusConnection; exit_on_close: Tgboolean); cdecl; external libgio2;
function g_dbus_connection_get_capabilities(connection: PGDBusConnection): TGDBusCapabilityFlags; cdecl; external libgio2;
function g_dbus_connection_get_flags(connection: PGDBusConnection): TGDBusConnectionFlags; cdecl; external libgio2;
procedure g_dbus_connection_close(connection: PGDBusConnection; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_dbus_connection_close_finish(connection: PGDBusConnection; res: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_dbus_connection_close_sync(connection: PGDBusConnection; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libgio2;
procedure g_dbus_connection_flush(connection: PGDBusConnection; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_dbus_connection_flush_finish(connection: PGDBusConnection; res: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_dbus_connection_flush_sync(connection: PGDBusConnection; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_dbus_connection_send_message(connection: PGDBusConnection; message: PGDBusMessage; flags: TGDBusSendMessageFlags; out_serial: Pguint32; error: PPGError): Tgboolean; cdecl; external libgio2;
procedure g_dbus_connection_send_message_with_reply(connection: PGDBusConnection; message: PGDBusMessage; flags: TGDBusSendMessageFlags; timeout_msec: Tgint; out_serial: Pguint32;
  cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_dbus_connection_send_message_with_reply_finish(connection: PGDBusConnection; res: PGAsyncResult; error: PPGError): PGDBusMessage; cdecl; external libgio2;
function g_dbus_connection_send_message_with_reply_sync(connection: PGDBusConnection; message: PGDBusMessage; flags: TGDBusSendMessageFlags; timeout_msec: Tgint; out_serial: Pguint32;
  cancellable: PGCancellable; error: PPGError): PGDBusMessage; cdecl; external libgio2;
function g_dbus_connection_emit_signal(connection: PGDBusConnection; destination_bus_name: Pgchar; object_path: Pgchar; interface_name: Pgchar; signal_name: Pgchar;
  parameters: PGVariant; error: PPGError): Tgboolean; cdecl; external libgio2;
procedure g_dbus_connection_call(connection: PGDBusConnection; bus_name: Pgchar; object_path: Pgchar; interface_name: Pgchar; method_name: Pgchar;
  parameters: PGVariant; reply_type: PGVariantType; flags: TGDBusCallFlags; timeout_msec: Tgint; cancellable: PGCancellable;
  callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_dbus_connection_call_finish(connection: PGDBusConnection; res: PGAsyncResult; error: PPGError): PGVariant; cdecl; external libgio2;
function g_dbus_connection_call_sync(connection: PGDBusConnection; bus_name: Pgchar; object_path: Pgchar; interface_name: Pgchar; method_name: Pgchar;
  parameters: PGVariant; reply_type: PGVariantType; flags: TGDBusCallFlags; timeout_msec: Tgint; cancellable: PGCancellable;
  error: PPGError): PGVariant; cdecl; external libgio2;
{$ifdef linux}
procedure g_dbus_connection_call_with_unix_fd_list(connection: PGDBusConnection; bus_name: Pgchar; object_path: Pgchar; interface_name: Pgchar; method_name: Pgchar;
  parameters: PGVariant; reply_type: PGVariantType; flags: TGDBusCallFlags; timeout_msec: Tgint; fd_list: PGUnixFDList;
  cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_dbus_connection_call_with_unix_fd_list_finish(connection: PGDBusConnection; out_fd_list: PPGUnixFDList; res: PGAsyncResult; error: PPGError): PGVariant; cdecl; external libgio2;
function g_dbus_connection_call_with_unix_fd_list_sync(connection: PGDBusConnection; bus_name: Pgchar; object_path: Pgchar; interface_name: Pgchar; method_name: Pgchar;
  parameters: PGVariant; reply_type: PGVariantType; flags: TGDBusCallFlags; timeout_msec: Tgint; fd_list: PGUnixFDList;
  out_fd_list: PPGUnixFDList; cancellable: PGCancellable; error: PPGError): PGVariant; cdecl; external libgio2;
{$endif}
type

  TGDBusInterfaceMethodCallFunc = procedure(connection: PGDBusConnection; Sender: Pgchar; object_path: Pgchar; interface_name: Pgchar; method_name: Pgchar;
    parameters: PGVariant; invocation: PGDBusMethodInvocation; user_data: Tgpointer); cdecl;

  PGDBusInterfaceGetPropertyFunc = ^TGDBusInterfaceGetPropertyFunc;
  TGDBusInterfaceGetPropertyFunc = function(connection: PGDBusConnection; Sender: Pgchar; object_path: Pgchar; interface_name: Pgchar; property_name: Pgchar;
    error: PPGError; user_data: Tgpointer): PGVariant; cdecl;
  TGDBusInterfaceSetPropertyFunc = function(connection: PGDBusConnection; Sender: Pgchar; object_path: Pgchar; interface_name: Pgchar; property_name: Pgchar;
    Value: PGVariant; error: PPGError; user_data: Tgpointer): Tgboolean; cdecl;
  PGDBusInterfaceVTable = ^TGDBusInterfaceVTable;

  TGDBusInterfaceVTable = record
    method_call: TGDBusInterfaceMethodCallFunc;
    get_property: TGDBusInterfaceGetPropertyFunc;
    set_property: TGDBusInterfaceSetPropertyFunc;
    padding: array[0..7] of Tgpointer;
  end;


function g_dbus_connection_register_object(connection: PGDBusConnection; object_path: Pgchar; interface_info: PGDBusInterfaceInfo; vtable: PGDBusInterfaceVTable; user_data: Tgpointer;
  user_data_free_func: TGDestroyNotify; error: PPGError): Tguint; cdecl; external libgio2;
function g_dbus_connection_register_object_with_closures(connection: PGDBusConnection; object_path: Pgchar; interface_info: PGDBusInterfaceInfo; method_call_closure: PGClosure; get_property_closure: PGClosure;
  set_property_closure: PGClosure; error: PPGError): Tguint; cdecl; external libgio2;
function g_dbus_connection_unregister_object(connection: PGDBusConnection; registration_id: Tguint): Tgboolean; cdecl; external libgio2;

type
  PGDBusSubtreeEnumerateFunc = ^TGDBusSubtreeEnumerateFunc;
  TGDBusSubtreeEnumerateFunc = function(connection: PGDBusConnection; Sender: Pgchar; object_path: Pgchar; user_data: Tgpointer): PPgchar; cdecl;
  PGDBusSubtreeIntrospectFunc = ^TGDBusSubtreeIntrospectFunc;
  TGDBusSubtreeIntrospectFunc = function(connection: PGDBusConnection; Sender: Pgchar; object_path: Pgchar; node: Pgchar; user_data: Tgpointer): PPGDBusInterfaceInfo; cdecl;
  PGDBusSubtreeDispatchFunc = ^TGDBusSubtreeDispatchFunc;
  TGDBusSubtreeDispatchFunc = function(connection: PGDBusConnection; Sender: Pgchar; object_path: Pgchar; interface_name: Pgchar; node: Pgchar;
    out_user_data: Pgpointer; user_data: Tgpointer): PGDBusInterfaceVTable; cdecl;
  PGDBusSubtreeVTable = ^TGDBusSubtreeVTable;

  TGDBusSubtreeVTable = record
    enumerate: TGDBusSubtreeEnumerateFunc;
    introspect: TGDBusSubtreeIntrospectFunc;
    dispatch: TGDBusSubtreeDispatchFunc;
    padding: array[0..7] of Tgpointer;
  end;


function g_dbus_connection_register_subtree(connection: PGDBusConnection; object_path: Pgchar; vtable: PGDBusSubtreeVTable; flags: TGDBusSubtreeFlags; user_data: Tgpointer;
  user_data_free_func: TGDestroyNotify; error: PPGError): Tguint; cdecl; external libgio2;
function g_dbus_connection_unregister_subtree(connection: PGDBusConnection; registration_id: Tguint): Tgboolean; cdecl; external libgio2;

type
  TGDBusSignalCallback = procedure(connection: PGDBusConnection; sender_name: Pgchar; object_path: Pgchar; interface_name: Pgchar; signal_name: Pgchar;
    parameters: PGVariant; user_data: Tgpointer); cdecl;

function g_dbus_connection_signal_subscribe(connection: PGDBusConnection; Sender: Pgchar; interface_name: Pgchar; member: Pgchar; object_path: Pgchar;
  arg0: Pgchar; flags: TGDBusSignalFlags; callback: TGDBusSignalCallback; user_data: Tgpointer; user_data_free_func: TGDestroyNotify): Tguint; cdecl; external libgio2;
procedure g_dbus_connection_signal_unsubscribe(connection: PGDBusConnection; subscription_id: Tguint); cdecl; external libgio2;

type
  PGDBusMessageFilterFunction = ^TGDBusMessageFilterFunction;
  TGDBusMessageFilterFunction = function(connection: PGDBusConnection; message: PGDBusMessage; incoming: Tgboolean; user_data: Tgpointer): PGDBusMessage; cdecl;

function g_dbus_connection_add_filter(connection: PGDBusConnection; filter_function: TGDBusMessageFilterFunction; user_data: Tgpointer; user_data_free_func: TGDestroyNotify): Tguint; cdecl; external libgio2;
procedure g_dbus_connection_remove_filter(connection: PGDBusConnection; filter_id: Tguint); cdecl; external libgio2;

// === Konventiert am: 18-8-24 17:03:20 ===

function G_TYPE_DBUS_CONNECTION: TGType;
function G_DBUS_CONNECTION(obj: Pointer): PGDBusConnection;
function G_IS_DBUS_CONNECTION(obj: Pointer): Tgboolean;

implementation

function G_TYPE_DBUS_CONNECTION: TGType;
begin
  G_TYPE_DBUS_CONNECTION := g_dbus_connection_get_type;
end;

function G_DBUS_CONNECTION(obj: Pointer): PGDBusConnection;
begin
  Result := PGDBusConnection(g_type_check_instance_cast(obj, G_TYPE_DBUS_CONNECTION));
end;

function G_IS_DBUS_CONNECTION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_DBUS_CONNECTION);
end;



end.
