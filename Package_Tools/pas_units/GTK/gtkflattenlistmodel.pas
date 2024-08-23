unit gtkflattenlistmodel;

interface

uses
  glib2, common_GTK;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {G_DECLARE_FINAL_TYPE (GtkFlattenListModel, gtk_flatten_list_model, GTK, FLATTEN_LIST_MODEL, GObject) }
type
  TGtkFlattenListModel = record
  end;
  PGtkFlattenListModel = ^TGtkFlattenListModel;

  TGtkFlattenListModelClass = record
    parent_class: TGObjectClass;
  end;
  PGtkFlattenListModelClass = ^TGtkFlattenListModelClass;

function gtk_flatten_list_model_get_type: TGType; cdecl; external libgtk4;
function gtk_flatten_list_model_new(model: PGListModel): PGtkFlattenListModel; cdecl; external libgtk4;
procedure gtk_flatten_list_model_set_model(self: PGtkFlattenListModel; model: PGListModel); cdecl; external libgtk4;
function gtk_flatten_list_model_get_model(self: PGtkFlattenListModel): PGListModel; cdecl; external libgtk4;
function gtk_flatten_list_model_get_model_for_item(self: PGtkFlattenListModel; position: Tguint): PGListModel; cdecl; external libgtk4;

// === Konventiert am: 27-7-24 15:28:29 ===

function GTK_TYPE_FLATTEN_LIST_MODEL: TGType;
function GTK_FLATTEN_LIST_MODEL(obj: Pointer): PGtkFlattenListModel;
function GTK_IS_FLATTEN_LIST_MODEL(obj: Pointer): Tgboolean;

implementation

function GTK_TYPE_FLATTEN_LIST_MODEL: TGType;
begin
  Result := gtk_flatten_list_model_get_type;
end;

function GTK_FLATTEN_LIST_MODEL(obj: Pointer): PGtkFlattenListModel;
begin
  Result := PGtkFlattenListModel(g_type_check_instance_cast(obj, GTK_TYPE_FLATTEN_LIST_MODEL));
end;

function GTK_IS_FLATTEN_LIST_MODEL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_FLATTEN_LIST_MODEL);
end;




end.
