/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

function G_TYPE_PARAM_CHAR: Tgtype;
function G_IS_PARAM_SPEC_CHAR(pspec: Pointer): Tgboolean;
function G_PARAM_SPEC_CHAR(pspec: Pointer): PGTypeInstance;
function G_TYPE_PARAM_UCHAR: Tgtype;
function G_IS_PARAM_SPEC_UCHAR(pspec: Pointer): Tgboolean;
function G_PARAM_SPEC_UCHAR(pspec: Pointer): PGTypeInstance;
function G_TYPE_PARAM_BOOLEAN: Tgtype;
function G_IS_PARAM_SPEC_BOOLEAN(pspec: Pointer): Tgboolean;
function G_PARAM_SPEC_BOOLEAN(pspec: Pointer): PGTypeInstance;
function G_TYPE_PARAM_INT: Tgtype;
function G_IS_PARAM_SPEC_INT(pspec: Pointer): Tgboolean;
function G_PARAM_SPEC_INT(pspec: Pointer): PGTypeInstance;
function G_TYPE_PARAM_UINT: Tgtype;
function G_IS_PARAM_SPEC_UINT(pspec: Pointer): Tgboolean;
function G_PARAM_SPEC_UINT(pspec: Pointer): PGTypeInstance;
function G_TYPE_PARAM_LONG: Tgtype;
function G_IS_PARAM_SPEC_LONG(pspec: Pointer): Tgboolean;
function G_PARAM_SPEC_LONG(pspec: Pointer): PGTypeInstance;
function G_TYPE_PARAM_ULONG: Tgtype;
function G_IS_PARAM_SPEC_ULONG(pspec: Pointer): Tgboolean;
function G_PARAM_SPEC_ULONG(pspec: Pointer): PGTypeInstance;
function G_TYPE_PARAM_INT64: Tgtype;
function G_IS_PARAM_SPEC_INT64(pspec: Pointer): Tgboolean;
function G_PARAM_SPEC_INT64(pspec: Pointer): PGTypeInstance;
function G_TYPE_PARAM_UINT64: Tgtype;
function G_IS_PARAM_SPEC_UINT64(pspec: Pointer): Tgboolean;
function G_PARAM_SPEC_UINT64(pspec: Pointer): PGTypeInstance;
function G_TYPE_PARAM_UNICHAR: Tgtype;
function G_PARAM_SPEC_UNICHAR(pspec: Pointer): PGTypeInstance;
function G_IS_PARAM_SPEC_UNICHAR(pspec: Pointer): Tgboolean;
function G_TYPE_PARAM_ENUM: Tgtype;
function G_IS_PARAM_SPEC_ENUM(pspec: Pointer): Tgboolean;
function G_PARAM_SPEC_ENUM(pspec: Pointer): PGTypeInstance;
function G_TYPE_PARAM_FLAGS: Tgtype;
function G_IS_PARAM_SPEC_FLAGS(pspec: Pointer): Tgboolean;
function G_PARAM_SPEC_FLAGS(pspec: Pointer): PGTypeInstance;
function G_TYPE_PARAM_FLOAT: Tgtype;
function G_IS_PARAM_SPEC_FLOAT(pspec: Pointer): Tgboolean;
function G_PARAM_SPEC_FLOAT(pspec: Pointer): PGTypeInstance;
function G_TYPE_PARAM_DOUBLE: Tgtype;
function G_IS_PARAM_SPEC_DOUBLE(pspec: Pointer): Tgboolean;
function G_PARAM_SPEC_DOUBLE(pspec: Pointer): PGTypeInstance;
function G_TYPE_PARAM_STRING: Tgtype;
function G_IS_PARAM_SPEC_STRING(pspec: Pointer): Tgboolean;
function G_PARAM_SPEC_STRING(pspec: Pointer): PGTypeInstance;
function G_TYPE_PARAM_PARAM: Tgtype;
function G_IS_PARAM_SPEC_PARAM(pspec: Pointer): Tgboolean;
function G_PARAM_SPEC_PARAM(pspec: Pointer): PGTypeInstance;
function G_TYPE_PARAM_BOXED: Tgtype;
function G_IS_PARAM_SPEC_BOXED(pspec: Pointer): Tgboolean;
function G_PARAM_SPEC_BOXED(pspec: Pointer): PGTypeInstance;
function G_TYPE_PARAM_POINTER: Tgtype;
function G_IS_PARAM_SPEC_POINTER(pspec: Pointer): Tgboolean;
function G_PARAM_SPEC_POINTER(pspec: Pointer): PGTypeInstance;
function G_TYPE_PARAM_VALUE_ARRAY: Tgtype;
function G_IS_PARAM_SPEC_VALUE_ARRAY(pspec: Pointer): Tgboolean;
function G_PARAM_SPEC_VALUE_ARRAY(pspec: Pointer): PGTypeInstance;
function G_TYPE_PARAM_OBJECT: Tgtype;
function G_IS_PARAM_SPEC_OBJECT(pspec: Pointer): Tgboolean;
function G_PARAM_SPEC_OBJECT(pspec: Pointer): PGTypeInstance;
function G_TYPE_PARAM_OVERRIDE: Tgtype;
function G_IS_PARAM_SPEC_OVERRIDE(pspec: Pointer): Tgboolean;
function G_PARAM_SPEC_OVERRIDE(pspec: Pointer): PGTypeInstance;
function G_TYPE_PARAM_GTYPE: Tgtype;
function G_IS_PARAM_SPEC_GTYPE(pspec: Pointer): Tgboolean;
function G_PARAM_SPEC_GTYPE(pspec: Pointer): PGTypeInstance;
function G_TYPE_PARAM_VARIANT: Tgtype;
function G_IS_PARAM_SPEC_VARIANT(pspec: Pointer): Tgboolean;
function G_PARAM_SPEC_VARIANT(pspec: Pointer): PGTypeInstance;

