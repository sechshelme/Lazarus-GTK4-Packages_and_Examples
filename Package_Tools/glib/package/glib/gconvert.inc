/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  PGConvertError = ^TGConvertError;
  TGConvertError = longint;

const
  G_CONVERT_ERROR_NO_CONVERSION = 0;
  G_CONVERT_ERROR_ILLEGAL_SEQUENCE = 1;
  G_CONVERT_ERROR_FAILED = 2;
  G_CONVERT_ERROR_PARTIAL_INPUT = 3;
  G_CONVERT_ERROR_BAD_URI = 4;
  G_CONVERT_ERROR_NOT_ABSOLUTE_PATH = 5;
  G_CONVERT_ERROR_NO_MEMORY = 6;
  G_CONVERT_ERROR_EMBEDDED_NUL = 7;

function g_convert_error_quark: TGQuark; cdecl; external libglib2;

type
  PGIConv = ^TGIConv;
  TGIConv = PGIConv;

function g_iconv_open(to_codeset: Pgchar; from_codeset: Pgchar): TGIConv; cdecl; external libglib2;
function g_iconv(converter: TGIConv; inbuf: PPgchar; inbytes_left: Pgsize; outbuf: PPgchar; outbytes_left: Pgsize): Tgsize; cdecl; external libglib2;
function g_iconv_close(converter: TGIConv): Tgint; cdecl; external libglib2;
function g_convert(str: Pgchar; len: Tgssize; to_codeset: Pgchar; from_codeset: Pgchar; bytes_read: Pgsize;
  bytes_written: Pgsize; error: PPGError): Pgchar; cdecl; external libglib2;
function g_convert_with_iconv(str: Pgchar; len: Tgssize; converter: TGIConv; bytes_read: Pgsize; bytes_written: Pgsize;
  error: PPGError): Pgchar; cdecl; external libglib2;
function g_convert_with_fallback(str: Pgchar; len: Tgssize; to_codeset: Pgchar; from_codeset: Pgchar; fallback: Pgchar;
  bytes_read: Pgsize; bytes_written: Pgsize; error: PPGError): Pgchar; cdecl; external libglib2;
function g_locale_to_utf8(opsysstring: Pgchar; len: Tgssize; bytes_read: Pgsize; bytes_written: Pgsize; error: PPGError): Pgchar; cdecl; external libglib2;
function g_locale_from_utf8(utf8string: Pgchar; len: Tgssize; bytes_read: Pgsize; bytes_written: Pgsize; error: PPGError): Pgchar; cdecl; external libglib2;
function g_filename_to_utf8(opsysstring: Pgchar; len: Tgssize; bytes_read: Pgsize; bytes_written: Pgsize; error: PPGError): Pgchar; cdecl; external libglib2;
function g_filename_from_utf8(utf8string: Pgchar; len: Tgssize; bytes_read: Pgsize; bytes_written: Pgsize; error: PPGError): Pgchar; cdecl; external libglib2;
function g_filename_from_uri(uri: Pgchar; hostname: PPgchar; error: PPGError): Pgchar; cdecl; external libglib2;
function g_filename_to_uri(filename: Pgchar; hostname: Pgchar; error: PPGError): Pgchar; cdecl; external libglib2;
function g_filename_display_name(filename: Pgchar): Pgchar; cdecl; external libglib2;
function g_get_filename_charsets(filename_charsets: PPPgchar): Tgboolean; cdecl; external libglib2;
function g_filename_display_basename(filename: Pgchar): Pgchar; cdecl; external libglib2;
function g_uri_list_extract_uris(uri_list: Pgchar): PPgchar; cdecl; external libglib2;

function G_CONVERT_ERROR: TGQuark;

// === Konventiert am: 8-8-24 19:40:21 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_CONVERT_ERROR: TGQuark;
begin
  G_CONVERT_ERROR := g_convert_error_quark;
end;


{$ENDIF read_implementation}
