/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  PGIOCondition = ^TGIOCondition;
  TGIOCondition = longint;

const
  G_IO_IN = 1;
  G_IO_OUT = 4;
  G_IO_PRI = 2;
  G_IO_ERR = 8;
  G_IO_HUP = 16;
  G_IO_NVAL = 32;

type
  PGMainContextFlags = ^TGMainContextFlags;
  TGMainContextFlags = longint;

const
  G_MAIN_CONTEXT_FLAGS_NONE = 0;
  G_MAIN_CONTEXT_FLAGS_OWNERLESS_POLLING = 1;

type
  TGMainLoop = record
  end;
  PGMainLoop = ^TGMainLoop;

  TGMainContext = record
  end;
  PGMainContext = ^TGMainContext;

  TGSourcePrivate = record
  end;
  PGSourcePrivate = ^TGSourcePrivate;

  PGSource = ^TGSource;

  TGSource = record
    callback_data: Tgpointer;
    callback_funcs: ^TGSourceCallbackFuncs;
    source_funcs: ^TGSourceFuncs;
    ref_count: Tguint;
    context: PGMainContext;
    priority: Tgint;
    flags: Tguint;
    source_id: Tguint;
    poll_fds: PGSList;
    prev: PGSource;
    Next: PGSource;
    Name: PChar;
    priv: PGSourcePrivate;
  end;

  TGSourceFunc = function(user_data: Tgpointer): Tgboolean; cdecl;
  PGSourceFunc = ^TGSourceFunc;
  TGSourceDummyMarshal = procedure(para1: pointer); cdecl;

  PGSourceFuncs = ^TGSourceFuncs;

  TGSourceFuncs = record
    prepare: function(Source: PGSource; timeout_: Pgint): Tgboolean; cdecl;
    check: function(Source: PGSource): Tgboolean; cdecl;
    dispatch: function(Source: PGSource; callback: TGSourceFunc; user_data: Tgpointer): Tgboolean; cdecl;
    finalize: procedure(Source: PGSource); cdecl;
    closure_callback: TGSourceFunc;
    closure_marshal: TGSourceDummyMarshal;
  end;


  TGSourceOnceFunc = procedure(user_data: Tgpointer); cdecl;
  TGChildWatchFunc = procedure(pid: TGPid; wait_status: Tgint; user_data: Tgpointer); cdecl;
  TGSourceDisposeFunc = procedure(Source: PGSource); cdecl;
  PGSourceCallbackFuncs = ^TGSourceCallbackFuncs;

  TGSourceCallbackFuncs = record
    ref: procedure(cb_data: Tgpointer); cdecl;
    unref: procedure(cb_data: Tgpointer); cdecl;
    get: procedure(cb_data: Tgpointer; Source: PGSource; func: PGSourceFunc; Data: Pgpointer); cdecl;
  end;



const
  G_PRIORITY_HIGH = -(100);
  G_PRIORITY_DEFAULT = 0;
  G_PRIORITY_HIGH_IDLE = 100;
  G_PRIORITY_DEFAULT_IDLE = 200;
  G_PRIORITY_LOW = 300;
  G_SOURCE_REMOVE_ = 0;
  G_SOURCE_CONTINUE = 1;

