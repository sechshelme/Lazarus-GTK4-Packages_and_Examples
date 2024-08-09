unit gscanner;

interface

uses
  common_GLIB, gtypes, gdataset, ghash;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  G_CSET_A_2_Z = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  G_CSET_a_2_z_ = 'abcdefghijklmnopqrstuvwxyz';
  G_CSET_DIGITS = '0123456789';
  {#define G_CSET_LATINC  "\300\301\302\303\304\305\306"\ }
  {      "\307\310\311\312\313\314\315\316\317\320"\ }
  {      "\321\322\323\324\325\326"\ }
  {      "\330\331\332\333\334\335\336" }
  {#define G_CSET_LATINS  "\337\340\341\342\343\344\345\346"\ }
  {      "\347\350\351\352\353\354\355\356\357\360"\ }
  {      "\361\362\363\364\365\366"\ }
  {      "\370\371\372\373\374\375\376\377" }

type
  PGErrorType = ^TGErrorType;
  TGErrorType = longint;

const
  G_ERR_UNKNOWN = 0;
  G_ERR_UNEXP_EOF = 1;
  G_ERR_UNEXP_EOF_IN_STRING = 2;
  G_ERR_UNEXP_EOF_IN_COMMENT = 3;
  G_ERR_NON_DIGIT_IN_CONST = 4;
  G_ERR_DIGIT_RADIX = 5;
  G_ERR_FLOAT_RADIX = 6;
  G_ERR_FLOAT_MALFORMED = 7;

type
  PGTokenType = ^TGTokenType;
  TGTokenType = longint;

const
  G_TOKEN_EOF = 0;
  G_TOKEN_LEFT_PAREN = '(';
  G_TOKEN_RIGHT_PAREN = ')';
  G_TOKEN_LEFT_CURLY = '{';
  G_TOKEN_RIGHT_CURLY = '}';
  G_TOKEN_LEFT_BRACE = '[';
  G_TOKEN_RIGHT_BRACE = ']';
  G_TOKEN_EQUAL_SIGN = '=';
  G_TOKEN_COMMA = ',';
  G_TOKEN_NONE = 256;
  G_TOKEN_ERROR = 257;
  G_TOKEN_CHAR = 258;
  G_TOKEN_BINARY = 259;
  G_TOKEN_OCTAL = 260;
  G_TOKEN_INT = 261;
  G_TOKEN_HEX = 262;
  G_TOKEN_FLOAT = 263;
  G_TOKEN_STRING = 264;
  G_TOKEN_SYMBOL = 265;
  G_TOKEN_IDENTIFIER = 266;
  G_TOKEN_IDENTIFIER_NULL = 267;
  G_TOKEN_COMMENT_SINGLE = 268;
  G_TOKEN_COMMENT_MULTI = 269;
  G_TOKEN_LAST = 270;

type
  PGTokenValue = ^TGTokenValue;
  TGTokenValue = record
    case longint of
      0: (v_symbol: Tgpointer);
      1: (v_identifier: Pgchar);
      2: (v_binary: Tgulong);
      3: (v_octal: Tgulong);
      4: (v_int: Tgulong);
      5: (v_int64: Tguint64);
      6: (v_float: Tgdouble);
      7: (v_hex: Tgulong);
      8: (v_string: Pgchar);
      9: (v_comment: Pgchar);
      10: (v_char: Tguchar);
      11: (v_error: Tguint);
  end;

  // struct  _GScannerConfig
  //{
  //  /* Character sets
  //   */
  //  gchar    *cset_skip_characters;    /* default: " \t\n" */
  //  gchar    *cset_identifier_first;
  //  gchar    *cset_identifier_nth;
  //  gchar    *cpair_comment_single;    /* default: "#\n" */
  //
  //  /* Should symbol lookup work case sensitive?
  //   */
  //  guint    case_sensitive : 1;
  //
  //  /* Boolean values to be adjusted "on the fly"
  //   * to configure scanning behaviour.
  //   */
  //  guint    skip_comment_multi : 1;    /* C like comment */
  //  guint    skip_comment_single : 1;  /* single line comment */
  //  guint    scan_comment_multi : 1;    /* scan multi line comments? */
  //  guint    scan_identifier : 1;
  //  guint    scan_identifier_1char : 1;
  //  guint    scan_identifier_NULL : 1;
  //  guint    scan_symbols : 1;
  //  guint    scan_binary : 1;
  //  guint    scan_octal : 1;
  //  guint    scan_float : 1;
  //  guint    scan_hex : 1;      /* '0x0ff0' */
  //  guint    scan_hex_dollar : 1;    /* '$0ff0' */
  //  guint    scan_string_sq : 1;    /* string: 'anything' */
  //  guint    scan_string_dq : 1;    /* string: "\\-escapes!\n" */
  //  guint    numbers_2_int : 1;    /* bin, octal, hex => int */
  //  guint    int_2_float : 1;    /* int => G_TOKEN_FLOAT? */
  //  guint    identifier_2_string : 1;
  //  guint    char_2_token : 1;    /* return G_TOKEN_CHAR? */
  //  guint    symbol_2_token : 1;
  //  guint    scope_0_fallback : 1;    /* try scope 0 on lookups? */
  //  guint    store_int64 : 1;     /* use value.v_int64 rather than v_int */
  //
  //  /*< private >*/
  //  guint    padding_dummy;
  //};


  TGScannerConfig = bitpacked record
    cset_skip_characters: Pgchar;
    cset_identifier_first: Pgchar;
    cset_identifier_nth: Pgchar;
    cpair_comment_single: Pgchar;

    case_sensitive: 0..1;
    skip_comment_multi: 0..1;
    skip_comment_single: 0..1;
    scan_comment_multi: 0..1;
    scan_identifier: 0..1;
    scan_identifier_1char: 0..1;
    scan_identifier_NULL: 0..1;
    scan_symbols: 0..1;
    scan_binary: 0..1;
    scan_octal: 0..1;
    scan_float: 0..1;
    scan_hex: 0..1;
    scan_hex_dollar: 0..1;
    scan_string_sq: 0..1;
    scan_string_dq: 0..1;
    numbers_2_int: 0..1;
    int_2_float: 0..1;
    identifier_2_string: 0..1;
    char_2_token: 0..1;
    symbol_2_token: 0..1;
    scope_0_fallback: 0..1;
    store_int64: 0..1;

    pp: array[0..8] of 0..1;

    padding_dummy: Tguint;
    //    c:PChar;
  end;
  PGScannerConfig = ^TGScannerConfig;


type
  PGScanner = ^TGScanner;
  TGScannerMsgFunc = procedure(scanner: PGScanner; message: Pgchar; error: Tgboolean); cdecl;

  TGScanner = record
    user_data: Tgpointer;
    max_parse_errors: Tguint;
    parse_errors: Tguint;
    input_name: Pgchar;
    qdata: PGData;
    config: PGScannerConfig;
    token: TGTokenType;
    Value: TGTokenValue;
    line: Tguint;
    position: Tguint;
    next_token: TGTokenType;
    next_value: TGTokenValue;
    next_line: Tguint;
    next_position: Tguint;
    symbol_table: PGHashTable;
    input_fd: Tgint;
    Text: Pgchar;
    text_end: Pgchar;
    buffer: Pgchar;
    scope_id: Tguint;
    msg_handler: TGScannerMsgFunc;
  end;


function g_scanner_new(config_templ: PGScannerConfig): PGScanner; cdecl; external libglib2;
procedure g_scanner_destroy(scanner: PGScanner); cdecl; external libglib2;
procedure g_scanner_input_file(scanner: PGScanner; input_fd: Tgint); cdecl; external libglib2;
procedure g_scanner_sync_file_offset(scanner: PGScanner); cdecl; external libglib2;
procedure g_scanner_input_text(scanner: PGScanner; Text: Pgchar; text_len: Tguint); cdecl; external libglib2;
function g_scanner_get_next_token(scanner: PGScanner): TGTokenType; cdecl; external libglib2;
function g_scanner_peek_next_token(scanner: PGScanner): TGTokenType; cdecl; external libglib2;
function g_scanner_cur_token(scanner: PGScanner): TGTokenType; cdecl; external libglib2;
function g_scanner_cur_value(scanner: PGScanner): TGTokenValue; cdecl; external libglib2;
function g_scanner_cur_line(scanner: PGScanner): Tguint; cdecl; external libglib2;
function g_scanner_cur_position(scanner: PGScanner): Tguint; cdecl; external libglib2;
function g_scanner_eof(scanner: PGScanner): Tgboolean; cdecl; external libglib2;
function g_scanner_set_scope(scanner: PGScanner; scope_id: Tguint): Tguint; cdecl; external libglib2;
procedure g_scanner_scope_add_symbol(scanner: PGScanner; scope_id: Tguint; symbol: Pgchar; Value: Tgpointer); cdecl; external libglib2;
procedure g_scanner_scope_remove_symbol(scanner: PGScanner; scope_id: Tguint; symbol: Pgchar); cdecl; external libglib2;
function g_scanner_scope_lookup_symbol(scanner: PGScanner; scope_id: Tguint; symbol: Pgchar): Tgpointer; cdecl; external libglib2;
procedure g_scanner_scope_foreach_symbol(scanner: PGScanner; scope_id: Tguint; func: TGHFunc; user_data: Tgpointer); cdecl; external libglib2;
function g_scanner_lookup_symbol(scanner: PGScanner; symbol: Pgchar): Tgpointer; cdecl; external libglib2;
procedure g_scanner_unexp_token(scanner: PGScanner; expected_token: TGTokenType; identifier_spec: Pgchar; symbol_spec: Pgchar; symbol_name: Pgchar;
  message: Pgchar; is_error: Tgint); cdecl; external libglib2;
procedure g_scanner_error(scanner: PGScanner; format: Pgchar; args: array of const); cdecl; external libglib2;
procedure g_scanner_error(scanner: PGScanner; format: Pgchar); cdecl; external libglib2;
procedure g_scanner_warn(scanner: PGScanner; format: Pgchar; args: array of const); cdecl; external libglib2;
procedure g_scanner_warn(scanner: PGScanner; format: Pgchar); cdecl; external libglib2;

function g_scanner_freeze_symbol_table(scanner: Pointer): pointer;
function g_scanner_thaw_symbol_table(scanner: Pointer): pointer;


// === Konventiert am: 9-8-24 16:52:36 ===

procedure g_scanner_add_symbol(scanner: PGScanner; symbol: Pgchar; Value: Tgpointer);
procedure g_scanner_remove_symbol(scanner: PGScanner; symbol: Pgchar);
procedure g_scanner_foreach_symbol(scanner: PGScanner; func: TGHFunc; Data: Tgpointer);


(*
#define    g_scanner_add_symbol( scanner, symbol, value )  G_STMT_START { \
  g_scanner_scope_add_symbol ((scanner), 0, (symbol), (value)); \
} G_STMT_END GLIB_DEPRECATED_MACRO_IN_2_26_FOR(g_scanner_scope_add_symbol)
#define    g_scanner_remove_symbol( scanner, symbol )  G_STMT_START { \
  g_scanner_scope_remove_symbol ((scanner), 0, (symbol)); \
} G_STMT_END GLIB_DEPRECATED_MACRO_IN_2_26_FOR(g_scanner_scope_remove_symbol)
#define    g_scanner_foreach_symbol( scanner, func, data )  G_STMT_START { \
  g_scanner_scope_foreach_symbol ((scanner), 0, (func), (data)); \
} G_STMT_END GLIB_DEPRECATED_MACRO_IN_2_26_FOR(g_scanner_scope_foreach_symbol)
*)


implementation


function g_scanner_freeze_symbol_table(scanner: Pointer): pointer;
begin
  g_scanner_freeze_symbol_table := pointer(0);
end;

function g_scanner_thaw_symbol_table(scanner: Pointer): pointer;
begin
  g_scanner_thaw_symbol_table := pointer(0);
end;

procedure g_scanner_add_symbol(scanner: PGScanner; symbol: Pgchar;
  Value: Tgpointer);
begin
  g_scanner_scope_add_symbol(scanner, 0, symbol, Value);
end;

procedure g_scanner_remove_symbol(scanner: PGScanner; symbol: Pgchar);
begin
  g_scanner_scope_remove_symbol(scanner, 0, symbol);
end;

procedure g_scanner_foreach_symbol(scanner: PGScanner; func: TGHFunc;
  Data: Tgpointer);
begin
  g_scanner_scope_foreach_symbol(scanner, 0, func, Data);
end;


end.
