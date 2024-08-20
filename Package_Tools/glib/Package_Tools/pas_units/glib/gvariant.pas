unit gvariant;

interface

uses
  common_GLIB, gtypes, garray, gerror, gstring, gquark, gvarianttype;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGVariant = record
  end;
  PGVariant = ^TGVariant;
  PPGVariant = ^PGVariant;
  PPPGVariant = ^PPGVariant;

  PGVariantClass = ^TGVariantClass;
  TGVariantClass = longint;

const
  G_VARIANT_CLASS_BOOLEAN = 'b';
  G_VARIANT_CLASS_BYTE = 'y';
  G_VARIANT_CLASS_INT16 = 'n';
  G_VARIANT_CLASS_UINT16 = 'q';
  G_VARIANT_CLASS_INT32 = 'i';
  G_VARIANT_CLASS_UINT32 = 'u';
  G_VARIANT_CLASS_INT64 = 'x';
  G_VARIANT_CLASS_UINT64 = 't';
  G_VARIANT_CLASS_HANDLE = 'h';
  G_VARIANT_CLASS_DOUBLE = 'd';
  G_VARIANT_CLASS_STRING = 's';
  G_VARIANT_CLASS_OBJECT_PATH = 'o';
  G_VARIANT_CLASS_SIGNATURE = 'g';
  G_VARIANT_CLASS_VARIANT = 'v';
  G_VARIANT_CLASS_MAYBE = 'm';
  G_VARIANT_CLASS_ARRAY = 'a';
  G_VARIANT_CLASS_TUPLE = '(';
  G_VARIANT_CLASS_DICT_ENTRY = '{';