function g_main_context_new: PGMainContext; cdecl; external libglib2;
function g_main_context_new_with_flags(flags: TGMainContextFlags): PGMainContext; cdecl; external libglib2;
function g_main_context_ref(context: PGMainContext): PGMainContext; cdecl; external libglib2;
procedure g_main_context_unref(context: PGMainContext); cdecl; external libglib2;
function g_main_context_default: PGMainContext; cdecl; external libglib2;
function g_main_context_iteration(context: PGMainContext; may_block: Tgboolean): Tgboolean; cdecl; external libglib2;
function g_main_context_pending(context: PGMainContext): Tgboolean; cdecl; external libglib2;
function g_main_context_find_source_by_id(context: PGMainContext; source_id: Tguint): PGSource; cdecl; external libglib2;
function g_main_context_find_source_by_user_data(context: PGMainContext; user_data: Tgpointer): PGSource; cdecl; external libglib2;
function g_main_context_find_source_by_funcs_user_data(context: PGMainContext; funcs: PGSourceFuncs; user_data: Tgpointer): PGSource; cdecl; external libglib2;
procedure g_main_context_wakeup(context: PGMainContext); cdecl; external libglib2;
function g_main_context_acquire(context: PGMainContext): Tgboolean; cdecl; external libglib2;
procedure g_main_context_release(context: PGMainContext); cdecl; external libglib2;
function g_main_context_is_owner(context: PGMainContext): Tgboolean; cdecl; external libglib2;
function g_main_context_wait(context: PGMainContext; cond: PGCond; mutex: PGMutex): Tgboolean; cdecl; external libglib2;
function g_main_context_prepare(context: PGMainContext; priority: Pgint): Tgboolean; cdecl; external libglib2;
function g_main_context_query(context: PGMainContext; max_priority: Tgint; timeout_: Pgint; fds: PGPollFD; n_fds: Tgint): Tgint; cdecl; external libglib2;
function g_main_context_check(context: PGMainContext; max_priority: Tgint; fds: PGPollFD; n_fds: Tgint): Tgboolean; cdecl; external libglib2;
procedure g_main_context_dispatch(context: PGMainContext); cdecl; external libglib2;
procedure g_main_context_set_poll_func(context: PGMainContext; func: TGPollFunc); cdecl; external libglib2;
function g_main_context_get_poll_func(context: PGMainContext): TGPollFunc; cdecl; external libglib2;
procedure g_main_context_add_poll(context: PGMainContext; fd: PGPollFD; priority: Tgint); cdecl; external libglib2;
procedure g_main_context_remove_poll(context: PGMainContext; fd: PGPollFD); cdecl; external libglib2;
function g_main_depth: Tgint; cdecl; external libglib2;
function g_main_current_source: PGSource; cdecl; external libglib2;
procedure g_main_context_push_thread_default(context: PGMainContext); cdecl; external libglib2;
procedure g_main_context_pop_thread_default(context: PGMainContext); cdecl; external libglib2;
function g_main_context_get_thread_default: PGMainContext; cdecl; external libglib2;
function g_main_context_ref_thread_default: PGMainContext; cdecl; external libglib2;

type
  PGMainContextPusher = ^TGMainContextPusher;
  TGMainContextPusher = pointer;

