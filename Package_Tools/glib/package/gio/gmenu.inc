/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGMenu = record
  end;
  PGMenu = ^TGMenu;

  TGMenuItem = record
  end;
  PGMenuItem = ^TGMenuItem;

function g_menu_get_type: TGType; cdecl; external libgio2;
function g_menu_new: PGMenu; cdecl; external libgio2;
procedure g_menu_freeze(menu: PGMenu); cdecl; external libgio2;
procedure g_menu_insert_item(menu: PGMenu; position: Tgint; item: PGMenuItem); cdecl; external libgio2;
procedure g_menu_prepend_item(menu: PGMenu; item: PGMenuItem); cdecl; external libgio2;
procedure g_menu_append_item(menu: PGMenu; item: PGMenuItem); cdecl; external libgio2;
procedure g_menu_remove(menu: PGMenu; position: Tgint); cdecl; external libgio2;
procedure g_menu_remove_all(menu: PGMenu); cdecl; external libgio2;
procedure g_menu_insert(menu: PGMenu; position: Tgint; _label: Pgchar; detailed_action: Pgchar); cdecl; external libgio2;
procedure g_menu_prepend(menu: PGMenu; _label: Pgchar; detailed_action: Pgchar); cdecl; external libgio2;
procedure g_menu_append(menu: PGMenu; _label: Pgchar; detailed_action: Pgchar); cdecl; external libgio2;
procedure g_menu_insert_section(menu: PGMenu; position: Tgint; _label: Pgchar; section: PGMenuModel); cdecl; external libgio2;
procedure g_menu_prepend_section(menu: PGMenu; _label: Pgchar; section: PGMenuModel); cdecl; external libgio2;
procedure g_menu_append_section(menu: PGMenu; _label: Pgchar; section: PGMenuModel); cdecl; external libgio2;
procedure g_menu_insert_submenu(menu: PGMenu; position: Tgint; _label: Pgchar; submenu: PGMenuModel); cdecl; external libgio2;
procedure g_menu_prepend_submenu(menu: PGMenu; _label: Pgchar; submenu: PGMenuModel); cdecl; external libgio2;
procedure g_menu_append_submenu(menu: PGMenu; _label: Pgchar; submenu: PGMenuModel); cdecl; external libgio2;
function g_menu_item_get_type: TGType; cdecl; external libgio2;
function g_menu_item_new(_label: Pgchar; detailed_action: Pgchar): PGMenuItem; cdecl; external libgio2;
function g_menu_item_new_from_model(model: PGMenuModel; item_index: Tgint): PGMenuItem; cdecl; external libgio2;
function g_menu_item_new_submenu(_label: Pgchar; submenu: PGMenuModel): PGMenuItem; cdecl; external libgio2;
function g_menu_item_new_section(_label: Pgchar; section: PGMenuModel): PGMenuItem; cdecl; external libgio2;
function g_menu_item_get_attribute_value(menu_item: PGMenuItem; attribute: Pgchar; expected_type: PGVariantType): PGVariant; cdecl; external libgio2;
function g_menu_item_get_attribute(menu_item: PGMenuItem; attribute: Pgchar; format_string: Pgchar; args: array of const): Tgboolean; cdecl; external libgio2;
function g_menu_item_get_attribute(menu_item: PGMenuItem; attribute: Pgchar; format_string: Pgchar): Tgboolean; cdecl; external libgio2;
function g_menu_item_get_link(menu_item: PGMenuItem; link: Pgchar): PGMenuModel; cdecl; external libgio2;
procedure g_menu_item_set_attribute_value(menu_item: PGMenuItem; attribute: Pgchar; Value: PGVariant); cdecl; external libgio2;
procedure g_menu_item_set_attribute(menu_item: PGMenuItem; attribute: Pgchar; format_string: Pgchar; args: array of const); cdecl; external libgio2;
procedure g_menu_item_set_attribute(menu_item: PGMenuItem; attribute: Pgchar; format_string: Pgchar); cdecl; external libgio2;
procedure g_menu_item_set_link(menu_item: PGMenuItem; link: Pgchar; model: PGMenuModel); cdecl; external libgio2;
procedure g_menu_item_set_label(menu_item: PGMenuItem; _label: Pgchar); cdecl; external libgio2;
procedure g_menu_item_set_submenu(menu_item: PGMenuItem; submenu: PGMenuModel); cdecl; external libgio2;
procedure g_menu_item_set_section(menu_item: PGMenuItem; section: PGMenuModel); cdecl; external libgio2;
procedure g_menu_item_set_action_and_target_value(menu_item: PGMenuItem; action: Pgchar; target_value: PGVariant); cdecl; external libgio2;
procedure g_menu_item_set_action_and_target(menu_item: PGMenuItem; action: Pgchar; format_string: Pgchar; args: array of const); cdecl; external libgio2;
procedure g_menu_item_set_action_and_target(menu_item: PGMenuItem; action: Pgchar; format_string: Pgchar); cdecl; external libgio2;
procedure g_menu_item_set_detailed_action(menu_item: PGMenuItem; detailed_action: Pgchar); cdecl; external libgio2;
procedure g_menu_item_set_icon(menu_item: PGMenuItem; icon: PGIcon); cdecl; external libgio2;

// === Konventiert am: 20-8-24 13:57:40 ===

function G_TYPE_MENU: TGType;
function G_MENU(obj: Pointer): PGMenu;
function G_IS_MENU(obj: Pointer): Tgboolean;

function G_TYPE_MENU_ITEM: TGType;
function G_MENU_ITEM(obj: Pointer): PGMenuItem;
function G_IS_MENU_ITEM(obj: Pointer): Tgboolean;


{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_TYPE_MENU: TGType;
begin
  G_TYPE_MENU := g_menu_get_type;
end;

function G_MENU(obj: Pointer): PGMenu;
begin
  Result := PGMenu(g_type_check_instance_cast(obj, G_TYPE_MENU));
end;

function G_IS_MENU(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_MENU);
end;

// ====

function G_TYPE_MENU_ITEM: TGType;
begin
  G_TYPE_MENU_ITEM := g_menu_item_get_type;
end;

function G_MENU_ITEM(obj: Pointer): PGMenuItem;
begin
  Result := PGMenuItem(g_type_check_instance_cast(obj, G_TYPE_MENU_ITEM));
end;

function G_IS_MENU_ITEM(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_MENU_ITEM);
end;


{$ENDIF read_implementation}
