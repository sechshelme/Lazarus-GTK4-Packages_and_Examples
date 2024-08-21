/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGUri = record
  end;
  PGUri = ^TGUri;

function g_uri_ref(uri: PGUri): PGUri; cdecl; external libglib2;
procedure g_uri_unref(uri: PGUri); cdecl; external libglib2;

type
  PGUriFlags = ^TGUriFlags;
  TGUriFlags = longint;

const
  G_URI_FLAGS_NONE = 0;
  G_URI_FLAGS_PARSE_RELAXED = 1 shl 0;
  G_URI_FLAGS_HAS_PASSWORD = 1 shl 1;
  G_URI_FLAGS_HAS_AUTH_PARAMS = 1 shl 2;
  G_URI_FLAGS_ENCODED = 1 shl 3;
  G_URI_FLAGS_NON_DNS = 1 shl 4;
  G_URI_FLAGS_ENCODED_QUERY = 1 shl 5;
  G_URI_FLAGS_ENCODED_PATH = 1 shl 6;
  G_URI_FLAGS_ENCODED_FRAGMENT = 1 shl 7;
  G_URI_FLAGS_SCHEME_NORMALIZE = 1 shl 8;


function g_uri_split(uri_ref: Pgchar; flags: TGUriFlags; scheme: PPgchar; userinfo: PPgchar; host: PPgchar;
  port: Pgint; path: PPgchar; query: PPgchar; fragment: PPgchar; error: PPGError): Tgboolean; cdecl; external libglib2;
function g_uri_split_with_user(uri_ref: Pgchar; flags: TGUriFlags; scheme: PPgchar; user: PPgchar; password: PPgchar;
  auth_params: PPgchar; host: PPgchar; port: Pgint; path: PPgchar; query: PPgchar;
  fragment: PPgchar; error: PPGError): Tgboolean; cdecl; external libglib2;
function g_uri_split_network(uri_string: Pgchar; flags: TGUriFlags; scheme: PPgchar; host: PPgchar; port: Pgint;
  error: PPGError): Tgboolean; cdecl; external libglib2;
function g_uri_is_valid(uri_string: Pgchar; flags: TGUriFlags; error: PPGError): Tgboolean; cdecl; external libglib2;
function g_uri_join(flags: TGUriFlags; scheme: Pgchar; userinfo: Pgchar; host: Pgchar; port: Tgint;
  path: Pgchar; query: Pgchar; fragment: Pgchar): Pgchar; cdecl; external libglib2;
function g_uri_join_with_user(flags: TGUriFlags; scheme: Pgchar; user: Pgchar; password: Pgchar; auth_params: Pgchar;
  host: Pgchar; port: Tgint; path: Pgchar; query: Pgchar; fragment: Pgchar): Pgchar; cdecl; external libglib2;
function g_uri_parse(uri_string: Pgchar; flags: TGUriFlags; error: PPGError): PGUri; cdecl; external libglib2;
function g_uri_parse_relative(base_uri: PGUri; uri_ref: Pgchar; flags: TGUriFlags; error: PPGError): PGUri; cdecl; external libglib2;
function g_uri_resolve_relative(base_uri_string: Pgchar; uri_ref: Pgchar; flags: TGUriFlags; error: PPGError): Pgchar; cdecl; external libglib2;
function g_uri_build(flags: TGUriFlags; scheme: Pgchar; userinfo: Pgchar; host: Pgchar; port: Tgint;
  path: Pgchar; query: Pgchar; fragment: Pgchar): PGUri; cdecl; external libglib2;
function g_uri_build_with_user(flags: TGUriFlags; scheme: Pgchar; user: Pgchar; password: Pgchar; auth_params: Pgchar;
  host: Pgchar; port: Tgint; path: Pgchar; query: Pgchar; fragment: Pgchar): PGUri; cdecl; external libglib2;

type
  PGUriHideFlags = ^TGUriHideFlags;
  TGUriHideFlags = longint;

const
  G_URI_HIDE_NONE = 0;
  G_URI_HIDE_USERINFO = 1 shl 0;
  G_URI_HIDE_PASSWORD = 1 shl 1;
  G_URI_HIDE_AUTH_PARAMS = 1 shl 2;
  G_URI_HIDE_QUERY = 1 shl 3;
  G_URI_HIDE_FRAGMENT = 1 shl 4;

