unit gdir;

interface

uses
  common_GLIB, gtypes, gerror;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGDir = record
  end;
  PGDir = ^TGDir;

function g_dir_open(path: Pgchar; flags: Tguint; error: PPGError): PGDir; cdecl; external libgobject2_0;
function g_dir_read_name(dir: PGDir): Pgchar; cdecl; external libgobject2_0;
procedure g_dir_rewind(dir: PGDir); cdecl; external libgobject2_0;
procedure g_dir_close(dir: PGDir); cdecl; external libgobject2_0;
function g_dir_ref(dir: PGDir): PGDir; cdecl; external libgobject2_0;
procedure g_dir_unref(dir: PGDir); cdecl; external libgobject2_0;

// === Konventiert am: 11-8-24 19:28:29 ===


implementation



end.
