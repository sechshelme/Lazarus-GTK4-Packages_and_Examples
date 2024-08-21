/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGMountIface = record
    g_iface: TGTypeInterface;
    changed: procedure(mount: PGMount); cdecl;
    unmounted: procedure(mount: PGMount); cdecl;
    get_root: function(mount: PGMount): PGFile; cdecl;
    get_name: function(mount: PGMount): PChar; cdecl;
    get_icon: function(mount: PGMount): PGIcon; cdecl;
    get_uuid: function(mount: PGMount): PChar; cdecl;
    get_volume: function(mount: PGMount): PGVolume; cdecl;
    get_drive: function(mount: PGMount): PGDrive; cdecl;
    can_unmount: function(mount: PGMount): Tgboolean; cdecl;
    can_eject: function(mount: PGMount): Tgboolean; cdecl;
    unmount: procedure(mount: PGMount; flags: TGMountUnmountFlags; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl;
    unmount_finish: function(mount: PGMount; Result: PGAsyncResult; error: PPGError): Tgboolean; cdecl;
    eject: procedure(mount: PGMount; flags: TGMountUnmountFlags; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl;
    eject_finish: function(mount: PGMount; Result: PGAsyncResult; error: PPGError): Tgboolean; cdecl;
    remount: procedure(mount: PGMount; flags: TGMountMountFlags; mount_operation: PGMountOperation; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
      user_data: Tgpointer); cdecl;
    remount_finish: function(mount: PGMount; Result: PGAsyncResult; error: PPGError): Tgboolean; cdecl;
    guess_content_type: procedure(mount: PGMount; force_rescan: Tgboolean; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl;
    guess_content_type_finish: function(mount: PGMount; Result: PGAsyncResult; error: PPGError): PPgchar; cdecl;
    guess_content_type_sync: function(mount: PGMount; force_rescan: Tgboolean; cancellable: PGCancellable; error: PPGError): PPgchar; cdecl;
    pre_unmount: procedure(mount: PGMount); cdecl;
    unmount_with_operation: procedure(mount: PGMount; flags: TGMountUnmountFlags; mount_operation: PGMountOperation; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
      user_data: Tgpointer); cdecl;
    unmount_with_operation_finish: function(mount: PGMount; Result: PGAsyncResult; error: PPGError): Tgboolean; cdecl;
    eject_with_operation: procedure(mount: PGMount; flags: TGMountUnmountFlags; mount_operation: PGMountOperation; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
      user_data: Tgpointer); cdecl;
    eject_with_operation_finish: function(mount: PGMount; Result: PGAsyncResult; error: PPGError): Tgboolean; cdecl;
    get_default_location: function(mount: PGMount): PGFile; cdecl;
    get_sort_key: function(mount: PGMount): Pgchar; cdecl;
    get_symbolic_icon: function(mount: PGMount): PGIcon; cdecl;
  end;
  PGMountIface = ^TGMountIface;


function g_mount_get_type: TGType; cdecl; external libgio2;
function g_mount_get_root(mount: PGMount): PGFile; cdecl; external libgio2;
function g_mount_get_default_location(mount: PGMount): PGFile; cdecl; external libgio2;
function g_mount_get_name(mount: PGMount): PChar; cdecl; external libgio2;
function g_mount_get_icon(mount: PGMount): PGIcon; cdecl; external libgio2;
function g_mount_get_symbolic_icon(mount: PGMount): PGIcon; cdecl; external libgio2;
function g_mount_get_uuid(mount: PGMount): PChar; cdecl; external libgio2;
function g_mount_get_volume(mount: PGMount): PGVolume; cdecl; external libgio2;
function g_mount_get_drive(mount: PGMount): PGDrive; cdecl; external libgio2;
function g_mount_can_unmount(mount: PGMount): Tgboolean; cdecl; external libgio2;
function g_mount_can_eject(mount: PGMount): Tgboolean; cdecl; external libgio2;
procedure g_mount_unmount(mount: PGMount; flags: TGMountUnmountFlags; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_mount_unmount_finish(mount: PGMount; Result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libgio2;
procedure g_mount_eject(mount: PGMount; flags: TGMountUnmountFlags; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_mount_eject_finish(mount: PGMount; Result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libgio2;
procedure g_mount_remount(mount: PGMount; flags: TGMountMountFlags; mount_operation: PGMountOperation; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
  user_data: Tgpointer); cdecl; external libgio2;
function g_mount_remount_finish(mount: PGMount; Result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libgio2;
procedure g_mount_guess_content_type(mount: PGMount; force_rescan: Tgboolean; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_mount_guess_content_type_finish(mount: PGMount; Result: PGAsyncResult; error: PPGError): PPgchar; cdecl; external libgio2;
function g_mount_guess_content_type_sync(mount: PGMount; force_rescan: Tgboolean; cancellable: PGCancellable; error: PPGError): PPgchar; cdecl; external libgio2;
function g_mount_is_shadowed(mount: PGMount): Tgboolean; cdecl; external libgio2;
procedure g_mount_shadow(mount: PGMount); cdecl; external libgio2;
procedure g_mount_unshadow(mount: PGMount); cdecl; external libgio2;
procedure g_mount_unmount_with_operation(mount: PGMount; flags: TGMountUnmountFlags; mount_operation: PGMountOperation; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
  user_data: Tgpointer); cdecl; external libgio2;
function g_mount_unmount_with_operation_finish(mount: PGMount; Result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libgio2;
procedure g_mount_eject_with_operation(mount: PGMount; flags: TGMountUnmountFlags; mount_operation: PGMountOperation; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
  user_data: Tgpointer); cdecl; external libgio2;
function g_mount_eject_with_operation_finish(mount: PGMount; Result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_mount_get_sort_key(mount: PGMount): Pgchar; cdecl; external libgio2;

// === Konventiert am: 19-8-24 17:43:49 ===

function G_TYPE_MOUNT: TGType;
function G_MOUNT(obj: Pointer): PGMount;
function G_IS_MOUNT(obj: Pointer): Tgboolean;
function G_MOUNT_GET_IFACE(obj: Pointer): PGMountIface;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_TYPE_MOUNT: TGType;
begin
  G_TYPE_MOUNT := g_mount_get_type;
end;

function G_MOUNT(obj: Pointer): PGMount;
begin
  Result := PGMount(g_type_check_instance_cast(obj, G_TYPE_MOUNT));
end;

function G_IS_MOUNT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_MOUNT);
end;

function G_MOUNT_GET_IFACE(obj: Pointer): PGMountIface;
begin
  Result := g_type_interface_peek(obj, G_TYPE_MOUNT);
end;



{$ENDIF read_implementation}
