unit gtktooltip;

interface

uses
  glib2, common_GTK, GDK4, gtktypes, gtkwidget;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


function gtk_tooltip_get_type:TGType;cdecl;external libgtk4;
procedure gtk_tooltip_set_markup(tooltip:PGtkTooltip; markup:Pchar);cdecl;external libgtk4;
procedure gtk_tooltip_set_text(tooltip:PGtkTooltip; text:Pchar);cdecl;external libgtk4;
procedure gtk_tooltip_set_icon(tooltip:PGtkTooltip; paintable:PGdkPaintable);cdecl;external libgtk4;
procedure gtk_tooltip_set_icon_from_icon_name(tooltip:PGtkTooltip; icon_name:Pchar);cdecl;external libgtk4;
procedure gtk_tooltip_set_icon_from_gicon(tooltip:PGtkTooltip; gicon:PGIcon);cdecl;external libgtk4;
procedure gtk_tooltip_set_custom(tooltip:PGtkTooltip; custom_widget:PGtkWidget);cdecl;external libgtk4;
procedure gtk_tooltip_set_tip_area(tooltip:PGtkTooltip; rect:PGdkRectangle);cdecl;external libgtk4;

// === Konventiert am: 21-7-24 17:14:27 ===

function GTK_TYPE_TOOLTIP : TGType;
function GTK_TOOLTIP(obj : Pointer) : PGtkTooltip;
function GTK_IS_TOOLTIP(obj : Pointer) : Tgboolean;

implementation

function GTK_TYPE_TOOLTIP : TGType;
  begin
    GTK_TYPE_TOOLTIP:=gtk_tooltip_get_type;
  end;

function GTK_TOOLTIP(obj : Pointer) : PGtkTooltip;
begin
  Result := PGtkTooltip(g_type_check_instance_cast(obj, GTK_TYPE_TOOLTIP));
end;

function GTK_IS_TOOLTIP(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_TOOLTIP);
end;



end.