type
  PGParamSpecChar = ^TGParamSpecChar;

  TGParamSpecChar = record
    parent_instance: TGParamSpec;
    minimum: Tgint8;
    maximum: Tgint8;
    default_value: Tgint8;
  end;

  PGParamSpecUChar = ^TGParamSpecUChar;

  TGParamSpecUChar = record
    parent_instance: TGParamSpec;
    minimum: Tguint8;
    maximum: Tguint8;
    default_value: Tguint8;
  end;

  PGParamSpecBoolean = ^TGParamSpecBoolean;

  TGParamSpecBoolean = record
    parent_instance: TGParamSpec;
    default_value: Tgboolean;
  end;

  PGParamSpecInt = ^TGParamSpecInt;

  TGParamSpecInt = record
    parent_instance: TGParamSpec;
    minimum: Tgint;
    maximum: Tgint;
    default_value: Tgint;
  end;

  PGParamSpecUInt = ^TGParamSpecUInt;

  TGParamSpecUInt = record
    parent_instance: TGParamSpec;
    minimum: Tguint;
    maximum: Tguint;
    default_value: Tguint;
  end;

  PGParamSpecLong = ^TGParamSpecLong;

  TGParamSpecLong = record
    parent_instance: TGParamSpec;
    minimum: Tglong;
    maximum: Tglong;
    default_value: Tglong;
  end;

  PGParamSpecULong = ^TGParamSpecULong;

  TGParamSpecULong = record
    parent_instance: TGParamSpec;
    minimum: Tgulong;
    maximum: Tgulong;
    default_value: Tgulong;
  end;

  PGParamSpecInt64 = ^TGParamSpecInt64;

  TGParamSpecInt64 = record
    parent_instance: TGParamSpec;
    minimum: Tgint64;
    maximum: Tgint64;
    default_value: Tgint64;
  end;

  PGParamSpecUInt64 = ^TGParamSpecUInt64;

  TGParamSpecUInt64 = record
    parent_instance: TGParamSpec;
    minimum: Tguint64;
    maximum: Tguint64;
    default_value: Tguint64;
  end;

  PGParamSpecUnichar = ^TGParamSpecUnichar;

  TGParamSpecUnichar = record
    parent_instance: TGParamSpec;
    default_value: Tgunichar;
  end;

  PGParamSpecEnum = ^TGParamSpecEnum;

  TGParamSpecEnum = record
    parent_instance: TGParamSpec;
    enum_class: PGEnumClass;
    default_value: Tgint;
  end;

  PGParamSpecFlags = ^TGParamSpecFlags;

  TGParamSpecFlags = record
    parent_instance: TGParamSpec;
    flags_class: PGFlagsClass;
    default_value: Tguint;
  end;

  PGParamSpecFloat = ^TGParamSpecFloat;

  TGParamSpecFloat = record
    parent_instance: TGParamSpec;
    minimum: Tgfloat;
    maximum: Tgfloat;
    default_value: Tgfloat;
    epsilon: Tgfloat;
  end;

  PGParamSpecDouble = ^TGParamSpecDouble;

  TGParamSpecDouble = record
    parent_instance: TGParamSpec;
    minimum: Tgdouble;
    maximum: Tgdouble;
    default_value: Tgdouble;
    epsilon: Tgdouble;
  end;

