/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGSettingsPrivate = record
  end;
  PGSettingsPrivate = ^TGSettingsPrivate;

  TGSettings = record
    parent_instance: TGObject;
    priv: PGSettingsPrivate;
  end;
  PGSettings = ^TGSettings;

  TGSettingsClass = record
    parent_class: TGObjectClass;
    writable_changed: procedure(settings: PGSettings; key: Pgchar); cdecl;
    changed: procedure(settings: PGSettings; key: Pgchar); cdecl;
    writable_change_event: function(settings: PGSettings; key: TGQuark): Tgboolean; cdecl;
    change_event: function(settings: PGSettings; keys: PGQuark; n_keys: Tgint): Tgboolean; cdecl;
    padding: array[0..19] of Tgpointer;
  end;
  PGSettingsClass = ^TGSettingsClass;

function g_settings_get_type: TGType; cdecl; external libgio2;
function g_settings_list_schemas: PPgchar; cdecl; external libgio2;
function g_settings_list_relocatable_schemas: PPgchar; cdecl; external libgio2;
function g_settings_new(schema_id: Pgchar): PGSettings; cdecl; external libgio2;
function g_settings_new_with_path(schema_id: Pgchar; path: Pgchar): PGSettings; cdecl; external libgio2;
function g_settings_new_with_backend(schema_id: Pgchar; backend: PGSettingsBackend): PGSettings; cdecl; external libgio2;
function g_settings_new_with_backend_and_path(schema_id: Pgchar; backend: PGSettingsBackend; path: Pgchar): PGSettings; cdecl; external libgio2;
function g_settings_new_full(schema: PGSettingsSchema; backend: PGSettingsBackend; path: Pgchar): PGSettings; cdecl; external libgio2;
function g_settings_list_children(settings: PGSettings): PPgchar; cdecl; external libgio2;
function g_settings_list_keys(settings: PGSettings): PPgchar; cdecl; external libgio2;
function g_settings_get_range(settings: PGSettings; key: Pgchar): PGVariant; cdecl; external libgio2;
function g_settings_range_check(settings: PGSettings; key: Pgchar; Value: PGVariant): Tgboolean; cdecl; external libgio2;
function g_settings_set_value(settings: PGSettings; key: Pgchar; Value: PGVariant): Tgboolean; cdecl; external libgio2;
function g_settings_get_value(settings: PGSettings; key: Pgchar): PGVariant; cdecl; external libgio2;
function g_settings_get_user_value(settings: PGSettings; key: Pgchar): PGVariant; cdecl; external libgio2;
function g_settings_get_default_value(settings: PGSettings; key: Pgchar): PGVariant; cdecl; external libgio2;
function g_settings_set(settings: PGSettings; key: Pgchar; format: Pgchar; args: array of const): Tgboolean; cdecl; external libgio2;
function g_settings_set(settings: PGSettings; key: Pgchar; format: Pgchar): Tgboolean; cdecl; external libgio2;
procedure g_settings_get(settings: PGSettings; key: Pgchar; format: Pgchar; args: array of const); cdecl; external libgio2;
procedure g_settings_get(settings: PGSettings; key: Pgchar; format: Pgchar); cdecl; external libgio2;
procedure g_settings_reset(settings: PGSettings; key: Pgchar); cdecl; external libgio2;
function g_settings_get_int(settings: PGSettings; key: Pgchar): Tgint; cdecl; external libgio2;
function g_settings_set_int(settings: PGSettings; key: Pgchar; Value: Tgint): Tgboolean; cdecl; external libgio2;
function g_settings_get_int64(settings: PGSettings; key: Pgchar): Tgint64; cdecl; external libgio2;
function g_settings_set_int64(settings: PGSettings; key: Pgchar; Value: Tgint64): Tgboolean; cdecl; external libgio2;
function g_settings_get_uint(settings: PGSettings; key: Pgchar): Tguint; cdecl; external libgio2;
function g_settings_set_uint(settings: PGSettings; key: Pgchar; Value: Tguint): Tgboolean; cdecl; external libgio2;
function g_settings_get_uint64(settings: PGSettings; key: Pgchar): Tguint64; cdecl; external libgio2;
function g_settings_set_uint64(settings: PGSettings; key: Pgchar; Value: Tguint64): Tgboolean; cdecl; external libgio2;
function g_settings_get_string(settings: PGSettings; key: Pgchar): Pgchar; cdecl; external libgio2;
function g_settings_set_string(settings: PGSettings; key: Pgchar; Value: Pgchar): Tgboolean; cdecl; external libgio2;
function g_settings_get_boolean(settings: PGSettings; key: Pgchar): Tgboolean; cdecl; external libgio2;
function g_settings_set_boolean(settings: PGSettings; key: Pgchar; Value: Tgboolean): Tgboolean; cdecl; external libgio2;
function g_settings_get_double(settings: PGSettings; key: Pgchar): Tgdouble; cdecl; external libgio2;
function g_settings_set_double(settings: PGSettings; key: Pgchar; Value: Tgdouble): Tgboolean; cdecl; external libgio2;
function g_settings_get_strv(settings: PGSettings; key: Pgchar): PPgchar; cdecl; external libgio2;
function g_settings_set_strv(settings: PGSettings; key: Pgchar; Value: PPgchar): Tgboolean; cdecl; external libgio2;
function g_settings_get_enum(settings: PGSettings; key: Pgchar): Tgint; cdecl; external libgio2;
function g_settings_set_enum(settings: PGSettings; key: Pgchar; Value: Tgint): Tgboolean; cdecl; external libgio2;
function g_settings_get_flags(settings: PGSettings; key: Pgchar): Tguint; cdecl; external libgio2;
function g_settings_set_flags(settings: PGSettings; key: Pgchar; Value: Tguint): Tgboolean; cdecl; external libgio2;
function g_settings_get_child(settings: PGSettings; Name: Pgchar): PGSettings; cdecl; external libgio2;
function g_settings_is_writable(settings: PGSettings; Name: Pgchar): Tgboolean; cdecl; external libgio2;
procedure g_settings_delay(settings: PGSettings); cdecl; external libgio2;
procedure g_settings_apply(settings: PGSettings); cdecl; external libgio2;
procedure g_settings_revert(settings: PGSettings); cdecl; external libgio2;
function g_settings_get_has_unapplied(settings: PGSettings): Tgboolean; cdecl; external libgio2;
procedure g_settings_sync; cdecl; external libgio2;