function g_main_loop_new(context: PGMainContext; is_running: Tgboolean): PGMainLoop; cdecl; external libglib2;
procedure g_main_loop_run(loop: PGMainLoop); cdecl; external libglib2;
procedure g_main_loop_quit(loop: PGMainLoop); cdecl; external libglib2;
function g_main_loop_ref(loop: PGMainLoop): PGMainLoop; cdecl; external libglib2;
procedure g_main_loop_unref(loop: PGMainLoop); cdecl; external libglib2;
function g_main_loop_is_running(loop: PGMainLoop): Tgboolean; cdecl; external libglib2;
function g_main_loop_get_context(loop: PGMainLoop): PGMainContext; cdecl; external libglib2;
function g_source_new(source_funcs: PGSourceFuncs; struct_size: Tguint): PGSource; cdecl; external libglib2;
procedure g_source_set_dispose_function(Source: PGSource; _dispose: TGSourceDisposeFunc); cdecl; external libglib2;
function g_source_ref(Source: PGSource): PGSource; cdecl; external libglib2;
procedure g_source_unref(Source: PGSource); cdecl; external libglib2;
function g_source_attach(Source: PGSource; context: PGMainContext): Tguint; cdecl; external libglib2;
procedure g_source_destroy(Source: PGSource); cdecl; external libglib2;
procedure g_source_set_priority(Source: PGSource; priority: Tgint); cdecl; external libglib2;
function g_source_get_priority(Source: PGSource): Tgint; cdecl; external libglib2;
procedure g_source_set_can_recurse(Source: PGSource; can_recurse: Tgboolean); cdecl; external libglib2;
function g_source_get_can_recurse(Source: PGSource): Tgboolean; cdecl; external libglib2;
function g_source_get_id(Source: PGSource): Tguint; cdecl; external libglib2;
function g_source_get_context(Source: PGSource): PGMainContext; cdecl; external libglib2;
procedure g_source_set_callback(Source: PGSource; func: TGSourceFunc; Data: Tgpointer; notify: TGDestroyNotify); cdecl; external libglib2;
procedure g_source_set_funcs(Source: PGSource; funcs: PGSourceFuncs); cdecl; external libglib2;
function g_source_is_destroyed(Source: PGSource): Tgboolean; cdecl; external libglib2;
procedure g_source_set_name(Source: PGSource; Name: PChar); cdecl; external libglib2;
procedure g_source_set_static_name(Source: PGSource; Name: PChar); cdecl; external libglib2;
function g_source_get_name(Source: PGSource): PChar; cdecl; external libglib2;
procedure g_source_set_name_by_id(tag: Tguint; Name: PChar); cdecl; external libglib2;
procedure g_source_set_ready_time(Source: PGSource; ready_time: Tgint64); cdecl; external libglib2;
function g_source_get_ready_time(Source: PGSource): Tgint64; cdecl; external libglib2;
{$IFDEF Linux}
function g_source_add_unix_fd(Source: PGSource; fd: Tgint; events: TGIOCondition): Tgpointer; cdecl; external libglib2;
procedure g_source_modify_unix_fd(Source: PGSource; tag: Tgpointer; new_events: TGIOCondition); cdecl; external libglib2;
procedure g_source_remove_unix_fd(Source: PGSource; tag: Tgpointer); cdecl; external libglib2;
function g_source_query_unix_fd(Source: PGSource; tag: Tgpointer): TGIOCondition; cdecl; external libglib2;
{$ENDIF}

procedure g_source_set_callback_indirect(Source: PGSource; callback_data: Tgpointer; callback_funcs: PGSourceCallbackFuncs); cdecl; external libglib2;
procedure g_source_add_poll(Source: PGSource; fd: PGPollFD); cdecl; external libglib2;
procedure g_source_remove_poll(Source: PGSource; fd: PGPollFD); cdecl; external libglib2;
procedure g_source_add_child_source(Source: PGSource; child_source: PGSource); cdecl; external libglib2;
procedure g_source_remove_child_source(Source: PGSource; child_source: PGSource); cdecl; external libglib2;
procedure g_source_get_current_time(Source: PGSource; timeval: PGTimeVal); cdecl; external libglib2;
function g_source_get_time(Source: PGSource): Tgint64; cdecl; external libglib2;
function g_idle_source_new: PGSource; cdecl; external libglib2;
function g_child_watch_source_new(pid: TGPid): PGSource; cdecl; external libglib2;
function g_timeout_source_new(interval: Tguint): PGSource; cdecl; external libglib2;
function g_timeout_source_new_seconds(interval: Tguint): PGSource; cdecl; external libglib2;
procedure g_get_current_time(Result: PGTimeVal); cdecl; external libglib2;
function g_get_monotonic_time: Tgint64; cdecl; external libglib2;
function g_get_real_time: Tgint64; cdecl; external libglib2;
function g_source_remove(tag: Tguint): Tgboolean; cdecl; external libglib2;
function g_source_remove_by_user_data(user_data: Tgpointer): Tgboolean; cdecl; external libglib2;
function g_source_remove_by_funcs_user_data(funcs: PGSourceFuncs; user_data: Tgpointer): Tgboolean; cdecl; external libglib2;

type
  TGClearHandleFunc = procedure(handle_id: Tguint); cdecl;