function g_uri_to_string(uri: PGUri): PChar; cdecl; external libglib2;
function g_uri_to_string_partial(uri: PGUri; flags: TGUriHideFlags): PChar; cdecl; external libglib2;
function g_uri_get_scheme(uri: PGUri): Pgchar; cdecl; external libglib2;
function g_uri_get_userinfo(uri: PGUri): Pgchar; cdecl; external libglib2;
function g_uri_get_user(uri: PGUri): Pgchar; cdecl; external libglib2;
function g_uri_get_password(uri: PGUri): Pgchar; cdecl; external libglib2;
function g_uri_get_auth_params(uri: PGUri): Pgchar; cdecl; external libglib2;
function g_uri_get_host(uri: PGUri): Pgchar; cdecl; external libglib2;
function g_uri_get_port(uri: PGUri): Tgint; cdecl; external libglib2;
function g_uri_get_path(uri: PGUri): Pgchar; cdecl; external libglib2;
function g_uri_get_query(uri: PGUri): Pgchar; cdecl; external libglib2;
function g_uri_get_fragment(uri: PGUri): Pgchar; cdecl; external libglib2;
function g_uri_get_flags(uri: PGUri): TGUriFlags; cdecl; external libglib2;

type
  PGUriParamsFlags = ^TGUriParamsFlags;
  TGUriParamsFlags = longint;

const
  G_URI_PARAMS_NONE = 0;
  G_URI_PARAMS_CASE_INSENSITIVE = 1 shl 0;
  G_URI_PARAMS_WWW_FORM = 1 shl 1;
  G_URI_PARAMS_PARSE_RELAXED = 1 shl 2;


function g_uri_parse_params(params: Pgchar; length: Tgssize; separators: Pgchar; flags: TGUriParamsFlags; error: PPGError): PGHashTable; cdecl; external libglib2;

type
  PGUriParamsIter = ^TGUriParamsIter;

  TGUriParamsIter = record
    dummy0: Tgint;
    dummy1: Tgpointer;
    dummy2: Tgpointer;
    dummy3: array[0..255] of Tguint8;
  end;


procedure g_uri_params_iter_init(iter: PGUriParamsIter; params: Pgchar; length: Tgssize; separators: Pgchar; flags: TGUriParamsFlags); cdecl; external libglib2;
function g_uri_params_iter_next(iter: PGUriParamsIter; attribute: PPgchar; Value: PPgchar; error: PPGError): Tgboolean; cdecl; external libglib2;


function g_uri_error_quark: TGQuark; cdecl; external libglib2;

type
  PGUriError = ^TGUriError;
  TGUriError = longint;

const
  G_URI_ERROR_FAILED = 0;
  G_URI_ERROR_BAD_SCHEME = 1;
  G_URI_ERROR_BAD_USER = 2;
  G_URI_ERROR_BAD_PASSWORD = 3;
  G_URI_ERROR_BAD_AUTH_PARAMS = 4;
  G_URI_ERROR_BAD_HOST = 5;
  G_URI_ERROR_BAD_PORT = 6;
  G_URI_ERROR_BAD_PATH = 7;
  G_URI_ERROR_BAD_QUERY = 8;
  G_URI_ERROR_BAD_FRAGMENT = 9;
  G_URI_RESERVED_CHARS_GENERIC_DELIMITERS = ':/?#[]@';
  G_URI_RESERVED_CHARS_SUBCOMPONENT_DELIMITERS = '!$&''()*+,;=';
  G_URI_RESERVED_CHARS_ALLOWED_IN_PATH_ELEMENT = '!$&''()*+,;=:@';
  G_URI_RESERVED_CHARS_ALLOWED_IN_PATH = '!$&''()*+,;=:@/';
  G_URI_RESERVED_CHARS_ALLOWED_IN_USERINFO = '!$&''()*+,;=:';

function g_uri_unescape_string(escaped_string: PChar; illegal_characters: PChar): PChar; cdecl; external libglib2;
function g_uri_unescape_segment(escaped_string: PChar; escaped_string_end: PChar; illegal_characters: PChar): PChar; cdecl; external libglib2;
function g_uri_parse_scheme(uri: PChar): PChar; cdecl; external libglib2;
function g_uri_peek_scheme(uri: PChar): PChar; cdecl; external libglib2;
function g_uri_escape_string(unescaped: PChar; reserved_chars_allowed: PChar; allow_utf8: Tgboolean): PChar; cdecl; external libglib2;
function g_uri_unescape_bytes(escaped_string: PChar; length: Tgssize; illegal_characters: PChar; error: PPGError): PGBytes; cdecl; external libglib2;
function g_uri_escape_bytes(unescaped: Pguint8; length: Tgsize; reserved_chars_allowed: PChar): PChar; cdecl; external libglib2;

function G_URI_ERROR: TGQuark;

// === Konventiert am: 8-8-24 17:01:36 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_URI_ERROR: TGQuark;
begin
  G_URI_ERROR := g_uri_error_quark;
end;

{$ENDIF read_implementation}
