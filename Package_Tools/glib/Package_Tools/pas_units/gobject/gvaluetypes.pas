unit gvaluetypes;

interface

uses
  common_GLIB, gtypes, gvariant, gvalue, gtype;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

procedure g_value_set_char(value:PGValue; v_char:Tgchar);cdecl;external libglib2;
function g_value_get_char(value:PGValue):Tgchar;cdecl;external libglib2;
procedure g_value_set_schar(value:PGValue; v_char:Tgint8);cdecl;external libglib2;
function g_value_get_schar(value:PGValue):Tgint8;cdecl;external libglib2;
procedure g_value_set_uchar(value:PGValue; v_uchar:Tguchar);cdecl;external libglib2;
function g_value_get_uchar(value:PGValue):Tguchar;cdecl;external libglib2;
procedure g_value_set_boolean(value:PGValue; v_boolean:Tgboolean);cdecl;external libglib2;
function g_value_get_boolean(value:PGValue):Tgboolean;cdecl;external libglib2;
procedure g_value_set_int(value:PGValue; v_int:Tgint);cdecl;external libglib2;
function g_value_get_int(value:PGValue):Tgint;cdecl;external libglib2;
procedure g_value_set_uint(value:PGValue; v_uint:Tguint);cdecl;external libglib2;
function g_value_get_uint(value:PGValue):Tguint;cdecl;external libglib2;
procedure g_value_set_long(value:PGValue; v_long:Tglong);cdecl;external libglib2;
function g_value_get_long(value:PGValue):Tglong;cdecl;external libglib2;
procedure g_value_set_ulong(value:PGValue; v_ulong:Tgulong);cdecl;external libglib2;
function g_value_get_ulong(value:PGValue):Tgulong;cdecl;external libglib2;
procedure g_value_set_int64(value:PGValue; v_int64:Tgint64);cdecl;external libglib2;
function g_value_get_int64(value:PGValue):Tgint64;cdecl;external libglib2;
procedure g_value_set_uint64(value:PGValue; v_uint64:Tguint64);cdecl;external libglib2;
function g_value_get_uint64(value:PGValue):Tguint64;cdecl;external libglib2;
procedure g_value_set_float(value:PGValue; v_float:Tgfloat);cdecl;external libglib2;
function g_value_get_float(value:PGValue):Tgfloat;cdecl;external libglib2;
procedure g_value_set_double(value:PGValue; v_double:Tgdouble);cdecl;external libglib2;
function g_value_get_double(value:PGValue):Tgdouble;cdecl;external libglib2;
procedure g_value_set_string(value:PGValue; v_string:Pgchar);cdecl;external libglib2;
procedure g_value_set_static_string(value:PGValue; v_string:Pgchar);cdecl;external libglib2;
procedure g_value_set_interned_string(value:PGValue; v_string:Pgchar);cdecl;external libglib2;
function g_value_get_string(value:PGValue):Pgchar;cdecl;external libglib2;
function g_value_dup_string(value:PGValue):Pgchar;cdecl;external libglib2;
function g_value_steal_string(value:PGValue):Pgchar;cdecl;external libglib2;
procedure g_value_set_pointer(value:PGValue; v_pointer:Tgpointer);cdecl;external libglib2;
function g_value_get_pointer(value:PGValue):Tgpointer;cdecl;external libglib2;
function g_gtype_get_type:TGType;cdecl;external libglib2;
procedure g_value_set_gtype(value:PGValue; v_gtype:TGType);cdecl;external libglib2;
function g_value_get_gtype(value:PGValue):TGType;cdecl;external libglib2;
procedure g_value_set_variant(value:PGValue; variant:PGVariant);cdecl;external libglib2;
procedure g_value_take_variant(value:PGValue; variant:PGVariant);cdecl;external libglib2;
function g_value_get_variant(value:PGValue):PGVariant;cdecl;external libglib2;
function g_value_dup_variant(value:PGValue):PGVariant;cdecl;external libglib2;
function g_pointer_type_register_static(name:Pgchar):TGType;cdecl;external libglib2;
function g_strdup_value_contents(value:PGValue):Pgchar;cdecl;external libglib2;
procedure g_value_take_string(value:PGValue; v_string:Pgchar);cdecl;external libglib2;
procedure g_value_set_string_take_ownership(value:PGValue; v_string:Pgchar);cdecl;external libglib2;
type
  Pgchararray = ^Tgchararray;
  Tgchararray = Pgchar;

  function G_VALUE_HOLDS_CHAR(value : PGValue) : Tgboolean;
  function G_VALUE_HOLDS_UCHAR(value : PGValue) : Tgboolean;
  function G_VALUE_HOLDS_BOOLEAN(value : PGValue) : Tgboolean;
  function G_VALUE_HOLDS_INT(value : PGValue) : Tgboolean;
  function G_VALUE_HOLDS_UINT(value : PGValue) : Tgboolean;
  function G_VALUE_HOLDS_LONG(value : PGValue) : Tgboolean;
  function G_VALUE_HOLDS_ULONG(value : PGValue) : Tgboolean;
  function G_VALUE_HOLDS_INT64(value : PGValue) : Tgboolean;
  function G_VALUE_HOLDS_UINT64(value : PGValue) : Tgboolean;
  function G_VALUE_HOLDS_FLOAT(value : PGValue) : Tgboolean;
  function G_VALUE_HOLDS_DOUBLE(value : PGValue) : Tgboolean;
  function G_VALUE_HOLDS_STRING(value : PGValue) : Tgboolean;
  function G_VALUE_HOLDS_POINTER(value : PGValue) : Tgboolean;
  function G_VALUE_HOLDS_GTYPE(value : PGValue) : Tgboolean;
  function G_VALUE_HOLDS_VARIANT(value : PGValue) : Tgboolean;

  function G_VALUE_IS_INTERNED_STRING(value : PGValue) : Tgboolean;
  function G_TYPE_GTYPE : TGType;

