unit gdkkeys;

interface

uses
  glib2, common_GTK;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

function gdk_keyval_name(keyval: Tguint): PChar; cdecl; external libgtk4;
function gdk_keyval_from_name(keyval_name: PChar): Tguint; cdecl; external libgtk4;
procedure gdk_keyval_convert_case(symbol: Tguint; lower: Pguint; upper: Pguint); cdecl; external libgtk4;
function gdk_keyval_to_upper(keyval: Tguint): Tguint; cdecl; external libgtk4;
function gdk_keyval_to_lower(keyval: Tguint): Tguint; cdecl; external libgtk4;
function gdk_keyval_is_upper(keyval: Tguint): Tgboolean; cdecl; external libgtk4;
function gdk_keyval_is_lower(keyval: Tguint): Tgboolean; cdecl; external libgtk4;
function gdk_keyval_to_unicode(keyval: Tguint): Tguint32; cdecl; external libgtk4;
function gdk_unicode_to_keyval(wc: Tguint32): Tguint; cdecl; external libgtk4;

// === Konventiert am: 2-8-24 17:23:21 ===


implementation



end.
