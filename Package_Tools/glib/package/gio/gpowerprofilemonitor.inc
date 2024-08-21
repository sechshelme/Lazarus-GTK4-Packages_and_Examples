/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

const
  G_POWER_PROFILE_MONITOR_EXTENSION_POINT_NAME = 'gio-power-profile-monitor';

  {G_DECLARE_INTERFACE (GPowerProfileMonitor, g_power_profile_monitor, g, power_profile_monitor, GObject) }
type
  TGPowerProfileMonitorInterface = record
    g_iface: TGTypeInterface;
  end;
  PGPowerProfileMonitorInterface = ^TGPowerProfileMonitorInterface;

  TGPowerProfileMonitor = record
  end;
  PGPowerProfileMonitor = ^TGPowerProfileMonitor;

function g_power_profile_monitor_get_type: TGType; cdecl; external libgtk4;
function g_power_profile_monitor_dup_default: PGPowerProfileMonitor; cdecl; external libgio2;
function g_power_profile_monitor_get_power_saver_enabled(monitor: PGPowerProfileMonitor): Tgboolean; cdecl; external libgio2;

// === Konventiert am: 21-8-24 15:47:09 ===

function G_TYPE_POWER_PROFILE_MONITOR: TGType;
function G_POWER_PROFILE_MONITOR(obj: Pointer): PGPowerProfileMonitor;
function G_IS_POWER_PROFILE_MONITOR(obj: Pointer): Tgboolean;
function G_POWER_PROFILE_MONITOR_GET_INTERFACE(obj: Pointer): PGPowerProfileMonitorInterface;

function g_power_profile_monitor_GET_IFACE(obj: Pointer): PGPowerProfileMonitorInterface;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_TYPE_POWER_PROFILE_MONITOR: TGType;
begin
  G_TYPE_POWER_PROFILE_MONITOR := g_power_profile_monitor_get_type;
end;

function G_POWER_PROFILE_MONITOR(obj: Pointer): PGPowerProfileMonitor;
begin
  Result := PGPowerProfileMonitor(g_type_check_instance_cast(obj, G_TYPE_POWER_PROFILE_MONITOR));
end;

function G_IS_POWER_PROFILE_MONITOR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_POWER_PROFILE_MONITOR);
end;

function G_POWER_PROFILE_MONITOR_GET_INTERFACE(obj: Pointer): PGPowerProfileMonitorInterface;
begin
  Result := g_type_interface_peek(obj, G_TYPE_POWER_PROFILE_MONITOR);
end;


function g_power_profile_monitor_GET_IFACE(obj: Pointer): PGPowerProfileMonitorInterface;
begin
  Result := g_type_interface_peek(obj, g_TYPE_power_profile_monitor);
end;



{$ENDIF read_implementation}
