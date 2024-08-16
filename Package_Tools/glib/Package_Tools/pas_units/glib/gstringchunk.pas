unit gstringchunk;

interface

uses
  common_GLIB, gtypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGStringChunk = record
  end;
  PGStringChunk = ^TGStringChunk;

function g_string_chunk_new(size: Tgsize): PGStringChunk; cdecl; external libgobject2_0;
procedure g_string_chunk_free(chunk: PGStringChunk); cdecl; external libgobject2_0;
procedure g_string_chunk_clear(chunk: PGStringChunk); cdecl; external libgobject2_0;
function g_string_chunk_insert(chunk: PGStringChunk; _string: Pgchar): Pgchar; cdecl; external libgobject2_0;
function g_string_chunk_insert_len(chunk: PGStringChunk; _string: Pgchar; len: Tgssize): Pgchar; cdecl; external libgobject2_0;
function g_string_chunk_insert_const(chunk: PGStringChunk; _string: Pgchar): Pgchar; cdecl; external libgobject2_0;

// === Konventiert am: 11-8-24 15:56:52 ===


implementation



end.
