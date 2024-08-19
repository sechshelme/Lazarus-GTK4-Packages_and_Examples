unit gvolume;

interface

uses
  common_GLIB, gtypes, gtype, gerror, giotypes, gobject, gioenums, gmountoperation;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

const
  G_VOLUME_IDENTIFIER_KIND_HAL_UDI = 'hal-udi';
  G_VOLUME_IDENTIFIER_KIND_UNIX_DEVICE = 'unix-device';
  G_VOLUME_IDENTIFIER_KIND_LABEL = 'label';
  G_VOLUME_IDENTIFIER_KIND_UUID = 'uuid';
  G_VOLUME_IDENTIFIER_KIND_NFS_MOUNT = 'nfs-mount';
  G_VOLUME_IDENTIFIER_KIND_CLASS = 'class';

type
  TGVolume=record
      end;
  PGVolume=^TGVolume;

  TGVolumeIface = record
    g_iface: TGTypeInterface;
    changed: procedure(volume: PGVolume); cdecl;
    removed: procedure(volume: PGVolume); cdecl;
    get_name: function(volume: PGVolume): PChar; cdecl;
    get_icon: function(volume: PGVolume): PGIcon; cdecl;
    get_uuid: function(volume: PGVolume): PChar; cdecl;
    get_drive: function(volume: PGVolume): PGDrive; cdecl;
    get_mount: function(volume: PGVolume): PGMount; cdecl;
    can_mount: function(volume: PGVolume): Tgboolean; cdecl;
    can_eject: function(volume: PGVolume): Tgboolean; cdecl;
    mount_fn: procedure(volume: PGVolume; flags: TGMountMountFlags; mount_operation: PGMountOperation; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
      user_data: Tgpointer); cdecl;
    mount_finish: function(volume: PGVolume; Result: PGAsyncResult; error: PPGError): Tgboolean; cdecl;
    eject: procedure(volume: PGVolume; flags: TGMountUnmountFlags; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl;
    eject_finish: function(volume: PGVolume; Result: PGAsyncResult; error: PPGError): Tgboolean; cdecl;
    get_identifier: function(volume: PGVolume; kind: PChar): PChar; cdecl;
    enumerate_identifiers: function(volume: PGVolume): PPchar; cdecl;
    should_automount: function(volume: PGVolume): Tgboolean; cdecl;
    get_activation_root: function(volume: PGVolume): PGFile; cdecl;
    eject_with_operation: procedure(volume: PGVolume; flags: TGMountUnmountFlags; mount_operation: PGMountOperation; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
      user_data: Tgpointer); cdecl;
    eject_with_operation_finish: function(volume: PGVolume; Result: PGAsyncResult; error: PPGError): Tgboolean; cdecl;
    get_sort_key: function(volume: PGVolume): Pgchar; cdecl;
    get_symbolic_icon: function(volume: PGVolume): PGIcon; cdecl;
  end;
  PGVolumeIface = ^TGVolumeIface;


function g_volume_get_type: TGType; cdecl; external libgio2;
function g_volume_get_name(volume: PGVolume): PChar; cdecl; external libgio2;
function g_volume_get_icon(volume: PGVolume): PGIcon; cdecl; external libgio2;
function g_volume_get_symbolic_icon(volume: PGVolume): PGIcon; cdecl; external libgio2;
function g_volume_get_uuid(volume: PGVolume): PChar; cdecl; external libgio2;
function g_volume_get_drive(volume: PGVolume): PGDrive; cdecl; external libgio2;
function g_volume_get_mount(volume: PGVolume): PGMount; cdecl; external libgio2;
function g_volume_can_mount(volume: PGVolume): Tgboolean; cdecl; external libgio2;
function g_volume_can_eject(volume: PGVolume): Tgboolean; cdecl; external libgio2;
function g_volume_should_automount(volume: PGVolume): Tgboolean; cdecl; external libgio2;
procedure g_volume_mount(volume: PGVolume; flags: TGMountMountFlags; mount_operation: PGMountOperation; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
  user_data: Tgpointer); cdecl; external libgio2;
function g_volume_mount_finish(volume: PGVolume; Result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libgio2;
procedure g_volume_eject(volume: PGVolume; flags: TGMountUnmountFlags; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_volume_eject_finish(volume: PGVolume; Result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_volume_get_identifier(volume: PGVolume; kind: PChar): PChar; cdecl; external libgio2;
function g_volume_enumerate_identifiers(volume: PGVolume): PPChar; cdecl; external libgio2;
function g_volume_get_activation_root(volume: PGVolume): PGFile; cdecl; external libgio2;
procedure g_volume_eject_with_operation(volume: PGVolume; flags: TGMountUnmountFlags; mount_operation: PGMountOperation; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
  user_data: Tgpointer); cdecl; external libgio2;
function g_volume_eject_with_operation_finish(volume: PGVolume; Result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_volume_get_sort_key(volume: PGVolume): Pgchar; cdecl; external libgio2;

// === Konventiert am: 19-8-24 17:50:10 ===

function G_TYPE_VOLUME: TGType;
function G_VOLUME(obj: Pointer): PGVolume;
function G_IS_VOLUME(obj: Pointer): Tgboolean;
function G_VOLUME_GET_IFACE(obj: Pointer): PGVolumeIface;

implementation

function G_TYPE_VOLUME: TGType;
begin
  G_TYPE_VOLUME := g_volume_get_type;
end;

function G_VOLUME(obj: Pointer): PGVolume;
begin
  Result := PGVolume(g_type_check_instance_cast(obj, G_TYPE_VOLUME));
end;

function G_IS_VOLUME(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_VOLUME);
end;

function G_VOLUME_GET_IFACE(obj: Pointer): PGVolumeIface;
begin
  Result := g_type_interface_peek(obj, G_TYPE_VOLUME);
end;



end.
