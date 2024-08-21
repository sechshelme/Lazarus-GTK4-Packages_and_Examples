/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

procedure g_io_scheduler_push_job(job_func: TGIOSchedulerJobFunc; user_data: Tgpointer; notify: TGDestroyNotify; io_priority: Tgint; cancellable: PGCancellable); cdecl; external libgio2;
procedure g_io_scheduler_cancel_all_jobs; cdecl; external libgio2;
function g_io_scheduler_job_send_to_mainloop(job: PGIOSchedulerJob; func: TGSourceFunc; user_data: Tgpointer; notify: TGDestroyNotify): Tgboolean; cdecl; external libgio2;
procedure g_io_scheduler_job_send_to_mainloop_async(job: PGIOSchedulerJob; func: TGSourceFunc; user_data: Tgpointer; notify: TGDestroyNotify); cdecl; external libgio2;

// === Konventiert am: 21-8-24 16:23:03 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
