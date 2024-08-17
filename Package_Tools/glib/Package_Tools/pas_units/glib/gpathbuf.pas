unit gpathbuf;

interface

uses
  common_GLIB, gtypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGPathBuf = record
    dummy: array[0..7] of Tgpointer;
  end;
  PGPathBuf = ^TGPathBuf;

const
  G_PATH_BUF_INIT_ = nil;

function g_path_buf_new: PGPathBuf; cdecl; external libglib2;
function g_path_buf_new_from_path(path: PChar): PGPathBuf; cdecl; external libglib2;
function g_path_buf_init(buf: PGPathBuf): PGPathBuf; cdecl; external libglib2;
function g_path_buf_init_from_path(buf: PGPathBuf; path: PChar): PGPathBuf; cdecl; external libglib2;
procedure g_path_buf_clear(buf: PGPathBuf); cdecl; external libglib2;
function g_path_buf_clear_to_path(buf: PGPathBuf): PChar; cdecl; external libglib2;
procedure g_path_buf_free(buf: PGPathBuf); cdecl; external libglib2;
function g_path_buf_free_to_path(buf: PGPathBuf): PChar; cdecl; external libglib2;
function g_path_buf_copy(buf: PGPathBuf): PGPathBuf; cdecl; external libglib2;
function g_path_buf_push(buf: PGPathBuf; path: PChar): PGPathBuf; cdecl; external libglib2;
function g_path_buf_pop(buf: PGPathBuf): Tgboolean; cdecl; external libglib2;
function g_path_buf_set_filename(buf: PGPathBuf; file_name: PChar): Tgboolean; cdecl; external libglib2;
function g_path_buf_set_extension(buf: PGPathBuf; extension: PChar): Tgboolean; cdecl; external libglib2;
function g_path_buf_to_path(buf: PGPathBuf): PChar; cdecl; external libglib2;
function g_path_buf_equal(v1: Tgconstpointer; v2: Tgconstpointer): Tgboolean; cdecl; external libglib2;

// === Konventiert am: 11-8-24 15:49:28 ===


implementation



end.
