unit gstrfuncs;

interface

uses
  common_GLIB, gtypes, gerror, gquark;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PGAsciiType = ^TGAsciiType;
  TGAsciiType = longint;

const
  G_ASCII_ALNUM = 1 shl 0;
  G_ASCII_ALPHA = 1 shl 1;
  G_ASCII_CNTRL = 1 shl 2;
  G_ASCII_DIGIT = 1 shl 3;
  G_ASCII_GRAPH = 1 shl 4;
  G_ASCII_LOWER = 1 shl 5;
  G_ASCII_PRINT = 1 shl 6;
  G_ASCII_PUNCT = 1 shl 7;
  G_ASCII_SPACE = 1 shl 8;
  G_ASCII_UPPER = 1 shl 9;
  G_ASCII_XDIGIT = 1 shl 10;

var
  g_ascii_table: Pguint16; cvar;external libglib2;

function g_ascii_tolower(c: Tgchar): Tgchar; cdecl; external libglib2;
function g_ascii_toupper(c: Tgchar): Tgchar; cdecl; external libglib2;
function g_ascii_digit_value(c: Tgchar): Tgint; cdecl; external libglib2;
function g_ascii_xdigit_value(c: Tgchar): Tgint; cdecl; external libglib2;

const
  G_STR_DELIMITERS = '_-|> <.';

function g_strdelimit(_string: Pgchar; delimiters: Pgchar; new_delimiter: Tgchar): Pgchar; cdecl; external libglib2;
function g_strcanon(_string: Pgchar; valid_chars: Pgchar; substitutor: Tgchar): Pgchar; cdecl; external libglib2;
function g_strerror(errnum: Tgint): Pgchar; cdecl; external libglib2;
function g_strsignal(signum: Tgint): Pgchar; cdecl; external libglib2;
function g_strreverse(_string: Pgchar): Pgchar; cdecl; external libglib2;
function g_strlcpy(dest: Pgchar; src: Pgchar; dest_size: Tgsize): Tgsize; cdecl; external libglib2;
function g_strlcat(dest: Pgchar; src: Pgchar; dest_size: Tgsize): Tgsize; cdecl; external libglib2;
function g_strstr_len(haystack: Pgchar; haystack_len: Tgssize; needle: Pgchar): Pgchar; cdecl; external libglib2;
function g_strrstr(haystack: Pgchar; needle: Pgchar): Pgchar; cdecl; external libglib2;
function g_strrstr_len(haystack: Pgchar; haystack_len: Tgssize; needle: Pgchar): Pgchar; cdecl; external libglib2;
function g_str_has_suffix(str: Pgchar; suffix: Pgchar): Tgboolean; cdecl; external libglib2;
function g_str_has_prefix(str: Pgchar; prefix: Pgchar): Tgboolean; cdecl; external libglib2;

function g_strtod(nptr: Pgchar; endptr: PPgchar): Tgdouble; cdecl; external libglib2;
function g_ascii_strtod(nptr: Pgchar; endptr: PPgchar): Tgdouble; cdecl; external libglib2;
function g_ascii_strtoull(nptr: Pgchar; endptr: PPgchar; base: Tguint): Tguint64; cdecl; external libglib2;
function g_ascii_strtoll(nptr: Pgchar; endptr: PPgchar; base: Tguint): Tgint64; cdecl; external libglib2;

const
  G_ASCII_DTOSTR_BUF_SIZE = 29 + 10;

function g_ascii_dtostr(buffer: Pgchar; buf_len: Tgint; d: Tgdouble): Pgchar; cdecl; external libglib2;
function g_ascii_formatd(buffer: Pgchar; buf_len: Tgint; format: Pgchar; d: Tgdouble): Pgchar; cdecl; external libglib2;
function g_strchug(_string: Pgchar): Pgchar; cdecl; external libglib2;
function g_strchomp(_string: Pgchar): Pgchar; cdecl; external libglib2;

