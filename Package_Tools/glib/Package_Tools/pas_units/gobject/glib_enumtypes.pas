unit glib_enumtypes;

interface

uses
  common_GLIB, gtypes, gtype;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

function g_unicode_type_get_type: TGType; cdecl; external libgobject2_0;
function g_unicode_break_type_get_type: TGType; cdecl; external libgobject2_0;
function g_unicode_script_get_type: TGType; cdecl; external libgobject2_0;
function g_normalize_mode_get_type: TGType; cdecl; external libgobject2_0;

function G_TYPE_UNICODE_TYPE: TGType;
function G_TYPE_UNICODE_BREAK_TYPE: TGType;
function G_TYPE_UNICODE_SCRIPT: TGType;
function G_TYPE_NORMALIZE_MODE: TGType;


// === Konventiert am: 15-8-24 19:51:21 ===


implementation


function G_TYPE_UNICODE_TYPE: TGType;
begin
  G_TYPE_UNICODE_TYPE := g_unicode_type_get_type;
end;

function G_TYPE_UNICODE_BREAK_TYPE: TGType;
begin
  G_TYPE_UNICODE_BREAK_TYPE := g_unicode_break_type_get_type;
end;

function G_TYPE_UNICODE_SCRIPT: TGType;
begin
  G_TYPE_UNICODE_SCRIPT := g_unicode_script_get_type;
end;

function G_TYPE_NORMALIZE_MODE: TGType;
begin
  G_TYPE_NORMALIZE_MODE := g_normalize_mode_get_type;
end;


end.
