unit gmain_dep;

interface

uses
  common_GLIB, gtypes, gmain;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


function g_main_new(is_running : longint) : longint;
function g_main_run(loop : longint) : longint;
function g_main_quit(loop : longint) : longint;
function g_main_destroy(loop : longint) : longint;
function g_main_is_running(loop : longint) : longint;
function g_main_iteration(may_block : longint) : longint;
function g_main_pending : longint;
function g_main_set_poll_func(func : longint) : longint;


// === Konventiert am: 11-8-24 20:08:50 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_main_new(is_running : longint) : longint;
begin
  g_main_new:=g_main_loop_new(NULL,is_running);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_main_run(loop : longint) : longint;
begin
  g_main_run:=g_main_loop_run(loop);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_main_quit(loop : longint) : longint;
begin
  g_main_quit:=g_main_loop_quit(loop);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_main_destroy(loop : longint) : longint;
begin
  g_main_destroy:=g_main_loop_unref(loop);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_main_is_running(loop : longint) : longint;
begin
  g_main_is_running:=g_main_loop_is_running(loop);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_main_iteration(may_block : longint) : longint;
begin
  g_main_iteration:=g_main_context_iteration(NULL,may_block);
end;

{ was #define dname(params) para_def_expr }
{ return type might be wrong }   
function g_main_pending : longint;
begin
  g_main_pending:=g_main_context_pending(NULL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_main_set_poll_func(func : longint) : longint;
begin
  g_main_set_poll_func:=g_main_context_set_poll_func(NULL,func);
end;


end.