(*
struct _GParamSpecString
{
  GParamSpec    parent_instance;

  gchar        *default_value;
  gchar        *cset_first;
  gchar        *cset_nth;
  gchar         substitutor;
  guint         null_fold_if_empty : 1;
  guint         ensure_non_null : 1;
};
*)

  PGParamSpecString = ^TGParamSpecString;

  TGParamSpecString = record
    parent_instance: TGParamSpec;
    default_value: Pgchar;
    cset_first: Pgchar;
    cset_nth: Pgchar;
    substitutor: Tgchar;
    flag0: word;    // ????????
        null_fold_if_empty : 0..1;
          ensure_non_null : 0..1;
  end;


const
  bm_TGParamSpecString_null_fold_if_empty = $1;
  bp_TGParamSpecString_null_fold_if_empty = 0;
  bm_TGParamSpecString_ensure_non_null = $2;
  bp_TGParamSpecString_ensure_non_null = 1;

type
  PGParamSpecParam = ^TGParamSpecParam;

  TGParamSpecParam = record
    parent_instance: TGParamSpec;
  end;

  PGParamSpecBoxed = ^TGParamSpecBoxed;

  TGParamSpecBoxed = record
    parent_instance: TGParamSpec;
  end;

  PGParamSpecPointer = ^TGParamSpecPointer;

  TGParamSpecPointer = record
    parent_instance: TGParamSpec;
  end;

  PGParamSpecValueArray = ^TGParamSpecValueArray;

  TGParamSpecValueArray = record
    parent_instance: TGParamSpec;
    element_spec: PGParamSpec;
    fixed_n_elements: Tguint;
  end;

  PGParamSpecObject = ^TGParamSpecObject;

  TGParamSpecObject = record
    parent_instance: TGParamSpec;
  end;

  PGParamSpecOverride = ^TGParamSpecOverride;

  TGParamSpecOverride = record
    parent_instance: TGParamSpec;
    overridden: PGParamSpec;
  end;

  PGParamSpecGType = ^TGParamSpecGType;

  TGParamSpecGType = record
    parent_instance: TGParamSpec;
    is_a_type: TGType;
  end;

  PGParamSpecVariant = ^TGParamSpecVariant;

  TGParamSpecVariant = record
    parent_instance: TGParamSpec;
    _type: PGVariantType;
    default_value: PGVariant;
    padding: array[0..3] of Tgpointer;
  end;

function g_param_spec_char(Name: Pgchar; nick: Pgchar; blurb: Pgchar; minimum: Tgint8; maximum: Tgint8;
  default_value: Tgint8; flags: TGParamFlags): PGParamSpec; cdecl; external libgobject2_0;
function g_param_spec_uchar(Name: Pgchar; nick: Pgchar; blurb: Pgchar; minimum: Tguint8; maximum: Tguint8;
  default_value: Tguint8; flags: TGParamFlags): PGParamSpec; cdecl; external libgobject2_0;
function g_param_spec_boolean(Name: Pgchar; nick: Pgchar; blurb: Pgchar; default_value: Tgboolean; flags: TGParamFlags): PGParamSpec; cdecl; external libgobject2_0;
function g_param_spec_int(Name: Pgchar; nick: Pgchar; blurb: Pgchar; minimum: Tgint; maximum: Tgint;
  default_value: Tgint; flags: TGParamFlags): PGParamSpec; cdecl; external libgobject2_0;
