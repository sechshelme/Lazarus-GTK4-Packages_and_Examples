unit gdkframetimings;

interface

uses
  glib2, common_GTK;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGdkFrameTimings = record
  end;
  PGdkFrameTimings = ^TGdkFrameTimings;

function gdk_frame_timings_get_type: TGType; cdecl; external libgtk4;
function gdk_frame_timings_ref(timings: PGdkFrameTimings): PGdkFrameTimings; cdecl; external libgtk4;
procedure gdk_frame_timings_unref(timings: PGdkFrameTimings); cdecl; external libgtk4;
function gdk_frame_timings_get_frame_counter(timings: PGdkFrameTimings): Tgint64; cdecl; external libgtk4;
function gdk_frame_timings_get_complete(timings: PGdkFrameTimings): Tgboolean; cdecl; external libgtk4;
function gdk_frame_timings_get_frame_time(timings: PGdkFrameTimings): Tgint64; cdecl; external libgtk4;
function gdk_frame_timings_get_presentation_time(timings: PGdkFrameTimings): Tgint64; cdecl; external libgtk4;
function gdk_frame_timings_get_refresh_interval(timings: PGdkFrameTimings): Tgint64; cdecl; external libgtk4;
function gdk_frame_timings_get_predicted_presentation_time(timings: PGdkFrameTimings): Tgint64; cdecl; external libgtk4;

// === Konventiert am: 31-7-24 19:21:02 ===


implementation



end.
