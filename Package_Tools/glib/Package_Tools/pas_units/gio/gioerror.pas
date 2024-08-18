unit gioerror;

interface

uses
  common_GLIB, gtypes, gquark, gfileutils, gtype, giotypes, gobject, gioenums;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

function g_io_error_quark: TGQuark; cdecl; external libgio2;
function g_io_error_from_errno(err_no: Tgint): TGIOErrorEnum; cdecl; external libgio2;
function g_io_error_from_file_error(file_error: TGFileError): TGIOErrorEnum; cdecl; external libgio2;
function g_io_error_from_win32_error(error_code: Tgint): TGIOErrorEnum; cdecl; external libgio2;

function G_IO_ERROR: TGQuark;

// === Konventiert am: 18-8-24 17:14:46 ===


implementation

function G_IO_ERROR: TGQuark;
begin
  G_IO_ERROR := g_io_error_quark;
end;


end.
