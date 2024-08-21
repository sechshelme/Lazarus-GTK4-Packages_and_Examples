unit gnativevolumemonitor;

interface

uses
  common_GLIB, gtypes, gerror, gtype, giotypes, gobject, gioenums, gvolumemonitor;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

const
  G_NATIVE_VOLUME_MONITOR_EXTENSION_POINT_NAME = 'gio-native-volume-monitor';

type
  TGNativeVolumeMonitor = record
    parent_instance: TGVolumeMonitor;
  end;
  PGNativeVolumeMonitor = ^TGNativeVolumeMonitor;

  TGNativeVolumeMonitorClass = record
    parent_class: TGVolumeMonitorClass;
    get_mount_for_mount_path: function(mount_path: PChar; cancellable: PGCancellable): PGMount; cdecl;
  end;
  PGNativeVolumeMonitorClass = ^TGNativeVolumeMonitorClass;

function g_native_volume_monitor_get_type: TGType; cdecl; external libgio2;

// === Konventiert am: 21-8-24 16:00:25 ===

function G_TYPE_NATIVE_VOLUME_MONITOR: TGType;
function G_NATIVE_VOLUME_MONITOR(obj: Pointer): PGNativeVolumeMonitor;
function G_NATIVE_VOLUME_MONITOR_CLASS(klass: Pointer): PGNativeVolumeMonitorClass;
function G_IS_NATIVE_VOLUME_MONITOR(obj: Pointer): Tgboolean;
function G_IS_NATIVE_VOLUME_MONITOR_CLASS(klass: Pointer): Tgboolean;

implementation

function G_TYPE_NATIVE_VOLUME_MONITOR: TGType;
begin
  G_TYPE_NATIVE_VOLUME_MONITOR := g_native_volume_monitor_get_type;
end;

function G_NATIVE_VOLUME_MONITOR(obj: Pointer): PGNativeVolumeMonitor;
begin
  Result := PGNativeVolumeMonitor(g_type_check_instance_cast(obj, G_TYPE_NATIVE_VOLUME_MONITOR));
end;

function G_NATIVE_VOLUME_MONITOR_CLASS(klass: Pointer): PGNativeVolumeMonitorClass;
begin
  Result := PGNativeVolumeMonitorClass(g_type_check_class_cast(klass, G_TYPE_NATIVE_VOLUME_MONITOR));
end;

function G_IS_NATIVE_VOLUME_MONITOR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_NATIVE_VOLUME_MONITOR);
end;

function G_IS_NATIVE_VOLUME_MONITOR_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_NATIVE_VOLUME_MONITOR);
end;



end.
