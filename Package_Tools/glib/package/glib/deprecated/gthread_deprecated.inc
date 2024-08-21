/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

  // Ausgelagert in neune gtheread.pas

  //type
  //  PGThreadPriority = ^TGThreadPriority;
  //  TGThreadPriority =  Longint;
  //  Const
  //    G_THREAD_PRIORITY_LOW = 0;
  //    G_THREAD_PRIORITY_NORMAL = 1;
  //    G_THREAD_PRIORITY_HIGH = 2;
  //    G_THREAD_PRIORITY_URGENT = 3;
  //type
  //  PGThread = ^TGThread;
  //  TGThread = record
  //      func : TGThreadFunc;
  //      data : Tgpointer;
  //      joinable : Tgboolean;
  //      priority : TGThreadPriority;
  //    end;

type
  PGThreadFunctions = ^TGThreadFunctions;

  TGThreadFunctions = record
    mutex_new: function: PGMutex; cdecl;
    mutex_lock: procedure(mutex: PGMutex); cdecl;
    mutex_trylock: function(mutex: PGMutex): Tgboolean; cdecl;
    mutex_unlock: procedure(mutex: PGMutex); cdecl;
    mutex_free: procedure(mutex: PGMutex); cdecl;
    cond_new: function: PGCond; cdecl;
    cond_signal: procedure(cond: PGCond); cdecl;
    cond_broadcast: procedure(cond: PGCond); cdecl;
    cond_wait: procedure(cond: PGCond; mutex: PGMutex); cdecl;
    cond_timed_wait: function(cond: PGCond; mutex: PGMutex; end_time: PGTimeVal): Tgboolean; cdecl;
    cond_free: procedure(cond: PGCond); cdecl;
    private_new: function(_destructor: TGDestroyNotify): PGPrivate; cdecl;
    private_get: function(private_key: PGPrivate): Tgpointer; cdecl;
    private_set: procedure(private_key: PGPrivate; Data: Tgpointer); cdecl;
    thread_create: procedure(func: TGThreadFunc; Data: Tgpointer; stack_size: Tgulong; joinable: Tgboolean; bound: Tgboolean;
      priority: TGThreadPriority; thread: Tgpointer; error: PPGError); cdecl;
    thread_yield: procedure; cdecl;
    thread_join: procedure(thread: Tgpointer); cdecl;
    thread_exit: procedure; cdecl;
    thread_set_priority: procedure(thread: Tgpointer; priority: TGThreadPriority); cdecl;
    thread_self: procedure(thread: Tgpointer); cdecl;
    thread_equal: function(thread1: Tgpointer; thread2: Tgpointer): Tgboolean; cdecl;
  end;

var
  g_thread_functions_for_glib_use: TGThreadFunctions; cvar; external libglib2;
  g_thread_use_default_impl: Tgboolean; cvar; external libglib2;
  g_thread_gettime: function: Tguint64; cvar; external libglib2;

function g_thread_create(func: TGThreadFunc; Data: Tgpointer; joinable: Tgboolean; error: PPGError): PGThread; cdecl; external libglib2;
function g_thread_create_full(func: TGThreadFunc; Data: Tgpointer; stack_size: Tgulong; joinable: Tgboolean; bound: Tgboolean;
  priority: TGThreadPriority; error: PPGError): PGThread; cdecl; external libglib2;
procedure g_thread_set_priority(thread: PGThread; priority: TGThreadPriority); cdecl; external libglib2;
procedure g_thread_foreach(thread_func: TGFunc; user_data: Tgpointer); cdecl; external libglib2;

type
  TGStaticMutex = record
    mutex: PGMutex;
    unused: Tpthread_mutex_t;
  end;
  PGStaticMutex = ^TGStaticMutex;

procedure g_static_mutex_init(mutex: PGStaticMutex); cdecl; external libglib2;
procedure g_static_mutex_free(mutex: PGStaticMutex); cdecl; external libglib2;
function g_static_mutex_get_mutex_impl(mutex: PGStaticMutex): PGMutex; cdecl; external libglib2;

type
  TGStaticRecMutex = record
    mutex: TGStaticMutex;
    depth: Tguint;
    unused: record
      case longint of
        0: (owner: pointer);
        1: (owner_: Tpthread_t);
        2: (dummy: Tgdouble);
      end;
  end;
  PGStaticRecMutex = ^TGStaticRecMutex;

