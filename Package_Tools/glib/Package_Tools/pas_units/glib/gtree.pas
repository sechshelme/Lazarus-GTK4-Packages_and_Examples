unit gtree;

interface

uses
  common_GLIB, gtypes, gnode;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGTreeNode=record
      end;
  PGTreeNode=^TGTreeNode;

  TGTree=record
      end;
  PGTree=^TGTree;

  TGTraverseFunc = function(key: Tgpointer; Value: Tgpointer; Data: Tgpointer): Tgboolean; cdecl;
  TGTraverseNodeFunc = function(node: PGTreeNode; Data: Tgpointer): Tgboolean; cdecl;

function g_tree_new(key_compare_func: TGCompareFunc): PGTree; cdecl; external libglib2;
function g_tree_new_with_data(key_compare_func: TGCompareDataFunc; key_compare_data: Tgpointer): PGTree; cdecl; external libglib2;
function g_tree_new_full(key_compare_func: TGCompareDataFunc; key_compare_data: Tgpointer; key_destroy_func: TGDestroyNotify; value_destroy_func: TGDestroyNotify): PGTree; cdecl; external libglib2;
function g_tree_node_first(tree: PGTree): PGTreeNode; cdecl; external libglib2;
function g_tree_node_last(tree: PGTree): PGTreeNode; cdecl; external libglib2;
function g_tree_node_previous(node: PGTreeNode): PGTreeNode; cdecl; external libglib2;
function g_tree_node_next(node: PGTreeNode): PGTreeNode; cdecl; external libglib2;
function g_tree_ref(tree: PGTree): PGTree; cdecl; external libglib2;
procedure g_tree_unref(tree: PGTree); cdecl; external libglib2;
procedure g_tree_destroy(tree: PGTree); cdecl; external libglib2;
function g_tree_insert_node(tree: PGTree; key: Tgpointer; Value: Tgpointer): PGTreeNode; cdecl; external libglib2;
procedure g_tree_insert(tree: PGTree; key: Tgpointer; Value: Tgpointer); cdecl; external libglib2;
function g_tree_replace_node(tree: PGTree; key: Tgpointer; Value: Tgpointer): PGTreeNode; cdecl; external libglib2;
procedure g_tree_replace(tree: PGTree; key: Tgpointer; Value: Tgpointer); cdecl; external libglib2;
function g_tree_remove(tree: PGTree; key: Tgconstpointer): Tgboolean; cdecl; external libglib2;
procedure g_tree_remove_all(tree: PGTree); cdecl; external libglib2;
function g_tree_steal(tree: PGTree; key: Tgconstpointer): Tgboolean; cdecl; external libglib2;
function g_tree_node_key(node: PGTreeNode): Tgpointer; cdecl; external libglib2;
function g_tree_node_value(node: PGTreeNode): Tgpointer; cdecl; external libglib2;
function g_tree_lookup_node(tree: PGTree; key: Tgconstpointer): PGTreeNode; cdecl; external libglib2;
function g_tree_lookup(tree: PGTree; key: Tgconstpointer): Tgpointer; cdecl; external libglib2;
function g_tree_lookup_extended(tree: PGTree; lookup_key: Tgconstpointer; orig_key: Pgpointer; Value: Pgpointer): Tgboolean; cdecl; external libglib2;
procedure g_tree_foreach(tree: PGTree; func: TGTraverseFunc; user_data: Tgpointer); cdecl; external libglib2;
procedure g_tree_foreach_node(tree: PGTree; func: TGTraverseNodeFunc; user_data: Tgpointer); cdecl; external libglib2;
procedure g_tree_traverse(tree: PGTree; traverse_func: TGTraverseFunc; traverse_type: TGTraverseType; user_data: Tgpointer); cdecl; external libglib2;
function g_tree_search_node(tree: PGTree; search_func: TGCompareFunc; user_data: Tgconstpointer): PGTreeNode; cdecl; external libglib2;
function g_tree_search(tree: PGTree; search_func: TGCompareFunc; user_data: Tgconstpointer): Tgpointer; cdecl; external libglib2;
function g_tree_lower_bound(tree: PGTree; key: Tgconstpointer): PGTreeNode; cdecl; external libglib2;
function g_tree_upper_bound(tree: PGTree; key: Tgconstpointer): PGTreeNode; cdecl; external libglib2;
function g_tree_height(tree: PGTree): Tgint; cdecl; external libglib2;
function g_tree_nnodes(tree: PGTree): Tgint; cdecl; external libglib2;

procedure g_tree_dump(tree: PGTree); cdecl; external libglib2;

// === Konventiert am: 10-8-24 17:31:06 ===


implementation



end.
