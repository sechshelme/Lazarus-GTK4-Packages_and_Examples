unit glib_types;

interface

uses
  common_GLIB, gtypes, TGType;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

function g_date_get_type: TGType; cdecl; external libgobject2_0;
function g_strv_get_type: TGType; cdecl; external libgobject2_0;
function g_gstring_get_type: TGType; cdecl; external libgobject2_0;
function g_hash_table_get_type: TGType; cdecl; external libgobject2_0;
function g_array_get_type: TGType; cdecl; external libgobject2_0;
function g_byte_array_get_type: TGType; cdecl; external libgobject2_0;
function g_ptr_array_get_type: TGType; cdecl; external libgobject2_0;
function g_bytes_get_type: TGType; cdecl; external libgobject2_0;
function g_variant_type_get_gtype: TGType; cdecl; external libgobject2_0;
function g_regex_get_type: TGType; cdecl; external libgobject2_0;
function g_match_info_get_type: TGType; cdecl; external libgobject2_0;
function g_error_get_type: TGType; cdecl; external libgobject2_0;
function g_date_time_get_type: TGType; cdecl; external libgobject2_0;
function g_time_zone_get_type: TGType; cdecl; external libgobject2_0;
function g_io_channel_get_type: TGType; cdecl; external libgobject2_0;
function g_io_condition_get_type: TGType; cdecl; external libgobject2_0;
function g_variant_builder_get_type: TGType; cdecl; external libgobject2_0;
function g_variant_dict_get_type: TGType; cdecl; external libgobject2_0;
function g_key_file_get_type: TGType; cdecl; external libgobject2_0;
function g_main_loop_get_type: TGType; cdecl; external libgobject2_0;
function g_main_context_get_type: TGType; cdecl; external libgobject2_0;
function g_source_get_type: TGType; cdecl; external libgobject2_0;
function g_pollfd_get_type: TGType; cdecl; external libgobject2_0;
function g_thread_get_type: TGType; cdecl; external libgobject2_0;
function g_checksum_get_type: TGType; cdecl; external libgobject2_0;
function g_markup_parse_context_get_type: TGType; cdecl; external libgobject2_0;
function g_mapped_file_get_type: TGType; cdecl; external libgobject2_0;
function g_option_group_get_type: TGType; cdecl; external libgobject2_0;
function g_uri_get_type: TGType; cdecl; external libgobject2_0;
function g_tree_get_type: TGType; cdecl; external libgobject2_0;
function g_pattern_spec_get_type: TGType; cdecl; external libgobject2_0;
function g_bookmark_file_get_type: TGType; cdecl; external libgobject2_0;
function g_hmac_get_type: TGType; cdecl; external libgobject2_0;
function g_dir_get_type: TGType; cdecl; external libgobject2_0;
function g_rand_get_type: TGType; cdecl; external libgobject2_0;
function g_strv_builder_get_type: TGType; cdecl; external libgobject2_0;
function g_variant_get_gtype: TGType; cdecl; external libgobject2_0;

function G_TYPE_DATE: TGType;
function G_TYPE_STRV: TGType;
function G_TYPE_GSTRING: TGType;
function G_TYPE_HASH_TABLE: TGType;
function G_TYPE_REGEX: TGType;
function G_TYPE_MATCH_INFO: TGType;
function G_TYPE_ARRAY: TGType;
function G_TYPE_BYTE_ARRAY: TGType;
function G_TYPE_PTR_ARRAY: TGType;
function G_TYPE_BYTES: TGType;
function G_TYPE_VARIANT_TYPE: TGType;
function G_TYPE_ERROR: TGType;
function G_TYPE_DATE_TIME: TGType;
function G_TYPE_TIME_ZONE: TGType;
function G_TYPE_IO_CHANNEL: TGType;
function G_TYPE_IO_CONDITION: TGType;
function G_TYPE_VARIANT_BUILDER: TGType;
function G_TYPE_VARIANT_DICT: TGType;
function G_TYPE_MAIN_LOOP: TGType;
function G_TYPE_MAIN_CONTEXT: TGType;
function G_TYPE_SOURCE: TGType;
function G_TYPE_POLLFD: TGType;
function G_TYPE_MARKUP_PARSE_CONTEXT: TGType;
function G_TYPE_KEY_FILE: TGType;
function G_TYPE_MAPPED_FILE: TGType;
function G_TYPE_THREAD: TGType;
function G_TYPE_CHECKSUM: TGType;
function G_TYPE_OPTION_GROUP: TGType;
function G_TYPE_URI: TGType;
function G_TYPE_TREE: TGType;
function G_TYPE_PATTERN_SPEC: TGType;
function G_TYPE_BOOKMARK_FILE: TGType;
function G_TYPE_HMAC: TGType;
function G_TYPE_DIR: TGType;
function G_TYPE_RAND: TGType;
function G_TYPE_STRV_BUILDER: TGType;

// === Konventiert am: 14-8-24 19:17:57 ===


