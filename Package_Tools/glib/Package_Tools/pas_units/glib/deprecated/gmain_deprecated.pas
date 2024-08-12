unit gmain_deprecated;

interface

uses
  common_GLIB, gtypes, gmain, gpoll;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function g_main_new(is_running: Tgboolean): PGMainLoop;
procedure g_main_run(loop: PGMainLoop);
procedure g_main_quit(loop: PGMainLoop);
procedure g_main_destroy(loop: PGMainLoop);
function g_main_is_running(loop: PGMainLoop): Tgboolean;
function g_main_iteration(may_block: Tgboolean): Tgboolean;
function g_main_pending: Tgboolean;
procedure g_main_set_poll_func(func: TGPollFunc);


// === Konventiert am: 11-8-24 20:08:50 ===


implementation

function g_main_new(is_running: Tgboolean): PGMainLoop;
begin
  g_main_new := g_main_loop_new(nil, is_running);
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
  g_main_is_running := g_main_loop_is_running(loop);
end;

function g_main_iteration(may_block: Tgboolean): Tgboolean;
begin
  g_main_iteration := g_main_context_iteration(nil, may_block);
end;

function g_main_pending: Tgboolean;
begin
  g_main_pending := g_main_context_pending(nil);
end;

procedure g_main_set_poll_func(func: TGPollFunc);
begin
  g_main_context_set_poll_func(nil, func);
end;


end.
