unit gskstroke;

interface

uses
  glib2, Cairo, common_GTK, gskenums;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGskStroke = record
  end;
  PGskStroke = ^TGskStroke;

function gsk_stroke_get_type: TGType; cdecl; external libgtk4;
function gsk_stroke_new(line_width: single): PGskStroke; cdecl; external libgtk4;
function gsk_stroke_copy(other: PGskStroke): PGskStroke; cdecl; external libgtk4;
procedure gsk_stroke_free(self: PGskStroke); cdecl; external libgtk4;
function gsk_stroke_equal(stroke1: Tgconstpointer; stroke2: Tgconstpointer): Tgboolean; cdecl; external libgtk4;
procedure gsk_stroke_set_line_width(self: PGskStroke; line_width: single); cdecl; external libgtk4;
function gsk_stroke_get_line_width(self: PGskStroke): single; cdecl; external libgtk4;
procedure gsk_stroke_set_line_cap(self: PGskStroke; line_cap: TGskLineCap); cdecl; external libgtk4;
function gsk_stroke_get_line_cap(self: PGskStroke): TGskLineCap; cdecl; external libgtk4;
procedure gsk_stroke_set_line_join(self: PGskStroke; line_join: TGskLineJoin); cdecl; external libgtk4;
function gsk_stroke_get_line_join(self: PGskStroke): TGskLineJoin; cdecl; external libgtk4;
procedure gsk_stroke_set_miter_limit(self: PGskStroke; limit: single); cdecl; external libgtk4;
function gsk_stroke_get_miter_limit(self: PGskStroke): single; cdecl; external libgtk4;
procedure gsk_stroke_set_dash(self: PGskStroke; dash: Psingle; n_dash: Tgsize); cdecl; external libgtk4;
function gsk_stroke_get_dash(self: PGskStroke; n_dash: Pgsize): Psingle; cdecl; external libgtk4;
procedure gsk_stroke_set_dash_offset(self: PGskStroke; offset: single); cdecl; external libgtk4;
function gsk_stroke_get_dash_offset(self: PGskStroke): single; cdecl; external libgtk4;
procedure gsk_stroke_to_cairo(self: PGskStroke; cr: Pcairo_t); cdecl; external libgtk4;

// === Konventiert am: 3-8-24 15:58:58 ===

function GSK_TYPE_STROKE: TGType;

implementation

function GSK_TYPE_STROKE: TGType;
begin
  GSK_TYPE_STROKE := gsk_stroke_get_type;
end;



end.
