unit ggettext;

interface

uses
  common_GLIB, gtypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

function g_strip_context(msgid: Pgchar; msgval: Pgchar): Pgchar; cdecl; external libglib2;
function g_dgettext(domain: Pgchar; msgid: Pgchar): Pgchar; cdecl; external libglib2;
function g_dcgettext(domain: Pgchar; msgid: Pgchar; category: Tgint): Pgchar; cdecl; external libglib2;
function g_dngettext(domain: Pgchar; msgid: Pgchar; msgid_plural: Pgchar; n: Tgulong): Pgchar; cdecl; external libglib2;
function g_dpgettext(domain: Pgchar; msgctxtid: Pgchar; msgidoffset: Tgsize): Pgchar; cdecl; external libglib2;
function g_dpgettext2(domain: Pgchar; context: Pgchar; msgid: Pgchar): Pgchar; cdecl; external libglib2;

// === Konventiert am: 11-8-24 15:46:01 ===


implementation



end.
