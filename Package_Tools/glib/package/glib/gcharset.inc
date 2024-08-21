/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}



function g_get_charset(charset: PPchar): Tgboolean; cdecl; external libglib2;
function g_get_codeset: Pgchar; cdecl; external libglib2;
function g_get_console_charset(charset: PPchar): Tgboolean; cdecl; external libglib2;
function g_get_language_names: PPgchar; cdecl; external libglib2;
function g_get_language_names_with_category(category_name: Pgchar): PPgchar; cdecl; external libglib2;
function g_get_locale_variants(locale: Pgchar): PPgchar; cdecl; external libglib2;

// === Konventiert am: 11-8-24 19:32:53 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
