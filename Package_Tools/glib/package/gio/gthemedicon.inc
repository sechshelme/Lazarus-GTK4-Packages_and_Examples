/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGThemedIcon = record
  end;
  PGThemedIcon = ^TGThemedIcon;

  TGThemedIconClass = record
  end;
  PGThemedIconClass = ^TGThemedIconClass;

function g_themed_icon_get_type: TGType; cdecl; external libgio2;
function g_themed_icon_new(iconname: PChar): PGIcon; cdecl; external libgio2;
function g_themed_icon_new_with_default_fallbacks(iconname: PChar): PGIcon; cdecl; external libgio2;
function g_themed_icon_new_from_names(iconnames: PPchar; len: longint): PGIcon; cdecl; external libgio2;
procedure g_themed_icon_prepend_name(icon: PGThemedIcon; iconname: PChar); cdecl; external libgio2;
procedure g_themed_icon_append_name(icon: PGThemedIcon; iconname: PChar); cdecl; external libgio2;
function g_themed_icon_get_names(icon: PGThemedIcon): PPgchar; cdecl; external libgio2;

// === Konventiert am: 21-8-24 15:30:03 ===

function G_TYPE_THEMED_ICON: TGType;
function G_THEMED_ICON(obj: Pointer): PGThemedIcon;
function G_THEMED_ICON_CLASS(klass: Pointer): PGThemedIconClass;
function G_IS_THEMED_ICON(obj: Pointer): Tgboolean;
function G_IS_THEMED_ICON_CLASS(klass: Pointer): Tgboolean;
function G_THEMED_ICON_GET_CLASS(obj: Pointer): PGThemedIconClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_TYPE_THEMED_ICON: TGType;
begin
  G_TYPE_THEMED_ICON := g_themed_icon_get_type;
end;

function G_THEMED_ICON(obj: Pointer): PGThemedIcon;
begin
  Result := PGThemedIcon(g_type_check_instance_cast(obj, G_TYPE_THEMED_ICON));
end;

function G_THEMED_ICON_CLASS(klass: Pointer): PGThemedIconClass;
begin
  Result := PGThemedIconClass(g_type_check_class_cast(klass, G_TYPE_THEMED_ICON));
end;

function G_IS_THEMED_ICON(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_THEMED_ICON);
end;

function G_IS_THEMED_ICON_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_THEMED_ICON);
end;

function G_THEMED_ICON_GET_CLASS(obj: Pointer): PGThemedIconClass;
begin
  Result := PGThemedIconClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
