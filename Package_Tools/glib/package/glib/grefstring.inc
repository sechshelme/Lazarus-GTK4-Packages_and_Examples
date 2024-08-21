/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

function g_ref_string_new(str: PChar): PChar; cdecl; external libglib2;
function g_ref_string_new_len(str: PChar; len: Tgssize): PChar; cdecl; external libglib2;
function g_ref_string_new_intern(str: PChar): PChar; cdecl; external libglib2;
function g_ref_string_acquire(str: PChar): PChar; cdecl; external libglib2;
procedure g_ref_string_release(str: PChar); cdecl; external libglib2;
function g_ref_string_length(str: PChar): Tgsize; cdecl; external libglib2;

type
  PGRefString = ^TGRefString;
  TGRefString = char;

  // === Konventiert am: 11-8-24 19:28:39 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
