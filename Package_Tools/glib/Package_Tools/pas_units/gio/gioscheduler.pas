unit gioscheduler;

interface

uses
  common_GLIB, gtypes, gerror, gtype, gmain, giotypes, gobject, gioenums;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

procedure g_io_scheduler_push_job(job_func: TGIOSchedulerJobFunc; user_data: Tgpointer; notify: TGDestroyNotify; io_priority: Tgint; cancellable: PGCancellable); cdecl; external libgio2;
procedure g_io_scheduler_cancel_all_jobs; cdecl; external libgio2;
function g_io_scheduler_job_send_to_mainloop(job: PGIOSchedulerJob; func: TGSourceFunc; user_data: Tgpointer; notify: TGDestroyNotify): Tgboolean; cdecl; external libgio2;
procedure g_io_scheduler_job_send_to_mainloop_async(job: PGIOSchedulerJob; func: TGSourceFunc; user_data: Tgpointer; notify: TGDestroyNotify); cdecl; external libgio2;

// === Konventiert am: 21-8-24 16:23:03 ===


implementation



end.
