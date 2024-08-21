unit gmemorymonitor;

interface

uses
  common_GLIB, gtypes, gerror, gtype, giotypes, gobject, gioenums;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

const
  G_MEMORY_MONITOR_EXTENSION_POINT_NAME = 'gio-memory-monitor';
  {G_DECLARE_INTERFACE (GMemoryMonitor, g_memory_monitor, g, memory_monitor, GObject) }

type
  TGMemoryMonitor = record
  end;
  PGMemoryMonitor = ^TGMemoryMonitor;

  TGMemoryMonitorInterface = record
    g_iface: TGTypeInterface;
    low_memory_warning: procedure(monitor: PGMemoryMonitor; level: TGMemoryMonitorWarningLevel); cdecl;
  end;
  PGMemoryMonitorInterface = ^TGMemoryMonitorInterface;

function g_memory_monitor_get_type: TGType; cdecl; external libgtk4;
function g_memory_monitor_dup_default: PGMemoryMonitor; cdecl; external libgio2;

// === Konventiert am: 21-8-24 15:59:47 ===

function G_TYPE_MEMORY_MONITOR: TGType;
function G_MEMORY_MONITOR(obj: Pointer): PGMemoryMonitor;
function G_IS_MEMORY_MONITOR(obj: Pointer): Tgboolean;
function G_MEMORY_MONITOR_GET_INTERFACE(obj: Pointer): PGMemoryMonitorInterface;

function g_memory_monitor_GET_IFACE(obj: Pointer): PGMemoryMonitorInterface;

implementation

function G_TYPE_MEMORY_MONITOR: TGType;
begin
  G_TYPE_MEMORY_MONITOR := g_memory_monitor_get_type;
end;

function G_MEMORY_MONITOR(obj: Pointer): PGMemoryMonitor;
begin
  Result := PGMemoryMonitor(g_type_check_instance_cast(obj, G_TYPE_MEMORY_MONITOR));
end;

function G_IS_MEMORY_MONITOR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_MEMORY_MONITOR);
end;

function G_MEMORY_MONITOR_GET_INTERFACE(obj: Pointer): PGMemoryMonitorInterface;
begin
  Result := g_type_interface_peek(obj, G_TYPE_MEMORY_MONITOR);
end;


function g_memory_monitor_GET_IFACE(obj: Pointer): PGMemoryMonitorInterface;
begin
  Result := g_type_interface_peek(obj, g_TYPE_memory_monitor);
end;




end.
