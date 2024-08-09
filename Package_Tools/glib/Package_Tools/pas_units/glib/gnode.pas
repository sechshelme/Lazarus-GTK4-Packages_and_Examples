unit gnode;

interface

uses
  common_GLIB, gtypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

type
  PGTraverseFlags = ^TGTraverseFlags;
  TGTraverseFlags =  Longint;
  Const
    G_TRAVERSE_LEAVES = 1 shl 0;
    G_TRAVERSE_NON_LEAVES = 1 shl 1;
    G_TRAVERSE_ALL = G_TRAVERSE_LEAVES or G_TRAVERSE_NON_LEAVES;
    G_TRAVERSE_MASK = $03;
    G_TRAVERSE_LEAFS = G_TRAVERSE_LEAVES;
    G_TRAVERSE_NON_LEAFS = G_TRAVERSE_NON_LEAVES;
type
  PGTraverseType = ^TGTraverseType;
  TGTraverseType =  Longint;
  Const
    G_IN_ORDER = 0;
    G_PRE_ORDER = 1;
    G_POST_ORDER = 2;
    G_LEVEL_ORDER = 3;

type
  PGNode = ^TGNode;
  TGNode = record
      data : Tgpointer;
      next : PGNode;
      prev : PGNode;
      parent : PGNode;
      children : PGNode;
    end;
  TGNodeTraverseFunc = function (node:PGNode; data:Tgpointer):Tgboolean;cdecl;
  TGNodeForeachFunc = procedure (node:PGNode; data:Tgpointer);cdecl;

function G_NODE_IS_ROOT (node: PGNode): boolean;
function G_NODE_IS_LEAF (node: PGNode): boolean;

function g_node_new(data:Tgpointer):PGNode;cdecl;external libglib2;
procedure g_node_destroy(root:PGNode);cdecl;external libglib2;
procedure g_node_unlink(node:PGNode);cdecl;external libglib2;
function g_node_copy_deep(node:PGNode; copy_func:TGCopyFunc; data:Tgpointer):PGNode;cdecl;external libglib2;
function g_node_copy(node:PGNode):PGNode;cdecl;external libglib2;
function g_node_insert(parent:PGNode; position:Tgint; node:PGNode):PGNode;cdecl;external libglib2;
function g_node_insert_before(parent:PGNode; sibling:PGNode; node:PGNode):PGNode;cdecl;external libglib2;
function g_node_insert_after(parent:PGNode; sibling:PGNode; node:PGNode):PGNode;cdecl;external libglib2;
function g_node_prepend(parent:PGNode; node:PGNode):PGNode;cdecl;external libglib2;
function g_node_n_nodes(root:PGNode; flags:TGTraverseFlags):Tguint;cdecl;external libglib2;
function g_node_get_root(node:PGNode):PGNode;cdecl;external libglib2;
function g_node_is_ancestor(node:PGNode; descendant:PGNode):Tgboolean;cdecl;external libglib2;
function g_node_depth(node:PGNode):Tguint;cdecl;external libglib2;
function g_node_find(root:PGNode; order:TGTraverseType; flags:TGTraverseFlags; data:Tgpointer):PGNode;cdecl;external libglib2;
procedure g_node_traverse(root:PGNode; order:TGTraverseType; flags:TGTraverseFlags; max_depth:Tgint; func:TGNodeTraverseFunc;
            data:Tgpointer);cdecl;external libglib2;
function g_node_max_height(root:PGNode):Tguint;cdecl;external libglib2;
procedure g_node_children_foreach(node:PGNode; flags:TGTraverseFlags; func:TGNodeForeachFunc; data:Tgpointer);cdecl;external libglib2;
procedure g_node_reverse_children(node:PGNode);cdecl;external libglib2;
function g_node_n_children(node:PGNode):Tguint;cdecl;external libglib2;
function g_node_nth_child(node:PGNode; n:Tguint):PGNode;cdecl;external libglib2;
function g_node_last_child(node:PGNode):PGNode;cdecl;external libglib2;
function g_node_find_child(node:PGNode; flags:TGTraverseFlags; data:Tgpointer):PGNode;cdecl;external libglib2;
function g_node_child_position(node:PGNode; child:PGNode):Tgint;cdecl;external libglib2;
function g_node_child_index(node:PGNode; data:Tgpointer):Tgint;cdecl;external libglib2;
function g_node_first_sibling(node:PGNode):PGNode;cdecl;external libglib2;
function g_node_last_sibling(node:PGNode):PGNode;cdecl;external libglib2;

function  g_node_append (parent: PGNode; node: PGNode): PGNode;
function  g_node_insert_data (parent: PGNode; position: Tgint; data: Tgpointer): PGNode;
function  g_node_insert_data_before (parent: PGNode; sibling: PGNode; data: Tgpointer): PGNode;
function  g_node_prepend_data (parent: PGNode; data: Tgpointer): PGNode;
function  g_node_append_data (parent: PGNode; data: Tgpointer): PGNode;
function g_node_prev_sibling (node : PGNode): PGNode;
function g_node_next_sibling (node : PGNode): PGNode;
function g_node_first_child (node : PGNode): PGNode;


// === Konventiert am: 9-8-24 16:52:28 ===


implementation


function G_NODE_IS_ROOT (node: PGNode): boolean;
begin
  G_NODE_IS_ROOT := (node^.parent = nil) and (node^.next = nil) and (node^.prev = nil);
end;

function G_NODE_IS_LEAF (node: PGNode): boolean;
begin
  G_NODE_IS_LEAF := node^.children = nil;
end;

function  g_node_append (parent: PGNode; node: PGNode): PGNode;
begin
   g_node_append := g_node_insert_before (parent, nil, node);
end;

function g_node_insert_data(parent: PGNode; position: Tgint; data: Tgpointer
  ): PGNode;
begin
   g_node_insert_data := g_node_insert (parent, position, g_node_new(data));
end;

function g_node_insert_data_before(parent: PGNode; sibling: PGNode;
  data: Tgpointer): PGNode;
begin
   g_node_insert_data_before := g_node_insert_before (parent, sibling, g_node_new(data));
end;

function g_node_prepend_data(parent: PGNode; data: Tgpointer): PGNode;
begin
   g_node_prepend_data := g_node_prepend (parent, g_node_new(data));
end;

function g_node_append_data(parent: PGNode; data: Tgpointer): PGNode;
begin
   g_node_append_data := g_node_insert_before (parent, nil, g_node_new(data));
end;

function g_node_prev_sibling (node : PGNode): PGNode;
begin
  if node <> nil then
    g_node_prev_sibling := node^.prev
  else
    g_node_prev_sibling := nil;
end;

function g_node_next_sibling (node : PGNode): PGNode;
begin
  if node <> nil then
    g_node_next_sibling := node^.next
  else
    g_node_next_sibling := nil;
end;

function g_node_first_child (node : PGNode): PGNode;
begin
  if node <> nil then
    g_node_first_child := node^.children
  else
    g_node_first_child := nil;
end;




end.