function g_ascii_strcasecmp(s1: Pgchar; s2: Pgchar): Tgint; cdecl; external libglib2;
function g_ascii_strncasecmp(s1: Pgchar; s2: Pgchar; n: Tgsize): Tgint; cdecl; external libglib2;
function g_ascii_strdown(str: Pgchar; len: Tgssize): Pgchar; cdecl; external libglib2;
function g_ascii_strup(str: Pgchar; len: Tgssize): Pgchar; cdecl; external libglib2;
function g_str_is_ascii(str: Pgchar): Tgboolean; cdecl; external libglib2;
function g_strcasecmp(s1: Pgchar; s2: Pgchar): Tgint; cdecl; external libglib2;
function g_strncasecmp(s1: Pgchar; s2: Pgchar; n: Tguint): Tgint; cdecl; external libglib2;
function g_strdown(_string: Pgchar): Pgchar; cdecl; external libglib2;
function g_strup(_string: Pgchar): Pgchar; cdecl; external libglib2;
function g_strdup(str: Pgchar): Pgchar; cdecl; external libglib2;
function g_strdup_printf(format: Pgchar; args: array of const): Pgchar; cdecl; external libglib2;
function g_strdup_printf(format: Pgchar): Pgchar; cdecl; external libglib2;
function g_strdup_vprintf(format: Pgchar; args: Tva_list): Pgchar; cdecl; external libglib2;
function g_strndup(str: Pgchar; n: Tgsize): Pgchar; cdecl; external libglib2;
function g_strnfill(length: Tgsize; fill_char: Tgchar): Pgchar; cdecl; external libglib2;
function g_strconcat(string1: Pgchar; args: array of const): Pgchar; cdecl; external libglib2;
function g_strconcat(string1: Pgchar): Pgchar; cdecl; external libglib2;
function g_strjoin(separator: Pgchar; args: array of const): Pgchar; cdecl; external libglib2;
function g_strjoin(separator: Pgchar): Pgchar; cdecl; external libglib2;
function g_strcompress(Source: Pgchar): Pgchar; cdecl; external libglib2;
function g_strescape(Source: Pgchar; exceptions: Pgchar): Pgchar; cdecl; external libglib2;
function g_memdup(mem: Tgconstpointer; byte_size: Tguint): Tgpointer; cdecl; external libglib2;
function g_memdup2(mem: Tgconstpointer; byte_size: Tgsize): Tgpointer; cdecl; external libglib2;

type
  PGStrv = ^TGStrv;
  TGStrv = ^Pgchar;

function g_strsplit(_string: Pgchar; delimiter: Pgchar; max_tokens: Tgint): PPgchar; cdecl; external libglib2;
function g_strsplit_set(_string: Pgchar; delimiters: Pgchar; max_tokens: Tgint): PPgchar; cdecl; external libglib2;
function g_strjoinv(separator: Pgchar; str_array: PPgchar): Pgchar; cdecl; external libglib2;
procedure g_strfreev(str_array: PPgchar); cdecl; external libglib2;
function g_strdupv(str_array: PPgchar): PPgchar; cdecl; external libglib2;
function g_strv_length(str_array: PPgchar): Tguint; cdecl; external libglib2;
function g_stpcpy(dest: Pgchar; src: PChar): Pgchar; cdecl; external libglib2;
function g_str_to_ascii(str: Pgchar; from_locale: Pgchar): Pgchar; cdecl; external libglib2;
function g_str_tokenize_and_fold(_string: Pgchar; translit_locale: Pgchar; ascii_alternates: PPPgchar): PPgchar; cdecl; external libglib2;
function g_str_match_string(search_term: Pgchar; potential_hit: Pgchar; accept_alternates: Tgboolean): Tgboolean; cdecl; external libglib2;
function g_strv_contains(strv: PPgchar; str: Pgchar): Tgboolean; cdecl; external libglib2;
function g_strv_equal(strv1: PPgchar; strv2: PPgchar): Tgboolean; cdecl; external libglib2;

