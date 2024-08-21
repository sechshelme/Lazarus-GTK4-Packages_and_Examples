/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGSignalGroup = record
  end;
  PGSignalGroup = ^TGSignalGroup;

function g_signal_group_get_type: TGType; cdecl; external libgobject2_0;
function g_signal_group_new(target_type: TGType): PGSignalGroup; cdecl; external libgobject2_0;
procedure g_signal_group_set_target(self: PGSignalGroup; target: Tgpointer); cdecl; external libgobject2_0;
function g_signal_group_dup_target(self: PGSignalGroup): Tgpointer; cdecl; external libgobject2_0;
procedure g_signal_group_block(self: PGSignalGroup); cdecl; external libgobject2_0;
procedure g_signal_group_unblock(self: PGSignalGroup); cdecl; external libgobject2_0;
procedure g_signal_group_connect_closure(self: PGSignalGroup; detailed_signal: Pgchar; closure: PGClosure; after: Tgboolean); cdecl; external libgobject2_0;
procedure g_signal_group_connect_object(self: PGSignalGroup; detailed_signal: Pgchar; c_handler: TGCallback; obj: Tgpointer; flags: TGConnectFlags); cdecl; external libgobject2_0;
procedure g_signal_group_connect_data(self: PGSignalGroup; detailed_signal: Pgchar; c_handler: TGCallback; Data: Tgpointer; notify: TGClosureNotify;
  flags: TGConnectFlags); cdecl; external libgobject2_0;
procedure g_signal_group_connect(self: PGSignalGroup; detailed_signal: Pgchar; c_handler: TGCallback; Data: Tgpointer); cdecl; external libgobject2_0;
procedure g_signal_group_connect_after(self: PGSignalGroup; detailed_signal: Pgchar; c_handler: TGCallback; Data: Tgpointer); cdecl; external libgobject2_0;
procedure g_signal_group_connect_swapped(self: PGSignalGroup; detailed_signal: Pgchar; c_handler: TGCallback; Data: Tgpointer); cdecl; external libgobject2_0;

// === Konventiert am: 15-8-24 19:41:08 ===

function G_TYPE_SIGNAL_GROUP: TGType;
function G_SIGNAL_GROUP(obj: Pointer): PGSignalGroup;
function G_IS_SIGNAL_GROUP(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_TYPE_SIGNAL_GROUP: TGType;
begin
  G_TYPE_SIGNAL_GROUP := g_signal_group_get_type;
end;

function G_SIGNAL_GROUP(obj: Pointer): PGSignalGroup;
begin
  Result := PGSignalGroup(g_type_check_instance_cast(obj, G_TYPE_SIGNAL_GROUP));
end;

function G_IS_SIGNAL_GROUP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_SIGNAL_GROUP);
end;



{$ENDIF read_implementation}
