/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGDBusInterfaceIface = record
    parent_iface: TGTypeInterface;
    get_info: function(interface_: PGDBusInterface): PGDBusInterfaceInfo; cdecl;
    get_object: function(interface_: PGDBusInterface): PGDBusObject; cdecl;
    set_object: procedure(interface_: PGDBusInterface; obj: PGDBusObject); cdecl;
    dup_object: function(interface_: PGDBusInterface): PGDBusObject; cdecl;
  end;
  PGDBusInterfaceIface = ^TGDBusInterfaceIface;

function g_dbus_interface_get_type: TGType; cdecl; external libgio2;
function g_dbus_interface_get_info(interface_: PGDBusInterface): PGDBusInterfaceInfo; cdecl; external libgio2;
function g_dbus_interface_get_object(interface_: PGDBusInterface): PGDBusObject; cdecl; external libgio2;
procedure g_dbus_interface_set_object(interface_: PGDBusInterface; obj: PGDBusObject); cdecl; external libgio2;
function g_dbus_interface_dup_object(interface_: PGDBusInterface): PGDBusObject; cdecl; external libgio2;

// === Konventiert am: 21-8-24 13:53:53 ===

function G_TYPE_DBUS_INTERFACE: TGType;
function G_DBUS_INTERFACE(obj: Pointer): PGDBusInterface;
function G_IS_DBUS_INTERFACE(obj: Pointer): Tgboolean;
function G_DBUS_INTERFACE_GET_IFACE(obj: Pointer): PGDBusInterfaceIface;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_TYPE_DBUS_INTERFACE: TGType;
begin
  G_TYPE_DBUS_INTERFACE := g_dbus_interface_get_type;
end;

function G_DBUS_INTERFACE(obj: Pointer): PGDBusInterface;
begin
  Result := PGDBusInterface(g_type_check_instance_cast(obj, G_TYPE_DBUS_INTERFACE));
end;

function G_IS_DBUS_INTERFACE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_DBUS_INTERFACE);
end;

function G_DBUS_INTERFACE_GET_IFACE(obj: Pointer): PGDBusInterfaceIface;
begin
  Result := g_type_interface_peek(obj, G_TYPE_DBUS_INTERFACE);
end;



{$ENDIF read_implementation}