implementation

function G_TYPE_DATE: TGType;
begin
  G_TYPE_DATE := g_date_get_type;
end;

function G_TYPE_STRV: TGType;
begin
  G_TYPE_STRV := g_strv_get_type;
end;

function G_TYPE_GSTRING: TGType;
begin
  G_TYPE_GSTRING := g_gstring_get_type;
end;

function G_TYPE_HASH_TABLE: TGType;
begin
  G_TYPE_HASH_TABLE := g_hash_table_get_type;
end;

function G_TYPE_REGEX: TGType;
begin
  G_TYPE_REGEX := g_regex_get_type;
end;

function G_TYPE_MATCH_INFO: TGType;
begin
  G_TYPE_MATCH_INFO := g_match_info_get_type;
end;

function G_TYPE_ARRAY: TGType;
begin
  G_TYPE_ARRAY := g_array_get_type;
end;

function G_TYPE_BYTE_ARRAY: TGType;
begin
  G_TYPE_BYTE_ARRAY := g_byte_array_get_type;
end;

function G_TYPE_PTR_ARRAY: TGType;
begin
  G_TYPE_PTR_ARRAY := g_ptr_array_get_type;
end;

function G_TYPE_BYTES: TGType;
begin
  G_TYPE_BYTES := g_bytes_get_type;
end;

function G_TYPE_VARIANT_TYPE: TGType;
begin
  G_TYPE_VARIANT_TYPE := g_variant_type_get_gtype;
end;

function G_TYPE_ERROR: TGType;
begin
  G_TYPE_ERROR := g_error_get_type;
end;

function G_TYPE_DATE_TIME: TGType;
begin
  G_TYPE_DATE_TIME := g_date_time_get_type;
end;

function G_TYPE_TIME_ZONE: TGType;
begin
  G_TYPE_TIME_ZONE := g_time_zone_get_type;
end;

function G_TYPE_IO_CHANNEL: TGType;
begin
  G_TYPE_IO_CHANNEL := g_io_channel_get_type;
end;

function G_TYPE_IO_CONDITION: TGType;
begin
  G_TYPE_IO_CONDITION := g_io_condition_get_type;
end;

function G_TYPE_VARIANT_BUILDER: TGType;
begin
  G_TYPE_VARIANT_BUILDER := g_variant_builder_get_type;
end;

function G_TYPE_VARIANT_DICT: TGType;
begin
  G_TYPE_VARIANT_DICT := g_variant_dict_get_type;
end;

function G_TYPE_MAIN_LOOP: TGType;
begin
  G_TYPE_MAIN_LOOP := g_main_loop_get_type;
end;

function G_TYPE_MAIN_CONTEXT: TGType;
begin
  G_TYPE_MAIN_CONTEXT := g_main_context_get_type;
end;

function G_TYPE_SOURCE: TGType;
begin
  G_TYPE_SOURCE := g_source_get_type;
end;

function G_TYPE_POLLFD: TGType;
begin
  G_TYPE_POLLFD := g_pollfd_get_type;
end;

function G_TYPE_MARKUP_PARSE_CONTEXT: TGType;
begin
  G_TYPE_MARKUP_PARSE_CONTEXT := g_markup_parse_context_get_type;
end;

function G_TYPE_KEY_FILE: TGType;
begin
  G_TYPE_KEY_FILE := g_key_file_get_type;
end;

function G_TYPE_MAPPED_FILE: TGType;
begin
  G_TYPE_MAPPED_FILE := g_mapped_file_get_type;
end;

function G_TYPE_THREAD: TGType;
begin
  G_TYPE_THREAD := g_thread_get_type;
end;

function G_TYPE_CHECKSUM: TGType;
begin
  G_TYPE_CHECKSUM := g_checksum_get_type;
end;

function G_TYPE_OPTION_GROUP: TGType;
begin
  G_TYPE_OPTION_GROUP := g_option_group_get_type;
end;

function G_TYPE_URI: TGType;
begin
  G_TYPE_URI := g_uri_get_type;
end;

function G_TYPE_TREE: TGType;
begin
  G_TYPE_TREE := g_tree_get_type;
end;

function G_TYPE_PATTERN_SPEC: TGType;
begin
  G_TYPE_PATTERN_SPEC := g_pattern_spec_get_type;
end;

function G_TYPE_BOOKMARK_FILE: TGType;
begin
  G_TYPE_BOOKMARK_FILE := g_bookmark_file_get_type;
end;

function G_TYPE_HMAC: TGType;
begin
  G_TYPE_HMAC := g_hmac_get_type;
end;

function G_TYPE_DIR: TGType;
begin
  G_TYPE_DIR := g_dir_get_type;
end;

function G_TYPE_RAND: TGType;
begin
  G_TYPE_RAND := g_rand_get_type;
end;

function G_TYPE_STRV_BUILDER: TGType;
begin
  G_TYPE_STRV_BUILDER := g_strv_builder_get_type;
end;

end.
