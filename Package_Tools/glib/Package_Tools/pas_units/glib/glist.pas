unit glist;

interface

uses
  common_GLIB, gtypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PGList = ^TGList;

  TGList = record
    Data: Tgpointer;
    Next: PGList;
    prev: PGList;
  end;
  PPGList = ^PGList;

function g_list_alloc: PGList; cdecl; external libglib2;
procedure g_list_free(list: PGList); cdecl; external libglib2;
procedure g_list_free_1(list: PGList); cdecl; external libglib2;
//const
//  g_list_free1 = g_list_free_1;  

procedure g_list_free_full(list: PGList; free_func: TGDestroyNotify); cdecl; external libglib2;
function g_list_append(list: PGList; Data: Tgpointer): PGList; cdecl; external libglib2;
function g_list_prepend(list: PGList; Data: Tgpointer): PGList; cdecl; external libglib2;
function g_list_insert(list: PGList; Data: Tgpointer; position: Tgint): PGList; cdecl; external libglib2;
function g_list_insert_sorted(list: PGList; Data: Tgpointer; func: TGCompareFunc): PGList; cdecl; external libglib2;
function g_list_insert_sorted_with_data(list: PGList; Data: Tgpointer; func: TGCompareDataFunc; user_data: Tgpointer): PGList; cdecl; external libglib2;
function g_list_insert_before(list: PGList; sibling: PGList; Data: Tgpointer): PGList; cdecl; external libglib2;
function g_list_insert_before_link(list: PGList; sibling: PGList; link_: PGList): PGList; cdecl; external libglib2;
function g_list_concat(list1: PGList; list2: PGList): PGList; cdecl; external libglib2;
function g_list_remove(list: PGList; Data: Tgconstpointer): PGList; cdecl; external libglib2;
function g_list_remove_all(list: PGList; Data: Tgconstpointer): PGList; cdecl; external libglib2;
function g_list_remove_link(list: PGList; llink: PGList): PGList; cdecl; external libglib2;
function g_list_delete_link(list: PGList; link_: PGList): PGList; cdecl; external libglib2;
function g_list_reverse(list: PGList): PGList; cdecl; external libglib2;
function g_list_copy(list: PGList): PGList; cdecl; external libglib2;
function g_list_copy_deep(list: PGList; func: TGCopyFunc; user_data: Tgpointer): PGList; cdecl; external libglib2;
function g_list_nth(list: PGList; n: Tguint): PGList; cdecl; external libglib2;
function g_list_nth_prev(list: PGList; n: Tguint): PGList; cdecl; external libglib2;
function g_list_find(list: PGList; Data: Tgconstpointer): PGList; cdecl; external libglib2;
function g_list_find_custom(list: PGList; Data: Tgconstpointer; func: TGCompareFunc): PGList; cdecl; external libglib2;
function g_list_position(list: PGList; llink: PGList): Tgint; cdecl; external libglib2;
function g_list_index(list: PGList; Data: Tgconstpointer): Tgint; cdecl; external libglib2;
function g_list_last(list: PGList): PGList; cdecl; external libglib2;
function g_list_first(list: PGList): PGList; cdecl; external libglib2;
function g_list_length(list: PGList): Tguint; cdecl; external libglib2;
procedure g_list_foreach(list: PGList; func: TGFunc; user_data: Tgpointer); cdecl; external libglib2;
function g_list_sort(list: PGList; compare_func: TGCompareFunc): PGList; cdecl; external libglib2;
function g_list_sort_with_data(list: PGList; compare_func: TGCompareDataFunc; user_data: Tgpointer): PGList; cdecl; external libglib2;
function g_list_nth_data(list: PGList; n: Tguint): Tgpointer; cdecl; external libglib2;
procedure g_clear_list(list_ptr: PPGList; Destroy: TGDestroyNotify); cdecl; external libglib2;
{
#define  g_clear_list(list_ptr, destroy)       \
  G_STMT_START                                \
    GList *_list;                              \
                                               \
    _list = *(list_ptr);                       \
    if (_list)                                 \
                                              \
        *list_ptr = NULL;                      \
                                               \
        if ((destroy) != NULL)                 \
          g_list_free_full (_list, (destroy)); \
        else                                   \
          g_list_free (_list);                 \
                                              \
   G_STMT_END                                 \
  GLIB_AVAILABLE_MACRO_IN_2_64
 }

function g_list_previous(list: PGList): PGList;
function g_list_next(list: PGList): PGList;


// === Konventiert am: 7-8-24 16:41:08 ===


implementation


function g_list_previous(list: PGList): PGList;
var
  if_local1: PGList;
begin
  if list <> nil then begin
    if_local1 := (PGList(list))^.prev;
  end else begin
    if_local1 := nil;
  end;
  g_list_previous := if_local1;
end;

function g_list_next(list: PGList): PGList;
var
  if_local1: PGList;
begin
  if list <> nil then begin
    if_local1 := (PGList(list))^.Next;
  end else begin
    if_local1 := nil;
  end;
  g_list_next := if_local1;
end;


end.