// === Konventiert am: 14-8-24 19:22:51 ===


implementation

function G_VALUE_HOLDS_CHAR(value: PGValue): Tgboolean;
begin
  G_VALUE_HOLDS_CHAR:=G_TYPE_CHECK_VALUE_TYPE(value,G_TYPE_CHAR);
end;
function G_VALUE_HOLDS_UCHAR(value: PGValue): Tgboolean;
begin
  G_VALUE_HOLDS_UCHAR:=G_TYPE_CHECK_VALUE_TYPE(value,G_TYPE_UCHAR);
end;
function G_VALUE_HOLDS_BOOLEAN(value: PGValue): Tgboolean;
begin
  G_VALUE_HOLDS_BOOLEAN:=G_TYPE_CHECK_VALUE_TYPE(value,G_TYPE_BOOLEAN);
end;
function G_VALUE_HOLDS_INT(value: PGValue): Tgboolean;
begin
  G_VALUE_HOLDS_INT:=G_TYPE_CHECK_VALUE_TYPE(value,G_TYPE_INT);
end;
function G_VALUE_HOLDS_UINT(value: PGValue): Tgboolean;
begin
  G_VALUE_HOLDS_UINT:=G_TYPE_CHECK_VALUE_TYPE(value,G_TYPE_UINT);
end;
function G_VALUE_HOLDS_LONG(value: PGValue): Tgboolean;
begin
  G_VALUE_HOLDS_LONG:=G_TYPE_CHECK_VALUE_TYPE(value,G_TYPE_LONG);
end;
function G_VALUE_HOLDS_ULONG(value: PGValue): Tgboolean;
begin
  G_VALUE_HOLDS_ULONG:=G_TYPE_CHECK_VALUE_TYPE(value,G_TYPE_ULONG);
end;
function G_VALUE_HOLDS_INT64(value: PGValue): Tgboolean;
begin
  G_VALUE_HOLDS_INT64:=G_TYPE_CHECK_VALUE_TYPE(value,G_TYPE_INT64);
end;
function G_VALUE_HOLDS_UINT64(value: PGValue): Tgboolean;
begin
  G_VALUE_HOLDS_UINT64:=G_TYPE_CHECK_VALUE_TYPE(value,G_TYPE_UINT64);
end;
function G_VALUE_HOLDS_FLOAT(value: PGValue): Tgboolean;
begin
  G_VALUE_HOLDS_FLOAT:=G_TYPE_CHECK_VALUE_TYPE(value,G_TYPE_FLOAT);
end;
function G_VALUE_HOLDS_DOUBLE(value: PGValue): Tgboolean;
begin
  G_VALUE_HOLDS_DOUBLE:=G_TYPE_CHECK_VALUE_TYPE(value,G_TYPE_DOUBLE);
end;
function G_VALUE_HOLDS_STRING(value: PGValue): Tgboolean;
begin
  G_VALUE_HOLDS_STRING:=G_TYPE_CHECK_VALUE_TYPE(value,G_TYPE_STRING);
end;
function G_VALUE_HOLDS_POINTER(value: PGValue): Tgboolean;
begin
  G_VALUE_HOLDS_POINTER:=G_TYPE_CHECK_VALUE_TYPE(value,G_TYPE_POINTER);
end;

function G_VALUE_HOLDS_GTYPE(value: PGValue): Tgboolean;
begin
  G_VALUE_HOLDS_GTYPE:=G_TYPE_CHECK_VALUE_TYPE(value,G_TYPE_GTYPE);
end;
function G_VALUE_HOLDS_VARIANT(value: PGValue): Tgboolean;
begin
  G_VALUE_HOLDS_VARIANT:=G_TYPE_CHECK_VALUE_TYPE(value,G_TYPE_VARIANT);
end;
function G_VALUE_IS_INTERNED_STRING(value: PGValue): Tgboolean;
begin
  G_VALUE_IS_INTERNED_STRING:=(G_VALUE_HOLDS_STRING(value)) and (((value^.data[1].v_int) and G_VALUE_INTERNED_STRING)<>0);
end;
function G_TYPE_GTYPE: TGType;
  begin
    G_TYPE_GTYPE:=g_gtype_get_type;
  end;


end.