function g_param_spec_uint(Name: Pgchar; nick: Pgchar; blurb: Pgchar; minimum: Tguint; maximum: Tguint;
  default_value: Tguint; flags: TGParamFlags): PGParamSpec; cdecl; external libgobject2_0;
function g_param_spec_long(Name: Pgchar; nick: Pgchar; blurb: Pgchar; minimum: Tglong; maximum: Tglong;
  default_value: Tglong; flags: TGParamFlags): PGParamSpec; cdecl; external libgobject2_0;
function g_param_spec_ulong(Name: Pgchar; nick: Pgchar; blurb: Pgchar; minimum: Tgulong; maximum: Tgulong;
  default_value: Tgulong; flags: TGParamFlags): PGParamSpec; cdecl; external libgobject2_0;
function g_param_spec_int64(Name: Pgchar; nick: Pgchar; blurb: Pgchar; minimum: Tgint64; maximum: Tgint64;
  default_value: Tgint64; flags: TGParamFlags): PGParamSpec; cdecl; external libgobject2_0;
function g_param_spec_uint64(Name: Pgchar; nick: Pgchar; blurb: Pgchar; minimum: Tguint64; maximum: Tguint64;
  default_value: Tguint64; flags: TGParamFlags): PGParamSpec; cdecl; external libgobject2_0;
function g_param_spec_unichar(Name: Pgchar; nick: Pgchar; blurb: Pgchar; default_value: Tgunichar; flags: TGParamFlags): PGParamSpec; cdecl; external libgobject2_0;
function g_param_spec_enum(Name: Pgchar; nick: Pgchar; blurb: Pgchar; enum_type: TGType; default_value: Tgint;
  flags: TGParamFlags): PGParamSpec; cdecl; external libgobject2_0;
function g_param_spec_flags(Name: Pgchar; nick: Pgchar; blurb: Pgchar; flags_type: TGType; default_value: Tguint;
  flags: TGParamFlags): PGParamSpec; cdecl; external libgobject2_0;
function g_param_spec_float(Name: Pgchar; nick: Pgchar; blurb: Pgchar; minimum: Tgfloat; maximum: Tgfloat;
  default_value: Tgfloat; flags: TGParamFlags): PGParamSpec; cdecl; external libgobject2_0;
function g_param_spec_double(Name: Pgchar; nick: Pgchar; blurb: Pgchar; minimum: Tgdouble; maximum: Tgdouble;
  default_value: Tgdouble; flags: TGParamFlags): PGParamSpec; cdecl; external libgobject2_0;
function g_param_spec_string(Name: Pgchar; nick: Pgchar; blurb: Pgchar; default_value: Pgchar; flags: TGParamFlags): PGParamSpec; cdecl; external libgobject2_0;
function g_param_spec_param(Name: Pgchar; nick: Pgchar; blurb: Pgchar; param_type: TGType; flags: TGParamFlags): PGParamSpec; cdecl; external libgobject2_0;
function g_param_spec_boxed(Name: Pgchar; nick: Pgchar; blurb: Pgchar; boxed_type: TGType; flags: TGParamFlags): PGParamSpec; cdecl; external libgobject2_0;
function g_param_spec_pointer(Name: Pgchar; nick: Pgchar; blurb: Pgchar; flags: TGParamFlags): PGParamSpec; cdecl; external libgobject2_0;
function g_param_spec_value_array(Name: Pgchar; nick: Pgchar; blurb: Pgchar; element_spec: PGParamSpec; flags: TGParamFlags): PGParamSpec; cdecl; external libgobject2_0;
function g_param_spec_object(Name: Pgchar; nick: Pgchar; blurb: Pgchar; object_type: TGType; flags: TGParamFlags): PGParamSpec; cdecl; external libgobject2_0;
function g_param_spec_override(Name: Pgchar; overridden: PGParamSpec): PGParamSpec; cdecl; external libgobject2_0;
function g_param_spec_gtype(Name: Pgchar; nick: Pgchar; blurb: Pgchar; is_a_type: TGType; flags: TGParamFlags): PGParamSpec; cdecl; external libgobject2_0;
function g_param_spec_variant(Name: Pgchar; nick: Pgchar; blurb: Pgchar; _type: PGVariantType; default_value: PGVariant;
  flags: TGParamFlags): PGParamSpec; cdecl; external libgobject2_0;

