/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  PGRegexError = ^TGRegexError;
  TGRegexError = longint;

const
  G_REGEX_ERROR_COMPILE = 0;
  G_REGEX_ERROR_OPTIMIZE = 1;
  G_REGEX_ERROR_REPLACE = 2;
  G_REGEX_ERROR_MATCH = 3;
  G_REGEX_ERROR_INTERNAL = 4;
  G_REGEX_ERROR_STRAY_BACKSLASH = 101;
  G_REGEX_ERROR_MISSING_CONTROL_CHAR = 102;
  G_REGEX_ERROR_UNRECOGNIZED_ESCAPE = 103;
  G_REGEX_ERROR_QUANTIFIERS_OUT_OF_ORDER = 104;
  G_REGEX_ERROR_QUANTIFIER_TOO_BIG = 105;
  G_REGEX_ERROR_UNTERMINATED_CHARACTER_CLASS = 106;
  G_REGEX_ERROR_INVALID_ESCAPE_IN_CHARACTER_CLASS = 107;
  G_REGEX_ERROR_RANGE_OUT_OF_ORDER = 108;
  G_REGEX_ERROR_NOTHING_TO_REPEAT = 109;
  G_REGEX_ERROR_UNRECOGNIZED_CHARACTER = 112;
  G_REGEX_ERROR_POSIX_NAMED_CLASS_OUTSIDE_CLASS = 113;
  G_REGEX_ERROR_UNMATCHED_PARENTHESIS = 114;
  G_REGEX_ERROR_INEXISTENT_SUBPATTERN_REFERENCE = 115;
  G_REGEX_ERROR_UNTERMINATED_COMMENT = 118;
  G_REGEX_ERROR_EXPRESSION_TOO_LARGE = 120;
  G_REGEX_ERROR_MEMORY_ERROR = 121;
  G_REGEX_ERROR_VARIABLE_LENGTH_LOOKBEHIND = 125;
  G_REGEX_ERROR_MALFORMED_CONDITION = 126;
  G_REGEX_ERROR_TOO_MANY_CONDITIONAL_BRANCHES = 127;
  G_REGEX_ERROR_ASSERTION_EXPECTED = 128;
  G_REGEX_ERROR_UNKNOWN_POSIX_CLASS_NAME = 130;
  G_REGEX_ERROR_POSIX_COLLATING_ELEMENTS_NOT_SUPPORTED = 131;
  G_REGEX_ERROR_HEX_CODE_TOO_LARGE = 134;
  G_REGEX_ERROR_INVALID_CONDITION = 135;
  G_REGEX_ERROR_SINGLE_BYTE_MATCH_IN_LOOKBEHIND = 136;
  G_REGEX_ERROR_INFINITE_LOOP = 140;
  G_REGEX_ERROR_MISSING_SUBPATTERN_NAME_TERMINATOR = 142;
  G_REGEX_ERROR_DUPLICATE_SUBPATTERN_NAME = 143;
  G_REGEX_ERROR_MALFORMED_PROPERTY = 146;
  G_REGEX_ERROR_UNKNOWN_PROPERTY = 147;
  G_REGEX_ERROR_SUBPATTERN_NAME_TOO_LONG = 148;
  G_REGEX_ERROR_TOO_MANY_SUBPATTERNS = 149;
  G_REGEX_ERROR_INVALID_OCTAL_VALUE = 151;
  G_REGEX_ERROR_TOO_MANY_BRANCHES_IN_DEFINE = 154;
  G_REGEX_ERROR_DEFINE_REPETION = 155;
  G_REGEX_ERROR_INCONSISTENT_NEWLINE_OPTIONS = 156;
  G_REGEX_ERROR_MISSING_BACK_REFERENCE = 157;
  G_REGEX_ERROR_INVALID_RELATIVE_REFERENCE = 158;
  G_REGEX_ERROR_BACKTRACKING_CONTROL_VERB_ARGUMENT_FORBIDDEN = 159;
  G_REGEX_ERROR_UNKNOWN_BACKTRACKING_CONTROL_VERB = 160;
  G_REGEX_ERROR_NUMBER_TOO_BIG = 161;
  G_REGEX_ERROR_MISSING_SUBPATTERN_NAME = 162;
  G_REGEX_ERROR_MISSING_DIGIT = 163;
  G_REGEX_ERROR_INVALID_DATA_CHARACTER = 164;
  G_REGEX_ERROR_EXTRA_SUBPATTERN_NAME = 165;
  G_REGEX_ERROR_BACKTRACKING_CONTROL_VERB_ARGUMENT_REQUIRED = 166;
  G_REGEX_ERROR_INVALID_CONTROL_CHAR = 168;
  G_REGEX_ERROR_MISSING_NAME = 169;
  G_REGEX_ERROR_NOT_SUPPORTED_IN_CLASS = 171;
  G_REGEX_ERROR_TOO_MANY_FORWARD_REFERENCES = 172;
  G_REGEX_ERROR_NAME_TOO_LONG = 175;
  G_REGEX_ERROR_CHARACTER_VALUE_TOO_LARGE = 176;

