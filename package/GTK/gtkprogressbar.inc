/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 28-08-2024   15:47                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGtkProgressBar = record // _GtkProgressBar
  end;
  PGtkProgressBar = ^TGtkProgressBar;

function gtk_progress_bar_get_type: TGType; cdecl; external libgtk4;
function gtk_progress_bar_new: PGtkWidget; cdecl; external libgtk4;
procedure gtk_progress_bar_pulse(pbar: PGtkProgressBar); cdecl; external libgtk4;
procedure gtk_progress_bar_set_text(pbar: PGtkProgressBar; Text: PChar); cdecl; external libgtk4;
procedure gtk_progress_bar_set_fraction(pbar: PGtkProgressBar; fraction: Tdouble); cdecl; external libgtk4;
procedure gtk_progress_bar_set_pulse_step(pbar: PGtkProgressBar; fraction: Tdouble); cdecl; external libgtk4;
procedure gtk_progress_bar_set_inverted(pbar: PGtkProgressBar; inverted: Tgboolean); cdecl; external libgtk4;
function gtk_progress_bar_get_text(pbar: PGtkProgressBar): PChar; cdecl; external libgtk4;
function gtk_progress_bar_get_fraction(pbar: PGtkProgressBar): Tdouble; cdecl; external libgtk4;
function gtk_progress_bar_get_pulse_step(pbar: PGtkProgressBar): Tdouble; cdecl; external libgtk4;
function gtk_progress_bar_get_inverted(pbar: PGtkProgressBar): Tgboolean; cdecl; external libgtk4;
procedure gtk_progress_bar_set_ellipsize(pbar: PGtkProgressBar; mode: TPangoEllipsizeMode); cdecl; external libgtk4;
function gtk_progress_bar_get_ellipsize(pbar: PGtkProgressBar): TPangoEllipsizeMode; cdecl; external libgtk4;
procedure gtk_progress_bar_set_show_text(pbar: PGtkProgressBar; show_text: Tgboolean); cdecl; external libgtk4;
function gtk_progress_bar_get_show_text(pbar: PGtkProgressBar): Tgboolean; cdecl; external libgtk4;

// === Konventiert am: 28-7-24 15:26:53 ===

function GTK_TYPE_PROGRESS_BAR: TGType;
function GTK_PROGRESS_BAR(obj: Pointer): PGtkProgressBar;
function GTK_IS_PROGRESS_BAR(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GTK_TYPE_PROGRESS_BAR: TGType;
begin
  GTK_TYPE_PROGRESS_BAR := gtk_progress_bar_get_type;
end;

function GTK_PROGRESS_BAR(obj: Pointer): PGtkProgressBar;
begin
  Result := PGtkProgressBar(g_type_check_instance_cast(obj, GTK_TYPE_PROGRESS_BAR));
end;

function GTK_IS_PROGRESS_BAR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_PROGRESS_BAR);
end;



{$ENDIF read_implementation}
