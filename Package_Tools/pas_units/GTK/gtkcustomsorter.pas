unit gtkcustomsorter;

interface

uses
  glib2, common_GTK, gtksorter;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {G_DECLARE_FINAL_TYPE (GtkCustomSorter, gtk_custom_sorter, GTK, CUSTOM_SORTER, GtkSorter) }
type
  TGtkCustomSorter = record
  end;
  PGtkCustomSorter = ^TGtkCustomSorter;

  TGtkCustomSorterClass = record
    parent_class: TGtkSorterClass;
  end;
  PGtkCustomSorterClass = ^TGtkCustomSorterClass;

function gtk_custom_sorter_get_type: TGType; cdecl; external libgtk4;
function gtk_custom_sorter_new(sort_func: TGCompareDataFunc; user_data: Tgpointer; user_destroy: TGDestroyNotify): PGtkCustomSorter; cdecl; external libgtk4;
procedure gtk_custom_sorter_set_sort_func(self: PGtkCustomSorter; sort_func: TGCompareDataFunc; user_data: Tgpointer; user_destroy: TGDestroyNotify); cdecl; external libgtk4;

// === Konventiert am: 24-7-24 19:36:33 ===

function GTK_TYPE_CUSTOM_SORTER: TGType;
function GTK_CUSTOM_SORTER(obj: Pointer): PGtkCustomSorter;
function GTK_IS_CUSTOM_SORTER(obj: Pointer): Tgboolean;

implementation

function GTK_TYPE_CUSTOM_SORTER: TGType;
begin
  Result := gtk_custom_sorter_get_type;
end;

function GTK_CUSTOM_SORTER(obj: Pointer): PGtkCustomSorter;
begin
  Result := PGtkCustomSorter(g_type_check_instance_cast(obj, GTK_TYPE_CUSTOM_SORTER));
end;

function GTK_IS_CUSTOM_SORTER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_CUSTOM_SORTER);
end;




end.
