unit gactiongroup;

interface

uses
  common_GLIB, gtypes, gtype, gvariant, gvarianttype;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGActionGroup = record
  end;
  PGActionGroup = ^TGActionGroup;

  TGActionGroupInterface = record
    g_iface: TGTypeInterface;
    has_action: function(action_group: PGActionGroup; action_name: Pgchar): Tgboolean; cdecl;
    list_actions: function(action_group: PGActionGroup): PPgchar; cdecl;
    get_action_enabled: function(action_group: PGActionGroup; action_name: Pgchar): Tgboolean; cdecl;
    get_action_parameter_type: function(action_group: PGActionGroup; action_name: Pgchar): PGVariantType; cdecl;
    get_action_state_type: function(action_group: PGActionGroup; action_name: Pgchar): PGVariantType; cdecl;
    get_action_state_hint: function(action_group: PGActionGroup; action_name: Pgchar): PGVariant; cdecl;
    get_action_state: function(action_group: PGActionGroup; action_name: Pgchar): PGVariant; cdecl;
    change_action_state: procedure(action_group: PGActionGroup; action_name: Pgchar; Value: PGVariant); cdecl;
    activate_action: procedure(action_group: PGActionGroup; action_name: Pgchar; parameter: PGVariant); cdecl;
    action_added: procedure(action_group: PGActionGroup; action_name: Pgchar); cdecl;
    action_removed: procedure(action_group: PGActionGroup; action_name: Pgchar); cdecl;
    action_enabled_changed: procedure(action_group: PGActionGroup; action_name: Pgchar; Enabled: Tgboolean); cdecl;
    action_state_changed: procedure(action_group: PGActionGroup; action_name: Pgchar; state: PGVariant); cdecl;
    query_action: function(action_group: PGActionGroup; action_name: Pgchar; Enabled: Pgboolean; parameter_type: PPGVariantType; state_type: PPGVariantType;
      state_hint: PPGVariant; state: PPGVariant): Tgboolean; cdecl;
  end;
  PGActionGroupInterface = ^TGActionGroupInterface;

function g_action_group_get_type: TGType; cdecl; external libgio2;
function g_action_group_has_action(action_group: PGActionGroup; action_name: Pgchar): Tgboolean; cdecl; external libgio2;
function g_action_group_list_actions(action_group: PGActionGroup): PPgchar; cdecl; external libgio2;
function g_action_group_get_action_parameter_type(action_group: PGActionGroup; action_name: Pgchar): PGVariantType; cdecl; external libgio2;
function g_action_group_get_action_state_type(action_group: PGActionGroup; action_name: Pgchar): PGVariantType; cdecl; external libgio2;
function g_action_group_get_action_state_hint(action_group: PGActionGroup; action_name: Pgchar): PGVariant; cdecl; external libgio2;
function g_action_group_get_action_enabled(action_group: PGActionGroup; action_name: Pgchar): Tgboolean; cdecl; external libgio2;
function g_action_group_get_action_state(action_group: PGActionGroup; action_name: Pgchar): PGVariant; cdecl; external libgio2;
procedure g_action_group_change_action_state(action_group: PGActionGroup; action_name: Pgchar; Value: PGVariant); cdecl; external libgio2;
procedure g_action_group_activate_action(action_group: PGActionGroup; action_name: Pgchar; parameter: PGVariant); cdecl; external libgio2;
procedure g_action_group_action_added(action_group: PGActionGroup; action_name: Pgchar); cdecl; external libgio2;
procedure g_action_group_action_removed(action_group: PGActionGroup; action_name: Pgchar); cdecl; external libgio2;
procedure g_action_group_action_enabled_changed(action_group: PGActionGroup; action_name: Pgchar; Enabled: Tgboolean); cdecl; external libgio2;
procedure g_action_group_action_state_changed(action_group: PGActionGroup; action_name: Pgchar; state: PGVariant); cdecl; external libgio2;
function g_action_group_query_action(action_group: PGActionGroup; action_name: Pgchar; Enabled: Pgboolean; parameter_type: PPGVariantType; state_type: PPGVariantType;
  state_hint: PPGVariant; state: PPGVariant): Tgboolean; cdecl; external libgio2;

// === Konventiert am: 16-8-24 19:15:34 ===

function G_TYPE_ACTION_GROUP: TGType;
function G_ACTION_GROUP(obj: Pointer): PGActionGroup;
function G_IS_ACTION_GROUP(obj: Pointer): Tgboolean;
function G_ACTION_GROUP_GET_IFACE(obj: Pointer): PGActionGroupInterface;

implementation

function G_TYPE_ACTION_GROUP: TGType;
begin
  G_TYPE_ACTION_GROUP := g_action_group_get_type;
end;

function G_ACTION_GROUP(obj: Pointer): PGActionGroup;
begin
  Result := PGActionGroup(g_type_check_instance_cast(obj, G_TYPE_ACTION_GROUP));
end;

function G_IS_ACTION_GROUP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_ACTION_GROUP);
end;

function G_ACTION_GROUP_GET_IFACE(obj: Pointer): PGActionGroupInterface;
begin
  Result := g_type_interface_peek(obj, G_TYPE_ACTION_GROUP);
end;



end.