var
  g_param_spec_types: PGType; cvar;external libglib2;

  // === Konventiert am: 14-8-24 17:01:22 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function G_TYPE_PARAM_CHAR: Tgtype;
begin
  G_TYPE_PARAM_CHAR := g_param_spec_types[0];
end;

function G_IS_PARAM_SPEC_CHAR(pspec: Pointer): Tgboolean;
begin
  G_IS_PARAM_SPEC_CHAR := G_TYPE_CHECK_INSTANCE_TYPE(pspec, G_TYPE_PARAM_CHAR);
end;

function G_PARAM_SPEC_CHAR(pspec: Pointer): PGTypeInstance;
begin
  G_PARAM_SPEC_CHAR := G_TYPE_CHECK_INSTANCE_CAST(pspec, G_TYPE_PARAM_CHAR);
end;

function G_TYPE_PARAM_UCHAR: Tgtype;
begin
  G_TYPE_PARAM_UCHAR := g_param_spec_types[1];
end;

function G_IS_PARAM_SPEC_UCHAR(pspec: Pointer): Tgboolean;
begin
  G_IS_PARAM_SPEC_UCHAR := G_TYPE_CHECK_INSTANCE_TYPE(pspec, G_TYPE_PARAM_UCHAR);
end;

function G_PARAM_SPEC_UCHAR(pspec: Pointer): PGTypeInstance;
begin
  G_PARAM_SPEC_UCHAR := G_TYPE_CHECK_INSTANCE_CAST(pspec, G_TYPE_PARAM_UCHAR);
end;

function G_TYPE_PARAM_BOOLEAN: Tgtype;
begin
  G_TYPE_PARAM_BOOLEAN := g_param_spec_types[2];
end;

function G_IS_PARAM_SPEC_BOOLEAN(pspec: Pointer): Tgboolean;
begin
  G_IS_PARAM_SPEC_BOOLEAN := G_TYPE_CHECK_INSTANCE_TYPE(pspec, G_TYPE_PARAM_BOOLEAN);
end;

function G_PARAM_SPEC_BOOLEAN(pspec: Pointer): PGTypeInstance;
begin
  G_PARAM_SPEC_BOOLEAN := G_TYPE_CHECK_INSTANCE_CAST(pspec, G_TYPE_PARAM_BOOLEAN);
end;

function G_TYPE_PARAM_INT: Tgtype;
begin
  G_TYPE_PARAM_INT := g_param_spec_types[3];
end;

function G_IS_PARAM_SPEC_INT(pspec: Pointer): Tgboolean;
begin
  G_IS_PARAM_SPEC_INT := G_TYPE_CHECK_INSTANCE_TYPE(pspec, G_TYPE_PARAM_INT);
end;

function G_PARAM_SPEC_INT(pspec: Pointer): PGTypeInstance;
begin
  G_PARAM_SPEC_INT := G_TYPE_CHECK_INSTANCE_CAST(pspec, G_TYPE_PARAM_INT);
end;

function G_TYPE_PARAM_UINT: Tgtype;
begin
  G_TYPE_PARAM_UINT := g_param_spec_types[4];
end;

function G_IS_PARAM_SPEC_UINT(pspec: Pointer): Tgboolean;
begin
  G_IS_PARAM_SPEC_UINT := G_TYPE_CHECK_INSTANCE_TYPE(pspec, G_TYPE_PARAM_UINT);
end;

function G_PARAM_SPEC_UINT(pspec: Pointer): PGTypeInstance;
begin
  G_PARAM_SPEC_UINT := G_TYPE_CHECK_INSTANCE_CAST(pspec, G_TYPE_PARAM_UINT);
end;

function G_TYPE_PARAM_LONG: Tgtype;
begin
  G_TYPE_PARAM_LONG := g_param_spec_types[5];
end;

function G_IS_PARAM_SPEC_LONG(pspec: Pointer): Tgboolean;
begin
  G_IS_PARAM_SPEC_LONG := G_TYPE_CHECK_INSTANCE_TYPE(pspec, G_TYPE_PARAM_LONG);
