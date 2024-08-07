unit gvarianttype;

interface

uses
  common_GLIB, gtypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGVariantType = record
  end;
  PGVariantType = ^TGVariantType;
  PPGVariantType = ^PGVariantType;

function G_VARIANT_TYPE_BOOLEAN: PGVariantType;
function G_VARIANT_TYPE_BYTE: PGVariantType;
function G_VARIANT_TYPE_INT16: PGVariantType;
function G_VARIANT_TYPE_UINT16: PGVariantType;
function G_VARIANT_TYPE_INT32: PGVariantType;
function G_VARIANT_TYPE_UINT32: PGVariantType;
function G_VARIANT_TYPE_INT64: PGVariantType;
function G_VARIANT_TYPE_UINT64: PGVariantType;
function G_VARIANT_TYPE_DOUBLE: PGVariantType;
function G_VARIANT_TYPE_STRING: PGVariantType;
function G_VARIANT_TYPE_OBJECT_PATH: PGVariantType;
function G_VARIANT_TYPE_SIGNATURE: PGVariantType;
function G_VARIANT_TYPE_VARIANT: PGVariantType;
function G_VARIANT_TYPE_HANDLE: PGVariantType;
function G_VARIANT_TYPE_UNIT: PGVariantType;
function G_VARIANT_TYPE_ANY: PGVariantType;
function G_VARIANT_TYPE_BASIC: PGVariantType;
function G_VARIANT_TYPE_MAYBE: PGVariantType;
function G_VARIANT_TYPE_ARRAY: PGVariantType;
function G_VARIANT_TYPE_TUPLE: PGVariantType;
function G_VARIANT_TYPE_DICT_ENTRY: PGVariantType;
function G_VARIANT_TYPE_DICTIONARY: PGVariantType;
function G_VARIANT_TYPE_STRING_ARRAY: PGVariantType;
function G_VARIANT_TYPE_OBJECT_PATH_ARRAY: PGVariantType;
function G_VARIANT_TYPE_BYTESTRING: PGVariantType;
function G_VARIANT_TYPE_BYTESTRING_ARRAY: PGVariantType;
function G_VARIANT_TYPE_VARDICT: PGVariantType;
function G_VARIANT_TYPE(type_string: Pgchar): PGVariantType;

function g_variant_type_string_is_valid(type_string: Pgchar): Tgboolean; cdecl; external libglib2;
function g_variant_type_string_scan(_string: Pgchar; limit: Pgchar; endptr: PPgchar): Tgboolean; cdecl; external libglib2;
procedure g_variant_type_free(_type: PGVariantType); cdecl; external libglib2;
function g_variant_type_copy(_type: PGVariantType): PGVariantType; cdecl; external libglib2;
function g_variant_type_new(type_string: Pgchar): PGVariantType; cdecl; external libglib2;
function g_variant_type_get_string_length(_type: PGVariantType): Tgsize; cdecl; external libglib2;
function g_variant_type_peek_string(_type: PGVariantType): Pgchar; cdecl; external libglib2;
function g_variant_type_dup_string(_type: PGVariantType): Pgchar; cdecl; external libglib2;
function g_variant_type_is_definite(_type: PGVariantType): Tgboolean; cdecl; external libglib2;
function g_variant_type_is_container(_type: PGVariantType): Tgboolean; cdecl; external libglib2;
function g_variant_type_is_basic(_type: PGVariantType): Tgboolean; cdecl; external libglib2;
function g_variant_type_is_maybe(_type: PGVariantType): Tgboolean; cdecl; external libglib2;
function g_variant_type_is_array(_type: PGVariantType): Tgboolean; cdecl; external libglib2;
function g_variant_type_is_tuple(_type: PGVariantType): Tgboolean; cdecl; external libglib2;
function g_variant_type_is_dict_entry(_type: PGVariantType): Tgboolean; cdecl; external libglib2;
function g_variant_type_is_variant(_type: PGVariantType): Tgboolean; cdecl; external libglib2;
function g_variant_type_hash(_type: Tgconstpointer): Tguint; cdecl; external libglib2;
function g_variant_type_equal(type1: Tgconstpointer; type2: Tgconstpointer): Tgboolean; cdecl; external libglib2;
function g_variant_type_is_subtype_of(_type: PGVariantType; supertype: PGVariantType): Tgboolean; cdecl; external libglib2;
function g_variant_type_element(_type: PGVariantType): PGVariantType; cdecl; external libglib2;
function g_variant_type_first(_type: PGVariantType): PGVariantType; cdecl; external libglib2;
function g_variant_type_next(_type: PGVariantType): PGVariantType; cdecl; external libglib2;
function g_variant_type_n_items(_type: PGVariantType): Tgsize; cdecl; external libglib2;
function g_variant_type_key(_type: PGVariantType): PGVariantType; cdecl; external libglib2;
function g_variant_type_value(_type: PGVariantType): PGVariantType; cdecl; external libglib2;
function g_variant_type_new_array(element: PGVariantType): PGVariantType; cdecl; external libglib2;
function g_variant_type_new_maybe(element: PGVariantType): PGVariantType; cdecl; external libglib2;
function g_variant_type_new_tuple(items: PPGVariantType; length: Tgint): PGVariantType; cdecl; external libglib2;
function g_variant_type_new_dict_entry(key: PGVariantType; Value: PGVariantType): PGVariantType; cdecl; external libglib2;
function g_variant_type_checked_(type_string: Pgchar): PGVariantType; cdecl; external libglib2;
function g_variant_type_string_get_depth_(type_string: Pgchar): Tgsize; cdecl; external libglib2;

