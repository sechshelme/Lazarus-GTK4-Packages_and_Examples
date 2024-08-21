/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}


type
  TGBoxedCopyFunc = function(boxed: Tgpointer): Tgpointer; cdecl;
  TGBoxedFreeFunc = procedure(boxed: Tgpointer); cdecl;

function g_boxed_copy(boxed_type: TGType; src_boxed: Tgconstpointer): Tgpointer; cdecl; external libgobject2_0;
procedure g_boxed_free(boxed_type: TGType; boxed: Tgpointer); cdecl; external libgobject2_0;
procedure g_value_set_boxed(Value: PGValue; v_boxed: Tgconstpointer); cdecl; external libgobject2_0;
procedure g_value_set_static_boxed(Value: PGValue; v_boxed: Tgconstpointer); cdecl; external libgobject2_0;
procedure g_value_take_boxed(Value: PGValue; v_boxed: Tgconstpointer); cdecl; external libgobject2_0;
procedure g_value_set_boxed_take_ownership(Value: PGValue; v_boxed: Tgconstpointer); cdecl; external libgobject2_0;
function g_value_get_boxed(Value: PGValue): Tgpointer; cdecl; external libgobject2_0;
function g_value_dup_boxed(Value: PGValue): Tgpointer; cdecl; external libgobject2_0;
function g_boxed_type_register_static(Name: Pgchar; boxed_copy: TGBoxedCopyFunc; boxed_free: TGBoxedFreeFunc): TGType; cdecl; external libgobject2_0;

function g_closure_get_type: TGType; cdecl; external libgobject2_0;
function g_value_get_type: TGType; cdecl; external libgobject2_0;

function G_TYPE_IS_BOXED(_type: TGType): Tgboolean;
function G_VALUE_HOLDS_BOXED(Value: Pointer): Tgboolean;

function G_TYPE_CLOSURE: TGType;
function G_TYPE_VALUE: TGType;

// === Konventiert am: 15-8-24 19:51:09 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function G_TYPE_IS_BOXED(_type: TGType): Tgboolean;
begin
  G_TYPE_IS_BOXED := (G_TYPE_FUNDAMENTAL(_type)) = G_TYPE_BOXED;
end;

function G_VALUE_HOLDS_BOXED(Value: Pointer): Tgboolean;
begin
  G_VALUE_HOLDS_BOXED := G_TYPE_CHECK_VALUE_TYPE(Value, G_TYPE_BOXED);
end;

function G_TYPE_CLOSURE: TGType;
begin
  G_TYPE_CLOSURE := g_closure_get_type;
end;

function G_TYPE_VALUE: TGType;
begin
  G_TYPE_VALUE := g_value_get_type;
end;


{$ENDIF read_implementation}
