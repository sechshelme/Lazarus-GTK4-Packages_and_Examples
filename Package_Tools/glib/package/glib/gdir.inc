/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGDir = record
  end;
  PGDir = ^TGDir;

function g_dir_open(path: Pgchar; flags: Tguint; error: PPGError): PGDir; cdecl; external libglib2;
function g_dir_read_name(dir: PGDir): Pgchar; cdecl; external libglib2;
procedure g_dir_rewind(dir: PGDir); cdecl; external libglib2;
procedure g_dir_close(dir: PGDir); cdecl; external libglib2;
function g_dir_ref(dir: PGDir): PGDir; cdecl; external libglib2;
procedure g_dir_unref(dir: PGDir); cdecl; external libglib2;

// === Konventiert am: 11-8-24 19:28:29 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
