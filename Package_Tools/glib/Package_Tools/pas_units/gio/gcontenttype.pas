unit gcontenttype;

interface

uses
  common_GLIB, gtypes, glist, gtype, giotypes, gobject, gioenums;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

function g_content_type_equals(type1: Pgchar; type2: Pgchar): Tgboolean; cdecl; external libgio2;
function g_content_type_is_a(_type: Pgchar; supertype: Pgchar): Tgboolean; cdecl; external libgio2;
function g_content_type_is_mime_type(_type: Pgchar; mime_type: Pgchar): Tgboolean; cdecl; external libgio2;
function g_content_type_is_unknown(_type: Pgchar): Tgboolean; cdecl; external libgio2;
function g_content_type_get_description(_type: Pgchar): Pgchar; cdecl; external libgio2;
function g_content_type_get_mime_type(_type: Pgchar): Pgchar; cdecl; external libgio2;
function g_content_type_get_icon(_type: Pgchar): PGIcon; cdecl; external libgio2;
function g_content_type_get_symbolic_icon(_type: Pgchar): PGIcon; cdecl; external libgio2;
function g_content_type_get_generic_icon_name(_type: Pgchar): Pgchar; cdecl; external libgio2;
function g_content_type_can_be_executable(_type: Pgchar): Tgboolean; cdecl; external libgio2;
function g_content_type_from_mime_type(mime_type: Pgchar): Pgchar; cdecl; external libgio2;
function g_content_type_guess(filename: Pgchar; Data: Pguchar; data_size: Tgsize; result_uncertain: Pgboolean): Pgchar; cdecl; external libgio2;
function g_content_type_guess_for_tree(root: PGFile): PPgchar; cdecl; external libgio2;
function g_content_types_get_registered: PGList; cdecl; external libgio2;

function g_content_type_get_mime_dirs: PPgchar; cdecl; external libgio2;
procedure g_content_type_set_mime_dirs(dirs: PPgchar); cdecl; external libgio2;

// === Konventiert am: 20-8-24 19:49:49 ===


implementation



end.
