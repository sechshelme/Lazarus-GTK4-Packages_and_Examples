/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  PGQueue = ^TGQueue;

  TGQueue = record
    head: PGList;
    tail: PGList;
    length: Tguint;
  end;

  {#define G_QUEUE_INIT  NULL, NULL, 0  }

function g_queue_new: PGQueue; cdecl; external libglib2;
procedure g_queue_free(queue: PGQueue); cdecl; external libglib2;
procedure g_queue_free_full(queue: PGQueue; free_func: TGDestroyNotify); cdecl; external libglib2;
procedure g_queue_init(queue: PGQueue); cdecl; external libglib2;
procedure g_queue_clear(queue: PGQueue); cdecl; external libglib2;
function g_queue_is_empty(queue: PGQueue): Tgboolean; cdecl; external libglib2;
procedure g_queue_clear_full(queue: PGQueue; free_func: TGDestroyNotify); cdecl; external libglib2;
function g_queue_get_length(queue: PGQueue): Tguint; cdecl; external libglib2;
procedure g_queue_reverse(queue: PGQueue); cdecl; external libglib2;
function g_queue_copy(queue: PGQueue): PGQueue; cdecl; external libglib2;
procedure g_queue_foreach(queue: PGQueue; func: TGFunc; user_data: Tgpointer); cdecl; external libglib2;
function g_queue_find(queue: PGQueue; Data: Tgconstpointer): PGList; cdecl; external libglib2;
function g_queue_find_custom(queue: PGQueue; Data: Tgconstpointer; func: TGCompareFunc): PGList; cdecl; external libglib2;
procedure g_queue_sort(queue: PGQueue; compare_func: TGCompareDataFunc; user_data: Tgpointer); cdecl; external libglib2;
procedure g_queue_push_head(queue: PGQueue; Data: Tgpointer); cdecl; external libglib2;
procedure g_queue_push_tail(queue: PGQueue; Data: Tgpointer); cdecl; external libglib2;
procedure g_queue_push_nth(queue: PGQueue; Data: Tgpointer; n: Tgint); cdecl; external libglib2;
function g_queue_pop_head(queue: PGQueue): Tgpointer; cdecl; external libglib2;
function g_queue_pop_tail(queue: PGQueue): Tgpointer; cdecl; external libglib2;
function g_queue_pop_nth(queue: PGQueue; n: Tguint): Tgpointer; cdecl; external libglib2;
function g_queue_peek_head(queue: PGQueue): Tgpointer; cdecl; external libglib2;
function g_queue_peek_tail(queue: PGQueue): Tgpointer; cdecl; external libglib2;
function g_queue_peek_nth(queue: PGQueue; n: Tguint): Tgpointer; cdecl; external libglib2;
function g_queue_index(queue: PGQueue; Data: Tgconstpointer): Tgint; cdecl; external libglib2;
function g_queue_remove(queue: PGQueue; Data: Tgconstpointer): Tgboolean; cdecl; external libglib2;
function g_queue_remove_all(queue: PGQueue; Data: Tgconstpointer): Tguint; cdecl; external libglib2;
procedure g_queue_insert_before(queue: PGQueue; sibling: PGList; Data: Tgpointer); cdecl; external libglib2;
procedure g_queue_insert_before_link(queue: PGQueue; sibling: PGList; link_: PGList); cdecl; external libglib2;
procedure g_queue_insert_after(queue: PGQueue; sibling: PGList; Data: Tgpointer); cdecl; external libglib2;
procedure g_queue_insert_after_link(queue: PGQueue; sibling: PGList; link_: PGList); cdecl; external libglib2;
procedure g_queue_insert_sorted(queue: PGQueue; Data: Tgpointer; func: TGCompareDataFunc; user_data: Tgpointer); cdecl; external libglib2;
procedure g_queue_push_head_link(queue: PGQueue; link_: PGList); cdecl; external libglib2;
procedure g_queue_push_tail_link(queue: PGQueue; link_: PGList); cdecl; external libglib2;
procedure g_queue_push_nth_link(queue: PGQueue; n: Tgint; link_: PGList); cdecl; external libglib2;
function g_queue_pop_head_link(queue: PGQueue): PGList; cdecl; external libglib2;
function g_queue_pop_tail_link(queue: PGQueue): PGList; cdecl; external libglib2;
function g_queue_pop_nth_link(queue: PGQueue; n: Tguint): PGList; cdecl; external libglib2;
function g_queue_peek_head_link(queue: PGQueue): PGList; cdecl; external libglib2;
function g_queue_peek_tail_link(queue: PGQueue): PGList; cdecl; external libglib2;
function g_queue_peek_nth_link(queue: PGQueue; n: Tguint): PGList; cdecl; external libglib2;
function g_queue_link_index(queue: PGQueue; link_: PGList): Tgint; cdecl; external libglib2;
procedure g_queue_unlink(queue: PGQueue; link_: PGList); cdecl; external libglib2;
procedure g_queue_delete_link(queue: PGQueue; link_: PGList); cdecl; external libglib2;

// === Konventiert am: 10-8-24 17:06:03 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
