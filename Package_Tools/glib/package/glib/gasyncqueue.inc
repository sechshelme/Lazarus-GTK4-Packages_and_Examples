/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGAsyncQueue = record
  end;
  PGAsyncQueue = ^TGAsyncQueue;

function g_async_queue_new: PGAsyncQueue; cdecl; external libglib2;
function g_async_queue_new_full(item_free_func: TGDestroyNotify): PGAsyncQueue; cdecl; external libglib2;
procedure g_async_queue_lock(queue: PGAsyncQueue); cdecl; external libglib2;
procedure g_async_queue_unlock(queue: PGAsyncQueue); cdecl; external libglib2;
function g_async_queue_ref(queue: PGAsyncQueue): PGAsyncQueue; cdecl; external libglib2;
procedure g_async_queue_unref(queue: PGAsyncQueue); cdecl; external libglib2;
procedure g_async_queue_ref_unlocked(queue: PGAsyncQueue); cdecl; external libglib2;
procedure g_async_queue_unref_and_unlock(queue: PGAsyncQueue); cdecl; external libglib2;
procedure g_async_queue_push(queue: PGAsyncQueue; Data: Tgpointer); cdecl; external libglib2;
procedure g_async_queue_push_unlocked(queue: PGAsyncQueue; Data: Tgpointer); cdecl; external libglib2;
procedure g_async_queue_push_sorted(queue: PGAsyncQueue; Data: Tgpointer; func: TGCompareDataFunc; user_data: Tgpointer); cdecl; external libglib2;
procedure g_async_queue_push_sorted_unlocked(queue: PGAsyncQueue; Data: Tgpointer; func: TGCompareDataFunc; user_data: Tgpointer); cdecl; external libglib2;
function g_async_queue_pop(queue: PGAsyncQueue): Tgpointer; cdecl; external libglib2;
function g_async_queue_pop_unlocked(queue: PGAsyncQueue): Tgpointer; cdecl; external libglib2;
function g_async_queue_try_pop(queue: PGAsyncQueue): Tgpointer; cdecl; external libglib2;
function g_async_queue_try_pop_unlocked(queue: PGAsyncQueue): Tgpointer; cdecl; external libglib2;
function g_async_queue_timeout_pop(queue: PGAsyncQueue; timeout: Tguint64): Tgpointer; cdecl; external libglib2;
function g_async_queue_timeout_pop_unlocked(queue: PGAsyncQueue; timeout: Tguint64): Tgpointer; cdecl; external libglib2;
function g_async_queue_length(queue: PGAsyncQueue): Tgint; cdecl; external libglib2;
function g_async_queue_length_unlocked(queue: PGAsyncQueue): Tgint; cdecl; external libglib2;
procedure g_async_queue_sort(queue: PGAsyncQueue; func: TGCompareDataFunc; user_data: Tgpointer); cdecl; external libglib2;
procedure g_async_queue_sort_unlocked(queue: PGAsyncQueue; func: TGCompareDataFunc; user_data: Tgpointer); cdecl; external libglib2;
function g_async_queue_remove(queue: PGAsyncQueue; item: Tgpointer): Tgboolean; cdecl; external libglib2;
function g_async_queue_remove_unlocked(queue: PGAsyncQueue; item: Tgpointer): Tgboolean; cdecl; external libglib2;
procedure g_async_queue_push_front(queue: PGAsyncQueue; item: Tgpointer); cdecl; external libglib2;
procedure g_async_queue_push_front_unlocked(queue: PGAsyncQueue; item: Tgpointer); cdecl; external libglib2;
function g_async_queue_timed_pop(queue: PGAsyncQueue; end_time: PGTimeVal): Tgpointer; cdecl; external libglib2;
function g_async_queue_timed_pop_unlocked(queue: PGAsyncQueue; end_time: PGTimeVal): Tgpointer; cdecl; external libglib2;

// === Konventiert am: 10-8-24 19:52:29 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
