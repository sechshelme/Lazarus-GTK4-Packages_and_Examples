/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

function g_io_error_quark: TGQuark; cdecl; external libgio2;
function g_io_error_from_errno(err_no: Tgint): TGIOErrorEnum; cdecl; external libgio2;
function g_io_error_from_file_error(file_error: TGFileError): TGIOErrorEnum; cdecl; external libgio2;
function g_io_error_from_win32_error(error_code: Tgint): TGIOErrorEnum; cdecl; external libgio2;

function G_IO_ERROR: TGQuark;

// === Konventiert am: 18-8-24 17:14:46 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_IO_ERROR: TGQuark;
begin
  G_IO_ERROR := g_io_error_quark;
end;


{$ENDIF read_implementation}
