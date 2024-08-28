/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 28-08-2024   15:47                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGtkPrintJob = record
  end;
  PGtkPrintJob = ^TGtkPrintJob;

  TGtkPrintJobCompleteFunc = procedure(print_job: PGtkPrintJob; user_data: Tgpointer; error: PGError); cdecl;

function gtk_print_job_get_type: TGType; cdecl; external libgtk4;
function gtk_print_job_new(title: PChar; printer: PGtkPrinter; settings: PGtkPrintSettings; page_setup: PGtkPageSetup): PGtkPrintJob; cdecl; external libgtk4;
function gtk_print_job_get_settings(job: PGtkPrintJob): PGtkPrintSettings; cdecl; external libgtk4;
function gtk_print_job_get_printer(job: PGtkPrintJob): PGtkPrinter; cdecl; external libgtk4;
function gtk_print_job_get_title(job: PGtkPrintJob): PChar; cdecl; external libgtk4;
function gtk_print_job_get_status(job: PGtkPrintJob): TGtkPrintStatus; cdecl; external libgtk4;
function gtk_print_job_set_source_file(job: PGtkPrintJob; filename: PChar; error: PPGError): Tgboolean; cdecl; external libgtk4;
function gtk_print_job_set_source_fd(job: PGtkPrintJob; fd: longint; error: PPGError): Tgboolean; cdecl; external libgtk4;
function gtk_print_job_get_surface(job: PGtkPrintJob; error: PPGError): Pcairo_surface_t; cdecl; external libgtk4;
procedure gtk_print_job_set_track_print_status(job: PGtkPrintJob; track_status: Tgboolean); cdecl; external libgtk4;
function gtk_print_job_get_track_print_status(job: PGtkPrintJob): Tgboolean; cdecl; external libgtk4;
procedure gtk_print_job_send(job: PGtkPrintJob; callback: TGtkPrintJobCompleteFunc; user_data: Tgpointer; dnotify: TGDestroyNotify); cdecl; external libgtk4;
function gtk_print_job_get_pages(job: PGtkPrintJob): TGtkPrintPages; cdecl; external libgtk4;
procedure gtk_print_job_set_pages(job: PGtkPrintJob; pages: TGtkPrintPages); cdecl; external libgtk4;
function gtk_print_job_get_page_ranges(job: PGtkPrintJob; n_ranges: Plongint): PGtkPageRange; cdecl; external libgtk4;
procedure gtk_print_job_set_page_ranges(job: PGtkPrintJob; ranges: PGtkPageRange; n_ranges: longint); cdecl; external libgtk4;
function gtk_print_job_get_page_set(job: PGtkPrintJob): TGtkPageSet; cdecl; external libgtk4;
procedure gtk_print_job_set_page_set(job: PGtkPrintJob; page_set: TGtkPageSet); cdecl; external libgtk4;
function gtk_print_job_get_num_copies(job: PGtkPrintJob): longint; cdecl; external libgtk4;
procedure gtk_print_job_set_num_copies(job: PGtkPrintJob; num_copies: longint); cdecl; external libgtk4;
function gtk_print_job_get_scale(job: PGtkPrintJob): Tdouble; cdecl; external libgtk4;
procedure gtk_print_job_set_scale(job: PGtkPrintJob; scale: Tdouble); cdecl; external libgtk4;
function gtk_print_job_get_n_up(job: PGtkPrintJob): Tguint; cdecl; external libgtk4;
procedure gtk_print_job_set_n_up(job: PGtkPrintJob; n_up: Tguint); cdecl; external libgtk4;
function gtk_print_job_get_n_up_layout(job: PGtkPrintJob): TGtkNumberUpLayout; cdecl; external libgtk4;
procedure gtk_print_job_set_n_up_layout(job: PGtkPrintJob; layout: TGtkNumberUpLayout); cdecl; external libgtk4;
function gtk_print_job_get_rotate(job: PGtkPrintJob): Tgboolean; cdecl; external libgtk4;
procedure gtk_print_job_set_rotate(job: PGtkPrintJob; rotate: Tgboolean); cdecl; external libgtk4;
function gtk_print_job_get_collate(job: PGtkPrintJob): Tgboolean; cdecl; external libgtk4;
procedure gtk_print_job_set_collate(job: PGtkPrintJob; collate: Tgboolean); cdecl; external libgtk4;
function gtk_print_job_get_reverse(job: PGtkPrintJob): Tgboolean; cdecl; external libgtk4;
procedure gtk_print_job_set_reverse(job: PGtkPrintJob; reverse: Tgboolean); cdecl; external libgtk4;

// === Konventiert am: 3-8-24 13:41:15 ===

function GTK_TYPE_PRINT_JOB: TGType;
function GTK_PRINT_JOB(obj: Pointer): PGtkPrintJob;
function GTK_IS_PRINT_JOB(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GTK_TYPE_PRINT_JOB: TGType;
begin
  GTK_TYPE_PRINT_JOB := gtk_print_job_get_type;
end;

function GTK_PRINT_JOB(obj: Pointer): PGtkPrintJob;
begin
  Result := PGtkPrintJob(g_type_check_instance_cast(obj, GTK_TYPE_PRINT_JOB));
end;

function GTK_IS_PRINT_JOB(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_PRINT_JOB);
end;



{$ENDIF read_implementation}
