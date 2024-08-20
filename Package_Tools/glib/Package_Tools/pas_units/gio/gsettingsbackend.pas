unit gsettingsbackend;

interface

uses
  common_GLIB, gtypes, gvariant, gtree, gvarianttype, gtype, giotypes, gobject, gioenums, gpermission;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

const
  G_SETTINGS_BACKEND_EXTENSION_POINT_NAME = 'gsettings-backend';

type
  TGSettingsBackendPrivate = record
  end;
  PGSettingsBackendPrivate = ^TGSettingsBackendPrivate;

  TGSettingsBackend = record
    parent_instance: TGObject;
    priv: PGSettingsBackendPrivate;
  end;
  PGSettingsBackend = ^TGSettingsBackend;

  TGSettingsBackendClass = record
    parent_class: TGObjectClass;
    Read: function(backend: PGSettingsBackend; key: Pgchar; expected_type: PGVariantType; default_value: Tgboolean): PGVariant; cdecl;
    get_writable: function(backend: PGSettingsBackend; key: Pgchar): Tgboolean; cdecl;
    Write: function(backend: PGSettingsBackend; key: Pgchar; Value: PGVariant; origin_tag: Tgpointer): Tgboolean; cdecl;
    write_tree: function(backend: PGSettingsBackend; tree: PGTree; origin_tag: Tgpointer): Tgboolean; cdecl;
    reset: procedure(backend: PGSettingsBackend; key: Pgchar; origin_tag: Tgpointer); cdecl;
    subscribe: procedure(backend: PGSettingsBackend; Name: Pgchar); cdecl;
    unsubscribe: procedure(backend: PGSettingsBackend; Name: Pgchar); cdecl;
    sync: procedure(backend: PGSettingsBackend); cdecl;
    get_permission: function(backend: PGSettingsBackend; path: Pgchar): PGPermission; cdecl;
    read_user_value: function(backend: PGSettingsBackend; key: Pgchar; expected_type: PGVariantType): PGVariant; cdecl;
    padding: array[0..22] of Tgpointer;
  end;
  PGSettingsBackendClass = ^TGSettingsBackendClass;

function g_settings_backend_get_type: TGType; cdecl; external libgio2;
procedure g_settings_backend_changed(backend: PGSettingsBackend; key: Pgchar; origin_tag: Tgpointer); cdecl; external libgio2;
procedure g_settings_backend_path_changed(backend: PGSettingsBackend; path: Pgchar; origin_tag: Tgpointer); cdecl; external libgio2;
procedure g_settings_backend_flatten_tree(tree: PGTree; path: PPgchar; keys: PPPgchar; values: PPPGVariant); cdecl; external libgio2;
procedure g_settings_backend_keys_changed(backend: PGSettingsBackend; path: Pgchar; items: PPgchar; origin_tag: Tgpointer); cdecl; external libgio2;
procedure g_settings_backend_path_writable_changed(backend: PGSettingsBackend; path: Pgchar); cdecl; external libgio2;
procedure g_settings_backend_writable_changed(backend: PGSettingsBackend; key: Pgchar); cdecl; external libgio2;
procedure g_settings_backend_changed_tree(backend: PGSettingsBackend; tree: PGTree; origin_tag: Tgpointer); cdecl; external libgio2;
function g_settings_backend_get_default: PGSettingsBackend; cdecl; external libgio2;
function g_keyfile_settings_backend_new(filename: Pgchar; root_path: Pgchar; root_group: Pgchar): PGSettingsBackend; cdecl; external libgio2;
function g_null_settings_backend_new: PGSettingsBackend; cdecl; external libgio2;
function g_memory_settings_backend_new: PGSettingsBackend; cdecl; external libgio2;

// === Konventiert am: 20-8-24 15:33:52 ===

function G_TYPE_SETTINGS_BACKEND: TGType;
function G_SETTINGS_BACKEND(obj: Pointer): PGSettingsBackend;
function G_SETTINGS_BACKEND_CLASS(klass: Pointer): PGSettingsBackendClass;
function G_IS_SETTINGS_BACKEND(obj: Pointer): Tgboolean;
function G_IS_SETTINGS_BACKEND_CLASS(klass: Pointer): Tgboolean;
function G_SETTINGS_BACKEND_GET_CLASS(obj: Pointer): PGSettingsBackendClass;

implementation

function G_TYPE_SETTINGS_BACKEND: TGType;
begin
  G_TYPE_SETTINGS_BACKEND := g_settings_backend_get_type;
end;

function G_SETTINGS_BACKEND(obj: Pointer): PGSettingsBackend;
begin
  Result := PGSettingsBackend(g_type_check_instance_cast(obj, G_TYPE_SETTINGS_BACKEND));
end;

function G_SETTINGS_BACKEND_CLASS(klass: Pointer): PGSettingsBackendClass;
begin
  Result := PGSettingsBackendClass(g_type_check_class_cast(klass, G_TYPE_SETTINGS_BACKEND));
end;

function G_IS_SETTINGS_BACKEND(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_SETTINGS_BACKEND);
end;

function G_IS_SETTINGS_BACKEND_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_SETTINGS_BACKEND);
end;

function G_SETTINGS_BACKEND_GET_CLASS(obj: Pointer): PGSettingsBackendClass;
begin
  Result := PGSettingsBackendClass(PGTypeInstance(obj)^.g_class);
end;



end.
