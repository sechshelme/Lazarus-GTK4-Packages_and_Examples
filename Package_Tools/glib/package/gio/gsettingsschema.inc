/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGSettingsSchemaSource = record
  end;
  PGSettingsSchemaSource = ^TGSettingsSchemaSource;
  TGSettingsSchema = record
  end;
  PGSettingsSchema = ^TGSettingsSchema;
  TGSettingsSchemaKey = record
  end;
  PGSettingsSchemaKey = ^TGSettingsSchemaKey;

function g_settings_schema_source_get_type: TGType; cdecl; external libgio2;
function g_settings_schema_source_get_default: PGSettingsSchemaSource; cdecl; external libgio2;
function g_settings_schema_source_ref(Source: PGSettingsSchemaSource): PGSettingsSchemaSource; cdecl; external libgio2;
procedure g_settings_schema_source_unref(Source: PGSettingsSchemaSource); cdecl; external libgio2;
function g_settings_schema_source_new_from_directory(directory: Pgchar; parent: PGSettingsSchemaSource; trusted: Tgboolean; error: PPGError): PGSettingsSchemaSource; cdecl; external libgio2;
function g_settings_schema_source_lookup(Source: PGSettingsSchemaSource; schema_id: Pgchar; recursive: Tgboolean): PGSettingsSchema; cdecl; external libgio2;
procedure g_settings_schema_source_list_schemas(Source: PGSettingsSchemaSource; recursive: Tgboolean; non_relocatable: PPPgchar; relocatable: PPPgchar); cdecl; external libgio2;

function g_settings_schema_get_type: TGType; cdecl; external libgio2;
function g_settings_schema_ref(schema: PGSettingsSchema): PGSettingsSchema; cdecl; external libgio2;
procedure g_settings_schema_unref(schema: PGSettingsSchema); cdecl; external libgio2;
function g_settings_schema_get_id(schema: PGSettingsSchema): Pgchar; cdecl; external libgio2;
function g_settings_schema_get_path(schema: PGSettingsSchema): Pgchar; cdecl; external libgio2;
function g_settings_schema_get_key(schema: PGSettingsSchema; Name: Pgchar): PGSettingsSchemaKey; cdecl; external libgio2;
function g_settings_schema_has_key(schema: PGSettingsSchema; Name: Pgchar): Tgboolean; cdecl; external libgio2;
function g_settings_schema_list_keys(schema: PGSettingsSchema): PPgchar; cdecl; external libgio2;
function g_settings_schema_list_children(schema: PGSettingsSchema): PPgchar; cdecl; external libgio2;

function g_settings_schema_key_get_type: TGType; cdecl; external libgio2;
function g_settings_schema_key_ref(key: PGSettingsSchemaKey): PGSettingsSchemaKey; cdecl; external libgio2;
procedure g_settings_schema_key_unref(key: PGSettingsSchemaKey); cdecl; external libgio2;
function g_settings_schema_key_get_value_type(key: PGSettingsSchemaKey): PGVariantType; cdecl; external libgio2;
function g_settings_schema_key_get_default_value(key: PGSettingsSchemaKey): PGVariant; cdecl; external libgio2;
function g_settings_schema_key_get_range(key: PGSettingsSchemaKey): PGVariant; cdecl; external libgio2;
function g_settings_schema_key_range_check(key: PGSettingsSchemaKey; Value: PGVariant): Tgboolean; cdecl; external libgio2;
function g_settings_schema_key_get_name(key: PGSettingsSchemaKey): Pgchar; cdecl; external libgio2;
function g_settings_schema_key_get_summary(key: PGSettingsSchemaKey): Pgchar; cdecl; external libgio2;
function g_settings_schema_key_get_description(key: PGSettingsSchemaKey): Pgchar; cdecl; external libgio2;

function G_TYPE_SETTINGS_SCHEMA: TGType;
function G_TYPE_SETTINGS_SCHEMA_KEY: TGType;

// === Konventiert am: 18-8-24 17:27:03 ===

function G_TYPE_SETTINGS_SCHEMA_SOURCE: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_TYPE_SETTINGS_SCHEMA_SOURCE: TGType;
begin
  G_TYPE_SETTINGS_SCHEMA_SOURCE := g_settings_schema_source_get_type;
end;


function G_TYPE_SETTINGS_SCHEMA: TGType;
begin
  G_TYPE_SETTINGS_SCHEMA := g_settings_schema_get_type;
end;

function G_TYPE_SETTINGS_SCHEMA_KEY: TGType;
begin
  G_TYPE_SETTINGS_SCHEMA_KEY := g_settings_schema_key_get_type;
end;


{$ENDIF read_implementation}
