/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGMappedFile = record
  end;
  PGMappedFile = ^TGMappedFile;

function g_mapped_file_new(filename: Pgchar; writable: Tgboolean; error: PPGError): PGMappedFile; cdecl; external libglib2;
function g_mapped_file_new_from_fd(fd: Tgint; writable: Tgboolean; error: PPGError): PGMappedFile; cdecl; external libglib2;
function g_mapped_file_get_length(file_: PGMappedFile): Tgsize; cdecl; external libglib2;
function g_mapped_file_get_contents(file_: PGMappedFile): Pgchar; cdecl; external libglib2;
function g_mapped_file_get_bytes(file_: PGMappedFile): PGBytes; cdecl; external libglib2;
function g_mapped_file_ref(file_: PGMappedFile): PGMappedFile; cdecl; external libglib2;
procedure g_mapped_file_unref(file_: PGMappedFile); cdecl; external libglib2;
procedure g_mapped_file_free(file_: PGMappedFile); cdecl; external libglib2;

// === Konventiert am: 11-8-24 15:58:59 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
