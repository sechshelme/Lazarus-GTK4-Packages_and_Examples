/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGDBusObjectManagerIface = record
    parent_iface: TGTypeInterface;
    get_object_path: function(manager: PGDBusObjectManager): Pgchar; cdecl;
    get_objects: function(manager: PGDBusObjectManager): PGList; cdecl;
    get_object: function(manager: PGDBusObjectManager; object_path: Pgchar): PGDBusObject; cdecl;
    get_interface: function(manager: PGDBusObjectManager; object_path: Pgchar; interface_name: Pgchar): PGDBusInterface; cdecl;
    object_added: procedure(manager: PGDBusObjectManager; obj: PGDBusObject); cdecl;
    object_removed: procedure(manager: PGDBusObjectManager; obj: PGDBusObject); cdecl;
    interface_added: procedure(manager: PGDBusObjectManager; obj: PGDBusObject; interface_: PGDBusInterface); cdecl;
    interface_removed: procedure(manager: PGDBusObjectManager; obj: PGDBusObject; interface_: PGDBusInterface); cdecl;
  end;
  PGDBusObjectManagerIface = ^TGDBusObjectManagerIface;


function g_dbus_object_manager_get_type: TGType; cdecl; external libgio2;
function g_dbus_object_manager_get_object_path(manager: PGDBusObjectManager): Pgchar; cdecl; external libgio2;
function g_dbus_object_manager_get_objects(manager: PGDBusObjectManager): PGList; cdecl; external libgio2;
function g_dbus_object_manager_get_object(manager: PGDBusObjectManager; object_path: Pgchar): PGDBusObject; cdecl; external libgio2;
function g_dbus_object_manager_get_interface(manager: PGDBusObjectManager; object_path: Pgchar; interface_name: Pgchar): PGDBusInterface; cdecl; external libgio2;

// === Konventiert am: 20-8-24 18:01:46 ===

function G_TYPE_DBUS_OBJECT_MANAGER: TGType;
function G_DBUS_OBJECT_MANAGER(obj: Pointer): PGDBusObjectManager;
function G_IS_DBUS_OBJECT_MANAGER(obj: Pointer): Tgboolean;
function G_DBUS_OBJECT_MANAGER_GET_IFACE(obj: Pointer): PGDBusObjectManagerIface;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_TYPE_DBUS_OBJECT_MANAGER: TGType;
begin
  G_TYPE_DBUS_OBJECT_MANAGER := g_dbus_object_manager_get_type;
end;

function G_DBUS_OBJECT_MANAGER(obj: Pointer): PGDBusObjectManager;
begin
  Result := PGDBusObjectManager(g_type_check_instance_cast(obj, G_TYPE_DBUS_OBJECT_MANAGER));
end;

function G_IS_DBUS_OBJECT_MANAGER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_DBUS_OBJECT_MANAGER);
end;

function G_DBUS_OBJECT_MANAGER_GET_IFACE(obj: Pointer): PGDBusObjectManagerIface;
begin
  Result := g_type_interface_peek(obj, G_TYPE_DBUS_OBJECT_MANAGER);
end;



{$ENDIF read_implementation}
