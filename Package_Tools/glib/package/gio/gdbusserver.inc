/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

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

{$ENDIF read_interface}


{$IFDEF read_implementation}

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



{$ENDIF read_implementation}