end;

function G_PARAM_SPEC_LONG(pspec: Pointer): PGTypeInstance;
begin
  G_PARAM_SPEC_LONG := G_TYPE_CHECK_INSTANCE_CAST(pspec, G_TYPE_PARAM_LONG);
end;

function G_TYPE_PARAM_ULONG: Tgtype;
begin
  G_TYPE_PARAM_ULONG := g_param_spec_types[6];
end;

function G_IS_PARAM_SPEC_ULONG(pspec: Pointer): Tgboolean;
begin
  G_IS_PARAM_SPEC_ULONG := G_TYPE_CHECK_INSTANCE_TYPE(pspec, G_TYPE_PARAM_ULONG);
end;

function G_PARAM_SPEC_ULONG(pspec: Pointer): PGTypeInstance;
begin
  G_PARAM_SPEC_ULONG := G_TYPE_CHECK_INSTANCE_CAST(pspec, G_TYPE_PARAM_ULONG);
end;

function G_TYPE_PARAM_INT64: Tgtype;
begin
  G_TYPE_PARAM_INT64 := g_param_spec_types[7];
end;

function G_IS_PARAM_SPEC_INT64(pspec: Pointer): Tgboolean;
begin
  G_IS_PARAM_SPEC_INT64 := G_TYPE_CHECK_INSTANCE_TYPE(pspec, G_TYPE_PARAM_INT64);
end;

function G_PARAM_SPEC_INT64(pspec: Pointer): PGTypeInstance;
begin
  G_PARAM_SPEC_INT64 := G_TYPE_CHECK_INSTANCE_CAST(pspec, G_TYPE_PARAM_INT64);
end;

function G_TYPE_PARAM_UINT64: Tgtype;
begin
  G_TYPE_PARAM_UINT64 := g_param_spec_types[8];
end;

function G_IS_PARAM_SPEC_UINT64(pspec: Pointer): Tgboolean;
begin
  G_IS_PARAM_SPEC_UINT64 := G_TYPE_CHECK_INSTANCE_TYPE(pspec, G_TYPE_PARAM_UINT64);
end;

function G_PARAM_SPEC_UINT64(pspec: Pointer): PGTypeInstance;
begin
  G_PARAM_SPEC_UINT64 := G_TYPE_CHECK_INSTANCE_CAST(pspec, G_TYPE_PARAM_UINT64);
end;

function G_TYPE_PARAM_UNICHAR: Tgtype;
begin
  G_TYPE_PARAM_UNICHAR := g_param_spec_types[9];
end;

function G_PARAM_SPEC_UNICHAR(pspec: Pointer): PGTypeInstance;
begin
  G_PARAM_SPEC_UNICHAR := G_TYPE_CHECK_INSTANCE_CAST(pspec, G_TYPE_PARAM_UNICHAR);
end;

function G_IS_PARAM_SPEC_UNICHAR(pspec: Pointer): Tgboolean;
begin
  G_IS_PARAM_SPEC_UNICHAR := G_TYPE_CHECK_INSTANCE_TYPE(pspec, G_TYPE_PARAM_UNICHAR);
end;

function G_TYPE_PARAM_ENUM: Tgtype;
begin
  G_TYPE_PARAM_ENUM := g_param_spec_types[10];
end;

function G_IS_PARAM_SPEC_ENUM(pspec: Pointer): Tgboolean;
begin
  G_IS_PARAM_SPEC_ENUM := G_TYPE_CHECK_INSTANCE_TYPE(pspec, G_TYPE_PARAM_ENUM);
end;

function G_PARAM_SPEC_ENUM(pspec: Pointer): PGTypeInstance;
begin
  G_PARAM_SPEC_ENUM := G_TYPE_CHECK_INSTANCE_CAST(pspec, G_TYPE_PARAM_ENUM);
end;

function G_TYPE_PARAM_FLAGS: Tgtype;
begin
  G_TYPE_PARAM_FLAGS := g_param_spec_types[11];
end;

function G_IS_PARAM_SPEC_FLAGS(pspec: Pointer): Tgboolean;
begin
  G_IS_PARAM_SPEC_FLAGS := G_TYPE_CHECK_INSTANCE_TYPE(pspec, G_TYPE_PARAM_FLAGS);
