unit gparam;

interface

uses
  common_GLIB, gtypes, gquark, glist,  gtype, gdataset;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

type
  PGParamFlags = ^TGParamFlags;
  TGParamFlags =  Longint;
  Const
    G_PARAM_READABLE = 1 shl 0;
    G_PARAM_WRITABLE = 1 shl 1;
    G_PARAM_READWRITE = G_PARAM_READABLE or G_PARAM_WRITABLE;
    G_PARAM_CONSTRUCT = 1 shl 2;
    G_PARAM_CONSTRUCT_ONLY = 1 shl 3;
    G_PARAM_LAX_VALIDATION = 1 shl 4;
    G_PARAM_STATIC_NAME = 1 shl 5;
    G_PARAM_PRIVATE = G_PARAM_STATIC_NAME;
    G_PARAM_STATIC_NICK = 1 shl 6;
    G_PARAM_STATIC_BLURB = 1 shl 7;
    G_PARAM_EXPLICIT_NOTIFY = 1 shl 30;
    G_PARAM_DEPRECATED = Tgint(1 shl 31);
  G_PARAM_STATIC_STRINGS = (G_PARAM_STATIC_NAME or G_PARAM_STATIC_NICK) or G_PARAM_STATIC_BLURB;
  G_PARAM_MASK = $000000ff;
  G_PARAM_USER_SHIFT = 8;
type
  TGParamSpecPool=record
        end;
  PGParamSpecPool=^TGParamSpecPool;

  PPGParamSpec = ^PGParamSpec;
  PGParamSpec = ^TGParamSpec;
  TGParamSpec = record
      g_type_instance : TGTypeInstance;
      name : Pgchar;
      flags : TGParamFlags;
      value_type : TGType;
      owner_type : TGType;
      _nick : Pgchar;
      _blurb : Pgchar;
      qdata : PGData;
      ref_count : Tguint;
      param_id : Tguint;
    end;

  PGParamSpecClass = ^TGParamSpecClass;
  TGParamSpecClass = record
      g_type_class : TGTypeClass;
      value_type : TGType;
      finalize : procedure (pspec:PGParamSpec);cdecl;
      value_set_default : procedure (pspec:PGParamSpec; value:PGValue);cdecl;
      value_validate : function (pspec:PGParamSpec; value:PGValue):Tgboolean;cdecl;
      values_cmp : function (pspec:PGParamSpec; value1:PGValue; value2:PGValue):Tgint;cdecl;
      value_is_valid : function (pspec:PGParamSpec; value:PGValue):Tgboolean;cdecl;
      dummy : array[0..2] of Tgpointer;
    end;

  PGParameter = ^TGParameter;
  TGParameter = record
      name : Pgchar;
      value : TGValue;
    end;

function g_param_spec_ref(pspec:PGParamSpec):PGParamSpec;cdecl;external libglib2;
procedure g_param_spec_unref(pspec:PGParamSpec);cdecl;external libglib2;
procedure g_param_spec_sink(pspec:PGParamSpec);cdecl;external libglib2;
function g_param_spec_ref_sink(pspec:PGParamSpec):PGParamSpec;cdecl;external libglib2;
function g_param_spec_get_qdata(pspec:PGParamSpec; quark:TGQuark):Tgpointer;cdecl;external libglib2;
procedure g_param_spec_set_qdata(pspec:PGParamSpec; quark:TGQuark; data:Tgpointer);cdecl;external libglib2;
procedure g_param_spec_set_qdata_full(pspec:PGParamSpec; quark:TGQuark; data:Tgpointer; destroy:TGDestroyNotify);cdecl;external libglib2;
function g_param_spec_steal_qdata(pspec:PGParamSpec; quark:TGQuark):Tgpointer;cdecl;external libglib2;
function g_param_spec_get_redirect_target(pspec:PGParamSpec):PGParamSpec;cdecl;external libglib2;
procedure g_param_value_set_default(pspec:PGParamSpec; value:PGValue);cdecl;external libglib2;
function g_param_value_defaults(pspec:PGParamSpec; value:PGValue):Tgboolean;cdecl;external libglib2;
function g_param_value_validate(pspec:PGParamSpec; value:PGValue):Tgboolean;cdecl;external libglib2;
function g_param_value_is_valid(pspec:PGParamSpec; value:PGValue):Tgboolean;cdecl;external libglib2;
function g_param_value_convert(pspec:PGParamSpec; src_value:PGValue; dest_value:PGValue; strict_validation:Tgboolean):Tgboolean;cdecl;external libglib2;
function g_param_values_cmp(pspec:PGParamSpec; value1:PGValue; value2:PGValue):Tgint;cdecl;external libglib2;
function g_param_spec_get_name(pspec:PGParamSpec):Pgchar;cdecl;external libglib2;
function g_param_spec_get_nick(pspec:PGParamSpec):Pgchar;cdecl;external libglib2;
function g_param_spec_get_blurb(pspec:PGParamSpec):Pgchar;cdecl;external libglib2;
procedure g_value_set_param(value:PGValue; param:PGParamSpec);cdecl;external libglib2;
function g_value_get_param(value:PGValue):PGParamSpec;cdecl;external libglib2;
function g_value_dup_param(value:PGValue):PGParamSpec;cdecl;external libglib2;
procedure g_value_take_param(value:PGValue; param:PGParamSpec);cdecl;external libglib2;
procedure g_value_set_param_take_ownership(value:PGValue; param:PGParamSpec);cdecl;external libglib2;
function g_param_spec_get_default_value(pspec:PGParamSpec):PGValue;cdecl;external libglib2;
function g_param_spec_get_name_quark(pspec:PGParamSpec):TGQuark;cdecl;external libglib2;
type
  PGParamSpecTypeInfo = ^TGParamSpecTypeInfo;
  TGParamSpecTypeInfo = record
      instance_size : Tguint16;
      n_preallocs : Tguint16;
      instance_init : procedure (pspec:PGParamSpec);cdecl;
      value_type : TGType;
      finalize : procedure (pspec:PGParamSpec);cdecl;
      value_set_default : procedure (pspec:PGParamSpec; value:PGValue);cdecl;
      value_validate : function (pspec:PGParamSpec; value:PGValue):Tgboolean;cdecl;
      values_cmp : function (pspec:PGParamSpec; value1:PGValue; value2:PGValue):Tgint;cdecl;
    end;


