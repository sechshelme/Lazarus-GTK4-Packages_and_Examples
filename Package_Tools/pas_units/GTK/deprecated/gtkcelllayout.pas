unit gtkcelllayout;

interface

uses
  glib2, common_GTK, gtkbuilder, gtkbuildable, gtktreemodel, gtkcellrenderer, gtkcellarea;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGtkCellLayout = record
  end;
  PGtkCellLayout = ^TGtkCellLayout;

  TGtkCellLayoutDataFunc = procedure(cell_layout: PGtkCellLayout; cell: PGtkCellRenderer; tree_model: PGtkTreeModel; iter: PGtkTreeIter; Data: Tgpointer); cdecl;

  TGtkCellLayoutIface = record
    g_iface: TGTypeInterface;
    pack_start: procedure(cell_layout: PGtkCellLayout; cell: PGtkCellRenderer; expand: Tgboolean); cdecl;
    pack_end: procedure(cell_layout: PGtkCellLayout; cell: PGtkCellRenderer; expand: Tgboolean); cdecl;
    Clear: procedure(cell_layout: PGtkCellLayout); cdecl;
    add_attribute: procedure(cell_layout: PGtkCellLayout; cell: PGtkCellRenderer; attribute: PChar; column: longint); cdecl;
    set_cell_data_func: procedure(cell_layout: PGtkCellLayout; cell: PGtkCellRenderer; func: TGtkCellLayoutDataFunc; func_data: Tgpointer; Destroy: TGDestroyNotify); cdecl;
    clear_attributes: procedure(cell_layout: PGtkCellLayout; cell: PGtkCellRenderer); cdecl;
    reorder: procedure(cell_layout: PGtkCellLayout; cell: PGtkCellRenderer; position: longint); cdecl;
    get_cells: function(cell_layout: PGtkCellLayout): PGList; cdecl;
    get_area: function(cell_layout: PGtkCellLayout): PGtkCellArea; cdecl;
  end;
  PGtkCellLayoutIface = ^TGtkCellLayoutIface;


function gtk_cell_layout_get_type: TGType; cdecl; external libgtk4;
procedure gtk_cell_layout_pack_start(cell_layout: PGtkCellLayout; cell: PGtkCellRenderer; expand: Tgboolean); cdecl; external libgtk4;
procedure gtk_cell_layout_pack_end(cell_layout: PGtkCellLayout; cell: PGtkCellRenderer; expand: Tgboolean); cdecl; external libgtk4;
function gtk_cell_layout_get_cells(cell_layout: PGtkCellLayout): PGList; cdecl; external libgtk4;
procedure gtk_cell_layout_clear(cell_layout: PGtkCellLayout); cdecl; external libgtk4;
procedure gtk_cell_layout_set_attributes(cell_layout: PGtkCellLayout; cell: PGtkCellRenderer; args: array of const); cdecl; external libgtk4;
procedure gtk_cell_layout_set_attributes(cell_layout: PGtkCellLayout; cell: PGtkCellRenderer); cdecl; external libgtk4;
procedure gtk_cell_layout_add_attribute(cell_layout: PGtkCellLayout; cell: PGtkCellRenderer; attribute: PChar; column: longint); cdecl; external libgtk4;
procedure gtk_cell_layout_set_cell_data_func(cell_layout: PGtkCellLayout; cell: PGtkCellRenderer; func: TGtkCellLayoutDataFunc; func_data: Tgpointer; Destroy: TGDestroyNotify); cdecl; external libgtk4;
procedure gtk_cell_layout_clear_attributes(cell_layout: PGtkCellLayout; cell: PGtkCellRenderer); cdecl; external libgtk4;
procedure gtk_cell_layout_reorder(cell_layout: PGtkCellLayout; cell: PGtkCellRenderer; position: longint); cdecl; external libgtk4;
function gtk_cell_layout_get_area(cell_layout: PGtkCellLayout): PGtkCellArea; cdecl; external libgtk4;
function _gtk_cell_layout_buildable_custom_tag_start(buildable: PGtkBuildable; builder: PGtkBuilder; child: PGObject; tagname: PChar; parser: PGtkBuildableParser;
  Data: Pgpointer): Tgboolean; cdecl; external libgtk4;
function _gtk_cell_layout_buildable_custom_tag_end(buildable: PGtkBuildable; builder: PGtkBuilder; child: PGObject; tagname: PChar; Data: Pgpointer): Tgboolean; cdecl; external libgtk4;
procedure _gtk_cell_layout_buildable_add_child(buildable: PGtkBuildable; builder: PGtkBuilder; child: PGObject; _type: PChar); cdecl; external libgtk4;

// === Konventiert am: 29-7-24 16:59:49 ===

function GTK_TYPE_CELL_LAYOUT: TGType;
function GTK_CELL_LAYOUT(obj: Pointer): PGtkCellLayout;
function GTK_IS_CELL_LAYOUT(obj: Pointer): Tgboolean;
function GTK_CELL_LAYOUT_GET_IFACE(obj: Pointer): PGtkCellLayoutIface;


implementation

function GTK_TYPE_CELL_LAYOUT: TGType;
begin
  GTK_TYPE_CELL_LAYOUT := gtk_cell_layout_get_type;
end;

function GTK_CELL_LAYOUT(obj: Pointer): PGtkCellLayout;
begin
  Result := PGtkCellLayout(g_type_check_instance_cast(obj, GTK_TYPE_CELL_LAYOUT));
end;

function GTK_IS_CELL_LAYOUT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_CELL_LAYOUT);
end;

function GTK_CELL_LAYOUT_GET_IFACE(obj: Pointer): PGtkCellLayoutIface;
begin
  Result := g_type_interface_peek(obj, GTK_TYPE_CELL_LAYOUT);
end;


end.
