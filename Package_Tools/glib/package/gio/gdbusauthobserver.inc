/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

function g_dbus_auth_observer_get_type: TGType; cdecl; external libgio2;
function g_dbus_auth_observer_new: PGDBusAuthObserver; cdecl; external libgio2;
function g_dbus_auth_observer_authorize_authenticated_peer(observer: PGDBusAuthObserver; stream: PGIOStream; credentials: PGCredentials): Tgboolean; cdecl; external libgio2;
function g_dbus_auth_observer_allow_mechanism(observer: PGDBusAuthObserver; mechanism: Pgchar): Tgboolean; cdecl; external libgio2;

// === Konventiert am: 21-8-24 16:11:19 ===

function G_TYPE_DBUS_AUTH_OBSERVER: TGType;
function G_DBUS_AUTH_OBSERVER(obj: Pointer): PGDBusAuthObserver;
function G_IS_DBUS_AUTH_OBSERVER(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_TYPE_DBUS_AUTH_OBSERVER: TGType;
begin
  G_TYPE_DBUS_AUTH_OBSERVER := g_dbus_auth_observer_get_type;
end;

function G_DBUS_AUTH_OBSERVER(obj: Pointer): PGDBusAuthObserver;
begin
  Result := PGDBusAuthObserver(g_type_check_instance_cast(obj, G_TYPE_DBUS_AUTH_OBSERVER));
end;

function G_IS_DBUS_AUTH_OBSERVER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_DBUS_AUTH_OBSERVER);
end;



{$ENDIF read_implementation}
