unit gbindinggroup;

interface

uses
  common_GLIB, gtypes, gtype, gbinding, gclosure;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGBindingGroup = record
  end;
  PGBindingGroup = ^TGBindingGroup;

function g_binding_group_get_type: TGType; cdecl; external libglib2;
function g_binding_group_new: PGBindingGroup; cdecl; external libglib2;
function g_binding_group_dup_source(self: PGBindingGroup): Tgpointer; cdecl; external libglib2;
procedure g_binding_group_set_source(self: PGBindingGroup; Source: Tgpointer); cdecl; external libglib2;
procedure g_binding_group_bind(self: PGBindingGroup; source_property: Pgchar; target: Tgpointer; target_property: Pgchar; flags: TGBindingFlags); cdecl; external libglib2;
procedure g_binding_group_bind_full(self: PGBindingGroup; source_property: Pgchar; target: Tgpointer; target_property: Pgchar; flags: TGBindingFlags;
  transform_to: TGBindingTransformFunc; transform_from: TGBindingTransformFunc; user_data: Tgpointer; user_data_destroy: TGDestroyNotify); cdecl; external libglib2;
procedure g_binding_group_bind_with_closures(self: PGBindingGroup; source_property: Pgchar; target: Tgpointer; target_property: Pgchar; flags: TGBindingFlags;
  transform_to: PGClosure; transform_from: PGClosure); cdecl; external libglib2;

// === Konventiert am: 15-8-24 19:50:34 ===

function G_TYPE_BINDING_GROUP: TGType;
function G_BINDING_GROUP(obj: Pointer): PGBindingGroup;
function G_IS_BINDING_GROUP(obj: Pointer): Tgboolean;

implementation

function G_TYPE_BINDING_GROUP: TGType;
begin
  G_TYPE_BINDING_GROUP := g_binding_group_get_type;
end;

function G_BINDING_GROUP(obj: Pointer): PGBindingGroup;
begin
  Result := PGBindingGroup(g_type_check_instance_cast(obj, G_TYPE_BINDING_GROUP));
end;

function G_IS_BINDING_GROUP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_BINDING_GROUP);
end;



end.