procedure g_variant_unref(Value: PGVariant); cdecl; external libglib2;
function g_variant_ref(Value: PGVariant): PGVariant; cdecl; external libglib2;
function g_variant_ref_sink(Value: PGVariant): PGVariant; cdecl; external libglib2;
function g_variant_is_floating(Value: PGVariant): Tgboolean; cdecl; external libglib2;
function g_variant_take_ref(Value: PGVariant): PGVariant; cdecl; external libglib2;
function g_variant_get_type(Value: PGVariant): PGVariantType; cdecl; external libglib2;
function g_variant_get_type_string(Value: PGVariant): Pgchar; cdecl; external libglib2;
function g_variant_is_of_type(Value: PGVariant; _type: PGVariantType): Tgboolean; cdecl; external libglib2;
function g_variant_is_container(Value: PGVariant): Tgboolean; cdecl; external libglib2;
function g_variant_classify(Value: PGVariant): TGVariantClass; cdecl; external libglib2;
function g_variant_new_boolean(Value: Tgboolean): PGVariant; cdecl; external libglib2;
function g_variant_new_byte(Value: Tguint8): PGVariant; cdecl; external libglib2;
function g_variant_new_int16(Value: Tgint16): PGVariant; cdecl; external libglib2;
function g_variant_new_uint16(Value: Tguint16): PGVariant; cdecl; external libglib2;
function g_variant_new_int32(Value: Tgint32): PGVariant; cdecl; external libglib2;
function g_variant_new_uint32(Value: Tguint32): PGVariant; cdecl; external libglib2;
function g_variant_new_int64(Value: Tgint64): PGVariant; cdecl; external libglib2;
function g_variant_new_uint64(Value: Tguint64): PGVariant; cdecl; external libglib2;
function g_variant_new_handle(Value: Tgint32): PGVariant; cdecl; external libglib2;
function g_variant_new_double(Value: Tgdouble): PGVariant; cdecl; external libglib2;
function g_variant_new_string(_string: Pgchar): PGVariant; cdecl; external libglib2;
function g_variant_new_take_string(_string: Pgchar): PGVariant; cdecl; external libglib2;
function g_variant_new_printf(format_string: Pgchar; args: array of const): PGVariant; cdecl; external libglib2;
function g_variant_new_printf(format_string: Pgchar): PGVariant; cdecl; external libglib2;
function g_variant_new_object_path(object_path: Pgchar): PGVariant; cdecl; external libglib2;
function g_variant_is_object_path(_string: Pgchar): Tgboolean; cdecl; external libglib2;
function g_variant_new_signature(signature: Pgchar): PGVariant; cdecl; external libglib2;
function g_variant_is_signature(_string: Pgchar): Tgboolean; cdecl; external libglib2;
function g_variant_new_variant(Value: PGVariant): PGVariant; cdecl; external libglib2;
function g_variant_new_strv(strv: PPgchar; length: Tgssize): PGVariant; cdecl; external libglib2;
function g_variant_new_objv(strv: PPgchar; length: Tgssize): PGVariant; cdecl; external libglib2;
function g_variant_new_bytestring(_string: Pgchar): PGVariant; cdecl; external libglib2;
function g_variant_new_bytestring_array(strv: PPgchar; length: Tgssize): PGVariant; cdecl; external libglib2;
function g_variant_new_fixed_array(element_type: PGVariantType; elements: Tgconstpointer; n_elements: Tgsize; element_size: Tgsize): PGVariant; cdecl; external libglib2;
function g_variant_get_boolean(Value: PGVariant): Tgboolean; cdecl; external libglib2;
function g_variant_get_byte(Value: PGVariant): Tguint8; cdecl; external libglib2;
function g_variant_get_int16(Value: PGVariant): Tgint16; cdecl; external libglib2;
function g_variant_get_uint16(Value: PGVariant): Tguint16; cdecl; external libglib2;
function g_variant_get_int32(Value: PGVariant): Tgint32; cdecl; external libglib2;
function g_variant_get_uint32(Value: PGVariant): Tguint32; cdecl; external libglib2;
function g_variant_get_int64(Value: PGVariant): Tgint64; cdecl; external libglib2;
function g_variant_get_uint64(Value: PGVariant): Tguint64; cdecl; external libglib2;
function g_variant_get_handle(Value: PGVariant): Tgint32; cdecl; external libglib2;
function g_variant_get_double(Value: PGVariant): Tgdouble; cdecl; external libglib2;
function g_variant_get_variant(Value: PGVariant): PGVariant; cdecl; external libglib2;
function g_variant_get_string(Value: PGVariant; length: Pgsize): Pgchar; cdecl; external libglib2;
function g_variant_dup_string(Value: PGVariant; length: Pgsize): Pgchar; cdecl; external libglib2;
function g_variant_get_strv(Value: PGVariant; length: Pgsize): PPgchar; cdecl; external libglib2;
function g_variant_dup_strv(Value: PGVariant; length: Pgsize): PPgchar; cdecl; external libglib2;
function g_variant_get_objv(Value: PGVariant; length: Pgsize): PPgchar; cdecl; external libglib2;
function g_variant_dup_objv(Value: PGVariant; length: Pgsize): PPgchar; cdecl; external libglib2;
function g_variant_get_bytestring(Value: PGVariant): Pgchar; cdecl; external libglib2;
function g_variant_dup_bytestring(Value: PGVariant; length: Pgsize): Pgchar; cdecl; external libglib2;
function g_variant_get_bytestring_array(Value: PGVariant; length: Pgsize): PPgchar; cdecl; external libglib2;
function g_variant_dup_bytestring_array(Value: PGVariant; length: Pgsize): PPgchar; cdecl; external libglib2;
function g_variant_new_maybe(child_type: PGVariantType; child: PGVariant): PGVariant; cdecl; external libglib2;
function g_variant_new_array(child_type: PGVariantType; children: PPGVariant; n_children: Tgsize): PGVariant; cdecl; external libglib2;
function g_variant_new_tuple(children: PPGVariant; n_children: Tgsize): PGVariant; cdecl; external libglib2;
function g_variant_new_dict_entry(key: PGVariant; Value: PGVariant): PGVariant; cdecl; external libglib2;
function g_variant_get_maybe(Value: PGVariant): PGVariant; cdecl; external libglib2;
function g_variant_n_children(Value: PGVariant): Tgsize; cdecl; external libglib2;
procedure g_variant_get_child(Value: PGVariant; index_: Tgsize; format_string: Pgchar; args: array of const); cdecl; external libglib2;
procedure g_variant_get_child(Value: PGVariant; index_: Tgsize; format_string: Pgchar); cdecl; external libglib2;
function g_variant_get_child_value(Value: PGVariant; index_: Tgsize): PGVariant; cdecl; external libglib2;
function g_variant_lookup(dictionary: PGVariant; key: Pgchar; format_string: Pgchar; args: array of const): Tgboolean; cdecl; external libglib2;
function g_variant_lookup(dictionary: PGVariant; key: Pgchar; format_string: Pgchar): Tgboolean; cdecl; external libglib2;
function g_variant_lookup_value(dictionary: PGVariant; key: Pgchar; expected_type: PGVariantType): PGVariant; cdecl; external libglib2;
function g_variant_get_fixed_array(Value: PGVariant; n_elements: Pgsize; element_size: Tgsize): Tgconstpointer; cdecl; external libglib2;
function g_variant_get_size(Value: PGVariant): Tgsize; cdecl; external libglib2;
function g_variant_get_data(Value: PGVariant): Tgconstpointer; cdecl; external libglib2;
function g_variant_get_data_as_bytes(Value: PGVariant): PGBytes; cdecl; external libglib2;
procedure g_variant_store(Value: PGVariant; Data: Tgpointer); cdecl; external libglib2;
function g_variant_print(Value: PGVariant; type_annotate: Tgboolean): Pgchar; cdecl; external libglib2;
function g_variant_print_string(Value: PGVariant; _string: PGString; type_annotate: Tgboolean): PGString; cdecl; external libglib2;
function g_variant_hash(Value: Tgconstpointer): Tguint; cdecl; external libglib2;
function g_variant_equal(one: Tgconstpointer; two: Tgconstpointer): Tgboolean; cdecl; external libglib2;
function g_variant_get_normal_form(Value: PGVariant): PGVariant; cdecl; external libglib2;
function g_variant_is_normal_form(Value: PGVariant): Tgboolean; cdecl; external libglib2;
function g_variant_byteswap(Value: PGVariant): PGVariant; cdecl; external libglib2;
function g_variant_new_from_bytes(_type: PGVariantType; bytes: PGBytes; trusted: Tgboolean): PGVariant; cdecl; external libglib2;
function g_variant_new_from_data(_type: PGVariantType; Data: Tgconstpointer; size: Tgsize; trusted: Tgboolean; notify: TGDestroyNotify;
  user_data: Tgpointer): PGVariant; cdecl; external libglib2;

