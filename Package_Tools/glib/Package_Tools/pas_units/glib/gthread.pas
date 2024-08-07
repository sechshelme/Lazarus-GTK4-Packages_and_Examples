unit gthread;

interface

uses
  common_GLIB, gtypes, gquark, gerror;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

function G_THREAD_ERROR: TGQuark;

function g_thread_error_quark: TGQuark; cdecl; external libglib2;


type
  PGThreadError = ^TGThreadError;
  TGThreadError = longint;

const
  G_THREAD_ERROR_AGAIN = 0;

type
  TGThreadFunc = function(Data: Tgpointer): Tgpointer; cdecl;

  // --- Von doppelter gtheread.h von deprecated
type
  PGThreadPriority = ^TGThreadPriority;
  TGThreadPriority = longint;

const
  G_THREAD_PRIORITY_LOW = 0;
  G_THREAD_PRIORITY_NORMAL = 1;
  G_THREAD_PRIORITY_HIGH = 2;
  G_THREAD_PRIORITY_URGENT = 3;

type
  PGThread = ^TGThread;

  TGThread = record
    func: TGThreadFunc;
    Data: Tgpointer;
    joinable: Tgboolean;
    priority: TGThreadPriority;
  end;
  // -------

  PGMutex = ^TGMutex;
  TGMutex = record
    case longint of
      0: (p: Tgpointer);
      1: (i: array[0..1] of Tguint);
  end;

  PGRWLock = ^TGRWLock;

  TGRWLock = record
    p: Tgpointer;
    i: array[0..1] of Tguint;
  end;

  PGCond = ^TGCond;

  TGCond = record
    p: Tgpointer;
    i: array[0..1] of Tguint;
  end;

  PGRecMutex = ^TGRecMutex;

  TGRecMutex = record
    p: Tgpointer;
    i: array[0..1] of Tguint;
  end;

  PGPrivate = ^TGPrivate;

  TGPrivate = record
    p: Tgpointer;
    notify: TGDestroyNotify;
    future: array[0..1] of Tgpointer;
  end;


  PGOnceStatus = ^TGOnceStatus;
  TGOnceStatus = longint;

const
  G_ONCE_STATUS_NOTCALLED = 0;
  G_ONCE_STATUS_PROGRESS = 1;
  G_ONCE_STATUS_READY = 2;

type
  PGOnce = ^TGOnce;

  TGOnce = record
    status: TGOnceStatus;
    retval: Tgpointer;
  end;


function g_thread_ref(thread: PGThread): PGThread; cdecl; external libglib2;
procedure g_thread_unref(thread: PGThread); cdecl; external libglib2;
function g_thread_new(Name: Pgchar; func: TGThreadFunc; Data: Tgpointer): PGThread; cdecl; external libglib2;
function g_thread_try_new(Name: Pgchar; func: TGThreadFunc; Data: Tgpointer; error: PPGError): PGThread; cdecl; external libglib2;
function g_thread_self: PGThread; cdecl; external libglib2;
procedure g_thread_exit(retval: Tgpointer); cdecl; external libglib2;
function g_thread_join(thread: PGThread): Tgpointer; cdecl; external libglib2;
procedure g_thread_yield; cdecl; external libglib2;
procedure g_mutex_init(mutex: PGMutex); cdecl; external libglib2;
procedure g_mutex_clear(mutex: PGMutex); cdecl; external libglib2;
procedure g_mutex_lock(mutex: PGMutex); cdecl; external libglib2;
function g_mutex_trylock(mutex: PGMutex): Tgboolean; cdecl; external libglib2;
procedure g_mutex_unlock(mutex: PGMutex); cdecl; external libglib2;
procedure g_rw_lock_init(rw_lock: PGRWLock); cdecl; external libglib2;
procedure g_rw_lock_clear(rw_lock: PGRWLock); cdecl; external libglib2;
procedure g_rw_lock_writer_lock(rw_lock: PGRWLock); cdecl; external libglib2;
function g_rw_lock_writer_trylock(rw_lock: PGRWLock): Tgboolean; cdecl; external libglib2;
procedure g_rw_lock_writer_unlock(rw_lock: PGRWLock); cdecl; external libglib2;
procedure g_rw_lock_reader_lock(rw_lock: PGRWLock); cdecl; external libglib2;
function g_rw_lock_reader_trylock(rw_lock: PGRWLock): Tgboolean; cdecl; external libglib2;
procedure g_rw_lock_reader_unlock(rw_lock: PGRWLock); cdecl; external libglib2;
procedure g_rec_mutex_init(rec_mutex: PGRecMutex); cdecl; external libglib2;
procedure g_rec_mutex_clear(rec_mutex: PGRecMutex); cdecl; external libglib2;
procedure g_rec_mutex_lock(rec_mutex: PGRecMutex); cdecl; external libglib2;
function g_rec_mutex_trylock(rec_mutex: PGRecMutex): Tgboolean; cdecl; external libglib2;
procedure g_rec_mutex_unlock(rec_mutex: PGRecMutex); cdecl; external libglib2;
procedure g_cond_init(cond: PGCond); cdecl; external libglib2;
procedure g_cond_clear(cond: PGCond); cdecl; external libglib2;
procedure g_cond_wait(cond: PGCond; mutex: PGMutex); cdecl; external libglib2;
procedure g_cond_signal(cond: PGCond); cdecl; external libglib2;
procedure g_cond_broadcast(cond: PGCond); cdecl; external libglib2;
function g_cond_wait_until(cond: PGCond; mutex: PGMutex; end_time: Tgint64): Tgboolean; cdecl; external libglib2;
function g_private_get(key: PGPrivate): Tgpointer; cdecl; external libglib2;
procedure g_private_set(key: PGPrivate; Value: Tgpointer); cdecl; external libglib2;
procedure g_private_replace(key: PGPrivate; Value: Tgpointer); cdecl; external libglib2;
function g_once_impl(once: PGOnce; func: TGThreadFunc; arg: Tgpointer): Tgpointer; cdecl; external libglib2;
function g_once_init_enter(location: pointer): Tgboolean; cdecl; external libglib2;
procedure g_once_init_leave(location: pointer; Result: Tgsize); cdecl; external libglib2;
function g_once_init_enter_pointer(location: pointer): Tgboolean; cdecl; external libglib2;
procedure g_once_init_leave_pointer(location: pointer; Result: Tgpointer); cdecl; external libglib2;
function g_get_num_processors: Tguint; cdecl; external libglib2;

type
  PGMutexLocker = ^TGMutexLocker;
  TGMutexLocker = pointer;

  PGRecMutexLocker = ^TGRecMutexLocker;
  TGRecMutexLocker = pointer;

  PGRWLockWriterLocker = ^TGRWLockWriterLocker;
  TGRWLockWriterLocker = pointer;

  PGRWLockReaderLocker = ^TGRWLockReaderLocker;
  TGRWLockReaderLocker = pointer;

  // === Konventiert am: 7-8-24 17:00:47 ===


implementation


{ was #define dname def_expr }
function G_THREAD_ERROR: TGQuark; { return type might be wrong }
begin
  G_THREAD_ERROR := g_thread_error_quark;
end;


end.