function g_param_type_register_static(name:Pgchar; pspec_info:PGParamSpecTypeInfo):TGType;cdecl;external libglib2;
function g_param_spec_is_valid_name(name:Pgchar):Tgboolean;cdecl;external libglib2;
function _g_param_type_register_static_constant(name:Pgchar; pspec_info:PGParamSpecTypeInfo; opt_type:TGType):TGType;cdecl;external libglib2;
function g_param_spec_internal(param_type:TGType; name:Pgchar; nick:Pgchar; blurb:Pgchar; flags:TGParamFlags):Tgpointer;cdecl;external libglib2;
function g_param_spec_pool_new(type_prefixing:Tgboolean):PGParamSpecPool;cdecl;external libglib2;
procedure g_param_spec_pool_insert(pool:PGParamSpecPool; pspec:PGParamSpec; owner_type:TGType);cdecl;external libglib2;
procedure g_param_spec_pool_remove(pool:PGParamSpecPool; pspec:PGParamSpec);cdecl;external libglib2;
function g_param_spec_pool_lookup(pool:PGParamSpecPool; param_name:Pgchar; owner_type:TGType; walk_ancestors:Tgboolean):PGParamSpec;cdecl;external libglib2;
function g_param_spec_pool_list_owned(pool:PGParamSpecPool; owner_type:TGType):PGList;cdecl;external libglib2;
function g_param_spec_pool_list(pool:PGParamSpecPool; owner_type:TGType; n_pspecs_p:Pguint):PPGParamSpec;cdecl;external libglib2;
procedure g_param_spec_pool_free(pool:PGParamSpecPool);cdecl;external libglib2;

function G_TYPE_IS_PARAM(_type : longint) : Tgboolean;
function G_PARAM_SPEC(pspec : PGTypeInstance) : PGParamSpec;
function G_IS_PARAM_SPEC(pspec : PGTypeInstance) : Tgboolean;
function G_PARAM_SPEC_CLASS(pclass : PGTypeClass) : PGTypeClass;
function G_IS_PARAM_SPEC_CLASS(pclass : PGTypeClass) : Tgboolean;
function G_PARAM_SPEC_GET_CLASS(pspec : PGTypeInstance) : PGTypeClass;
function G_PARAM_SPEC_TYPE(pspec : PGTypeInstance) : TGType;
function G_PARAM_SPEC_TYPE_NAME(pspec :  PGTypeInstance) : Pgchar;
function G_PARAM_SPEC_VALUE_TYPE(pspec : PGTypeInstance) : TGType;
function G_VALUE_HOLDS_PARAM(value : PGValue) : Tgboolean;

// === Konventiert am: 13-8-24 14:36:58 ===


implementation

function G_TYPE_IS_PARAM(_type: longint): Tgboolean;
begin
  G_TYPE_IS_PARAM:=(G_TYPE_FUNDAMENTAL(_type))=G_TYPE_PARAM;
end;

function G_PARAM_SPEC(pspec: PGTypeInstance): PGParamSpec;
begin
  G_PARAM_SPEC:=PGParamSpec( g_type_check_instance_cast(pspec,G_TYPE_PARAM));
end;

function G_IS_PARAM_SPEC(pspec: PGTypeInstance): Tgboolean;
begin
  G_IS_PARAM_SPEC:=g_type_check_instance_is_a(pspec,G_TYPE_PARAM);
end;

function G_PARAM_SPEC_CLASS(pclass: PGTypeClass): PGTypeClass;
begin
  G_PARAM_SPEC_CLASS:=G_TYPE_CHECK_CLASS_CAST(pclass,G_TYPE_PARAM);
end;

function G_IS_PARAM_SPEC_CLASS(pclass: PGTypeClass): Tgboolean;
begin
  G_IS_PARAM_SPEC_CLASS:=g_type_check_class_is_a(pclass,G_TYPE_PARAM);
end;

function G_PARAM_SPEC_GET_CLASS(pspec: PGTypeInstance): PGTypeClass;
begin
  Result:=pspec^.g_class;
end;

function G_PARAM_SPEC_TYPE(pspec: PGTypeInstance): TGType;
begin
  Result:=  pspec^.g_class^.g_type;
end;

function G_PARAM_SPEC_TYPE_NAME(pspec: PGTypeInstance): Pgchar;
begin
  G_PARAM_SPEC_TYPE_NAME:=g_type_name(G_PARAM_SPEC_TYPE(pspec));
end;

function G_PARAM_SPEC_VALUE_TYPE(pspec: PGTypeInstance): TGType;
begin
  G_PARAM_SPEC_VALUE_TYPE:=G_PARAM_SPEC(pspec)^.value_type;    // ????
end;

function G_VALUE_HOLDS_PARAM(value: PGValue): Tgboolean;
begin
  G_VALUE_HOLDS_PARAM:=g_type_check_value_holds(value,G_TYPE_PARAM);
end;


end.