type
  TGVariantIter = record
    x: array[0..15] of Tguintptr;
  end;
  PGVariantIter = ^TGVariantIter;


function g_variant_iter_new(Value: PGVariant): PGVariantIter; cdecl; external libglib2;
function g_variant_iter_init(iter: PGVariantIter; Value: PGVariant): Tgsize; cdecl; external libglib2;
function g_variant_iter_copy(iter: PGVariantIter): PGVariantIter; cdecl; external libglib2;
function g_variant_iter_n_children(iter: PGVariantIter): Tgsize; cdecl; external libglib2;
procedure g_variant_iter_free(iter: PGVariantIter); cdecl; external libglib2;
function g_variant_iter_next_value(iter: PGVariantIter): PGVariant; cdecl; external libglib2;
function g_variant_iter_next(iter: PGVariantIter; format_string: Pgchar; args: array of const): Tgboolean; cdecl; external libglib2;
function g_variant_iter_next(iter: PGVariantIter; format_string: Pgchar): Tgboolean; cdecl; external libglib2;
function g_variant_iter_loop(iter: PGVariantIter; format_string: Pgchar; args: array of const): Tgboolean; cdecl; external libglib2;
function g_variant_iter_loop(iter: PGVariantIter; format_string: Pgchar): Tgboolean; cdecl; external libglib2;

