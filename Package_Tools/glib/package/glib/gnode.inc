/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  PGTraverseFlags = ^TGTraverseFlags;
  TGTraverseFlags = longint;

const
  G_TRAVERSE_LEAVES = 1 shl 0;
  G_TRAVERSE_NON_LEAVES = 1 shl 1;
  G_TRAVERSE_ALL = G_TRAVERSE_LEAVES or G_TRAVERSE_NON_LEAVES;
  G_TRAVERSE_MASK = $03;
  G_TRAVERSE_LEAFS = G_TRAVERSE_LEAVES;
  G_TRAVERSE_NON_LEAFS = G_TRAVERSE_NON_LEAVES;

type
  PGTraverseType = ^TGTraverseType;
  TGTraverseType = longint;

const
  G_IN_ORDER = 0;
  G_PRE_ORDER = 1;
  G_POST_ORDER = 2;
  G_LEVEL_ORDER = 3;

type
  PGNode = ^TGNode;

  TGNode = record
    Data: Tgpointer;
    Next: PGNode;
    prev: PGNode;
    parent: PGNode;
    children: PGNode;
  end;
  TGNodeTraverseFunc = function(node: PGNode; Data: Tgpointer): Tgboolean; cdecl;
  TGNodeForeachFunc = procedure(node: PGNode; Data: Tgpointer); cdecl;

function G_NODE_IS_ROOT(node: PGNode): boolean;
function G_NODE_IS_LEAF(node: PGNode): boolean;

function g_node_new(Data: Tgpointer): PGNode; cdecl; external libglib2;
procedure g_node_destroy(root: PGNode); cdecl; external libglib2;
procedure g_node_unlink(node: PGNode); cdecl; external libglib2;
function g_node_copy_deep(node: PGNode; copy_func: TGCopyFunc; Data: Tgpointer): PGNode; cdecl; external libglib2;
function g_node_copy(node: PGNode): PGNode; cdecl; external libglib2;
function g_node_insert(parent: PGNode; position: Tgint; node: PGNode): PGNode; cdecl; external libglib2;
function g_node_insert_before(parent: PGNode; sibling: PGNode; node: PGNode): PGNode; cdecl; external libglib2;
function g_node_insert_after(parent: PGNode; sibling: PGNode; node: PGNode): PGNode; cdecl; external libglib2;
function g_node_prepend(parent: PGNode; node: PGNode): PGNode; cdecl; external libglib2;
function g_node_n_nodes(root: PGNode; flags: TGTraverseFlags): Tguint; cdecl; external libglib2;
function g_node_get_root(node: PGNode): PGNode; cdecl; external libglib2;
function g_node_is_ancestor(node: PGNode; descendant: PGNode): Tgboolean; cdecl; external libglib2;
function g_node_depth(node: PGNode): Tguint; cdecl; external libglib2;
function g_node_find(root: PGNode; order: TGTraverseType; flags: TGTraverseFlags; Data: Tgpointer): PGNode; cdecl; external libglib2;
procedure g_node_traverse(root: PGNode; order: TGTraverseType; flags: TGTraverseFlags; max_depth: Tgint; func: TGNodeTraverseFunc;
  Data: Tgpointer); cdecl; external libglib2;
function g_node_max_height(root: PGNode): Tguint; cdecl; external libglib2;
procedure g_node_children_foreach(node: PGNode; flags: TGTraverseFlags; func: TGNodeForeachFunc; Data: Tgpointer); cdecl; external libglib2;
procedure g_node_reverse_children(node: PGNode); cdecl; external libglib2;
function g_node_n_children(node: PGNode): Tguint; cdecl; external libglib2;
function g_node_nth_child(node: PGNode; n: Tguint): PGNode; cdecl; external libglib2;
function g_node_last_child(node: PGNode): PGNode; cdecl; external libglib2;
function g_node_find_child(node: PGNode; flags: TGTraverseFlags; Data: Tgpointer): PGNode; cdecl; external libglib2;
function g_node_child_position(node: PGNode; child: PGNode): Tgint; cdecl; external libglib2;
function g_node_child_index(node: PGNode; Data: Tgpointer): Tgint; cdecl; external libglib2;
function g_node_first_sibling(node: PGNode): PGNode; cdecl; external libglib2;
function g_node_last_sibling(node: PGNode): PGNode; cdecl; external libglib2;

function g_node_append(parent: PGNode; node: PGNode): PGNode;
function g_node_insert_data(parent: PGNode; position: Tgint; Data: Tgpointer): PGNode;
function g_node_insert_data_after(parent: PGNode; sibling: PGNode; Data: Tgpointer): PGNode;
function g_node_insert_data_before(parent: PGNode; sibling: PGNode; Data: Tgpointer): PGNode;
function g_node_prepend_data(parent: PGNode; Data: Tgpointer): PGNode;
function g_node_append_data(parent: PGNode; Data: Tgpointer): PGNode;
function g_node_prev_sibling(node: PGNode): PGNode;
function g_node_next_sibling(node: PGNode): PGNode;
function g_node_first_child(node: PGNode): PGNode;


// === Konventiert am: 9-8-24 16:52:28 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function G_NODE_IS_ROOT(node: PGNode): boolean;
begin
  G_NODE_IS_ROOT := (node^.parent = nil) and (node^.Next = nil) and (node^.prev = nil);
end;

function G_NODE_IS_LEAF(node: PGNode): boolean;
begin
  G_NODE_IS_LEAF := node^.children = nil;
end;

function g_node_append(parent: PGNode; node: PGNode): PGNode;
begin
  g_node_append := g_node_insert_before(parent, nil, node);
end;

function g_node_insert_data(parent: PGNode; position: Tgint; Data: Tgpointer): PGNode;
begin
  g_node_insert_data := g_node_insert(parent, position, g_node_new(Data));
end;

function g_node_insert_data_after(parent: PGNode; sibling: PGNode; Data: Tgpointer): PGNode;
begin
  g_node_insert_data_after := g_node_insert_after(parent, sibling, g_node_new(Data));
end;

function g_node_insert_data_before(parent: PGNode; sibling: PGNode; Data: Tgpointer): PGNode;
begin
  g_node_insert_data_before := g_node_insert_before(parent, sibling, g_node_new(Data));
end;

function g_node_prepend_data(parent: PGNode; Data: Tgpointer): PGNode;
begin
  g_node_prepend_data := g_node_prepend(parent, g_node_new(Data));
end;

function g_node_append_data(parent: PGNode; Data: Tgpointer): PGNode;
begin
  g_node_append_data := g_node_insert_before(parent, nil, g_node_new(Data));
end;

function g_node_prev_sibling(node: PGNode): PGNode;
begin
  if node <> nil then begin
    g_node_prev_sibling := node^.prev;
  end else begin
    g_node_prev_sibling := nil;
  end;
end;

function g_node_next_sibling(node: PGNode): PGNode;
begin
  if node <> nil then begin
    g_node_next_sibling := node^.Next;
  end else begin
    g_node_next_sibling := nil;
  end;
end;

function g_node_first_child(node: PGNode): PGNode;
begin
  if node <> nil then begin
    g_node_first_child := node^.children;
  end else begin
    g_node_first_child := nil;
  end;
end;




{$ENDIF read_implementation}
