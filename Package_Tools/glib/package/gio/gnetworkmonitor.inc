/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}


const
  G_NETWORK_MONITOR_EXTENSION_POINT_NAME = 'gio-network-monitor';

type
  TGNetworkMonitor = record
  end;
  PGNetworkMonitor = ^TGNetworkMonitor;

  TGNetworkMonitorInterface = record
    g_iface: TGTypeInterface;
    network_changed: procedure(monitor: PGNetworkMonitor; network_available: Tgboolean); cdecl;
    can_reach: function(monitor: PGNetworkMonitor; connectable: PGSocketConnectable; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl;
    can_reach_async: procedure(monitor: PGNetworkMonitor; connectable: PGSocketConnectable; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl;
    can_reach_finish: function(monitor: PGNetworkMonitor; Result: PGAsyncResult; error: PPGError): Tgboolean; cdecl;
  end;
  PGNetworkMonitorInterface = ^TGNetworkMonitorInterface;


function g_network_monitor_get_type: TGType; cdecl; external libgio2;
function g_network_monitor_get_default: PGNetworkMonitor; cdecl; external libgio2;
function g_network_monitor_get_network_available(monitor: PGNetworkMonitor): Tgboolean; cdecl; external libgio2;
function g_network_monitor_get_network_metered(monitor: PGNetworkMonitor): Tgboolean; cdecl; external libgio2;
function g_network_monitor_get_connectivity(monitor: PGNetworkMonitor): TGNetworkConnectivity; cdecl; external libgio2;
function g_network_monitor_can_reach(monitor: PGNetworkMonitor; connectable: PGSocketConnectable; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libgio2;
procedure g_network_monitor_can_reach_async(monitor: PGNetworkMonitor; connectable: PGSocketConnectable; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_network_monitor_can_reach_finish(monitor: PGNetworkMonitor; Result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libgio2;

// === Konventiert am: 20-8-24 18:01:52 ===

function G_TYPE_NETWORK_MONITOR: TGType;
function G_NETWORK_MONITOR(obj: Pointer): PGNetworkMonitor;
function G_IS_NETWORK_MONITOR(obj: Pointer): Tgboolean;
function G_NETWORK_MONITOR_GET_INTERFACE(obj: Pointer): PGNetworkMonitorInterface;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_TYPE_NETWORK_MONITOR: TGType;
begin
  G_TYPE_NETWORK_MONITOR := g_network_monitor_get_type;
end;

function G_NETWORK_MONITOR(obj: Pointer): PGNetworkMonitor;
begin
  Result := PGNetworkMonitor(g_type_check_instance_cast(obj, G_TYPE_NETWORK_MONITOR));
end;

function G_IS_NETWORK_MONITOR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_NETWORK_MONITOR);
end;

function G_NETWORK_MONITOR_GET_INTERFACE(obj: Pointer): PGNetworkMonitorInterface;
begin
  Result := g_type_interface_peek(obj, G_TYPE_NETWORK_MONITOR);
end;



{$ENDIF read_implementation}
