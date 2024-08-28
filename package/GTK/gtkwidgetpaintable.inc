/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 28-08-2024   15:47                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}


  {G_DECLARE_FINAL_TYPE (GtkWidgetPaintable, gtk_widget_paintable, GTK, WIDGET_PAINTABLE, GObject) }
type
  TGtkWidgetPaintable = record
  end;
  PGtkWidgetPaintable = ^TGtkWidgetPaintable;

  TGtkWidgetPaintableClass = record
    parent_class: TGObjectClass;
  end;
  PGtkWidgetPaintableClass = ^TGtkWidgetPaintableClass;

function gtk_widget_paintable_get_type: TGType; cdecl; external libgtk4;
function gtk_widget_paintable_new(widget: PGtkWidget): PGdkPaintable; cdecl; external libgtk4;
function gtk_widget_paintable_get_widget(self: PGtkWidgetPaintable): PGtkWidget; cdecl; external libgtk4;
procedure gtk_widget_paintable_set_widget(self: PGtkWidgetPaintable; widget: PGtkWidget); cdecl; external libgtk4;

// === Konventiert am: 28-7-24 17:07:14 ===

function GTK_TYPE_WIDGET_PAINTABLE: TGType;
function GTK_WIDGET_PAINTABLE(obj: Pointer): PGtkWidgetPaintable;
function GTK_IS_WIDGET_PAINTABLE(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GTK_TYPE_WIDGET_PAINTABLE: TGType;
begin
  Result := gtk_widget_paintable_get_type;
end;

function GTK_WIDGET_PAINTABLE(obj: Pointer): PGtkWidgetPaintable;
begin
  Result := PGtkWidgetPaintable(g_type_check_instance_cast(obj, GTK_TYPE_WIDGET_PAINTABLE));
end;

function GTK_IS_WIDGET_PAINTABLE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_WIDGET_PAINTABLE);
end;




{$ENDIF read_implementation}