type
  TGVariantBuilder = record
    u: record
      case longint of
        0: (s: record
            partial_magic: Tgsize;
            _type: PGVariantType;
            y: array[0..13] of Tguintptr;
            end);
        1: (x: array[0..15] of Tguintptr);
      end;
  end;
  PGVariantBuilder = ^TGVariantBuilder;

  PGVariantParseError = ^TGVariantParseError;
  TGVariantParseError = longint;

const
  G_VARIANT_PARSE_ERROR_FAILED = 0;
  G_VARIANT_PARSE_ERROR_BASIC_TYPE_EXPECTED = 1;
  G_VARIANT_PARSE_ERROR_CANNOT_INFER_TYPE = 2;
  G_VARIANT_PARSE_ERROR_DEFINITE_TYPE_EXPECTED = 3;
  G_VARIANT_PARSE_ERROR_INPUT_NOT_AT_END = 4;
  G_VARIANT_PARSE_ERROR_INVALID_CHARACTER = 5;
  G_VARIANT_PARSE_ERROR_INVALID_FORMAT_STRING = 6;
  G_VARIANT_PARSE_ERROR_INVALID_OBJECT_PATH = 7;
  G_VARIANT_PARSE_ERROR_INVALID_SIGNATURE = 8;
  G_VARIANT_PARSE_ERROR_INVALID_TYPE_STRING = 9;
  G_VARIANT_PARSE_ERROR_NO_COMMON_TYPE = 10;
  G_VARIANT_PARSE_ERROR_NUMBER_OUT_OF_RANGE = 11;
  G_VARIANT_PARSE_ERROR_NUMBER_TOO_BIG = 12;
  G_VARIANT_PARSE_ERROR_TYPE_ERROR = 13;
  G_VARIANT_PARSE_ERROR_UNEXPECTED_TOKEN = 14;
  G_VARIANT_PARSE_ERROR_UNKNOWN_KEYWORD = 15;
  G_VARIANT_PARSE_ERROR_UNTERMINATED_STRING_CONSTANT = 16;
  G_VARIANT_PARSE_ERROR_VALUE_EXPECTED = 17;
  G_VARIANT_PARSE_ERROR_RECURSION = 18;

function g_variant_parser_get_error_quark: TGQuark; cdecl; external libglib2;
function g_variant_parse_error_quark: TGQuark; cdecl; external libglib2;
function g_variant_builder_new(_type: PGVariantType): PGVariantBuilder; cdecl; external libglib2;
procedure g_variant_builder_unref(builder: PGVariantBuilder); cdecl; external libglib2;
function g_variant_builder_ref(builder: PGVariantBuilder): PGVariantBuilder; cdecl; external libglib2;
procedure g_variant_builder_init(builder: PGVariantBuilder; _type: PGVariantType); cdecl; external libglib2;
function g_variant_builder_end(builder: PGVariantBuilder): PGVariant; cdecl; external libglib2;
procedure g_variant_builder_clear(builder: PGVariantBuilder); cdecl; external libglib2;
procedure g_variant_builder_open(builder: PGVariantBuilder; _type: PGVariantType); cdecl; external libglib2;
procedure g_variant_builder_close(builder: PGVariantBuilder); cdecl; external libglib2;
procedure g_variant_builder_add_value(builder: PGVariantBuilder; Value: PGVariant); cdecl; external libglib2;
procedure g_variant_builder_add(builder: PGVariantBuilder; format_string: Pgchar; args: array of const); cdecl; external libglib2;
procedure g_variant_builder_add(builder: PGVariantBuilder; format_string: Pgchar); cdecl; external libglib2;
procedure g_variant_builder_add_parsed(builder: PGVariantBuilder; format: Pgchar; args: array of const); cdecl; external libglib2;
procedure g_variant_builder_add_parsed(builder: PGVariantBuilder; format: Pgchar); cdecl; external libglib2;
function g_variant_new(format_string: Pgchar; args: array of const): PGVariant; cdecl; external libglib2;
function g_variant_new(format_string: Pgchar): PGVariant; cdecl; external libglib2;
procedure g_variant_get(Value: PGVariant; format_string: Pgchar; args: array of const); cdecl; external libglib2;
procedure g_variant_get(Value: PGVariant; format_string: Pgchar); cdecl; external libglib2;
function g_variant_new_va(format_string: Pgchar; endptr: PPgchar; app: Pva_list): PGVariant; cdecl; external libglib2;
procedure g_variant_get_va(Value: PGVariant; format_string: Pgchar; endptr: PPgchar; app: Pva_list); cdecl; external libglib2;
function g_variant_check_format_string(Value: PGVariant; format_string: Pgchar; copy_only: Tgboolean): Tgboolean; cdecl; external libglib2;
function g_variant_parse(_type: PGVariantType; Text: Pgchar; limit: Pgchar; endptr: PPgchar; error: PPGError): PGVariant; cdecl; external libglib2;
function g_variant_new_parsed(format: Pgchar; args: array of const): PGVariant; cdecl; external libglib2;
function g_variant_new_parsed(format: Pgchar): PGVariant; cdecl; external libglib2;
function g_variant_new_parsed_va(format: Pgchar; app: Pva_list): PGVariant; cdecl; external libglib2;
function g_variant_parse_error_print_context(error: PGError; source_str: Pgchar): Pgchar; cdecl; external libglib2;
function g_variant_compare(one: Tgconstpointer; two: Tgconstpointer): Tgint; cdecl; external libglib2;

