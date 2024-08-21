/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

function g_printf(format: Pgchar): Tgint; cdecl; varargs external libglib2;
function g_fprintf(file_: PFILE; format: Pgchar): Tgint; cdecl; varargs external libglib2;
function g_sprintf(_string: Pgchar; format: Pgchar): Tgint; cdecl; varargs external libglib2;
function g_vprintf(format: Pgchar; args: Tva_list): Tgint; cdecl; external libglib2;
function g_vfprintf(file_: PFILE; format: Pgchar; args: Tva_list): Tgint; cdecl; external libglib2;
function g_vsprintf(_string: Pgchar; format: Pgchar; args: Tva_list): Tgint; cdecl; external libglib2;
function g_vasprintf(_string: PPgchar; format: Pgchar; args: Tva_list): Tgint; cdecl; external libglib2;

// === Konventiert am: 11-8-24 19:16:43 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