function g_regex_error_quark: TGQuark; cdecl; external libglib2;

type
  PGRegexCompileFlags = ^TGRegexCompileFlags;
  TGRegexCompileFlags = longint;

const
  G_REGEX_DEFAULT = 0;
  G_REGEX_CASELESS = 1 shl 0;
  G_REGEX_MULTILINE = 1 shl 1;
  G_REGEX_DOTALL = 1 shl 2;
  G_REGEX_EXTENDED = 1 shl 3;
  G_REGEX_ANCHORED = 1 shl 4;
  G_REGEX_DOLLAR_ENDONLY = 1 shl 5;
  G_REGEX_UNGREEDY = 1 shl 9;
  G_REGEX_RAW = 1 shl 11;
  G_REGEX_NO_AUTO_CAPTURE = 1 shl 12;
  G_REGEX_OPTIMIZE = 1 shl 13;
  G_REGEX_FIRSTLINE = 1 shl 18;
  G_REGEX_DUPNAMES = 1 shl 19;
  G_REGEX_NEWLINE_CR = 1 shl 20;
  G_REGEX_NEWLINE_LF = 1 shl 21;
  G_REGEX_NEWLINE_CRLF = G_REGEX_NEWLINE_CR or G_REGEX_NEWLINE_LF;
  G_REGEX_NEWLINE_ANYCRLF = G_REGEX_NEWLINE_CR or (1 shl 22);
  G_REGEX_BSR_ANYCRLF = 1 shl 23;
  G_REGEX_JAVASCRIPT_COMPAT = 1 shl 25;

type
  PGRegexMatchFlags = ^TGRegexMatchFlags;
  TGRegexMatchFlags = longint;

const
  G_REGEX_MATCH_DEFAULT = 0;
  G_REGEX_MATCH_ANCHORED = 1 shl 4;
  G_REGEX_MATCH_NOTBOL = 1 shl 7;
  G_REGEX_MATCH_NOTEOL = 1 shl 8;
  G_REGEX_MATCH_NOTEMPTY = 1 shl 10;
  G_REGEX_MATCH_PARTIAL = 1 shl 15;
  G_REGEX_MATCH_NEWLINE_CR = 1 shl 20;
  G_REGEX_MATCH_NEWLINE_LF = 1 shl 21;
  G_REGEX_MATCH_NEWLINE_CRLF = G_REGEX_MATCH_NEWLINE_CR or G_REGEX_MATCH_NEWLINE_LF;
  G_REGEX_MATCH_NEWLINE_ANY = 1 shl 22;
  G_REGEX_MATCH_NEWLINE_ANYCRLF = G_REGEX_MATCH_NEWLINE_CR or G_REGEX_MATCH_NEWLINE_ANY;
  G_REGEX_MATCH_BSR_ANYCRLF = 1 shl 23;
  G_REGEX_MATCH_BSR_ANY = 1 shl 24;
  G_REGEX_MATCH_PARTIAL_SOFT = G_REGEX_MATCH_PARTIAL;
  G_REGEX_MATCH_PARTIAL_HARD = 1 shl 27;
  G_REGEX_MATCH_NOTEMPTY_ATSTART = 1 shl 28;

type
  TGRegex = record
  end;
  PGRegex = ^TGRegex;

  TGMatchInfo = record
  end;
  PGMatchInfo = ^TGMatchInfo;
  PPGMatchInfo = ^PGMatchInfo;

  TGRegexEvalCallback = function(match_info: PGMatchInfo; Result: PGString; user_data: Tgpointer): Tgboolean; cdecl;

function g_regex_new(pattern: Pgchar; compile_options: TGRegexCompileFlags; match_options: TGRegexMatchFlags; error: PPGError): PGRegex; cdecl; external libglib2;
function g_regex_ref(regex: PGRegex): PGRegex; cdecl; external libglib2;
procedure g_regex_unref(regex: PGRegex); cdecl; external libglib2;
function g_regex_get_pattern(regex: PGRegex): Pgchar; cdecl; external libglib2;
function g_regex_get_max_backref(regex: PGRegex): Tgint; cdecl; external libglib2;
function g_regex_get_capture_count(regex: PGRegex): Tgint; cdecl; external libglib2;
function g_regex_get_has_cr_or_lf(regex: PGRegex): Tgboolean; cdecl; external libglib2;
function g_regex_get_max_lookbehind(regex: PGRegex): Tgint; cdecl; external libglib2;
function g_regex_get_string_number(regex: PGRegex; Name: Pgchar): Tgint; cdecl; external libglib2;
function g_regex_escape_string(_string: Pgchar; length: Tgint): Pgchar; cdecl; external libglib2;
function g_regex_escape_nul(_string: Pgchar; length: Tgint): Pgchar; cdecl; external libglib2;
function g_regex_get_compile_flags(regex: PGRegex): TGRegexCompileFlags; cdecl; external libglib2;
function g_regex_get_match_flags(regex: PGRegex): TGRegexMatchFlags; cdecl; external libglib2;
function g_regex_match_simple(pattern: Pgchar; _string: Pgchar; compile_options: TGRegexCompileFlags; match_options: TGRegexMatchFlags): Tgboolean; cdecl; external libglib2;
function g_regex_match(regex: PGRegex; _string: Pgchar; match_options: TGRegexMatchFlags; match_info: PPGMatchInfo): Tgboolean; cdecl; external libglib2;
function g_regex_match_full(regex: PGRegex; _string: Pgchar; string_len: Tgssize; start_position: Tgint; match_options: TGRegexMatchFlags;
  match_info: PPGMatchInfo; error: PPGError): Tgboolean; cdecl; external libglib2;
