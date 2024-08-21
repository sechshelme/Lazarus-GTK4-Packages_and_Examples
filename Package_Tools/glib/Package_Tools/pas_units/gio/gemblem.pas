unit gemblem;

interface

uses
  common_GLIB, gtypes, gerror, gtype, giotypes, gobject, gioenums;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGEmblem = record
  end;
  PGEmblem = ^TGEmblem;

  TGEmblemClass = record
  end;
  PGEmblemClass = ^TGEmblemClass;

function g_emblem_get_type: TGType; cdecl; external libgio2;
function g_emblem_new(icon: PGIcon): PGEmblem; cdecl; external libgio2;
function g_emblem_new_with_origin(icon: PGIcon; origin: TGEmblemOrigin): PGEmblem; cdecl; external libgio2;
function g_emblem_get_icon(emblem: PGEmblem): PGIcon; cdecl; external libgio2;
function g_emblem_get_origin(emblem: PGEmblem): TGEmblemOrigin; cdecl; external libgio2;

// === Konventiert am: 21-8-24 15:22:57 ===

function G_TYPE_EMBLEM: TGType;
function G_EMBLEM(obj: Pointer): PGEmblem;
function G_EMBLEM_CLASS(klass: Pointer): PGEmblemClass;
function G_IS_EMBLEM(obj: Pointer): Tgboolean;
function G_IS_EMBLEM_CLASS(klass: Pointer): Tgboolean;
function G_EMBLEM_GET_CLASS(obj: Pointer): PGEmblemClass;

implementation

function G_TYPE_EMBLEM: TGType;
begin
  G_TYPE_EMBLEM := g_emblem_get_type;
end;

function G_EMBLEM(obj: Pointer): PGEmblem;
begin
  Result := PGEmblem(g_type_check_instance_cast(obj, G_TYPE_EMBLEM));
end;

function G_EMBLEM_CLASS(klass: Pointer): PGEmblemClass;
begin
  Result := PGEmblemClass(g_type_check_class_cast(klass, G_TYPE_EMBLEM));
end;

function G_IS_EMBLEM(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_EMBLEM);
end;

function G_IS_EMBLEM_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_EMBLEM);
end;

function G_EMBLEM_GET_CLASS(obj: Pointer): PGEmblemClass;
begin
  Result := PGEmblemClass(PGTypeInstance(obj)^.g_class);
end;



end.