type
  TGVariantDict = record
    u: record
      case longint of
        0: (s: record
            asv: PGVariant;
            partial_magic: Tgsize;
            y: array[0..13] of Tguintptr;
            end);
        1: (x: array[0..15] of Tguintptr);
      end;
  end;
  PGVariantDict = ^TGVariantDict;

function g_variant_dict_new(from_asv: PGVariant): PGVariantDict; cdecl; external libglib2;
procedure g_variant_dict_init(dict: PGVariantDict; from_asv: PGVariant); cdecl; external libglib2;
function g_variant_dict_lookup(dict: PGVariantDict; key: Pgchar; format_string: Pgchar; args: array of const): Tgboolean; cdecl; external libglib2;
function g_variant_dict_lookup(dict: PGVariantDict; key: Pgchar; format_string: Pgchar): Tgboolean; cdecl; external libglib2;
function g_variant_dict_lookup_value(dict: PGVariantDict; key: Pgchar; expected_type: PGVariantType): PGVariant; cdecl; external libglib2;
function g_variant_dict_contains(dict: PGVariantDict; key: Pgchar): Tgboolean; cdecl; external libglib2;
procedure g_variant_dict_insert(dict: PGVariantDict; key: Pgchar; format_string: Pgchar; args: array of const); cdecl; external libglib2;
procedure g_variant_dict_insert(dict: PGVariantDict; key: Pgchar; format_string: Pgchar); cdecl; external libglib2;
procedure g_variant_dict_insert_value(dict: PGVariantDict; key: Pgchar; Value: PGVariant); cdecl; external libglib2;
function g_variant_dict_remove(dict: PGVariantDict; key: Pgchar): Tgboolean; cdecl; external libglib2;
procedure g_variant_dict_clear(dict: PGVariantDict); cdecl; external libglib2;
function g_variant_dict_end(dict: PGVariantDict): PGVariant; cdecl; external libglib2;
function g_variant_dict_ref(dict: PGVariantDict): PGVariantDict; cdecl; external libglib2;
procedure g_variant_dict_unref(dict: PGVariantDict); cdecl; external libglib2;

function G_VARIANT_PARSE_ERROR: TGQuark;

// === Konventiert am: 6-8-24 15:38:31 ===

implementation

function G_VARIANT_PARSE_ERROR: TGQuark;
begin
  G_VARIANT_PARSE_ERROR := g_variant_parse_error_quark;
end;


end.
