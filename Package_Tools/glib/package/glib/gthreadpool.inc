/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  PGThreadPool = ^TGThreadPool;

  TGThreadPool = record
    func: TGFunc;
    user_data: Tgpointer;
    exclusive: Tgboolean;
  end;


function g_thread_pool_new(func: TGFunc; user_data: Tgpointer; max_threads: Tgint; exclusive: Tgboolean; error: PPGError): PGThreadPool; cdecl; external libglib2;
function g_thread_pool_new_full(func: TGFunc; user_data: Tgpointer; item_free_func: TGDestroyNotify; max_threads: Tgint; exclusive: Tgboolean;
  error: PPGError): PGThreadPool; cdecl; external libglib2;
procedure g_thread_pool_free(pool: PGThreadPool; immediate: Tgboolean; wait_: Tgboolean); cdecl; external libglib2;
function g_thread_pool_push(pool: PGThreadPool; Data: Tgpointer; error: PPGError): Tgboolean; cdecl; external libglib2;
function g_thread_pool_unprocessed(pool: PGThreadPool): Tguint; cdecl; external libglib2;
procedure g_thread_pool_set_sort_function(pool: PGThreadPool; func: TGCompareDataFunc; user_data: Tgpointer); cdecl; external libglib2;
function g_thread_pool_move_to_front(pool: PGThreadPool; Data: Tgpointer): Tgboolean; cdecl; external libglib2;
function g_thread_pool_set_max_threads(pool: PGThreadPool; max_threads: Tgint; error: PPGError): Tgboolean; cdecl; external libglib2;
function g_thread_pool_get_max_threads(pool: PGThreadPool): Tgint; cdecl; external libglib2;
function g_thread_pool_get_num_threads(pool: PGThreadPool): Tguint; cdecl; external libglib2;
procedure g_thread_pool_set_max_unused_threads(max_threads: Tgint); cdecl; external libglib2;
function g_thread_pool_get_max_unused_threads: Tgint; cdecl; external libglib2;
function g_thread_pool_get_num_unused_threads: Tguint; cdecl; external libglib2;
procedure g_thread_pool_stop_unused_threads; cdecl; external libglib2;
procedure g_thread_pool_set_max_idle_time(interval: Tguint); cdecl; external libglib2;
function g_thread_pool_get_max_idle_time: Tguint; cdecl; external libglib2;

// === Konventiert am: 11-8-24 15:21:24 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
