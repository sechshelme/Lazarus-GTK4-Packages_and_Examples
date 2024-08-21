/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

function g_bytes_new(Data: Tgconstpointer; size: Tgsize): PGBytes; cdecl; external libglib2;
function g_bytes_new_take(Data: Tgpointer; size: Tgsize): PGBytes; cdecl; external libglib2;
function g_bytes_new_static(Data: Tgconstpointer; size: Tgsize): PGBytes; cdecl; external libglib2;
function g_bytes_new_with_free_func(Data: Tgconstpointer; size: Tgsize; free_func: TGDestroyNotify; user_data: Tgpointer): PGBytes; cdecl; external libglib2;
function g_bytes_new_from_bytes(bytes: PGBytes; offset: Tgsize; length: Tgsize): PGBytes; cdecl; external libglib2;
function g_bytes_get_data(bytes: PGBytes; size: Pgsize): Tgconstpointer; cdecl; external libglib2;
function g_bytes_get_size(bytes: PGBytes): Tgsize; cdecl; external libglib2;
function g_bytes_ref(bytes: PGBytes): PGBytes; cdecl; external libglib2;
procedure g_bytes_unref(bytes: PGBytes); cdecl; external libglib2;
function g_bytes_unref_to_data(bytes: PGBytes; size: Pgsize): Tgpointer; cdecl; external libglib2;
function g_bytes_unref_to_array(bytes: PGBytes): PGByteArray; cdecl; external libglib2;
function g_bytes_hash(bytes: Tgconstpointer): Tguint; cdecl; external libglib2;
function g_bytes_equal(bytes1: Tgconstpointer; bytes2: Tgconstpointer): Tgboolean; cdecl; external libglib2;
function g_bytes_compare(bytes1: Tgconstpointer; bytes2: Tgconstpointer): Tgint; cdecl; external libglib2;
function g_bytes_get_region(bytes: PGBytes; element_size: Tgsize; offset: Tgsize; n_elements: Tgsize): Tgconstpointer; cdecl; external libglib2;

// === Konventiert am: 11-8-24 15:34:13 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
