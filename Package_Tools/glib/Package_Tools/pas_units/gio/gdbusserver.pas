unit gdbusserver;

interface

uses
  common_GLIB, gtypes, gerror, gtype, giotypes, gobject, gioenums;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGDBusServer = record
  end;
  PGDBusServer = ^TGDBusServer;

function g_dbus_server_get_type: TGType; cdecl; external libgio2;
function g_dbus_server_new_sync(address: Pgchar; flags: TGDBusServerFlags; guid: Pgchar; observer: PGDBusAuthObserver; cancellable: PGCancellable;
  error: PPGError): PGDBusServer; cdecl; external libgio2;
function g_dbus_server_get_client_address(server: PGDBusServer): Pgchar; cdecl; external libgio2;
function g_dbus_server_get_guid(server: PGDBusServer): Pgchar; cdecl; external libgio2;
function g_dbus_server_get_flags(server: PGDBusServer): TGDBusServerFlags; cdecl; external libgio2;
procedure g_dbus_server_start(server: PGDBusServer); cdecl; external libgio2;
procedure g_dbus_server_stop(server: PGDBusServer); cdecl; external libgio2;
function g_dbus_server_is_active(server: PGDBusServer): Tgboolean; cdecl; external libgio2;

// === Konventiert am: 21-8-24 15:42:38 ===

function G_TYPE_DBUS_SERVER: TGType;
function G_DBUS_SERVER(obj: Pointer): PGDBusServer;
function G_IS_DBUS_SERVER(obj: Pointer): Tgboolean;

implementation

function G_TYPE_DBUS_SERVER: TGType;
begin
  G_TYPE_DBUS_SERVER := g_dbus_server_get_type;
end;

function G_DBUS_SERVER(obj: Pointer): PGDBusServer;
begin
  Result := PGDBusServer(g_type_check_instance_cast(obj, G_TYPE_DBUS_SERVER));
end;

function G_IS_DBUS_SERVER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_DBUS_SERVER);
end;



end.
