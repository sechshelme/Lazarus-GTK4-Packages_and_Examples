unit gtkpopovermenu;

interface

uses
  glib2, common_GTK, gtkenums, gtktypes, gtkwidget;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGtkPopoverMenu = record // _GtkPopoverMenu
  end;
  PGtkPopoverMenu = ^TGtkPopoverMenu;

function gtk_popover_menu_get_type: TGType; cdecl; external libgtk4;
function gtk_popover_menu_new_from_model(model: PGMenuModel): PGtkWidget; cdecl; external libgtk4;
function gtk_popover_menu_new_from_model_full(model: PGMenuModel; flags: TGtkPopoverMenuFlags): PGtkWidget; cdecl; external libgtk4;
procedure gtk_popover_menu_set_menu_model(popover: PGtkPopoverMenu; model: PGMenuModel); cdecl; external libgtk4;
function gtk_popover_menu_get_menu_model(popover: PGtkPopoverMenu): PGMenuModel; cdecl; external libgtk4;
procedure gtk_popover_menu_set_flags(popover: PGtkPopoverMenu; flags: TGtkPopoverMenuFlags); cdecl; external libgtk4;
function gtk_popover_menu_get_flags(popover: PGtkPopoverMenu): TGtkPopoverMenuFlags; cdecl; external libgtk4;
function gtk_popover_menu_add_child(popover: PGtkPopoverMenu; child: PGtkWidget; id: PChar): Tgboolean; cdecl; external libgtk4;
function gtk_popover_menu_remove_child(popover: PGtkPopoverMenu; child: PGtkWidget): Tgboolean; cdecl; external libgtk4;

// === Konventiert am: 24-7-24 16:58:05 ===

function GTK_TYPE_POPOVER_MENU: TGType;
function GTK_POPOVER_MENU(obj: Pointer): PGtkPopoverMenu;
function GTK_IS_POPOVER_MENU(obj: Pointer): Tgboolean;

implementation

function GTK_TYPE_POPOVER_MENU: TGType;
begin
  GTK_TYPE_POPOVER_MENU := gtk_popover_menu_get_type;
end;

function GTK_POPOVER_MENU(obj: Pointer): PGtkPopoverMenu;
begin
  Result := PGtkPopoverMenu(g_type_check_instance_cast(obj, GTK_TYPE_POPOVER_MENU));
end;

function GTK_IS_POPOVER_MENU(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_POPOVER_MENU);
end;



end.
