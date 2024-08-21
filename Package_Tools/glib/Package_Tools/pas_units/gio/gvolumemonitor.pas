unit gvolumemonitor;

interface

uses
  common_GLIB, gtypes, glist, gtype, giotypes, gobject, gioenums, gvolume;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  G_VOLUME_MONITOR_EXTENSION_POINT_NAME = 'gio-volume-monitor';

type
  TGVolumeMonitor = record
    parent_instance: TGObject;
    priv: Tgpointer;
  end;
  PGVolumeMonitor = ^TGVolumeMonitor;

  TGVolumeMonitorClass = record
    parent_class: TGObjectClass;
    volume_added: procedure(volume_monitor: PGVolumeMonitor; volume: PGVolume); cdecl;
    volume_removed: procedure(volume_monitor: PGVolumeMonitor; volume: PGVolume); cdecl;
    volume_changed: procedure(volume_monitor: PGVolumeMonitor; volume: PGVolume); cdecl;
    mount_added: procedure(volume_monitor: PGVolumeMonitor; mount: PGMount); cdecl;
    mount_removed: procedure(volume_monitor: PGVolumeMonitor; mount: PGMount); cdecl;
    mount_pre_unmount: procedure(volume_monitor: PGVolumeMonitor; mount: PGMount); cdecl;
    mount_changed: procedure(volume_monitor: PGVolumeMonitor; mount: PGMount); cdecl;
    drive_connected: procedure(volume_monitor: PGVolumeMonitor; drive: PGDrive); cdecl;
    drive_disconnected: procedure(volume_monitor: PGVolumeMonitor; drive: PGDrive); cdecl;
    drive_changed: procedure(volume_monitor: PGVolumeMonitor; drive: PGDrive); cdecl;
    is_supported: function: Tgboolean; cdecl;
    get_connected_drives: function(volume_monitor: PGVolumeMonitor): PGList; cdecl;
    get_volumes: function(volume_monitor: PGVolumeMonitor): PGList; cdecl;
    get_mounts: function(volume_monitor: PGVolumeMonitor): PGList; cdecl;
    get_volume_for_uuid: function(volume_monitor: PGVolumeMonitor; uuid: PChar): PGVolume; cdecl;
    get_mount_for_uuid: function(volume_monitor: PGVolumeMonitor; uuid: PChar): PGMount; cdecl;
    adopt_orphan_mount: function(mount: PGMount; volume_monitor: PGVolumeMonitor): PGVolume; cdecl;
    drive_eject_button: procedure(volume_monitor: PGVolumeMonitor; drive: PGDrive); cdecl;
    drive_stop_button: procedure(volume_monitor: PGVolumeMonitor; drive: PGDrive); cdecl;
    _g_reserved1: procedure; cdecl;
    _g_reserved2: procedure; cdecl;
    _g_reserved3: procedure; cdecl;
    _g_reserved4: procedure; cdecl;
    _g_reserved5: procedure; cdecl;
    _g_reserved6: procedure; cdecl;
  end;
  PGVolumeMonitorClass = ^TGVolumeMonitorClass;


function g_volume_monitor_get_type: TGType; cdecl; external libgio2;
function g_volume_monitor_get: PGVolumeMonitor; cdecl; external libgio2;
function g_volume_monitor_get_connected_drives(volume_monitor: PGVolumeMonitor): PGList; cdecl; external libgio2;
function g_volume_monitor_get_volumes(volume_monitor: PGVolumeMonitor): PGList; cdecl; external libgio2;
function g_volume_monitor_get_mounts(volume_monitor: PGVolumeMonitor): PGList; cdecl; external libgio2;
function g_volume_monitor_get_volume_for_uuid(volume_monitor: PGVolumeMonitor; uuid: PChar): PGVolume; cdecl; external libgio2;
function g_volume_monitor_get_mount_for_uuid(volume_monitor: PGVolumeMonitor; uuid: PChar): PGMount; cdecl; external libgio2;
function g_volume_monitor_adopt_orphan_mount(mount: PGMount): PGVolume; cdecl; external libgio2;

// === Konventiert am: 20-8-24 16:20:30 ===

function G_TYPE_VOLUME_MONITOR: TGType;
function G_VOLUME_MONITOR(obj: Pointer): PGVolumeMonitor;
function G_VOLUME_MONITOR_CLASS(klass: Pointer): PGVolumeMonitorClass;
function G_IS_VOLUME_MONITOR(obj: Pointer): Tgboolean;
function G_IS_VOLUME_MONITOR_CLASS(klass: Pointer): Tgboolean;
function G_VOLUME_MONITOR_GET_CLASS(obj: Pointer): PGVolumeMonitorClass;

implementation

function G_TYPE_VOLUME_MONITOR: TGType;
begin
  G_TYPE_VOLUME_MONITOR := g_volume_monitor_get_type;
end;

function G_VOLUME_MONITOR(obj: Pointer): PGVolumeMonitor;
begin
  Result := PGVolumeMonitor(g_type_check_instance_cast(obj, G_TYPE_VOLUME_MONITOR));
end;

function G_VOLUME_MONITOR_CLASS(klass: Pointer): PGVolumeMonitorClass;
begin
  Result := PGVolumeMonitorClass(g_type_check_class_cast(klass, G_TYPE_VOLUME_MONITOR));
end;

function G_IS_VOLUME_MONITOR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_VOLUME_MONITOR);
end;

function G_IS_VOLUME_MONITOR_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_VOLUME_MONITOR);
end;

function G_VOLUME_MONITOR_GET_CLASS(obj: Pointer): PGVolumeMonitorClass;
begin
  Result := PGVolumeMonitorClass(PGTypeInstance(obj)^.g_class);
end;



end.
