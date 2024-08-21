unit gpropertyaction;

interface

uses
  common_GLIB, gtypes, gerror, gtype, giotypes, gobject, gioenums;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGPropertyAction = record
  end;
  PGPropertyAction = ^TGPropertyAction;

function g_property_action_get_type: TGType; cdecl; external libgio2;
function g_property_action_new(Name: Pgchar; obj: Tgpointer; property_name: Pgchar): PGPropertyAction; cdecl; external libgio2;

// === Konventiert am: 21-8-24 16:23:24 ===

function G_TYPE_PROPERTY_ACTION: TGType;
function G_PROPERTY_ACTION(obj: Pointer): PGPropertyAction;
function G_IS_PROPERTY_ACTION(obj: Pointer): Tgboolean;

implementation

function G_TYPE_PROPERTY_ACTION: TGType;
begin
  G_TYPE_PROPERTY_ACTION := g_property_action_get_type;
end;

function G_PROPERTY_ACTION(obj: Pointer): PGPropertyAction;
begin
  Result := PGPropertyAction(g_type_check_instance_cast(obj, G_TYPE_PROPERTY_ACTION));
end;

function G_IS_PROPERTY_ACTION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_PROPERTY_ACTION);
end;



end.
