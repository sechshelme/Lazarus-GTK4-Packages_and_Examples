unit gaction;

interface

uses
  common_GLIB, gtypes, gvariant, gvarianttype, gerror, gtype;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGAction = record
  end;
  PGAction = ^TGAction;

  TGActionInterface = record
    g_iface: TGTypeInterface;
    get_name: function(action: PGAction): Pgchar; cdecl;
    get_parameter_type: function(action: PGAction): PGVariantType; cdecl;
    get_state_type: function(action: PGAction): PGVariantType; cdecl;
    get_state_hint: function(action: PGAction): PGVariant; cdecl;
    get_enabled: function(action: PGAction): Tgboolean; cdecl;
    get_state: function(action: PGAction): PGVariant; cdecl;
    change_state: procedure(action: PGAction; Value: PGVariant); cdecl;
    activate: procedure(action: PGAction; parameter: PGVariant); cdecl;
  end;
  PGActionInterface = ^TGActionInterface;

function g_action_get_type: TGType; cdecl; external libgio2;
function g_action_get_name(action: PGAction): Pgchar; cdecl; external libgio2;
function g_action_get_parameter_type(action: PGAction): PGVariantType; cdecl; external libgio2;
function g_action_get_state_type(action: PGAction): PGVariantType; cdecl; external libgio2;
function g_action_get_state_hint(action: PGAction): PGVariant; cdecl; external libgio2;
function g_action_get_enabled(action: PGAction): Tgboolean; cdecl; external libgio2;
function g_action_get_state(action: PGAction): PGVariant; cdecl; external libgio2;
procedure g_action_change_state(action: PGAction; Value: PGVariant); cdecl; external libgio2;
procedure g_action_activate(action: PGAction; parameter: PGVariant); cdecl; external libgio2;
function g_action_name_is_valid(action_name: Pgchar): Tgboolean; cdecl; external libgio2;
function g_action_parse_detailed_name(detailed_name: Pgchar; action_name: PPgchar; target_value: PPGVariant; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_action_print_detailed_name(action_name: Pgchar; target_value: PGVariant): Pgchar; cdecl; external libgio2;

// === Konventiert am: 6-8-24 15:24:40 ===

function G_TYPE_ACTION: TGType;
function G_ACTION(obj: Pointer): PGAction;
function G_IS_ACTION(obj: Pointer): Tgboolean;
function G_ACTION_GET_IFACE(obj: Pointer): PGActionInterface;

implementation

function G_TYPE_ACTION: TGType;
begin
  G_TYPE_ACTION := g_action_get_type;
end;

function G_ACTION(obj: Pointer): PGAction;
begin
  Result := PGAction(g_type_check_instance_cast(obj, G_TYPE_ACTION));
end;

function G_IS_ACTION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_ACTION);
end;

function G_ACTION_GET_IFACE(obj: Pointer): PGActionInterface;
begin
  Result := g_type_interface_peek(obj, G_TYPE_ACTION);
end;



end.