type
  PGNumberParserError = ^TGNumberParserError;
  TGNumberParserError = longint;

const
  G_NUMBER_PARSER_ERROR_INVALID = 0;
  G_NUMBER_PARSER_ERROR_OUT_OF_BOUNDS = 1;


function g_number_parser_error_quark: TGQuark; cdecl; external libglib2;
function g_ascii_string_to_signed(str: Pgchar; base: Tguint; min: Tgint64; max: Tgint64; out_num: Pgint64;
  error: PPGError): Tgboolean; cdecl; external libglib2;
function g_ascii_string_to_unsigned(str: Pgchar; base: Tguint; min: Tguint64; max: Tguint64; out_num: Pguint64;
  error: PPGError): Tgboolean; cdecl; external libglib2;

function g_strstrip(_string: Pgchar): Pgchar;

function g_ascii_isalnum(c: char): boolean;
function g_ascii_isalpha(c: char): boolean;
function g_ascii_iscntrl(c: char): boolean;
function g_ascii_isdigit(c: char): boolean;
function g_ascii_isgraph(c: char): boolean;
function g_ascii_islower(c: char): boolean;
function g_ascii_isprint(c: char): boolean;
function g_ascii_ispunct(c: char): boolean;
function g_ascii_isspace(c: char): boolean;
function g_ascii_isupper(c: char): boolean;
function g_ascii_isxdigit(c: char): boolean;

function G_NUMBER_PARSER_ERROR: TGQuark;

// === Konventiert am: 8-8-24 15:16:36 ===


implementation

function g_ascii_isalnum(c: char): boolean;
begin
  g_ascii_isalnum := ((g_ascii_table[Tguchar(c)]) and G_ASCII_ALNUM) <> 0;
end;

function g_ascii_isalpha(c: char): boolean;
begin
  g_ascii_isalpha := ((g_ascii_table[Tguchar(c)]) and G_ASCII_ALPHA) <> 0;
end;

function g_ascii_iscntrl(c: char): boolean;
begin
  g_ascii_iscntrl := ((g_ascii_table[Tguchar(c)]) and G_ASCII_CNTRL) <> 0;
end;

function g_ascii_isdigit(c: char): boolean;
begin
  g_ascii_isdigit := ((g_ascii_table[Tguchar(c)]) and G_ASCII_DIGIT) <> 0;
end;

function g_ascii_isgraph(c: char): boolean;
begin
  g_ascii_isgraph := ((g_ascii_table[Tguchar(c)]) and G_ASCII_GRAPH) <> 0;
end;

function g_ascii_islower(c: char): boolean;
begin
  g_ascii_islower := ((g_ascii_table[Tguchar(c)]) and G_ASCII_LOWER) <> 0;
end;

function g_ascii_isprint(c: char): boolean;
begin
  g_ascii_isprint := ((g_ascii_table[Tguchar(c)]) and G_ASCII_PRINT) <> 0;
end;

function g_ascii_ispunct(c: char): boolean;
begin
  g_ascii_ispunct := ((g_ascii_table[Tguchar(c)]) and G_ASCII_PUNCT) <> 0;
end;

function g_ascii_isspace(c: char): boolean;
begin
  g_ascii_isspace := ((g_ascii_table[Tguchar(c)]) and G_ASCII_SPACE) <> 0;
end;

function g_ascii_isupper(c: char): boolean;
begin
  g_ascii_isupper := ((g_ascii_table[Tguchar(c)]) and G_ASCII_UPPER) <> 0;
end;

function g_ascii_isxdigit(c: char): boolean;
begin
  g_ascii_isxdigit := ((g_ascii_table[Tguchar(c)]) and G_ASCII_XDIGIT) <> 0;
end;

function g_strstrip(_string: Pgchar): Pgchar;
begin
  g_strstrip := g_strchomp(g_strchug(_string));
end;

function G_NUMBER_PARSER_ERROR: TGQuark;
begin
  G_NUMBER_PARSER_ERROR := g_number_parser_error_quark;
end;


end.
