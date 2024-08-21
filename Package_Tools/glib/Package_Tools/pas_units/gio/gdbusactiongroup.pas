unit gdbusactiongroup;

interface

uses
  common_GLIB, gtypes, gerror, gtype, giotypes, gobject, gioenums;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGDBusActionGroup = record
  end;
  PGDBusActionGroup = ^TGDBusActionGroup;

  TGDBusActionGroupClass = record
  end;
  PGDBusActionGroupClass = ^TGDBusActionGroupClass;

function g_dbus_action_group_get_type: TGType; cdecl; external libgio2;
function g_dbus_action_group_get(connection: PGDBusConnection; bus_name: Pgchar; object_path: Pgchar): PGDBusActionGroup; cdecl; external libgio2;

// === Konventiert am: 21-8-24 15:08:08 ===

function G_TYPE_DBUS_ACTION_GROUP: TGType;
function G_DBUS_ACTION_GROUP(obj: Pointer): PGDBusActionGroup;
function G_DBUS_ACTION_GROUP_CLASS(klass: Pointer): PGDBusActionGroupClass;
function G_IS_DBUS_ACTION_GROUP(obj: Pointer): Tgboolean;
function G_IS_DBUS_ACTION_GROUP_CLASS(klass: Pointer): Tgboolean;
function G_DBUS_ACTION_GROUP_GET_CLASS(obj: Pointer): PGDBusActionGroupClass;

implementation

function G_TYPE_DBUS_ACTION_GROUP: TGType;
begin
  G_TYPE_DBUS_ACTION_GROUP := g_dbus_action_group_get_type;
end;

function G_DBUS_ACTION_GROUP(obj: Pointer): PGDBusActionGroup;
begin
  Result := PGDBusActionGroup(g_type_check_instance_cast(obj, G_TYPE_DBUS_ACTION_GROUP));
end;

function G_DBUS_ACTION_GROUP_CLASS(klass: Pointer): PGDBusActionGroupClass;
begin
  Result := PGDBusActionGroupClass(g_type_check_class_cast(klass, G_TYPE_DBUS_ACTION_GROUP));
end;

function G_IS_DBUS_ACTION_GROUP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_DBUS_ACTION_GROUP);
end;

function G_IS_DBUS_ACTION_GROUP_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_DBUS_ACTION_GROUP);
end;

function G_DBUS_ACTION_GROUP_GET_CLASS(obj: Pointer): PGDBusActionGroupClass;
begin
  Result := PGDBusActionGroupClass(PGTypeInstance(obj)^.g_class);
end;



end.