procedure g_static_rec_mutex_init(mutex: PGStaticRecMutex); cdecl; external libglib2;
procedure g_static_rec_mutex_lock(mutex: PGStaticRecMutex); cdecl; external libglib2;
function g_static_rec_mutex_trylock(mutex: PGStaticRecMutex): Tgboolean; cdecl; external libglib2;
procedure g_static_rec_mutex_unlock(mutex: PGStaticRecMutex); cdecl; external libglib2;
procedure g_static_rec_mutex_lock_full(mutex: PGStaticRecMutex; depth: Tguint); cdecl; external libglib2;
function g_static_rec_mutex_unlock_full(mutex: PGStaticRecMutex): Tguint; cdecl; external libglib2;
procedure g_static_rec_mutex_free(mutex: PGStaticRecMutex); cdecl; external libglib2;

type
  TGStaticRWLock = record
    mutex: TGStaticMutex;
    read_cond: PGCond;
    write_cond: PGCond;
    read_counter: Tguint;
    have_writer: Tgboolean;
    want_to_read: Tguint;
    want_to_write: Tguint;
  end;
  PGStaticRWLock = ^TGStaticRWLock;

procedure g_static_rw_lock_init(lock: PGStaticRWLock); cdecl; external libglib2;
procedure g_static_rw_lock_reader_lock(lock: PGStaticRWLock); cdecl; external libglib2;
function g_static_rw_lock_reader_trylock(lock: PGStaticRWLock): Tgboolean; cdecl; external libglib2;
procedure g_static_rw_lock_reader_unlock(lock: PGStaticRWLock); cdecl; external libglib2;
procedure g_static_rw_lock_writer_lock(lock: PGStaticRWLock); cdecl; external libglib2;
function g_static_rw_lock_writer_trylock(lock: PGStaticRWLock): Tgboolean; cdecl; external libglib2;
procedure g_static_rw_lock_writer_unlock(lock: PGStaticRWLock); cdecl; external libglib2;
procedure g_static_rw_lock_free(lock: PGStaticRWLock); cdecl; external libglib2;
function g_private_new(notify: TGDestroyNotify): PGPrivate; cdecl; external libglib2;

type
  PGStaticPrivate = ^TGStaticPrivate;

  TGStaticPrivate = record
    index: Tguint;
  end;

procedure g_static_private_init(private_key: PGStaticPrivate); cdecl; external libglib2;
function g_static_private_get(private_key: PGStaticPrivate): Tgpointer; cdecl; external libglib2;
procedure g_static_private_set(private_key: PGStaticPrivate; Data: Tgpointer; notify: TGDestroyNotify); cdecl; external libglib2;
procedure g_static_private_free(private_key: PGStaticPrivate); cdecl; external libglib2;
function g_once_init_enter_impl(location: Pgsize): Tgboolean; cdecl; external libglib2;
procedure g_thread_init(vtable: Tgpointer); cdecl; external libglib2;
procedure g_thread_init_with_errorcheck_mutexes(vtable: Tgpointer); cdecl; external libglib2;
function g_thread_get_initialized: Tgboolean; cdecl; external libglib2;

var
  g_threads_got_initialized: Tgboolean; cvar; external libglib2;

function g_mutex_new: PGMutex; cdecl; external libglib2;
procedure g_mutex_free(mutex: PGMutex); cdecl; external libglib2;
function g_cond_new: PGCond; cdecl; external libglib2;
procedure g_cond_free(cond: PGCond); cdecl; external libglib2;
function g_cond_timed_wait(cond: PGCond; mutex: PGMutex; abs_time: PGTimeVal): Tgboolean; cdecl; external libglib2;

procedure g_static_mutex_lock(mutex: PGStaticMutex);
function g_static_mutex_trylock(mutex: PGStaticMutex): Tgboolean;
procedure g_static_mutex_unlock(mutex: PGStaticMutex);


// === Konventiert am: 12-8-24 18:05:18 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


procedure g_static_mutex_lock(mutex: PGStaticMutex);
begin
  g_mutex_lock(g_static_mutex_get_mutex_impl(mutex));
end;

function g_static_mutex_trylock(mutex: PGStaticMutex): Tgboolean;
begin
  g_static_mutex_trylock := g_mutex_trylock(g_static_mutex_get_mutex_impl(mutex));
end;

procedure g_static_mutex_unlock(mutex: PGStaticMutex);
begin
  g_mutex_unlock(g_static_mutex_get_mutex_impl(mutex));
end;

{$ENDIF read_implementation}
