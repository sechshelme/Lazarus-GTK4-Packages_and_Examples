unit gbinding;

interface

uses
  common_GLIB, gtypes, gtype, gobject, gclosure;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TGBinding = record
  end;
  PGBinding = ^TGBinding;

  TGBindingTransformFunc = function(binding: PGBinding; from_value: PGValue; to_value: PGValue; user_data: Tgpointer): Tgboolean; cdecl;

  PGBindingFlags = ^TGBindingFlags;
  TGBindingFlags = longint;

const
  G_BINDING_DEFAULT = 0;
  G_BINDING_BIDIRECTIONAL = 1 shl 0;
  G_BINDING_SYNC_CREATE = 1 shl 1;
  G_BINDING_INVERT_BOOLEAN = 1 shl 2;

function g_binding_flags_get_type: TGType; cdecl; external libgobject2_0;
function g_binding_get_type: TGType; cdecl; external libgobject2_0;
function g_binding_get_flags(binding: PGBinding): TGBindingFlags; cdecl; external libgobject2_0;
function g_binding_get_source(binding: PGBinding): PGObject; cdecl; external libgobject2_0;
function g_binding_dup_source(binding: PGBinding): PGObject; cdecl; external libgobject2_0;
function g_binding_get_target(binding: PGBinding): PGObject; cdecl; external libgobject2_0;
function g_binding_dup_target(binding: PGBinding): PGObject; cdecl; external libgobject2_0;
function g_binding_get_source_property(binding: PGBinding): Pgchar; cdecl; external libgobject2_0;
function g_binding_get_target_property(binding: PGBinding): Pgchar; cdecl; external libgobject2_0;
procedure g_binding_unbind(binding: PGBinding); cdecl; external libgobject2_0;
function g_object_bind_property(Source: Tgpointer; source_property: Pgchar; target: Tgpointer; target_property: Pgchar; flags: TGBindingFlags): PGBinding; cdecl; external libgobject2_0;
function g_object_bind_property_full(Source: Tgpointer; source_property: Pgchar; target: Tgpointer; target_property: Pgchar; flags: TGBindingFlags;
  transform_to: TGBindingTransformFunc; transform_from: TGBindingTransformFunc; user_data: Tgpointer; notify: TGDestroyNotify): PGBinding; cdecl; external libgobject2_0;
function g_object_bind_property_with_closures(Source: Tgpointer; source_property: Pgchar; target: Tgpointer; target_property: Pgchar; flags: TGBindingFlags;
  transform_to: PGClosure; transform_from: PGClosure): PGBinding; cdecl; external libgobject2_0;

function G_TYPE_BINDING_FLAGS: TGType;
function G_TYPE_BINDING: TGType;
function G_BINDING(obj: Pointer): PGTypeInstance;
function G_IS_BINDING(obj: Pointer): Tgboolean;

// === Konventiert am: 14-8-24 19:42:34 ===


implementation


function G_TYPE_BINDING_FLAGS: TGType;
begin
  G_TYPE_BINDING_FLAGS := g_binding_flags_get_type;
end;

function G_TYPE_BINDING: TGType;
begin
  G_TYPE_BINDING := g_binding_get_type;
end;

function G_BINDING(obj: Pointer): PGTypeInstance;
begin
  G_BINDING := G_TYPE_CHECK_INSTANCE_CAST(obj, G_TYPE_BINDING);
end;

function G_IS_BINDING(obj: Pointer): Tgboolean;
begin
  G_IS_BINDING := G_TYPE_CHECK_INSTANCE_TYPE(obj, G_TYPE_BINDING);
end;


end.