end;

function G_PARAM_SPEC_FLAGS(pspec: Pointer): PGTypeInstance;
begin
  G_PARAM_SPEC_FLAGS := G_TYPE_CHECK_INSTANCE_CAST(pspec, G_TYPE_PARAM_FLAGS);
end;

function G_TYPE_PARAM_FLOAT: Tgtype;
begin
  G_TYPE_PARAM_FLOAT := g_param_spec_types[12];
end;

function G_IS_PARAM_SPEC_FLOAT(pspec: Pointer): Tgboolean;
begin
  G_IS_PARAM_SPEC_FLOAT := G_TYPE_CHECK_INSTANCE_TYPE(pspec, G_TYPE_PARAM_FLOAT);
end;

function G_PARAM_SPEC_FLOAT(pspec: Pointer): PGTypeInstance;
begin
  G_PARAM_SPEC_FLOAT := G_TYPE_CHECK_INSTANCE_CAST(pspec, G_TYPE_PARAM_FLOAT);
end;

function G_TYPE_PARAM_DOUBLE: Tgtype;
begin
  G_TYPE_PARAM_DOUBLE := g_param_spec_types[13];
end;

function G_IS_PARAM_SPEC_DOUBLE(pspec: Pointer): Tgboolean;
begin
  G_IS_PARAM_SPEC_DOUBLE := G_TYPE_CHECK_INSTANCE_TYPE(pspec, G_TYPE_PARAM_DOUBLE);
end;

function G_PARAM_SPEC_DOUBLE(pspec: Pointer): PGTypeInstance;
begin
  G_PARAM_SPEC_DOUBLE := G_TYPE_CHECK_INSTANCE_CAST(pspec, G_TYPE_PARAM_DOUBLE);
end;

function G_TYPE_PARAM_STRING: Tgtype;
begin
  G_TYPE_PARAM_STRING := g_param_spec_types[14];
end;

function G_IS_PARAM_SPEC_STRING(pspec: Pointer): Tgboolean;
begin
  G_IS_PARAM_SPEC_STRING := G_TYPE_CHECK_INSTANCE_TYPE(pspec, G_TYPE_PARAM_STRING);
end;

function G_PARAM_SPEC_STRING(pspec: Pointer): PGTypeInstance;
begin
  G_PARAM_SPEC_STRING := G_TYPE_CHECK_INSTANCE_CAST(pspec, G_TYPE_PARAM_STRING);
end;

function G_TYPE_PARAM_PARAM: Tgtype;
begin
  G_TYPE_PARAM_PARAM := g_param_spec_types[15];
end;

function G_IS_PARAM_SPEC_PARAM(pspec: Pointer): Tgboolean;
begin
  G_IS_PARAM_SPEC_PARAM := G_TYPE_CHECK_INSTANCE_TYPE(pspec, G_TYPE_PARAM_PARAM);
end;

function G_PARAM_SPEC_PARAM(pspec: Pointer): PGTypeInstance;
begin
  G_PARAM_SPEC_PARAM := G_TYPE_CHECK_INSTANCE_CAST(pspec, G_TYPE_PARAM_PARAM);
end;

function G_TYPE_PARAM_BOXED: Tgtype;
begin
  G_TYPE_PARAM_BOXED := g_param_spec_types[16];
end;

function G_IS_PARAM_SPEC_BOXED(pspec: Pointer): Tgboolean;
begin
  G_IS_PARAM_SPEC_BOXED := G_TYPE_CHECK_INSTANCE_TYPE(pspec, G_TYPE_PARAM_BOXED);
end;

function G_PARAM_SPEC_BOXED(pspec: Pointer): PGTypeInstance;
begin
  G_PARAM_SPEC_BOXED := G_TYPE_CHECK_INSTANCE_CAST(pspec, G_TYPE_PARAM_BOXED);
end;

function G_TYPE_PARAM_POINTER: Tgtype;
begin
  G_TYPE_PARAM_POINTER := g_param_spec_types[17];
end;

