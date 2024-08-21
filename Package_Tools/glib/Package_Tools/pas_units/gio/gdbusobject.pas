unit gdbusobject;

interface

uses
  common_GLIB, gtypes, gerror, glist,  gtype, giotypes, gobject, gioenums;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGDBusObjectIface = record
    parent_iface: TGTypeInterface;
    get_object_path: function(obj: PGDBusObject): Pgchar; cdecl;
    get_interfaces: function(obj: PGDBusObject): PGList; cdecl;
    get_interface: function(obj: PGDBusObject; interface_name: Pgchar): PGDBusInterface; cdecl;
    interface_added: procedure(obj: PGDBusObject; interface_: PGDBusInterface); cdecl;
    interface_removed: procedure(obj: PGDBusObject; interface_: PGDBusInterface); cdecl;
  end;
  PGDBusObjectIface = ^TGDBusObjectIface;


function g_dbus_object_get_type: TGType; cdecl; external libgio2;
function g_dbus_object_get_object_path(obj: PGDBusObject): Pgchar; cdecl; external libgio2;
function g_dbus_object_get_interfaces(obj: PGDBusObject): PGList; cdecl; external libgio2;
function g_dbus_object_get_interface(obj: PGDBusObject; interface_name: Pgchar): PGDBusInterface; cdecl; external libgio2;

// === Konventiert am: 21-8-24 15:00:14 ===

function G_TYPE_DBUS_OBJECT: TGType;
function G_DBUS_OBJECT(obj: Pointer): PGDBusObject;
function G_IS_DBUS_OBJECT(obj: Pointer): Tgboolean;
function G_DBUS_OBJECT_GET_IFACE(obj: Pointer): PGDBusObjectIface;

implementation

function G_TYPE_DBUS_OBJECT: TGType;
begin
  G_TYPE_DBUS_OBJECT := g_dbus_object_get_type;
end;

function G_DBUS_OBJECT(obj: Pointer): PGDBusObject;
begin
  Result := PGDBusObject(g_type_check_instance_cast(obj, G_TYPE_DBUS_OBJECT));
end;

function G_IS_DBUS_OBJECT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_DBUS_OBJECT);
end;

function G_DBUS_OBJECT_GET_IFACE(obj: Pointer): PGDBusObjectIface;
begin
  Result := g_type_interface_peek(obj, G_TYPE_DBUS_OBJECT);
end;



end.
