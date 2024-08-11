unit gthread_dep;


interface
uses
  common_GLIB, gtypes, gthread;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

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

  PGThreadFunctions = ^TGThreadFunctions;
  TGThreadFunctions = record
      mutex_new : function :PGMutex;cdecl;
      mutex_lock : procedure (mutex:PGMutex);cdecl;
      mutex_trylock : function (mutex:PGMutex):Tgboolean;cdecl;
      mutex_unlock : procedure (mutex:PGMutex);cdecl;
      mutex_free : procedure (mutex:PGMutex);cdecl;
      cond_new : function :PGCond;cdecl;
      cond_signal : procedure (cond:PGCond);cdecl;
      cond_broadcast : procedure (cond:PGCond);cdecl;
      cond_wait : procedure (cond:PGCond; mutex:PGMutex);cdecl;
      cond_timed_wait : function (cond:PGCond; mutex:PGMutex; end_time:PGTimeVal):Tgboolean;cdecl;
      cond_free : procedure (cond:PGCond);cdecl;
      private_new : function (destructor:TGDestroyNotify):PGPrivate;cdecl;
      private_get : function (private_key:PGPrivate):Tgpointer;cdecl;
      private_set : procedure (private_key:PGPrivate; data:Tgpointer);cdecl;
      thread_create : procedure (func:TGThreadFunc; data:Tgpointer; stack_size:Tgulong; joinable:Tgboolean; bound:Tgboolean; 
                    priority:TGThreadPriority; thread:Tgpointer; error:PPGError);cdecl;
      thread_yield : procedure ;cdecl;
      thread_join : procedure (thread:Tgpointer);cdecl;
      thread_exit : procedure ;cdecl;
      thread_set_priority : procedure (thread:Tgpointer; priority:TGThreadPriority);cdecl;
      thread_self : procedure (thread:Tgpointer);cdecl;
      thread_equal : function (thread1:Tgpointer; thread2:Tgpointer):Tgboolean;cdecl;
    end;

  var
    g_thread_functions_for_glib_use : TGThreadFunctions;external libglib2;
    g_thread_use_default_impl : Tgboolean;cvar;external libglib2;
    g_thread_gettime : function :Tguint64;cvar;external libglib2;

function g_thread_create(func:TGThreadFunc; data:Tgpointer; joinable:Tgboolean; error:PPGError):PGThread;cdecl;external libglib2;
function g_thread_create_full(func:TGThreadFunc; data:Tgpointer; stack_size:Tgulong; joinable:Tgboolean; bound:Tgboolean; 
           priority:TGThreadPriority; error:PPGError):PGThread;cdecl;external libglib2;
procedure g_thread_set_priority(thread:PGThread; priority:TGThreadPriority);cdecl;external libglib2;
procedure g_thread_foreach(thread_func:TGFunc; user_data:Tgpointer);cdecl;external libglib2;

type
  PGStaticMutex = ^TGStaticMutex;
  TGStaticMutex = record
      mutex : PGMutex;
      unused : Tpthread_mutex_t;
    end;

procedure g_static_rw_lock_init(lock:PGStaticRWLock);cdecl;external libglib2;
procedure g_static_rw_lock_reader_lock(lock:PGStaticRWLock);cdecl;external libglib2;
function g_static_rw_lock_reader_trylock(lock:PGStaticRWLock):Tgboolean;cdecl;external libglib2;
procedure g_static_rw_lock_reader_unlock(lock:PGStaticRWLock);cdecl;external libglib2;
procedure g_static_rw_lock_writer_lock(lock:PGStaticRWLock);cdecl;external libglib2;
function g_static_rw_lock_writer_trylock(lock:PGStaticRWLock):Tgboolean;cdecl;external libglib2;
procedure g_static_rw_lock_writer_unlock(lock:PGStaticRWLock);cdecl;external libglib2;
procedure g_static_rw_lock_free(lock:PGStaticRWLock);cdecl;external libglib2;
function g_private_new(notify:TGDestroyNotify):PGPrivate;cdecl;external libglib2;
type
{< private > }
  PGStaticPrivate = ^TGStaticPrivate;
  TGStaticPrivate = record
      index : Tguint;
    end;

{#define G_STATIC_PRIVATE_INIT  0   }

procedure g_static_private_init(private_key:PGStaticPrivate);cdecl;external libglib2;
function g_static_private_get(private_key:PGStaticPrivate):Tgpointer;cdecl;external libglib2;
procedure g_static_private_set(private_key:PGStaticPrivate; data:Tgpointer; notify:TGDestroyNotify);cdecl;external libglib2;
procedure g_static_private_free(private_key:PGStaticPrivate);cdecl;external libglib2;
function g_once_init_enter_impl(location:Pgsize):Tgboolean;cdecl;external libglib2;
procedure g_thread_init(vtable:Tgpointer);cdecl;external libglib2;
procedure g_thread_init_with_errorcheck_mutexes(vtable:Tgpointer);cdecl;external libglib2;
function g_thread_get_initialized:Tgboolean;cdecl;external libglib2;
  var
    g_threads_got_initialized : Tgboolean;cvar;public;
{#define g_thread_supported()     (1) _MACRO_IN_2_32 }

function g_mutex_new:PGMutex;cdecl;external libglib2;
procedure g_mutex_free(mutex:PGMutex);cdecl;external libglib2;
function g_cond_new:PGCond;cdecl;external libglib2;
procedure g_cond_free(cond:PGCond);cdecl;external libglib2;
function g_cond_timed_wait(cond:PGCond; mutex:PGMutex; abs_time:PGTimeVal):Tgboolean;cdecl;external libglib2;

function g_static_mutex_lock(mutex : longint) : longint;
function g_static_mutex_trylock(mutex : longint) : longint;
function g_static_mutex_unlock(mutex : longint) : longint;


// === Konventiert am: 11-8-24 19:44:07 ===


implementation

function g_static_mutex_lock(mutex : longint) : longint;
begin
  g_static_mutex_lock:=g_mutex_lock(g_static_mutex_get_mutex(mutex));
end;

function g_static_mutex_trylock(mutex : longint) : longint;
begin
  g_static_mutex_trylock:=g_mutex_trylock(g_static_mutex_get_mutex(mutex));
end;

function g_static_mutex_unlock(mutex : longint) : longint;
begin
  g_static_mutex_unlock:=g_mutex_unlock(g_static_mutex_get_mutex(mutex));
end;


end.