type
  PGSettingsBindSetMapping = ^TGSettingsBindSetMapping;
  TGSettingsBindSetMapping = function(Value: PGValue; expected_type: PGVariantType; user_data: Tgpointer): PGVariant; cdecl;
  TGSettingsBindGetMapping = function(Value: PGValue; variant: PGVariant; user_data: Tgpointer): Tgboolean; cdecl;
  TGSettingsGetMapping = function(Value: PGVariant; Result: Pgpointer; user_data: Tgpointer): Tgboolean; cdecl;
  PGSettingsBindFlags = ^TGSettingsBindFlags;
  TGSettingsBindFlags = longint;

const
  G_SETTINGS_BIND_DEFAULT = 0;
  G_SETTINGS_BIND_GET = 1 shl 0;
  G_SETTINGS_BIND_SET = 1 shl 1;
  G_SETTINGS_BIND_NO_SENSITIVITY = 1 shl 2;
  G_SETTINGS_BIND_GET_NO_CHANGES = 1 shl 3;
  G_SETTINGS_BIND_INVERT_BOOLEAN = 1 shl 4;

procedure g_settings_bind(settings: PGSettings; key: Pgchar; obj: Tgpointer; _property: Pgchar; flags: TGSettingsBindFlags); cdecl; external libgio2;
procedure g_settings_bind_with_mapping(settings: PGSettings; key: Pgchar; obj: Tgpointer; _property: Pgchar; flags: TGSettingsBindFlags;
  get_mapping: TGSettingsBindGetMapping; set_mapping: TGSettingsBindSetMapping; user_data: Tgpointer; Destroy: TGDestroyNotify); cdecl; external libgio2;
procedure g_settings_bind_writable(settings: PGSettings; key: Pgchar; obj: Tgpointer; _property: Pgchar; inverted: Tgboolean); cdecl; external libgio2;
procedure g_settings_unbind(obj: Tgpointer; _property: Pgchar); cdecl; external libgio2;
function g_settings_create_action(settings: PGSettings; key: Pgchar): PGAction; cdecl; external libgio2;
function g_settings_get_mapped(settings: PGSettings; key: Pgchar; mapping: TGSettingsGetMapping; user_data: Tgpointer): Tgpointer; cdecl; external libgio2;

// === Konventiert am: 18-8-24 17:22:13 ===

function G_TYPE_SETTINGS: TGType;
function G_SETTINGS(obj: Pointer): PGSettings;
function G_SETTINGS_CLASS(klass: Pointer): PGSettingsClass;
function G_IS_SETTINGS(obj: Pointer): Tgboolean;
function G_IS_SETTINGS_CLASS(klass: Pointer): Tgboolean;
function G_SETTINGS_GET_CLASS(obj: Pointer): PGSettingsClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_TYPE_SETTINGS: TGType;
begin
  G_TYPE_SETTINGS := g_settings_get_type;
end;

function G_SETTINGS(obj: Pointer): PGSettings;
begin
  Result := PGSettings(g_type_check_instance_cast(obj, G_TYPE_SETTINGS));
end;

function G_SETTINGS_CLASS(klass: Pointer): PGSettingsClass;
begin
  Result := PGSettingsClass(g_type_check_class_cast(klass, G_TYPE_SETTINGS));
end;

function G_IS_SETTINGS(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_SETTINGS);
end;

function G_IS_SETTINGS_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_SETTINGS);
end;

function G_SETTINGS_GET_CLASS(obj: Pointer): PGSettingsClass;
begin
  Result := PGSettingsClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
