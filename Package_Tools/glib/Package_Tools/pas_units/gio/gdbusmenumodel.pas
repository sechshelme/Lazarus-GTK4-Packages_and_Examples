unit gdbusmenumodel;

interface

uses
  common_GLIB, gtypes, gerror, gtype, giotypes, gobject, gioenums;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGDBusMenuModel = record
  end;
  PGDBusMenuModel = ^TGDBusMenuModel;

function g_dbus_menu_model_get_type: TGType; cdecl; external libgio2;
function g_dbus_menu_model_get(connection: PGDBusConnection; bus_name: Pgchar; object_path: Pgchar): PGDBusMenuModel; cdecl; external libgio2;

// === Konventiert am: 21-8-24 16:34:04 ===

function G_TYPE_DBUS_MENU_MODEL: TGType;
function G_DBUS_MENU_MODEL(obj: Pointer): PGDBusMenuModel;
function G_IS_DBUS_MENU_MODEL(obj: Pointer): Tgboolean;

implementation

function G_TYPE_DBUS_MENU_MODEL: TGType;
begin
  G_TYPE_DBUS_MENU_MODEL := g_dbus_menu_model_get_type;
end;

function G_DBUS_MENU_MODEL(obj: Pointer): PGDBusMenuModel;
begin
  Result := PGDBusMenuModel(g_type_check_instance_cast(obj, G_TYPE_DBUS_MENU_MODEL));
end;

function G_IS_DBUS_MENU_MODEL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_DBUS_MENU_MODEL);
end;



end.
