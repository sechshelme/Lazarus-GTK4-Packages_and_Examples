/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGRemoteActionGroup = record
  end;
  PGRemoteActionGroup = ^TGRemoteActionGroup;

  TGRemoteActionGroupInterface = record
    g_iface: TGTypeInterface;
    activate_action_full: procedure(remote: PGRemoteActionGroup; action_name: Pgchar; parameter: PGVariant; platform_data: PGVariant); cdecl;
    change_action_state_full: procedure(remote: PGRemoteActionGroup; action_name: Pgchar; Value: PGVariant; platform_data: PGVariant); cdecl;
  end;
  PGRemoteActionGroupInterface = ^TGRemoteActionGroupInterface;


function g_remote_action_group_get_type: TGType; cdecl; external libgio2;
procedure g_remote_action_group_activate_action_full(remote: PGRemoteActionGroup; action_name: Pgchar; parameter: PGVariant; platform_data: PGVariant); cdecl; external libgio2;
procedure g_remote_action_group_change_action_state_full(remote: PGRemoteActionGroup; action_name: Pgchar; Value: PGVariant; platform_data: PGVariant); cdecl; external libgio2;

// === Konventiert am: 20-8-24 19:32:31 ===

function G_TYPE_REMOTE_ACTION_GROUP: TGType;
function G_REMOTE_ACTION_GROUP(obj: Pointer): PGRemoteActionGroup;
function G_IS_REMOTE_ACTION_GROUP(obj: Pointer): Tgboolean;
function G_REMOTE_ACTION_GROUP_GET_IFACE(obj: Pointer): PGRemoteActionGroupInterface;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_TYPE_REMOTE_ACTION_GROUP: TGType;
begin
  G_TYPE_REMOTE_ACTION_GROUP := g_remote_action_group_get_type;
end;

function G_REMOTE_ACTION_GROUP(obj: Pointer): PGRemoteActionGroup;
begin
  Result := PGRemoteActionGroup(g_type_check_instance_cast(obj, G_TYPE_REMOTE_ACTION_GROUP));
end;

function G_IS_REMOTE_ACTION_GROUP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_REMOTE_ACTION_GROUP);
end;

function G_REMOTE_ACTION_GROUP_GET_IFACE(obj: Pointer): PGRemoteActionGroupInterface;
begin
  Result := g_type_interface_peek(obj, G_TYPE_REMOTE_ACTION_GROUP);
end;



{$ENDIF read_implementation}
