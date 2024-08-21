unit gtype;

interface

uses
  common_GLIB, gtypes, gquark;


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  // unwichtige Makros entfernt
type
  PGType = ^TGType;
  TGType = Tguintptr;


  // ====== von gvalue.h
type
  TGValue = record
    g_type: TGType;
    Data: array[0..1] of record
      case longint of
        0: (v_int: Tgint);
        1: (v_uint: Tguint);
        2: (v_long: Tglong);
        3: (v_ulong: Tgulong);
        4: (v_int64: Tgint64);
        5: (v_uint64: Tguint64);
        6: (v_float: Tgfloat);
        7: (v_double: Tgdouble);
        8: (v_pointer: Tgpointer);
      end;
  end;
  PGValue = ^TGValue;

  // ==========

const
  G_TYPE_FUNDAMENTAL_SHIFT = 2;
  G_TYPE_FUNDAMENTAL_MAX = 255 shl G_TYPE_FUNDAMENTAL_SHIFT;

  G_TYPE_RESERVED_GLIB_FIRST = 22;
  G_TYPE_RESERVED_GLIB_LAST = 31;
  G_TYPE_RESERVED_BSE_FIRST = 32;
  G_TYPE_RESERVED_BSE_LAST = 48;
  G_TYPE_RESERVED_USER_FIRST = 49;

type
  TGTypePlugin = record
  end;
  PGTypePlugin = ^TGTypePlugin;

  TGTypeCValue = record
  end;
  PGTypeCValue = ^TGTypeCValue;

  PGTypeClass = ^TGTypeClass;

  TGTypeClass = record
    g_type: TGType;
  end;

  PGTypeInstance = ^TGTypeInstance;

  TGTypeInstance = record
    g_class: PGTypeClass;
  end;

  PGTypeInterface = ^TGTypeInterface;

  TGTypeInterface = record
    g_type: TGType;
    g_instance_type: TGType;
  end;

  PGTypeQuery = ^TGTypeQuery;

  TGTypeQuery = record
    _type: TGType;
    type_name: Pgchar;
    class_size: Tguint;
    instance_size: Tguint;
  end;


type
  PGTypeDebugFlags = ^TGTypeDebugFlags;
  TGTypeDebugFlags = longint;

const
  G_TYPE_DEBUG_NONE = 0;
  G_TYPE_DEBUG_OBJECTS = 1 shl 0;
  G_TYPE_DEBUG_SIGNALS = 1 shl 1;
  G_TYPE_DEBUG_INSTANCE_COUNT = 1 shl 2;
  G_TYPE_DEBUG_MASK = $07;

