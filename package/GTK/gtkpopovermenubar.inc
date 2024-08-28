/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 28-08-2024   15:47                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGtkPopoverMenuBar = record // _GtkPopoverMenuBar
  end;
  PGtkPopoverMenuBar = ^TGtkPopoverMenuBar;

function gtk_popover_menu_bar_get_type: TGType; cdecl; external libgtk4;
function gtk_popover_menu_bar_new_from_model(model: PGMenuModel): PGtkWidget; cdecl; external libgtk4;
procedure gtk_popover_menu_bar_set_menu_model(bar: PGtkPopoverMenuBar; model: PGMenuModel); cdecl; external libgtk4;
function gtk_popover_menu_bar_get_menu_model(bar: PGtkPopoverMenuBar): PGMenuModel; cdecl; external libgtk4;
function gtk_popover_menu_bar_add_child(bar: PGtkPopoverMenuBar; child: PGtkWidget; id: PChar): Tgboolean; cdecl; external libgtk4;
function gtk_popover_menu_bar_remove_child(bar: PGtkPopoverMenuBar; child: PGtkWidget): Tgboolean; cdecl; external libgtk4;

// === Konventiert am: 24-7-24 16:58:13 ===

function GTK_TYPE_POPOVER_MENU_BAR: TGType;
function GTK_POPOVER_MENU_BAR(obj: Pointer): PGtkPopoverMenuBar;
function GTK_IS_POPOVER_MENU_BAR(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GTK_TYPE_POPOVER_MENU_BAR: TGType;
begin
  GTK_TYPE_POPOVER_MENU_BAR := gtk_popover_menu_bar_get_type;
end;

function GTK_POPOVER_MENU_BAR(obj: Pointer): PGtkPopoverMenuBar;
begin
  Result := PGtkPopoverMenuBar(g_type_check_instance_cast(obj, GTK_TYPE_POPOVER_MENU_BAR));
end;

function GTK_IS_POPOVER_MENU_BAR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_POPOVER_MENU_BAR);
end;



{$ENDIF read_implementation}