function g_regex_match_all(regex: PGRegex; _string: Pgchar; match_options: TGRegexMatchFlags; match_info: PPGMatchInfo): Tgboolean; cdecl; external libglib2;
function g_regex_match_all_full(regex: PGRegex; _string: Pgchar; string_len: Tgssize; start_position: Tgint; match_options: TGRegexMatchFlags;
  match_info: PPGMatchInfo; error: PPGError): Tgboolean; cdecl; external libglib2;
function g_regex_split_simple(pattern: Pgchar; _string: Pgchar; compile_options: TGRegexCompileFlags; match_options: TGRegexMatchFlags): PPgchar; cdecl; external libglib2;
function g_regex_split(regex: PGRegex; _string: Pgchar; match_options: TGRegexMatchFlags): PPgchar; cdecl; external libglib2;
function g_regex_split_full(regex: PGRegex; _string: Pgchar; string_len: Tgssize; start_position: Tgint; match_options: TGRegexMatchFlags;
  max_tokens: Tgint; error: PPGError): PPgchar; cdecl; external libglib2;
function g_regex_replace(regex: PGRegex; _string: Pgchar; string_len: Tgssize; start_position: Tgint; replacement: Pgchar;
  match_options: TGRegexMatchFlags; error: PPGError): Pgchar; cdecl; external libglib2;
function g_regex_replace_literal(regex: PGRegex; _string: Pgchar; string_len: Tgssize; start_position: Tgint; replacement: Pgchar;
  match_options: TGRegexMatchFlags; error: PPGError): Pgchar; cdecl; external libglib2;
function g_regex_replace_eval(regex: PGRegex; _string: Pgchar; string_len: Tgssize; start_position: Tgint; match_options: TGRegexMatchFlags;
  eval: TGRegexEvalCallback; user_data: Tgpointer; error: PPGError): Pgchar; cdecl; external libglib2;
function g_regex_check_replacement(replacement: Pgchar; has_references: Pgboolean; error: PPGError): Tgboolean; cdecl; external libglib2;
function g_match_info_get_regex(match_info: PGMatchInfo): PGRegex; cdecl; external libglib2;
function g_match_info_get_string(match_info: PGMatchInfo): Pgchar; cdecl; external libglib2;
function g_match_info_ref(match_info: PGMatchInfo): PGMatchInfo; cdecl; external libglib2;
procedure g_match_info_unref(match_info: PGMatchInfo); cdecl; external libglib2;
procedure g_match_info_free(match_info: PGMatchInfo); cdecl; external libglib2;
function g_match_info_next(match_info: PGMatchInfo; error: PPGError): Tgboolean; cdecl; external libglib2;
function g_match_info_matches(match_info: PGMatchInfo): Tgboolean; cdecl; external libglib2;
function g_match_info_get_match_count(match_info: PGMatchInfo): Tgint; cdecl; external libglib2;
function g_match_info_is_partial_match(match_info: PGMatchInfo): Tgboolean; cdecl; external libglib2;
function g_match_info_expand_references(match_info: PGMatchInfo; string_to_expand: Pgchar; error: PPGError): Pgchar; cdecl; external libglib2;
function g_match_info_fetch(match_info: PGMatchInfo; match_num: Tgint): Pgchar; cdecl; external libglib2;
function g_match_info_fetch_pos(match_info: PGMatchInfo; match_num: Tgint; start_pos: Pgint; end_pos: Pgint): Tgboolean; cdecl; external libglib2;
function g_match_info_fetch_named(match_info: PGMatchInfo; Name: Pgchar): Pgchar; cdecl; external libglib2;
function g_match_info_fetch_named_pos(match_info: PGMatchInfo; Name: Pgchar; start_pos: Pgint; end_pos: Pgint): Tgboolean; cdecl; external libglib2;
function g_match_info_fetch_all(match_info: PGMatchInfo): PPgchar; cdecl; external libglib2;

function G_REGEX_ERROR: TGQuark;

// === Konventiert am: 8-8-24 14:21:16 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function G_REGEX_ERROR: TGQuark;
begin
  G_REGEX_ERROR := g_regex_error_quark;
end;


{$ENDIF read_implementation}
