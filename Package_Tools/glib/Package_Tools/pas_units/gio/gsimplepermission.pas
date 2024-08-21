unit gsimplepermission;

interface

uses
  common_GLIB, gtypes, gerror, gtype, giotypes, gobject, gioenums, gpermission;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGSimplePermission = record
  end;
  PGSimplePermission = ^TGSimplePermission;

function g_simple_permission_get_type: TGType; cdecl; external libgio2;
function g_simple_permission_new(allowed: Tgboolean): PGPermission; cdecl; external libgio2;

// === Konventiert am: 21-8-24 16:34:16 ===

function G_TYPE_SIMPLE_PERMISSION: TGType;
function G_SIMPLE_PERMISSION(obj: Pointer): PGSimplePermission;
function G_IS_SIMPLE_PERMISSION(obj: Pointer): Tgboolean;

implementation

function G_TYPE_SIMPLE_PERMISSION: TGType;
begin
  G_TYPE_SIMPLE_PERMISSION := g_simple_permission_get_type;
end;

function G_SIMPLE_PERMISSION(obj: Pointer): PGSimplePermission;
begin
  Result := PGSimplePermission(g_type_check_instance_cast(obj, G_TYPE_SIMPLE_PERMISSION));
end;

function G_IS_SIMPLE_PERMISSION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_SIMPLE_PERMISSION);
end;



end.
