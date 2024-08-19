unit gdrive;

interface

uses
  common_GLIB, gtypes, glist, gerror, gtype, giotypes, gioenums, gmountoperation;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

const
  G_DRIVE_IDENTIFIER_KIND_UNIX_DEVICE = 'unix-device';

type
  PGDriveIface = ^TGDriveIface;

  TGDriveIface = record
    g_iface: TGTypeInterface;
    changed: procedure(drive: PGDrive); cdecl;
    disconnected: procedure(drive: PGDrive); cdecl;
    eject_button: procedure(drive: PGDrive); cdecl;
    get_name: function(drive: PGDrive): PChar; cdecl;
    get_icon: function(drive: PGDrive): PGIcon; cdecl;
    has_volumes: function(drive: PGDrive): Tgboolean; cdecl;
    get_volumes: function(drive: PGDrive): PGList; cdecl;
    is_media_removable: function(drive: PGDrive): Tgboolean; cdecl;
    has_media: function(drive: PGDrive): Tgboolean; cdecl;
    is_media_check_automatic: function(drive: PGDrive): Tgboolean; cdecl;
    can_eject: function(drive: PGDrive): Tgboolean; cdecl;
    can_poll_for_media: function(drive: PGDrive): Tgboolean; cdecl;
    eject: procedure(drive: PGDrive; flags: TGMountUnmountFlags; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl;
    eject_finish: function(drive: PGDrive; Result: PGAsyncResult; error: PPGError): Tgboolean; cdecl;
    poll_for_media: procedure(drive: PGDrive; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl;
    poll_for_media_finish: function(drive: PGDrive; Result: PGAsyncResult; error: PPGError): Tgboolean; cdecl;
    get_identifier: function(drive: PGDrive; kind: PChar): PChar; cdecl;
    enumerate_identifiers: function(drive: PGDrive): PPchar; cdecl;
    get_start_stop_type: function(drive: PGDrive): TGDriveStartStopType; cdecl;
    can_start: function(drive: PGDrive): Tgboolean; cdecl;
    can_start_degraded: function(drive: PGDrive): Tgboolean; cdecl;
    start: procedure(drive: PGDrive; flags: TGDriveStartFlags; mount_operation: PGMountOperation; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
      user_data: Tgpointer); cdecl;
    start_finish: function(drive: PGDrive; Result: PGAsyncResult; error: PPGError): Tgboolean; cdecl;
    can_stop: function(drive: PGDrive): Tgboolean; cdecl;
    stop: procedure(drive: PGDrive; flags: TGMountUnmountFlags; mount_operation: PGMountOperation; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
      user_data: Tgpointer); cdecl;
    stop_finish: function(drive: PGDrive; Result: PGAsyncResult; error: PPGError): Tgboolean; cdecl;
    stop_button: procedure(drive: PGDrive); cdecl;
    eject_with_operation: procedure(drive: PGDrive; flags: TGMountUnmountFlags; mount_operation: PGMountOperation; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
      user_data: Tgpointer); cdecl;
    eject_with_operation_finish: function(drive: PGDrive; Result: PGAsyncResult; error: PPGError): Tgboolean; cdecl;
    get_sort_key: function(drive: PGDrive): Pgchar; cdecl;
    get_symbolic_icon: function(drive: PGDrive): PGIcon; cdecl;
    is_removable: function(drive: PGDrive): Tgboolean; cdecl;
  end;


function g_drive_get_type: TGType; cdecl; external libgio2;
function g_drive_get_name(drive: PGDrive): PChar; cdecl; external libgio2;
function g_drive_get_icon(drive: PGDrive): PGIcon; cdecl; external libgio2;
function g_drive_get_symbolic_icon(drive: PGDrive): PGIcon; cdecl; external libgio2;
function g_drive_has_volumes(drive: PGDrive): Tgboolean; cdecl; external libgio2;
function g_drive_get_volumes(drive: PGDrive): PGList; cdecl; external libgio2;
function g_drive_is_removable(drive: PGDrive): Tgboolean; cdecl; external libgio2;
function g_drive_is_media_removable(drive: PGDrive): Tgboolean; cdecl; external libgio2;
function g_drive_has_media(drive: PGDrive): Tgboolean; cdecl; external libgio2;
function g_drive_is_media_check_automatic(drive: PGDrive): Tgboolean; cdecl; external libgio2;
function g_drive_can_poll_for_media(drive: PGDrive): Tgboolean; cdecl; external libgio2;
function g_drive_can_eject(drive: PGDrive): Tgboolean; cdecl; external libgio2;
procedure g_drive_eject(drive: PGDrive; flags: TGMountUnmountFlags; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_drive_eject_finish(drive: PGDrive; Result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libgio2;
procedure g_drive_poll_for_media(drive: PGDrive; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_drive_poll_for_media_finish(drive: PGDrive; Result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_drive_get_identifier(drive: PGDrive; kind: PChar): PChar; cdecl; external libgio2;
function g_drive_enumerate_identifiers(drive: PGDrive): PPChar; cdecl; external libgio2;
function g_drive_get_start_stop_type(drive: PGDrive): TGDriveStartStopType; cdecl; external libgio2;
function g_drive_can_start(drive: PGDrive): Tgboolean; cdecl; external libgio2;
function g_drive_can_start_degraded(drive: PGDrive): Tgboolean; cdecl; external libgio2;
procedure g_drive_start(drive: PGDrive; flags: TGDriveStartFlags; mount_operation: PGMountOperation; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
  user_data: Tgpointer); cdecl; external libgio2;
function g_drive_start_finish(drive: PGDrive; Result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_drive_can_stop(drive: PGDrive): Tgboolean; cdecl; external libgio2;
procedure g_drive_stop(drive: PGDrive; flags: TGMountUnmountFlags; mount_operation: PGMountOperation; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
  user_data: Tgpointer); cdecl; external libgio2;
function g_drive_stop_finish(drive: PGDrive; Result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libgio2;
procedure g_drive_eject_with_operation(drive: PGDrive; flags: TGMountUnmountFlags; mount_operation: PGMountOperation; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
  user_data: Tgpointer); cdecl; external libgio2;
function g_drive_eject_with_operation_finish(drive: PGDrive; Result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_drive_get_sort_key(drive: PGDrive): Pgchar; cdecl; external libgio2;

// === Konventiert am: 19-8-24 19:11:05 ===

function G_TYPE_DRIVE: TGType;
function G_DRIVE(obj: Pointer): PGDrive;
function G_IS_DRIVE(obj: Pointer): Tgboolean;
function G_DRIVE_GET_IFACE(obj: Pointer): PGDriveIface;

implementation

function G_TYPE_DRIVE: TGType;
begin
  G_TYPE_DRIVE := g_drive_get_type;
end;

function G_DRIVE(obj: Pointer): PGDrive;
begin
  Result := PGDrive(g_type_check_instance_cast(obj, G_TYPE_DRIVE));
end;

function G_IS_DRIVE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_DRIVE);
end;

function G_DRIVE_GET_IFACE(obj: Pointer): PGDriveIface;
begin
  Result := g_type_interface_peek(obj, G_TYPE_DRIVE);
end;



end.
