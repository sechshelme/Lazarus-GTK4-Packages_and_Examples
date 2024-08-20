unit gdbusobjectmanagerserver;

interface

uses
  common_GLIB, gtypes, gtype, giotypes, gobject, gioenums, gdbusconnection, gdbusobjectskeleton;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGDBusObjectManagerServerPrivate = record
  end;
  PGDBusObjectManagerServerPrivate = ^TGDBusObjectManagerServerPrivate;

  TGDBusObjectManagerServer = record
    parent_instance: TGObject;
    priv: PGDBusObjectManagerServerPrivate;
  end;
  PGDBusObjectManagerServer = ^TGDBusObjectManagerServer;

  TGDBusObjectManagerServerClass = record
    parent_class: TGObjectClass;
    padding: array[0..7] of Tgpointer;
  end;
  PGDBusObjectManagerServerClass = ^TGDBusObjectManagerServerClass;


function g_dbus_object_manager_server_get_type: TGType; cdecl; external libgio2;
function g_dbus_object_manager_server_new(object_path: Pgchar): PGDBusObjectManagerServer; cdecl; external libgio2;
function g_dbus_object_manager_server_get_connection(manager: PGDBusObjectManagerServer): PGDBusConnection; cdecl; external libgio2;
procedure g_dbus_object_manager_server_set_connection(manager: PGDBusObjectManagerServer; connection: PGDBusConnection); cdecl; external libgio2;
procedure g_dbus_object_manager_server_export(manager: PGDBusObjectManagerServer; obj: PGDBusObjectSkeleton); cdecl; external libgio2;
procedure g_dbus_object_manager_server_export_uniquely(manager: PGDBusObjectManagerServer; obj: PGDBusObjectSkeleton); cdecl; external libgio2;
function g_dbus_object_manager_server_is_exported(manager: PGDBusObjectManagerServer; obj: PGDBusObjectSkeleton): Tgboolean; cdecl; external libgio2;
function g_dbus_object_manager_server_unexport(manager: PGDBusObjectManagerServer; object_path: Pgchar): Tgboolean; cdecl; external libgio2;

// === Konventiert am: 20-8-24 18:12:57 ===

function G_TYPE_DBUS_OBJECT_MANAGER_SERVER: TGType;
function G_DBUS_OBJECT_MANAGER_SERVER(obj: Pointer): PGDBusObjectManagerServer;
function G_DBUS_OBJECT_MANAGER_SERVER_CLASS(klass: Pointer): PGDBusObjectManagerServerClass;
function G_IS_DBUS_OBJECT_MANAGER_SERVER(obj: Pointer): Tgboolean;
function G_IS_DBUS_OBJECT_MANAGER_SERVER_CLASS(klass: Pointer): Tgboolean;
function G_DBUS_OBJECT_MANAGER_SERVER_GET_CLASS(obj: Pointer): PGDBusObjectManagerServerClass;

implementation

function G_TYPE_DBUS_OBJECT_MANAGER_SERVER: TGType;
begin
  G_TYPE_DBUS_OBJECT_MANAGER_SERVER := g_dbus_object_manager_server_get_type;
end;

function G_DBUS_OBJECT_MANAGER_SERVER(obj: Pointer): PGDBusObjectManagerServer;
begin
  Result := PGDBusObjectManagerServer(g_type_check_instance_cast(obj, G_TYPE_DBUS_OBJECT_MANAGER_SERVER));
end;

function G_DBUS_OBJECT_MANAGER_SERVER_CLASS(klass: Pointer): PGDBusObjectManagerServerClass;
begin
  Result := PGDBusObjectManagerServerClass(g_type_check_class_cast(klass, G_TYPE_DBUS_OBJECT_MANAGER_SERVER));
end;

function G_IS_DBUS_OBJECT_MANAGER_SERVER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_DBUS_OBJECT_MANAGER_SERVER);
end;

function G_IS_DBUS_OBJECT_MANAGER_SERVER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_DBUS_OBJECT_MANAGER_SERVER);
end;

function G_DBUS_OBJECT_MANAGER_SERVER_GET_CLASS(obj: Pointer): PGDBusObjectManagerServerClass;
begin
  Result := PGDBusObjectManagerServerClass(PGTypeInstance(obj)^.g_class);
end;



end.
