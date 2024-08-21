/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

// Ausgelagert
//type
//  TGValue = record
//    g_type: TGType;
//    Data: array[0..1] of record
//      case longint of
//        0: (v_int: Tgint);
//        1: (v_uint: Tguint);
//        2: (v_long: Tglong);
//        3: (v_ulong: Tgulong);
//        4: (v_int64: Tgint64);
//        5: (v_uint64: Tguint64);
//        6: (v_float: Tgfloat);
//        7: (v_double: Tgdouble);
//        8: (v_pointer: Tgpointer);
//      end;
//  end;
//  PGValue = ^TGValue;

type
  TGValueTransform = procedure(src_value: PGValue; dest_value: PGValue); cdecl;

function g_value_init(Value: PGValue; g_type: TGType): PGValue; cdecl; external libgobject2_0;
procedure g_value_copy(src_value: PGValue; dest_value: PGValue); cdecl; external libgobject2_0;
function g_value_reset(Value: PGValue): PGValue; cdecl; external libgobject2_0;
procedure g_value_unset(Value: PGValue); cdecl; external libgobject2_0;
procedure g_value_set_instance(Value: PGValue; instance: Tgpointer); cdecl; external libgobject2_0;
procedure g_value_init_from_instance(Value: PGValue; instance: Tgpointer); cdecl; external libgobject2_0;
function g_value_fits_pointer(Value: PGValue): Tgboolean; cdecl; external libgobject2_0;
function g_value_peek_pointer(Value: PGValue): Tgpointer; cdecl; external libgobject2_0;
function g_value_type_compatible(src_type: TGType; dest_type: TGType): Tgboolean; cdecl; external libgobject2_0;
function g_value_type_transformable(src_type: TGType; dest_type: TGType): Tgboolean; cdecl; external libgobject2_0;
function g_value_transform(src_value: PGValue; dest_value: PGValue): Tgboolean; cdecl; external libgobject2_0;
procedure g_value_register_transform_func(src_type: TGType; dest_type: TGType; transform_func: TGValueTransform); cdecl; external libgobject2_0;

const
  G_VALUE_NOCOPY_CONTENTS = 1 shl 27;
  G_VALUE_INTERNED_STRING = 1 shl 28;

function G_TYPE_IS_VALUE(_type: TGType): Tgboolean;
function G_IS_VALUE(Value: PGValue): Tgboolean;
function G_VALUE_TYPE(Value: PGValue): TGType;
function G_VALUE_TYPE_NAME(Value: PGValue): Pgchar;
function G_VALUE_HOLDS(Value:PGValue; _type: TGType): Tgboolean;


// === Konventiert am: 12-8-24 19:54:59 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function G_TYPE_IS_VALUE(_type: TGType): Tgboolean;
begin
  G_TYPE_IS_VALUE := g_type_check_is_value_type(_type);
end;

function G_IS_VALUE(Value: PGValue): Tgboolean;
begin
  G_IS_VALUE := g_type_check_value(Value);
end;

function G_VALUE_TYPE(Value: PGValue): TGType;
begin
  G_VALUE_TYPE := (PGValue(Value))^.g_type;
end;

function G_VALUE_TYPE_NAME(Value: PGValue): Pgchar;
begin
  G_VALUE_TYPE_NAME := g_type_name(G_VALUE_TYPE(Value));
end;

function G_VALUE_HOLDS(Value: PGValue; _type: TGType): Tgboolean;
begin
  G_VALUE_HOLDS := g_type_check_value_holds(Value, _type);
end;


{$ENDIF read_implementation}
