/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

function g_base64_encode_step(_in: Pguchar; len: Tgsize; break_lines: Tgboolean; out_: Pgchar; state: Pgint;
  save: Pgint): Tgsize; cdecl; external libglib2;
function g_base64_encode_close(break_lines: Tgboolean; _out: Pgchar; state: Pgint; save: Pgint): Tgsize; cdecl; external libglib2;
function g_base64_encode(Data: Pguchar; len: Tgsize): Pgchar; cdecl; external libglib2;
function g_base64_decode_step(_in: Pgchar; len: Tgsize; _out: Pguchar; state: Pgint; save: Pguint): Tgsize; cdecl; external libglib2;
function g_base64_decode(Text: Pgchar; out_len: Pgsize): Pguchar; cdecl; external libglib2;
function g_base64_decode_inplace(Text: Pgchar; out_len: Pgsize): Pguchar; cdecl; external libglib2;

// === Konventiert am: 11-8-24 15:45:58 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