procedure g_type_init; cdecl; external;
procedure g_type_init_with_debug_flags(debug_flags: TGTypeDebugFlags); cdecl; external;
function g_type_name(_type: TGType): Pgchar; cdecl; external;
function g_type_qname(_type: TGType): TGQuark; cdecl; external;
function g_type_from_name(Name: Pgchar): TGType; cdecl; external;
function g_type_parent(_type: TGType): TGType; cdecl; external;
function g_type_depth(_type: TGType): Tguint; cdecl; external;
function g_type_next_base(leaf_type: TGType; root_type: TGType): TGType; cdecl; external;
function g_type_is_a(_type: TGType; is_a_type: TGType): Tgboolean; cdecl; external;
{#define g_type_is_a(a,b) ((a) == (b) || (g_type_is_a) ((a), (b))) }
function g_type_class_ref(_type: TGType): Tgpointer; cdecl; external;
function g_type_class_peek(_type: TGType): Tgpointer; cdecl; external;
function g_type_class_peek_static(_type: TGType): Tgpointer; cdecl; external;
procedure g_type_class_unref(g_class: Tgpointer); cdecl; external;
function g_type_class_peek_parent(g_class: Tgpointer): Tgpointer; cdecl; external;
function g_type_interface_peek(instance_class: Tgpointer; iface_type: TGType): Tgpointer; cdecl; external;
function g_type_interface_peek_parent(g_iface: Tgpointer): Tgpointer; cdecl; external;
function g_type_default_interface_ref(g_type: TGType): Tgpointer; cdecl; external;
function g_type_default_interface_peek(g_type: TGType): Tgpointer; cdecl; external;
procedure g_type_default_interface_unref(g_iface: Tgpointer); cdecl; external;
function g_type_children(_type: TGType; n_children: Pguint): PGType; cdecl; external;
function g_type_interfaces(_type: TGType; n_interfaces: Pguint): PGType; cdecl; external;
procedure g_type_set_qdata(_type: TGType; quark: TGQuark; Data: Tgpointer); cdecl; external;
function g_type_get_qdata(_type: TGType; quark: TGQuark): Tgpointer; cdecl; external;
procedure g_type_query(_type: TGType; query: PGTypeQuery); cdecl; external;
function g_type_get_instance_count(_type: TGType): longint; cdecl; external;

type
  TGBaseInitFunc = procedure(g_class: Tgpointer); cdecl;
  TGBaseFinalizeFunc = procedure(g_class: Tgpointer); cdecl;
  TGClassInitFunc = procedure(g_class: Tgpointer; class_data: Tgpointer); cdecl;
  TGClassFinalizeFunc = procedure(g_class: Tgpointer; class_data: Tgpointer); cdecl;
  TGInstanceInitFunc = procedure(instance: PGTypeInstance; g_class: Tgpointer); cdecl;
  TGInterfaceInitFunc = procedure(g_iface: Tgpointer; iface_data: Tgpointer); cdecl;
  TGInterfaceFinalizeFunc = procedure(g_iface: Tgpointer; iface_data: Tgpointer); cdecl;
  TGTypeClassCacheFunc = function(cache_data: Tgpointer; g_class: PGTypeClass): Tgboolean; cdecl;
  TGTypeInterfaceCheckFunc = procedure(check_data: Tgpointer; g_iface: Tgpointer); cdecl;

  PGTypeFundamentalFlags = ^TGTypeFundamentalFlags;
  TGTypeFundamentalFlags = longint;

const
  G_TYPE_FLAG_CLASSED = 1 shl 0;
  G_TYPE_FLAG_INSTANTIATABLE = 1 shl 1;
  G_TYPE_FLAG_DERIVABLE = 1 shl 2;
  G_TYPE_FLAG_DEEP_DERIVABLE = 1 shl 3;

type
  PGTypeFlags = ^TGTypeFlags;
  TGTypeFlags = longint;

const
  G_TYPE_FLAG_NONE = 0;
  G_TYPE_FLAG_ABSTRACT = 1 shl 4;
  G_TYPE_FLAG_VALUE_ABSTRACT = 1 shl 5;
  G_TYPE_FLAG_FINAL = 1 shl 6;
  G_TYPE_FLAG_DEPRECATED = 1 shl 7;

type
  TGTypeValueInitFunc = procedure(Value: PGValue); cdecl;
  TGTypeValueFreeFunc = procedure(Value: PGValue); cdecl;
  TGTypeValueCopyFunc = procedure(src_value: PGValue; dest_value: PGValue); cdecl;
  TGTypeValuePeekPointerFunc = function(Value: PGValue): Tgpointer; cdecl;

  PGTypeValueCollectFunc = ^TGTypeValueCollectFunc;
  TGTypeValueCollectFunc = function(Value: PGValue; n_collect_values: Tguint; collect_values: PGTypeCValue; collect_flags: Tguint): Pgchar; cdecl;

  PGTypeValueLCopyFunc = ^TGTypeValueLCopyFunc;
  TGTypeValueLCopyFunc = function(Value: PGValue; n_collect_values: Tguint; collect_values: PGTypeCValue; collect_flags: Tguint): Pgchar; cdecl;

  PGTypeValueTable = ^TGTypeValueTable;

  TGTypeValueTable = record
    value_init: TGTypeValueInitFunc;
    value_free: TGTypeValueFreeFunc;
    value_copy: TGTypeValueCopyFunc;
    value_peek_pointer: TGTypeValuePeekPointerFunc;
    collect_format: Pgchar;
    collect_value: TGTypeValueCollectFunc;
    lcopy_format: Pgchar;
    lcopy_value: TGTypeValueLCopyFunc;
  end;
  PGTypeInfo = ^TGTypeInfo;

  TGTypeInfo = record
    class_size: Tguint16;
    base_init: TGBaseInitFunc;
    base_finalize: TGBaseFinalizeFunc;
    class_init: TGClassInitFunc;
    class_finalize: TGClassFinalizeFunc;
    class_data: Tgconstpointer;
    instance_size: Tguint16;
    n_preallocs: Tguint16;
    instance_init: TGInstanceInitFunc;
    value_table: PGTypeValueTable;
  end;
  PGTypeFundamentalInfo = ^TGTypeFundamentalInfo;

  TGTypeFundamentalInfo = record
    type_flags: TGTypeFundamentalFlags;
  end;

  PGInterfaceInfo = ^TGInterfaceInfo;

  TGInterfaceInfo = record
    interface_init: TGInterfaceInitFunc;
    interface_finalize: TGInterfaceFinalizeFunc;
    interface_data: Tgpointer;
  end;


function g_type_register_static(parent_type: TGType; type_name: Pgchar; info: PGTypeInfo; flags: TGTypeFlags): TGType; cdecl; external;
function g_type_register_static_simple(parent_type: TGType; type_name: Pgchar; class_size: Tguint; class_init: TGClassInitFunc; instance_size: Tguint;
  instance_init: TGInstanceInitFunc; flags: TGTypeFlags): TGType; cdecl; external;
function g_type_register_dynamic(parent_type: TGType; type_name: Pgchar; plugin: PGTypePlugin; flags: TGTypeFlags): TGType; cdecl; external;
function g_type_register_fundamental(type_id: TGType; type_name: Pgchar; info: PGTypeInfo; finfo: PGTypeFundamentalInfo; flags: TGTypeFlags): TGType; cdecl; external;
procedure g_type_add_interface_static(instance_type: TGType; interface_type: TGType; info: PGInterfaceInfo); cdecl; external;
procedure g_type_add_interface_dynamic(instance_type: TGType; interface_type: TGType; plugin: PGTypePlugin); cdecl; external;
procedure g_type_interface_add_prerequisite(interface_type: TGType; prerequisite_type: TGType); cdecl; external;
function g_type_interface_prerequisites(interface_type: TGType; n_prerequisites: Pguint): PGType; cdecl; external;
function g_type_interface_instantiatable_prerequisite(interface_type: TGType): TGType; cdecl; external;
procedure g_type_class_add_private(g_class: Tgpointer; private_size: Tgsize); cdecl; external;
function g_type_add_instance_private(class_type: TGType; private_size: Tgsize): Tgint; cdecl; external;
function g_type_instance_get_private(instance: PGTypeInstance; private_type: TGType): Tgpointer; cdecl; external;
procedure g_type_class_adjust_private_offset(g_class: Tgpointer; private_size_or_offset: Pgint); cdecl; external;
procedure g_type_add_class_private(class_type: TGType; private_size: Tgsize); cdecl; external;
function g_type_class_get_private(klass: PGTypeClass; private_type: TGType): Tgpointer; cdecl; external;
function g_type_class_get_instance_private_offset(g_class: Tgpointer): Tgint; cdecl; external;
procedure g_type_ensure(_type: TGType); cdecl; external;
function g_type_get_type_registration_serial: Tguint; cdecl; external;
function g_type_get_plugin(_type: TGType): PGTypePlugin; cdecl; external;
function g_type_interface_get_plugin(instance_type: TGType; interface_type: TGType): PGTypePlugin; cdecl; external;
function g_type_fundamental_next: TGType; cdecl; external;
function g_type_fundamental(type_id: TGType): TGType; cdecl; external;
function g_type_create_instance(_type: TGType): PGTypeInstance; cdecl; external;
procedure g_type_free_instance(instance: PGTypeInstance); cdecl; external;
procedure g_type_add_class_cache_func(cache_data: Tgpointer; cache_func: TGTypeClassCacheFunc); cdecl; external;
procedure g_type_remove_class_cache_func(cache_data: Tgpointer; cache_func: TGTypeClassCacheFunc); cdecl; external;
procedure g_type_class_unref_uncached(g_class: Tgpointer); cdecl; external;
procedure g_type_add_interface_check(check_data: Tgpointer; check_func: TGTypeInterfaceCheckFunc); cdecl; external;
procedure g_type_remove_interface_check(check_data: Tgpointer; check_func: TGTypeInterfaceCheckFunc); cdecl; external;
function g_type_value_table_peek(_type: TGType): PGTypeValueTable; cdecl; external;
function g_type_check_instance(instance: PGTypeInstance): Tgboolean; cdecl; external;
function g_type_check_instance_cast(instance: PGTypeInstance; iface_type: TGType): PGTypeInstance; cdecl; external;
function g_type_check_instance_is_a(instance: PGTypeInstance; iface_type: TGType): Tgboolean; cdecl; external;
function g_type_check_instance_is_fundamentally_a(instance: PGTypeInstance; fundamental_type: TGType): Tgboolean; cdecl; external;
function g_type_check_class_cast(g_class: PGTypeClass; is_a_type: TGType): PGTypeClass; cdecl; external;
function g_type_check_class_is_a(g_class: PGTypeClass; is_a_type: TGType): Tgboolean; cdecl; external;
function g_type_check_is_value_type(_type: TGType): Tgboolean; cdecl; external;
function g_type_check_value(Value: PGValue): Tgboolean; cdecl; external;
function g_type_check_value_holds(Value: PGValue; _type: TGType): Tgboolean; cdecl; external;
function g_type_test_flags(_type: TGType; flags: Tguint): Tgboolean; cdecl; external;
function g_type_name_from_instance(instance: PGTypeInstance): Pgchar; cdecl; external;
function g_type_name_from_class(g_class: PGTypeClass): Pgchar; cdecl; external;

const
  G_TYPE_FLAG_RESERVED_ID_BIT = 1 shl 0;

function G_TYPE_INVALID: TGType;
function G_TYPE_NONE: TGType;
function G_TYPE_INTERFACE: TGType;
function G_TYPE_CHAR: TGType;
function G_TYPE_UCHAR: TGType;
function G_TYPE_BOOLEAN: TGType;
function G_TYPE_INT: TGType;
function G_TYPE_UINT: TGType;
function G_TYPE_LONG: TGType;
function G_TYPE_ULONG: TGType;
function G_TYPE_INT64: TGType;
function G_TYPE_UINT64: TGType;
function G_TYPE_ENUM: TGType;
function G_TYPE_FLAGS: TGType;
function G_TYPE_FLOAT: TGType;
function G_TYPE_DOUBLE: TGType;
function G_TYPE_STRING: TGType;
function G_TYPE_POINTER: TGType;
function G_TYPE_BOXED: TGType;
function G_TYPE_PARAM: TGType;
function G_TYPE_OBJECT: TGType;
function G_TYPE_VARIANT: TGType;
function G_TYPE_MAKE_FUNDAMENTAL(x: longint): TGType;

function G_TYPE_IS_FUNDAMENTAL(_type: TGType): Tgboolean;
function G_TYPE_IS_DERIVED(_type: TGType): Tgboolean;
function G_TYPE_IS_INTERFACE(_type: TGType): Tgboolean;
function G_TYPE_IS_CLASSED(_type: TGType): Tgboolean;
function G_TYPE_IS_INSTANTIATABLE(_type: TGType): Tgboolean;
function G_TYPE_IS_DERIVABLE(_type: TGType): Tgboolean;
function G_TYPE_IS_DEEP_DERIVABLE(_type: TGType): Tgboolean;
function G_TYPE_IS_ABSTRACT(_type: TGType): Tgboolean;
function G_TYPE_IS_VALUE_ABSTRACT(_type: TGType): Tgboolean;
function G_TYPE_IS_VALUE_TYPE(_type: TGType): Tgboolean;
function G_TYPE_HAS_VALUE_TABLE(_type: TGType): Tgboolean;
function G_TYPE_IS_FINAL(_type: TGType): Tgboolean;
function G_TYPE_IS_DEPRECATED(_type: TGType): Tgboolean;


function G_TYPE_CHECK_INSTANCE_CAST(instance: Pointer; g_type: TGType): PGTypeInstance;
function G_TYPE_CHECK_INSTANCE_TYPE(instance: Pointer; g_type: TGType): Tgboolean;
function G_TYPE_CHECK_INSTANCE_FUNDAMENTAL_TYPE(instance: PGTypeInstance; g_type: TGType): Tgboolean;
function G_TYPE_INSTANCE_GET_CLASS(instance: Tgpointer; g_type: TGType): PGTypeClass;
function G_TYPE_INSTANCE_GET_INTERFACE(instance: Pointer; g_type: TGType): Pointer;
function G_TYPE_CHECK_CLASS_CAST(g_class: pointer; g_type: TGType): Pointer;
function G_TYPE_CHECK_CLASS_TYPE(g_class: pointer; g_type: TGType): Tgboolean;
function G_TYPE_CHECK_VALUE(Value: Pointer): Tgboolean;
function G_TYPE_CHECK_VALUE_TYPE(Value: pointer; g_type: TGType): Tgboolean;
function G_TYPE_FROM_INSTANCE(instance: Tgpointer): TGType;
function G_TYPE_FROM_CLASS(g_class: Tgpointer): TGType;
function G_TYPE_FROM_INTERFACE(g_iface: Pointer): TGType;
function G_TYPE_INSTANCE_GET_PRIVATE(instance, g_type, c_type: TGType): Tgpointer;
function G_TYPE_CLASS_GET_PRIVATE(klass, g_type, c_type: TGType): Tgpointer;

function GPOINTER_TO_TYPE(p: Tgpointer): TGType;
function GTYPE_TO_POINTER(t: TGType): Tgpointer;

implementation


function G_TYPE_INVALID: TGType;
begin
  G_TYPE_INVALID := G_TYPE_MAKE_FUNDAMENTAL(0);
end;


function G_TYPE_NONE: TGType;
begin
  G_TYPE_NONE := G_TYPE_MAKE_FUNDAMENTAL(1);
end;


function G_TYPE_INTERFACE: TGType;
begin
  G_TYPE_INTERFACE := G_TYPE_MAKE_FUNDAMENTAL(2);
end;


function G_TYPE_CHAR: TGType;
begin
  G_TYPE_CHAR := G_TYPE_MAKE_FUNDAMENTAL(3);
end;


function G_TYPE_UCHAR: TGType;
begin
  G_TYPE_UCHAR := G_TYPE_MAKE_FUNDAMENTAL(4);
end;


function G_TYPE_BOOLEAN: TGType;
begin
  G_TYPE_BOOLEAN := G_TYPE_MAKE_FUNDAMENTAL(5);
end;


function G_TYPE_INT: TGType;
begin
  G_TYPE_INT := G_TYPE_MAKE_FUNDAMENTAL(6);
end;


function G_TYPE_UINT: TGType;
begin
  G_TYPE_UINT := G_TYPE_MAKE_FUNDAMENTAL(7);
end;


function G_TYPE_LONG: TGType;
begin
  G_TYPE_LONG := G_TYPE_MAKE_FUNDAMENTAL(8);
end;


function G_TYPE_ULONG: TGType;
begin
  G_TYPE_ULONG := G_TYPE_MAKE_FUNDAMENTAL(9);
end;


function G_TYPE_INT64: TGType;
begin
  G_TYPE_INT64 := G_TYPE_MAKE_FUNDAMENTAL(10);
end;


function G_TYPE_UINT64: TGType;
begin
  G_TYPE_UINT64 := G_TYPE_MAKE_FUNDAMENTAL(11);
end;


function G_TYPE_ENUM: TGType;
begin
  G_TYPE_ENUM := G_TYPE_MAKE_FUNDAMENTAL(12);
end;


function G_TYPE_FLAGS: TGType;
begin
  G_TYPE_FLAGS := G_TYPE_MAKE_FUNDAMENTAL(13);
end;


function G_TYPE_FLOAT: TGType;
begin
  G_TYPE_FLOAT := G_TYPE_MAKE_FUNDAMENTAL(14);
end;


function G_TYPE_DOUBLE: TGType;
begin
  G_TYPE_DOUBLE := G_TYPE_MAKE_FUNDAMENTAL(15);
end;


function G_TYPE_STRING: TGType;
begin
  G_TYPE_STRING := G_TYPE_MAKE_FUNDAMENTAL(16);
end;


function G_TYPE_POINTER: TGType;
begin
  G_TYPE_POINTER := G_TYPE_MAKE_FUNDAMENTAL(17);
end;


function G_TYPE_BOXED: TGType;
begin
  G_TYPE_BOXED := G_TYPE_MAKE_FUNDAMENTAL(18);
end;


function G_TYPE_PARAM: TGType;
begin
  G_TYPE_PARAM := G_TYPE_MAKE_FUNDAMENTAL(19);
end;


function G_TYPE_OBJECT: TGType;
begin
  G_TYPE_OBJECT := G_TYPE_MAKE_FUNDAMENTAL(20);
end;


function G_TYPE_VARIANT: TGType;
begin
  G_TYPE_VARIANT := G_TYPE_MAKE_FUNDAMENTAL(21);
end;



function G_TYPE_MAKE_FUNDAMENTAL(x: longint): TGType;
begin
  G_TYPE_MAKE_FUNDAMENTAL := TGType(x shl G_TYPE_FUNDAMENTAL_SHIFT);
end;

function G_TYPE_CHECK_INSTANCE_CAST(instance: Pointer; g_type: TGType
  ): PGTypeInstance;
begin
  G_TYPE_CHECK_INSTANCE_CAST := g_type_check_instance_cast(instance, g_type);
end;

function G_TYPE_CHECK_INSTANCE_TYPE(instance: Pointer; g_type: TGType
  ): Tgboolean;
begin
  Result := g_type_check_instance_is_a(instance, g_type);
end;

function G_TYPE_INSTANCE_GET_CLASS(instance: Tgpointer; g_type: TGType
  ): PGTypeClass;
begin
  // #define G_TYPE_INSTANCE_GET_CLASS(instance, g_type, c_type)     (_G_TYPE_IGC ((instance), (g_type), c_type))
  // #define _G_TYPE_IGC(ip, gt, ct)         ((ct*) (((GTypeInstance*) ip)->g_class))
  Result := PGTypeInstance(Instance)^.g_class;
  Result := g_type_check_class_cast(Result, g_type);
end;

function G_TYPE_INSTANCE_GET_INTERFACE(instance: Pointer; g_type: TGType
  ): Pointer;
begin
  G_TYPE_INSTANCE_GET_INTERFACE := g_type_interface_peek((PGTypeInstance(instance))^.g_class, g_type);
end;

function G_TYPE_CHECK_CLASS_CAST(g_class: pointer; g_type: TGType): Pointer;
begin
  G_TYPE_CHECK_CLASS_CAST := g_type_check_class_cast(PGTypeClass(g_class), g_type);
end;

function G_TYPE_CHECK_CLASS_TYPE(g_class: pointer; g_type: TGType): Tgboolean;
begin
  G_TYPE_CHECK_CLASS_TYPE := g_type_check_class_is_a(PGTypeClass(g_class), g_type);
end;

function G_TYPE_CHECK_VALUE(Value: Pointer): Tgboolean;
begin
  G_TYPE_CHECK_VALUE := g_type_check_value(PGValue(Value));
end;

function G_TYPE_CHECK_VALUE_TYPE(Value: pointer; g_type: TGType): Tgboolean;
begin
  G_TYPE_CHECK_VALUE_TYPE := g_type_check_value_holds(PGValue(Value), g_type);
end;

function G_TYPE_FROM_INSTANCE(instance: Tgpointer): TGType;
begin
  G_TYPE_FROM_INSTANCE := G_TYPE_FROM_CLASS((PGTypeInstance(instance))^.g_class);
end;

function G_TYPE_FROM_CLASS(g_class: Tgpointer): TGType;
begin
  G_TYPE_FROM_CLASS := (PGTypeClass(g_class))^.g_type;
end;

function G_TYPE_FROM_INTERFACE(g_iface: Pointer): TGType;
begin
  G_TYPE_FROM_INTERFACE := (PGTypeInterface(g_iface))^.g_type;
end;


function G_TYPE_CHECK_INSTANCE_FUNDAMENTAL_TYPE(instance: PGTypeInstance;
  g_type: TGType): Tgboolean;
begin
  G_TYPE_CHECK_INSTANCE_FUNDAMENTAL_TYPE := g_type_check_instance_is_fundamentally_a(instance, g_type);
end;

function G_TYPE_INSTANCE_GET_PRIVATE(instance, g_type, c_type: TGType): Tgpointer;
begin
  G_TYPE_INSTANCE_GET_PRIVATE := g_type_instance_get_private(PGTypeInstance(instance), g_type);
end;


function G_TYPE_CLASS_GET_PRIVATE(klass, g_type, c_type: TGType): Tgpointer;
begin
  G_TYPE_CLASS_GET_PRIVATE := g_type_class_get_private(PGTypeClass(klass), g_type);
end;


// =====


function G_TYPE_IS_FUNDAMENTAL(_type: TGType): Tgboolean;
begin
  G_TYPE_IS_FUNDAMENTAL := _type <= G_TYPE_FUNDAMENTAL_MAX;
end;

function G_TYPE_IS_DERIVED(_type: TGType): Tgboolean;
begin
  G_TYPE_IS_DERIVED := _type > G_TYPE_FUNDAMENTAL_MAX;
end;

function G_TYPE_IS_INTERFACE(_type: TGType): Tgboolean;
begin
  G_TYPE_IS_INTERFACE := (G_TYPE_FUNDAMENTAL(_type)) = G_TYPE_INTERFACE;
end;

function G_TYPE_IS_CLASSED(_type: TGType): Tgboolean;
begin
  G_TYPE_IS_CLASSED := g_type_test_flags(_type, G_TYPE_FLAG_CLASSED);
end;

function G_TYPE_IS_INSTANTIATABLE(_type: TGType): Tgboolean;
begin
  G_TYPE_IS_INSTANTIATABLE := g_type_test_flags(_type, G_TYPE_FLAG_INSTANTIATABLE);
end;

function G_TYPE_IS_DERIVABLE(_type: TGType): Tgboolean;
begin
  G_TYPE_IS_DERIVABLE := g_type_test_flags(_type, G_TYPE_FLAG_DERIVABLE);
end;

function G_TYPE_IS_DEEP_DERIVABLE(_type: TGType): Tgboolean;
begin
  G_TYPE_IS_DEEP_DERIVABLE := g_type_test_flags(_type, G_TYPE_FLAG_DEEP_DERIVABLE);
end;

function G_TYPE_IS_ABSTRACT(_type: TGType): Tgboolean;
begin
  G_TYPE_IS_ABSTRACT := g_type_test_flags(_type, G_TYPE_FLAG_ABSTRACT);
end;

function G_TYPE_IS_VALUE_ABSTRACT(_type: TGType): Tgboolean;
begin
  G_TYPE_IS_VALUE_ABSTRACT := g_type_test_flags(_type, G_TYPE_FLAG_VALUE_ABSTRACT);
end;

function G_TYPE_IS_VALUE_TYPE(_type: TGType): Tgboolean;
begin
  G_TYPE_IS_VALUE_TYPE := g_type_check_is_value_type(_type);
end;

function G_TYPE_HAS_VALUE_TABLE(_type: TGType): Tgboolean;
begin
  G_TYPE_HAS_VALUE_TABLE := (g_type_value_table_peek(_type)) <> nil;
end;

function G_TYPE_IS_FINAL(_type: TGType): Tgboolean;
begin
  G_TYPE_IS_FINAL := g_type_test_flags(_type, G_TYPE_FLAG_FINAL);
end;

function G_TYPE_IS_DEPRECATED(_type: TGType): Tgboolean;
begin
  G_TYPE_IS_DEPRECATED := g_type_test_flags(_type, G_TYPE_FLAG_DEPRECATED);
end;

// ====

function GPOINTER_TO_TYPE(p: Tgpointer): TGType;
begin
  GPOINTER_TO_TYPE := TGType(Tguintptr(p));
end;

function GTYPE_TO_POINTER(t: TGType): Tgpointer;
begin
  GTYPE_TO_POINTER := Tgpointer(Tguintptr(t));
end;




end.