function G_IS_PARAM_SPEC_POINTER(pspec: Pointer): Tgboolean;
begin
  G_IS_PARAM_SPEC_POINTER := G_TYPE_CHECK_INSTANCE_TYPE(pspec, G_TYPE_PARAM_POINTER);
end;

function G_PARAM_SPEC_POINTER(pspec: Pointer): PGTypeInstance;
begin
  G_PARAM_SPEC_POINTER := G_TYPE_CHECK_INSTANCE_CAST(pspec, G_TYPE_PARAM_POINTER);
end;

function G_TYPE_PARAM_VALUE_ARRAY: Tgtype;
begin
  G_TYPE_PARAM_VALUE_ARRAY := g_param_spec_types[18];
end;

function G_IS_PARAM_SPEC_VALUE_ARRAY(pspec: Pointer): Tgboolean;
begin
  G_IS_PARAM_SPEC_VALUE_ARRAY := G_TYPE_CHECK_INSTANCE_TYPE(pspec, G_TYPE_PARAM_VALUE_ARRAY);
end;

function G_PARAM_SPEC_VALUE_ARRAY(pspec: Pointer): PGTypeInstance;
begin
  G_PARAM_SPEC_VALUE_ARRAY := G_TYPE_CHECK_INSTANCE_CAST(pspec, G_TYPE_PARAM_VALUE_ARRAY);
end;

function G_TYPE_PARAM_OBJECT: Tgtype;
begin
  G_TYPE_PARAM_OBJECT := g_param_spec_types[19];
end;

function G_IS_PARAM_SPEC_OBJECT(pspec: Pointer): Tgboolean;
begin
  G_IS_PARAM_SPEC_OBJECT := G_TYPE_CHECK_INSTANCE_TYPE(pspec, G_TYPE_PARAM_OBJECT);
end;

function G_PARAM_SPEC_OBJECT(pspec: Pointer): PGTypeInstance;
begin
  G_PARAM_SPEC_OBJECT := G_TYPE_CHECK_INSTANCE_CAST(pspec, G_TYPE_PARAM_OBJECT);
end;

function G_TYPE_PARAM_OVERRIDE: Tgtype;
begin
  G_TYPE_PARAM_OVERRIDE := g_param_spec_types[20];
end;

function G_IS_PARAM_SPEC_OVERRIDE(pspec: Pointer): Tgboolean;
begin
  G_IS_PARAM_SPEC_OVERRIDE := G_TYPE_CHECK_INSTANCE_TYPE(pspec, G_TYPE_PARAM_OVERRIDE);
end;

function G_PARAM_SPEC_OVERRIDE(pspec: Pointer): PGTypeInstance;
begin
  G_PARAM_SPEC_OVERRIDE := G_TYPE_CHECK_INSTANCE_CAST(pspec, G_TYPE_PARAM_OVERRIDE);
end;

function G_TYPE_PARAM_GTYPE: Tgtype;
begin
  G_TYPE_PARAM_GTYPE := g_param_spec_types[21];
end;

function G_IS_PARAM_SPEC_GTYPE(pspec: Pointer): Tgboolean;
begin
  G_IS_PARAM_SPEC_GTYPE := G_TYPE_CHECK_INSTANCE_TYPE(pspec, G_TYPE_PARAM_GTYPE);
end;

function G_PARAM_SPEC_GTYPE(pspec: Pointer): PGTypeInstance;
begin
  G_PARAM_SPEC_GTYPE := G_TYPE_CHECK_INSTANCE_CAST(pspec, G_TYPE_PARAM_GTYPE);
end;

function G_TYPE_PARAM_VARIANT: Tgtype;
begin
  G_TYPE_PARAM_VARIANT := g_param_spec_types[22];
end;

function G_IS_PARAM_SPEC_VARIANT(pspec: Pointer): Tgboolean;
begin
  G_IS_PARAM_SPEC_VARIANT := G_TYPE_CHECK_INSTANCE_TYPE(pspec, G_TYPE_PARAM_VARIANT);
end;

function G_PARAM_SPEC_VARIANT(pspec: Pointer): PGTypeInstance;
begin
  G_PARAM_SPEC_VARIANT := G_TYPE_CHECK_INSTANCE_CAST(pspec, G_TYPE_PARAM_VARIANT);
end;


{$ENDIF read_implementation}
