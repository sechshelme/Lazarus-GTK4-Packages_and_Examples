/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

function g_simple_action_get_type: TGType; cdecl; external libgio2;
function g_simple_action_new(Name: Pgchar; parameter_type: PGVariantType): PGSimpleAction; cdecl; external libgio2;
function g_simple_action_new_stateful(Name: Pgchar; parameter_type: PGVariantType; state: PGVariant): PGSimpleAction; cdecl; external libgio2;
procedure g_simple_action_set_enabled(simple: PGSimpleAction; Enabled: Tgboolean); cdecl; external libgio2;
procedure g_simple_action_set_state(simple: PGSimpleAction; Value: PGVariant); cdecl; external libgio2;
procedure g_simple_action_set_state_hint(simple: PGSimpleAction; state_hint: PGVariant); cdecl; external libgio2;

// === Konventiert am: 21-8-24 15:01:09 ===

function G_TYPE_SIMPLE_ACTION: TGType;
function G_SIMPLE_ACTION(obj: Pointer): PGSimpleAction;
function G_IS_SIMPLE_ACTION(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_TYPE_SIMPLE_ACTION: TGType;
begin
  G_TYPE_SIMPLE_ACTION := g_simple_action_get_type;
end;

function G_SIMPLE_ACTION(obj: Pointer): PGSimpleAction;
begin
  Result := PGSimpleAction(g_type_check_instance_cast(obj, G_TYPE_SIMPLE_ACTION));
end;

function G_IS_SIMPLE_ACTION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_SIMPLE_ACTION);
end;



{$ENDIF read_implementation}