// === Konventiert am: 6-8-24 16:12:48 ===


implementation



function G_VARIANT_TYPE_BOOLEAN: PGVariantType;
begin
  G_VARIANT_TYPE_BOOLEAN := PGVariantType(PChar('b' + ''));
end;


function G_VARIANT_TYPE_BYTE: PGVariantType;
begin
  G_VARIANT_TYPE_BYTE := PGVariantType(PChar('y' + ''));
end;


function G_VARIANT_TYPE_INT16: PGVariantType;
begin
  G_VARIANT_TYPE_INT16 := PGVariantType(PChar('n' + ''));
end;


function G_VARIANT_TYPE_UINT16: PGVariantType;
begin
  G_VARIANT_TYPE_UINT16 := PGVariantType(PChar('q' + ''));
end;


function G_VARIANT_TYPE_INT32: PGVariantType;
begin
  G_VARIANT_TYPE_INT32 := PGVariantType(PChar('i' + ''));
end;


function G_VARIANT_TYPE_UINT32: PGVariantType;
begin
  G_VARIANT_TYPE_UINT32 := PGVariantType(PChar('u' + ''));
end;


function G_VARIANT_TYPE_INT64: PGVariantType;
begin
  G_VARIANT_TYPE_INT64 := PGVariantType(PChar('x' + ''));
end;


function G_VARIANT_TYPE_UINT64: PGVariantType;
begin
  G_VARIANT_TYPE_UINT64 := PGVariantType(PChar('t' + ''));
end;


function G_VARIANT_TYPE_DOUBLE: PGVariantType;
begin
  G_VARIANT_TYPE_DOUBLE := PGVariantType(PChar('d' + ''));
end;


function G_VARIANT_TYPE_STRING: PGVariantType;
begin
  G_VARIANT_TYPE_STRING := PGVariantType(PChar('s' + ''));
end;


function G_VARIANT_TYPE_OBJECT_PATH: PGVariantType;
begin
  G_VARIANT_TYPE_OBJECT_PATH := PGVariantType(PChar('o' + ''));
end;


function G_VARIANT_TYPE_SIGNATURE: PGVariantType;
begin
  G_VARIANT_TYPE_SIGNATURE := PGVariantType(PChar('g' + ''));
end;


function G_VARIANT_TYPE_VARIANT: PGVariantType;
begin
  G_VARIANT_TYPE_VARIANT := PGVariantType(PChar('v' + ''));
end;


function G_VARIANT_TYPE_HANDLE: PGVariantType;
begin
  G_VARIANT_TYPE_HANDLE := PGVariantType(PChar('h' + ''));
end;


function G_VARIANT_TYPE_UNIT: PGVariantType;
begin
  G_VARIANT_TYPE_UNIT := PGVariantType(PChar('()' + ''));
end;


function G_VARIANT_TYPE_ANY: PGVariantType;
begin
  G_VARIANT_TYPE_ANY := PGVariantType(PChar('*' + ''));
end;


function G_VARIANT_TYPE_BASIC: PGVariantType;
begin
  G_VARIANT_TYPE_BASIC := PGVariantType(PChar('?' + ''));
end;


function G_VARIANT_TYPE_MAYBE: PGVariantType;
begin
  G_VARIANT_TYPE_MAYBE := PGVariantType(PChar('m*' + ''));
end;


function G_VARIANT_TYPE_ARRAY: PGVariantType;
begin
  G_VARIANT_TYPE_ARRAY := PGVariantType(PChar('a*' + ''));
end;


function G_VARIANT_TYPE_TUPLE: PGVariantType;
begin
  G_VARIANT_TYPE_TUPLE := PGVariantType(PChar('r' + ''));
end;


function G_VARIANT_TYPE_DICT_ENTRY: PGVariantType;
begin
  G_VARIANT_TYPE_DICT_ENTRY := PGVariantType(PChar('{?*}' + ''));
end;


function G_VARIANT_TYPE_DICTIONARY: PGVariantType;
begin
  G_VARIANT_TYPE_DICTIONARY := PGVariantType(PChar('a{?*}' + ''));
end;


function G_VARIANT_TYPE_STRING_ARRAY: PGVariantType;
begin
  G_VARIANT_TYPE_STRING_ARRAY := PGVariantType(PChar('as' + ''));
end;


function G_VARIANT_TYPE_OBJECT_PATH_ARRAY: PGVariantType;
begin
  G_VARIANT_TYPE_OBJECT_PATH_ARRAY := PGVariantType(PChar('ao' + ''));
end;


function G_VARIANT_TYPE_BYTESTRING: PGVariantType;
begin
  G_VARIANT_TYPE_BYTESTRING := PGVariantType(PChar('ay' + ''));
end;


function G_VARIANT_TYPE_BYTESTRING_ARRAY: PGVariantType;
begin
  G_VARIANT_TYPE_BYTESTRING_ARRAY := PGVariantType(PChar('aay' + ''));
end;


function G_VARIANT_TYPE_VARDICT: PGVariantType;
begin
  G_VARIANT_TYPE_VARDICT := PGVariantType(PChar('a{sv}' + ''));
end;

function G_VARIANT_TYPE(type_string: Pgchar): PGVariantType;
begin
  G_VARIANT_TYPE := g_variant_type_checked_(type_string);
end;


end.
