unit gtktreestore;

interface

uses
  glib2, common_GTK, gtktreemodel;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGtkTreeStorePrivate = record
  end;
  PGtkTreeStorePrivate = ^TGtkTreeStorePrivate;

  TGtkTreeStore = record
    parent: TGObject;
    priv: PGtkTreeStorePrivate;
  end;
  PGtkTreeStore = ^TGtkTreeStore;

  TGtkTreeStoreClass = record
    parent_class: TGObjectClass;
    padding: array[0..7] of Tgpointer;
  end;
  PGtkTreeStoreClass = ^TGtkTreeStoreClass;


function gtk_tree_store_get_type: TGType; cdecl; external libgtk4;
function gtk_tree_store_new(n_columns: longint): PGtkTreeStore; varargs cdecl; external libgtk4;
function gtk_tree_store_newv(n_columns: longint; types: PGType): PGtkTreeStore; cdecl; external libgtk4;
procedure gtk_tree_store_set_column_types(tree_store: PGtkTreeStore; n_columns: longint; types: PGType); cdecl; external libgtk4;
procedure gtk_tree_store_set_value(tree_store: PGtkTreeStore; iter: PGtkTreeIter; column: longint; Value: PGValue); cdecl; external libgtk4;
procedure gtk_tree_store_set(tree_store: PGtkTreeStore; iter: PGtkTreeIter); varargs cdecl; external libgtk4;
procedure gtk_tree_store_set_valuesv(tree_store: PGtkTreeStore; iter: PGtkTreeIter; columns: Plongint; values: PGValue; n_values: longint); cdecl; external libgtk4;
procedure gtk_tree_store_set_valist(tree_store: PGtkTreeStore; iter: PGtkTreeIter; var_args: Tva_list); cdecl; external libgtk4;
function gtk_tree_store_remove(tree_store: PGtkTreeStore; iter: PGtkTreeIter): Tgboolean; cdecl; external libgtk4;
procedure gtk_tree_store_insert(tree_store: PGtkTreeStore; iter: PGtkTreeIter; parent: PGtkTreeIter; position: longint); cdecl; external libgtk4;
procedure gtk_tree_store_insert_before(tree_store: PGtkTreeStore; iter: PGtkTreeIter; parent: PGtkTreeIter; sibling: PGtkTreeIter); cdecl; external libgtk4;
procedure gtk_tree_store_insert_after(tree_store: PGtkTreeStore; iter: PGtkTreeIter; parent: PGtkTreeIter; sibling: PGtkTreeIter); cdecl; external libgtk4;
procedure gtk_tree_store_insert_with_values(tree_store: PGtkTreeStore; iter: PGtkTreeIter; parent: PGtkTreeIter; position: longint); varargs cdecl; external libgtk4;
procedure gtk_tree_store_insert_with_valuesv(tree_store: PGtkTreeStore; iter: PGtkTreeIter; parent: PGtkTreeIter; position: longint; columns: Plongint;
  values: PGValue; n_values: longint); cdecl; external libgtk4;
procedure gtk_tree_store_prepend(tree_store: PGtkTreeStore; iter: PGtkTreeIter; parent: PGtkTreeIter); cdecl; external libgtk4;
procedure gtk_tree_store_append(tree_store: PGtkTreeStore; iter: PGtkTreeIter; parent: PGtkTreeIter); cdecl; external libgtk4;
function gtk_tree_store_is_ancestor(tree_store: PGtkTreeStore; iter: PGtkTreeIter; descendant: PGtkTreeIter): Tgboolean; cdecl; external libgtk4;
function gtk_tree_store_iter_depth(tree_store: PGtkTreeStore; iter: PGtkTreeIter): longint; cdecl; external libgtk4;
procedure gtk_tree_store_clear(tree_store: PGtkTreeStore); cdecl; external libgtk4;
function gtk_tree_store_iter_is_valid(tree_store: PGtkTreeStore; iter: PGtkTreeIter): Tgboolean; cdecl; external libgtk4;
procedure gtk_tree_store_reorder(tree_store: PGtkTreeStore; parent: PGtkTreeIter; new_order: Plongint); cdecl; external libgtk4;
procedure gtk_tree_store_swap(tree_store: PGtkTreeStore; a: PGtkTreeIter; b: PGtkTreeIter); cdecl; external libgtk4;
procedure gtk_tree_store_move_before(tree_store: PGtkTreeStore; iter: PGtkTreeIter; position: PGtkTreeIter); cdecl; external libgtk4;
procedure gtk_tree_store_move_after(tree_store: PGtkTreeStore; iter: PGtkTreeIter; position: PGtkTreeIter); cdecl; external libgtk4;

// === Konventiert am: 30-7-24 15:26:30 ===

function GTK_TYPE_TREE_STORE: TGType;
function GTK_TREE_STORE(obj: Pointer): PGtkTreeStore;
function GTK_TREE_STORE_CLASS(klass: Pointer): PGtkTreeStoreClass;
function GTK_IS_TREE_STORE(obj: Pointer): Tgboolean;
function GTK_IS_TREE_STORE_CLASS(klass: Pointer): Tgboolean;
function GTK_TREE_STORE_GET_CLASS(obj: Pointer): PGtkTreeStoreClass;

implementation

function GTK_TYPE_TREE_STORE: TGType;
begin
  GTK_TYPE_TREE_STORE := gtk_tree_store_get_type;
end;

function GTK_TREE_STORE(obj: Pointer): PGtkTreeStore;
begin
  Result := PGtkTreeStore(g_type_check_instance_cast(obj, GTK_TYPE_TREE_STORE));
end;

function GTK_TREE_STORE_CLASS(klass: Pointer): PGtkTreeStoreClass;
begin
  Result := PGtkTreeStoreClass(g_type_check_class_cast(klass, GTK_TYPE_TREE_STORE));
end;

function GTK_IS_TREE_STORE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_TREE_STORE);
end;

function GTK_IS_TREE_STORE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_TREE_STORE);
end;

function GTK_TREE_STORE_GET_CLASS(obj: Pointer): PGtkTreeStoreClass;
begin
  Result := PGtkTreeStoreClass(PGTypeInstance(obj)^.g_class);
end;



end.
