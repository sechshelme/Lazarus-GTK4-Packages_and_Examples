unit genums;

interface

uses
  common_GLIB, gtypes, gtype;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PGEnumValue = ^TGEnumValue;

  TGEnumValue = record
    Value: Tgint;
    value_name: Pgchar;
    value_nick: Pgchar;
  end;

  PGEnumClass = ^TGEnumClass;

  TGEnumClass = record
    g_type_class: TGTypeClass;
    minimum: Tgint;
    maximum: Tgint;
    n_values: Tguint;
    values: PGEnumValue;
  end;

  PGFlagsValue = ^TGFlagsValue;

  TGFlagsValue = record
    Value: Tguint;
    value_name: Pgchar;
    value_nick: Pgchar;
  end;
  PGFlagsClass = ^TGFlagsClass;

  TGFlagsClass = record
    g_type_class: TGTypeClass;
    mask: Tguint;
    n_values: Tguint;
    values: PGFlagsValue;
  end;

function g_enum_get_value(enum_class: PGEnumClass; Value: Tgint): PGEnumValue; cdecl; external libgobject2_0;
function g_enum_get_value_by_name(enum_class: PGEnumClass; Name: Pgchar): PGEnumValue; cdecl; external libgobject2_0;
function g_enum_get_value_by_nick(enum_class: PGEnumClass; nick: Pgchar): PGEnumValue; cdecl; external libgobject2_0;
function g_flags_get_first_value(flags_class: PGFlagsClass; Value: Tguint): PGFlagsValue; cdecl; external libgobject2_0;
function g_flags_get_value_by_name(flags_class: PGFlagsClass; Name: Pgchar): PGFlagsValue; cdecl; external libgobject2_0;
function g_flags_get_value_by_nick(flags_class: PGFlagsClass; nick: Pgchar): PGFlagsValue; cdecl; external libgobject2_0;
function g_enum_to_string(g_enum_type: TGType; Value: Tgint): Pgchar; cdecl; external libgobject2_0;
function g_flags_to_string(flags_type: TGType; Value: Tguint): Pgchar; cdecl; external libgobject2_0;
procedure g_value_set_enum(Value: PGValue; v_enum: Tgint); cdecl; external libgobject2_0;
function g_value_get_enum(Value: PGValue): Tgint; cdecl; external libgobject2_0;
procedure g_value_set_flags(Value: PGValue; v_flags: Tguint); cdecl; external libgobject2_0;
function g_value_get_flags(Value: PGValue): Tguint; cdecl; external libgobject2_0;
function g_enum_register_static(Name: Pgchar; const_static_values: PGEnumValue): TGType; cdecl; external libgobject2_0;
function g_flags_register_static(Name: Pgchar; const_static_values: PGFlagsValue): TGType; cdecl; external libgobject2_0;
procedure g_enum_complete_type_info(g_enum_type: TGType; info: PGTypeInfo; const_values: PGEnumValue); cdecl; external libgobject2_0;
procedure g_flags_complete_type_info(g_flags_type: TGType; info: PGTypeInfo; const_values: PGFlagsValue); cdecl; external libgobject2_0;

// === Konventiert am: 14-8-24 17:17:26 ===


function G_TYPE_IS_ENUM(_type: TGType): Tgboolean;
function G_ENUM_CLASS(klass: Pointer): Pointer;
function G_IS_ENUM_CLASS(klass: Pointer): Tgboolean;

function G_ENUM_CLASS_TYPE(klass: Pointer): longint;
function G_ENUM_CLASS_TYPE_NAME(klass: Pointer): Pgchar;

function G_TYPE_IS_FLAGS(_type: TGType): Tgboolean;
function G_FLAGS_CLASS(klass: Pointer): Pointer;
function G_IS_FLAGS_CLASS(klass: Pointer): Tgboolean;
function G_FLAGS_CLASS_TYPE(klass: Pointer): TGType;
function G_FLAGS_CLASS_TYPE_NAME(klass: Pointer): Pgchar;

function G_VALUE_HOLDS_ENUM(Value: Pointer): Tgboolean;
function G_VALUE_HOLDS_FLAGS(Value: Pointer): Tgboolean;

implementation


function G_TYPE_IS_ENUM(_type: TGType): Tgboolean;
begin
  G_TYPE_IS_ENUM := (G_TYPE_FUNDAMENTAL(_type)) = G_TYPE_ENUM;
end;

function G_ENUM_CLASS(klass: Pointer): Pointer;
begin
  G_ENUM_CLASS := G_TYPE_CHECK_CLASS_CAST(klass, G_TYPE_ENUM);
end;

function G_IS_ENUM_CLASS(klass: Pointer): Tgboolean;
begin
  G_IS_ENUM_CLASS := G_TYPE_CHECK_CLASS_TYPE(klass, G_TYPE_ENUM);
end;

function G_ENUM_CLASS_TYPE(klass: Pointer): longint;
begin
  G_ENUM_CLASS_TYPE := G_TYPE_FROM_CLASS(klass);
end;

function G_ENUM_CLASS_TYPE_NAME(klass: Pointer): Pgchar;
begin
  G_ENUM_CLASS_TYPE_NAME := g_type_name(G_ENUM_CLASS_TYPE(klass));
end;

function G_TYPE_IS_FLAGS(_type: TGType): Tgboolean;
begin
  G_TYPE_IS_FLAGS := (G_TYPE_FUNDAMENTAL(_type)) = G_TYPE_FLAGS;
end;

function G_FLAGS_CLASS(klass: Pointer): Pointer;
begin
  G_FLAGS_CLASS := G_TYPE_CHECK_CLASS_CAST(klass, G_TYPE_FLAGS);
end;

function G_IS_FLAGS_CLASS(klass: Pointer): Tgboolean;
begin
  G_IS_FLAGS_CLASS := G_TYPE_CHECK_CLASS_TYPE(klass, G_TYPE_FLAGS);
end;

function G_FLAGS_CLASS_TYPE(klass: Pointer): TGType;
begin
  G_FLAGS_CLASS_TYPE := G_TYPE_FROM_CLASS(klass);
end;

function G_FLAGS_CLASS_TYPE_NAME(klass: Pointer): Pgchar;
begin
  G_FLAGS_CLASS_TYPE_NAME := g_type_name(G_FLAGS_CLASS_TYPE(klass));
end;

function G_VALUE_HOLDS_ENUM(Value: Pointer): Tgboolean;
begin
  G_VALUE_HOLDS_ENUM := G_TYPE_CHECK_VALUE_TYPE(Value, G_TYPE_ENUM);
end;

function G_VALUE_HOLDS_FLAGS(Value: Pointer): Tgboolean;
begin
  G_VALUE_HOLDS_FLAGS := G_TYPE_CHECK_VALUE_TYPE(Value, G_TYPE_FLAGS);
end;


end.