procedure g_clear_handle_id(tag_ptr: Pguint; clear_func: TGClearHandleFunc); cdecl; external libglib2;
function g_timeout_add_full(priority: Tgint; interval: Tguint; _function: TGSourceFunc; Data: Tgpointer; notify: TGDestroyNotify): Tguint; cdecl; external libglib2;
function g_timeout_add(interval: Tguint; _function: TGSourceFunc; Data: Tgpointer): Tguint; cdecl; external libglib2;
function g_timeout_add_once(interval: Tguint; _function: TGSourceOnceFunc; Data: Tgpointer): Tguint; cdecl; external libglib2;
function g_timeout_add_seconds_full(priority: Tgint; interval: Tguint; _function: TGSourceFunc; Data: Tgpointer; notify: TGDestroyNotify): Tguint; cdecl; external libglib2;
function g_timeout_add_seconds(interval: Tguint; _function: TGSourceFunc; Data: Tgpointer): Tguint; cdecl; external libglib2;
function g_timeout_add_seconds_once(interval: Tguint; _function: TGSourceOnceFunc; Data: Tgpointer): Tguint; cdecl; external libglib2;
function g_child_watch_add_full(priority: Tgint; pid: TGPid; _function: TGChildWatchFunc; Data: Tgpointer; notify: TGDestroyNotify): Tguint; cdecl; external libglib2;
function g_child_watch_add(pid: TGPid; _function: TGChildWatchFunc; Data: Tgpointer): Tguint; cdecl; external libglib2;
function g_idle_add(_function: TGSourceFunc; Data: Tgpointer): Tguint; cdecl; external libglib2;
function g_idle_add_full(priority: Tgint; _function: TGSourceFunc; Data: Tgpointer; notify: TGDestroyNotify): Tguint; cdecl; external libglib2;
function g_idle_add_once(_function: TGSourceOnceFunc; Data: Tgpointer): Tguint; cdecl; external libglib2;
function g_idle_remove_by_data(Data: Tgpointer): Tgboolean; cdecl; external libglib2;
procedure g_main_context_invoke_full(context: PGMainContext; priority: Tgint; _function: TGSourceFunc; Data: Tgpointer; notify: TGDestroyNotify); cdecl; external libglib2;
procedure g_main_context_invoke(context: PGMainContext; _function: TGSourceFunc; Data: Tgpointer); cdecl; external libglib2;

var
  g_timeout_funcs: TGSourceFuncs; cvar;external libglib2;
  g_child_watch_funcs: TGSourceFuncs; cvar; external libglib2;
  g_idle_funcs: TGSourceFuncs; cvar;external libglib2;
  {$IFDEF Linux}
  g_unix_signal_funcs: TGSourceFuncs;external libglib2;
  g_unix_fd_source_funcs: TGSourceFuncs;external libglib2;
  {$ENDIF}


  function g_main_new(is_running : Tgboolean) : PGMainLoop;
  procedure g_main_run(loop : PGMainLoop);
  procedure g_main_quit(loop : PGMainLoop);
  procedure g_main_destroy(loop : PGMainLoop);
  function g_main_is_running(loop : PGMainLoop) : Tgboolean;
  function g_main_iteration(may_block : Tgboolean) : Tgboolean;
  function g_main_pending : Tgboolean;
  procedure g_main_set_poll_func(func : TGPollFunc);

  // === Konventiert am: 7-8-24 16:29:09 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function g_main_new(is_running: Tgboolean): PGMainLoop;
begin
  g_main_new:=g_main_loop_new(nil,is_running);
end;

procedure g_main_run(loop: PGMainLoop);
begin
  g_main_loop_run(loop);
end;

procedure g_main_quit(loop: PGMainLoop);
begin
  g_main_loop_quit(loop);
end;

procedure g_main_destroy(loop: PGMainLoop);
begin
  g_main_loop_unref(loop);
end;

function g_main_is_running(loop: PGMainLoop): Tgboolean;
begin
  g_main_is_running:=g_main_loop_is_running(loop);
end;

function g_main_iteration(may_block: Tgboolean): Tgboolean;
begin
  g_main_iteration:=g_main_context_iteration(nil,may_block);
end;

function g_main_pending: Tgboolean;
begin
  g_main_pending:=g_main_context_pending(nil);
end;

procedure g_main_set_poll_func(func: TGPollFunc);
begin
  g_main_context_set_poll_func(nil,func);
end;




{$ENDIF read_implementation}
