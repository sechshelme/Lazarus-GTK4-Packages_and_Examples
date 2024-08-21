unit gemblemedicon;

interface

uses
  common_GLIB, gtypes, glist, gerror, gtype, giotypes, gobject, gioenums, gemblem;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGEmblemedIconPrivate = record
  end;
  PGEmblemedIconPrivate = ^TGEmblemedIconPrivate;

  TGEmblemedIcon = record
    parent_instance: TGObject;
    priv: PGEmblemedIconPrivate;
  end;
  PGEmblemedIcon = ^TGEmblemedIcon;

  TGEmblemedIconClass = record
    parent_class: TGObjectClass;
  end;
  PGEmblemedIconClass = ^TGEmblemedIconClass;


function g_emblemed_icon_get_type: TGType; cdecl; external libgio2;
function g_emblemed_icon_new(icon: PGIcon; emblem: PGEmblem): PGIcon; cdecl; external libgio2;
function g_emblemed_icon_get_icon(emblemed: PGEmblemedIcon): PGIcon; cdecl; external libgio2;
function g_emblemed_icon_get_emblems(emblemed: PGEmblemedIcon): PGList; cdecl; external libgio2;
procedure g_emblemed_icon_add_emblem(emblemed: PGEmblemedIcon; emblem: PGEmblem); cdecl; external libgio2;
procedure g_emblemed_icon_clear_emblems(emblemed: PGEmblemedIcon); cdecl; external libgio2;

// === Konventiert am: 21-8-24 15:17:38 ===

function G_TYPE_EMBLEMED_ICON: TGType;
function G_EMBLEMED_ICON(obj: Pointer): PGEmblemedIcon;
function G_EMBLEMED_ICON_CLASS(klass: Pointer): PGEmblemedIconClass;
function G_IS_EMBLEMED_ICON(obj: Pointer): Tgboolean;
function G_IS_EMBLEMED_ICON_CLASS(klass: Pointer): Tgboolean;
function G_EMBLEMED_ICON_GET_CLASS(obj: Pointer): PGEmblemedIconClass;

implementation

function G_TYPE_EMBLEMED_ICON: TGType;
begin
  G_TYPE_EMBLEMED_ICON := g_emblemed_icon_get_type;
end;

function G_EMBLEMED_ICON(obj: Pointer): PGEmblemedIcon;
begin
  Result := PGEmblemedIcon(g_type_check_instance_cast(obj, G_TYPE_EMBLEMED_ICON));
end;

function G_EMBLEMED_ICON_CLASS(klass: Pointer): PGEmblemedIconClass;
begin
  Result := PGEmblemedIconClass(g_type_check_class_cast(klass, G_TYPE_EMBLEMED_ICON));
end;

function G_IS_EMBLEMED_ICON(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_EMBLEMED_ICON);
end;

function G_IS_EMBLEMED_ICON_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_EMBLEMED_ICON);
end;

function G_EMBLEMED_ICON_GET_CLASS(obj: Pointer): PGEmblemedIconClass;
begin
  Result := PGEmblemedIconClass(PGTypeInstance(obj)^.g_class);
end;



end.
