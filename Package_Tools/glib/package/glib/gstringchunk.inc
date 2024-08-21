/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGStringChunk = record
  end;
  PGStringChunk = ^TGStringChunk;

function g_string_chunk_new(size: Tgsize): PGStringChunk; cdecl; external libglib2;
procedure g_string_chunk_free(chunk: PGStringChunk); cdecl; external libglib2;
procedure g_string_chunk_clear(chunk: PGStringChunk); cdecl; external libglib2;
function g_string_chunk_insert(chunk: PGStringChunk; _string: Pgchar): Pgchar; cdecl; external libglib2;
function g_string_chunk_insert_len(chunk: PGStringChunk; _string: Pgchar; len: Tgssize): Pgchar; cdecl; external libglib2;
function g_string_chunk_insert_const(chunk: PGStringChunk; _string: Pgchar): Pgchar; cdecl; external libglib2;

// === Konventiert am: 11-8-24 15:56:52 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
