unit gunicode;

interface

uses
  common_GLIB, gtypes, gerror;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Pgunichar = ^Tgunichar;
  Tgunichar = Tguint32;

  Pgunichar2 = ^Tgunichar2;
  Tgunichar2 = Tguint16;

  PGUnicodeType = ^TGUnicodeType;
  TGUnicodeType = longint;

const
  G_UNICODE_CONTROL = 0;
  G_UNICODE_FORMAT = 1;
  G_UNICODE_UNASSIGNED = 2;
  G_UNICODE_PRIVATE_USE = 3;
  G_UNICODE_SURROGATE = 4;
  G_UNICODE_LOWERCASE_LETTER = 5;
  G_UNICODE_MODIFIER_LETTER = 6;
  G_UNICODE_OTHER_LETTER = 7;
  G_UNICODE_TITLECASE_LETTER = 8;
  G_UNICODE_UPPERCASE_LETTER = 9;
  G_UNICODE_SPACING_MARK = 10;
  G_UNICODE_ENCLOSING_MARK = 11;
  G_UNICODE_NON_SPACING_MARK = 12;
  G_UNICODE_DECIMAL_NUMBER = 13;
  G_UNICODE_LETTER_NUMBER = 14;
  G_UNICODE_OTHER_NUMBER = 15;
  G_UNICODE_CONNECT_PUNCTUATION = 16;
  G_UNICODE_DASH_PUNCTUATION = 17;
  G_UNICODE_CLOSE_PUNCTUATION = 18;
  G_UNICODE_FINAL_PUNCTUATION = 19;
  G_UNICODE_INITIAL_PUNCTUATION = 20;
  G_UNICODE_OTHER_PUNCTUATION = 21;
  G_UNICODE_OPEN_PUNCTUATION = 22;
  G_UNICODE_CURRENCY_SYMBOL = 23;
  G_UNICODE_MODIFIER_SYMBOL = 24;
  G_UNICODE_MATH_SYMBOL = 25;
  G_UNICODE_OTHER_SYMBOL = 26;
  G_UNICODE_LINE_SEPARATOR = 27;
  G_UNICODE_PARAGRAPH_SEPARATOR = 28;
  G_UNICODE_SPACE_SEPARATOR = 29;

type
  PGUnicodeBreakType = ^TGUnicodeBreakType;
  TGUnicodeBreakType = longint;

const
  G_UNICODE_BREAK_MANDATORY = 0;
  G_UNICODE_BREAK_CARRIAGE_RETURN = 1;
  G_UNICODE_BREAK_LINE_FEED = 2;
  G_UNICODE_BREAK_COMBINING_MARK = 3;
  G_UNICODE_BREAK_SURROGATE = 4;
  G_UNICODE_BREAK_ZERO_WIDTH_SPACE = 5;
  G_UNICODE_BREAK_INSEPARABLE = 6;
  G_UNICODE_BREAK_NON_BREAKING_GLUE = 7;
  G_UNICODE_BREAK_CONTINGENT = 8;
  G_UNICODE_BREAK_SPACE = 9;
  G_UNICODE_BREAK_AFTER = 10;
  G_UNICODE_BREAK_BEFORE = 11;
  G_UNICODE_BREAK_BEFORE_AND_AFTER = 12;
  G_UNICODE_BREAK_HYPHEN = 13;
  G_UNICODE_BREAK_NON_STARTER = 14;
  G_UNICODE_BREAK_OPEN_PUNCTUATION = 15;
  G_UNICODE_BREAK_CLOSE_PUNCTUATION = 16;
  G_UNICODE_BREAK_QUOTATION = 17;
  G_UNICODE_BREAK_EXCLAMATION = 18;
  G_UNICODE_BREAK_IDEOGRAPHIC = 19;
  G_UNICODE_BREAK_NUMERIC = 20;
  G_UNICODE_BREAK_INFIX_SEPARATOR = 21;
  G_UNICODE_BREAK_SYMBOL = 22;
  G_UNICODE_BREAK_ALPHABETIC = 23;
  G_UNICODE_BREAK_PREFIX = 24;
  G_UNICODE_BREAK_POSTFIX = 25;
  G_UNICODE_BREAK_COMPLEX_CONTEXT = 26;
  G_UNICODE_BREAK_AMBIGUOUS = 27;
  G_UNICODE_BREAK_UNKNOWN = 28;
  G_UNICODE_BREAK_NEXT_LINE = 29;
  G_UNICODE_BREAK_WORD_JOINER = 30;
  G_UNICODE_BREAK_HANGUL_L_JAMO = 31;
  G_UNICODE_BREAK_HANGUL_V_JAMO = 32;
  G_UNICODE_BREAK_HANGUL_T_JAMO = 33;
  G_UNICODE_BREAK_HANGUL_LV_SYLLABLE = 34;
  G_UNICODE_BREAK_HANGUL_LVT_SYLLABLE = 35;
  G_UNICODE_BREAK_CLOSE_PARANTHESIS = 36;
  G_UNICODE_BREAK_CONDITIONAL_JAPANESE_STARTER = 37;
  G_UNICODE_BREAK_HEBREW_LETTER = 38;
  G_UNICODE_BREAK_REGIONAL_INDICATOR = 39;
  G_UNICODE_BREAK_EMOJI_BASE = 40;
  G_UNICODE_BREAK_EMOJI_MODIFIER = 41;
  G_UNICODE_BREAK_ZERO_WIDTH_JOINER = 42;
  G_UNICODE_BREAK_AKSARA = 43;
  G_UNICODE_BREAK_AKSARA_PRE_BASE = 44;
  G_UNICODE_BREAK_AKSARA_START = 45;
  G_UNICODE_BREAK_VIRAMA_FINAL = 46;
  G_UNICODE_BREAK_VIRAMA = 47;

type
  PGUnicodeScript = ^TGUnicodeScript;
  TGUnicodeScript = longint;

const
  G_UNICODE_SCRIPT_INVALID_CODE = -(1);
  G_UNICODE_SCRIPT_COMMON = 0;
  G_UNICODE_SCRIPT_INHERITED = 1;
  G_UNICODE_SCRIPT_ARABIC = 2;
  G_UNICODE_SCRIPT_ARMENIAN = 3;
  G_UNICODE_SCRIPT_BENGALI = 4;
  G_UNICODE_SCRIPT_BOPOMOFO = 5;
  G_UNICODE_SCRIPT_CHEROKEE = 6;
  G_UNICODE_SCRIPT_COPTIC = 7;
  G_UNICODE_SCRIPT_CYRILLIC = 8;
  G_UNICODE_SCRIPT_DESERET = 9;
  G_UNICODE_SCRIPT_DEVANAGARI = 10;
  G_UNICODE_SCRIPT_ETHIOPIC = 11;
  G_UNICODE_SCRIPT_GEORGIAN = 12;
  G_UNICODE_SCRIPT_GOTHIC = 13;
  G_UNICODE_SCRIPT_GREEK = 14;
  G_UNICODE_SCRIPT_GUJARATI = 15;
  G_UNICODE_SCRIPT_GURMUKHI = 16;
  G_UNICODE_SCRIPT_HAN = 17;
  G_UNICODE_SCRIPT_HANGUL = 18;
  G_UNICODE_SCRIPT_HEBREW = 19;
  G_UNICODE_SCRIPT_HIRAGANA = 20;
  G_UNICODE_SCRIPT_KANNADA = 21;
  G_UNICODE_SCRIPT_KATAKANA = 22;
  G_UNICODE_SCRIPT_KHMER = 23;
  G_UNICODE_SCRIPT_LAO = 24;
  G_UNICODE_SCRIPT_LATIN = 25;
  G_UNICODE_SCRIPT_MALAYALAM = 26;
  G_UNICODE_SCRIPT_MONGOLIAN = 27;
  G_UNICODE_SCRIPT_MYANMAR = 28;
  G_UNICODE_SCRIPT_OGHAM = 29;
  G_UNICODE_SCRIPT_OLD_ITALIC = 30;
  G_UNICODE_SCRIPT_ORIYA = 31;
  G_UNICODE_SCRIPT_RUNIC = 32;
  G_UNICODE_SCRIPT_SINHALA = 33;
  G_UNICODE_SCRIPT_SYRIAC = 34;
  G_UNICODE_SCRIPT_TAMIL = 35;
  G_UNICODE_SCRIPT_TELUGU = 36;
  G_UNICODE_SCRIPT_THAANA = 37;
  G_UNICODE_SCRIPT_THAI = 38;
  G_UNICODE_SCRIPT_TIBETAN = 39;
  G_UNICODE_SCRIPT_CANADIAN_ABORIGINAL = 40;
  G_UNICODE_SCRIPT_YI = 41;
  G_UNICODE_SCRIPT_TAGALOG = 42;
  G_UNICODE_SCRIPT_HANUNOO = 43;
  G_UNICODE_SCRIPT_BUHID = 44;
  G_UNICODE_SCRIPT_TAGBANWA = 45;
  G_UNICODE_SCRIPT_BRAILLE = 46;
  G_UNICODE_SCRIPT_CYPRIOT = 47;
  G_UNICODE_SCRIPT_LIMBU = 48;
  G_UNICODE_SCRIPT_OSMANYA = 49;
  G_UNICODE_SCRIPT_SHAVIAN = 50;
  G_UNICODE_SCRIPT_LINEAR_B = 51;
  G_UNICODE_SCRIPT_TAI_LE = 52;
  G_UNICODE_SCRIPT_UGARITIC = 53;
  G_UNICODE_SCRIPT_NEW_TAI_LUE = 54;
  G_UNICODE_SCRIPT_BUGINESE = 55;
  G_UNICODE_SCRIPT_GLAGOLITIC = 56;
  G_UNICODE_SCRIPT_TIFINAGH = 57;
  G_UNICODE_SCRIPT_SYLOTI_NAGRI = 58;
  G_UNICODE_SCRIPT_OLD_PERSIAN = 59;
  G_UNICODE_SCRIPT_KHAROSHTHI = 60;
  G_UNICODE_SCRIPT_UNKNOWN = 61;
  G_UNICODE_SCRIPT_BALINESE = 62;
  G_UNICODE_SCRIPT_CUNEIFORM = 63;
  G_UNICODE_SCRIPT_PHOENICIAN = 64;
  G_UNICODE_SCRIPT_PHAGS_PA = 65;
  G_UNICODE_SCRIPT_NKO = 66;
  G_UNICODE_SCRIPT_KAYAH_LI = 67;
  G_UNICODE_SCRIPT_LEPCHA = 68;
  G_UNICODE_SCRIPT_REJANG = 69;
  G_UNICODE_SCRIPT_SUNDANESE = 70;
  G_UNICODE_SCRIPT_SAURASHTRA = 71;
  G_UNICODE_SCRIPT_CHAM = 72;
  G_UNICODE_SCRIPT_OL_CHIKI = 73;
  G_UNICODE_SCRIPT_VAI = 74;
  G_UNICODE_SCRIPT_CARIAN = 75;
  G_UNICODE_SCRIPT_LYCIAN = 76;
  G_UNICODE_SCRIPT_LYDIAN = 77;
  G_UNICODE_SCRIPT_AVESTAN = 78;
  G_UNICODE_SCRIPT_BAMUM = 79;
  G_UNICODE_SCRIPT_EGYPTIAN_HIEROGLYPHS = 80;
  G_UNICODE_SCRIPT_IMPERIAL_ARAMAIC = 81;
  G_UNICODE_SCRIPT_INSCRIPTIONAL_PAHLAVI = 82;
  G_UNICODE_SCRIPT_INSCRIPTIONAL_PARTHIAN = 83;
  G_UNICODE_SCRIPT_JAVANESE = 84;
  G_UNICODE_SCRIPT_KAITHI = 85;
  G_UNICODE_SCRIPT_LISU = 86;
  G_UNICODE_SCRIPT_MEETEI_MAYEK = 87;
  G_UNICODE_SCRIPT_OLD_SOUTH_ARABIAN = 88;
  G_UNICODE_SCRIPT_OLD_TURKIC = 89;
  G_UNICODE_SCRIPT_SAMARITAN = 90;
  G_UNICODE_SCRIPT_TAI_THAM = 91;
  G_UNICODE_SCRIPT_TAI_VIET = 92;
  G_UNICODE_SCRIPT_BATAK = 93;
  G_UNICODE_SCRIPT_BRAHMI = 94;
  G_UNICODE_SCRIPT_MANDAIC = 95;
  G_UNICODE_SCRIPT_CHAKMA = 96;
  G_UNICODE_SCRIPT_MEROITIC_CURSIVE = 97;
  G_UNICODE_SCRIPT_MEROITIC_HIEROGLYPHS = 98;
  G_UNICODE_SCRIPT_MIAO = 99;
  G_UNICODE_SCRIPT_SHARADA = 100;
  G_UNICODE_SCRIPT_SORA_SOMPENG = 101;
  G_UNICODE_SCRIPT_TAKRI = 102;
  G_UNICODE_SCRIPT_BASSA_VAH = 103;
  G_UNICODE_SCRIPT_CAUCASIAN_ALBANIAN = 104;
  G_UNICODE_SCRIPT_DUPLOYAN = 105;
  G_UNICODE_SCRIPT_ELBASAN = 106;
  G_UNICODE_SCRIPT_GRANTHA = 107;
  G_UNICODE_SCRIPT_KHOJKI = 108;
  G_UNICODE_SCRIPT_KHUDAWADI = 109;
  G_UNICODE_SCRIPT_LINEAR_A = 110;
  G_UNICODE_SCRIPT_MAHAJANI = 111;
  G_UNICODE_SCRIPT_MANICHAEAN = 112;
  G_UNICODE_SCRIPT_MENDE_KIKAKUI = 113;
  G_UNICODE_SCRIPT_MODI = 114;
  G_UNICODE_SCRIPT_MRO = 115;
  G_UNICODE_SCRIPT_NABATAEAN = 116;
  G_UNICODE_SCRIPT_OLD_NORTH_ARABIAN = 117;
  G_UNICODE_SCRIPT_OLD_PERMIC = 118;
  G_UNICODE_SCRIPT_PAHAWH_HMONG = 119;
  G_UNICODE_SCRIPT_PALMYRENE = 120;
  G_UNICODE_SCRIPT_PAU_CIN_HAU = 121;
  G_UNICODE_SCRIPT_PSALTER_PAHLAVI = 122;
  G_UNICODE_SCRIPT_SIDDHAM = 123;
  G_UNICODE_SCRIPT_TIRHUTA = 124;
  G_UNICODE_SCRIPT_WARANG_CITI = 125;
  G_UNICODE_SCRIPT_AHOM = 126;
  G_UNICODE_SCRIPT_ANATOLIAN_HIEROGLYPHS = 127;
  G_UNICODE_SCRIPT_HATRAN = 128;
  G_UNICODE_SCRIPT_MULTANI = 129;
  G_UNICODE_SCRIPT_OLD_HUNGARIAN = 130;
  G_UNICODE_SCRIPT_SIGNWRITING = 131;
  G_UNICODE_SCRIPT_ADLAM = 132;
  G_UNICODE_SCRIPT_BHAIKSUKI = 133;
  G_UNICODE_SCRIPT_MARCHEN = 134;
  G_UNICODE_SCRIPT_NEWA = 135;
  G_UNICODE_SCRIPT_OSAGE = 136;
  G_UNICODE_SCRIPT_TANGUT = 137;
  G_UNICODE_SCRIPT_MASARAM_GONDI = 138;
  G_UNICODE_SCRIPT_NUSHU = 139;
  G_UNICODE_SCRIPT_SOYOMBO = 140;
  G_UNICODE_SCRIPT_ZANABAZAR_SQUARE = 141;
  G_UNICODE_SCRIPT_DOGRA = 142;
  G_UNICODE_SCRIPT_GUNJALA_GONDI = 143;
  G_UNICODE_SCRIPT_HANIFI_ROHINGYA = 144;
  G_UNICODE_SCRIPT_MAKASAR = 145;
  G_UNICODE_SCRIPT_MEDEFAIDRIN = 146;
  G_UNICODE_SCRIPT_OLD_SOGDIAN = 147;
  G_UNICODE_SCRIPT_SOGDIAN = 148;
  G_UNICODE_SCRIPT_ELYMAIC = 149;
  G_UNICODE_SCRIPT_NANDINAGARI = 150;
  G_UNICODE_SCRIPT_NYIAKENG_PUACHUE_HMONG = 151;
  G_UNICODE_SCRIPT_WANCHO = 152;
  G_UNICODE_SCRIPT_CHORASMIAN = 153;
  G_UNICODE_SCRIPT_DIVES_AKURU = 154;
  G_UNICODE_SCRIPT_KHITAN_SMALL_SCRIPT = 155;
  G_UNICODE_SCRIPT_YEZIDI = 156;
  G_UNICODE_SCRIPT_CYPRO_MINOAN = 157;
  G_UNICODE_SCRIPT_OLD_UYGHUR = 158;
  G_UNICODE_SCRIPT_TANGSA = 159;
  G_UNICODE_SCRIPT_TOTO = 160;
  G_UNICODE_SCRIPT_VITHKUQI = 161;
  G_UNICODE_SCRIPT_MATH = 162;


function g_unicode_script_to_iso15924(script: TGUnicodeScript): Tguint32; cdecl; external libglib2;
function g_unicode_script_from_iso15924(iso15924: Tguint32): TGUnicodeScript; cdecl; external libglib2;
function g_unichar_isalnum(c: Tgunichar): Tgboolean; cdecl; external libglib2;
function g_unichar_isalpha(c: Tgunichar): Tgboolean; cdecl; external libglib2;
function g_unichar_iscntrl(c: Tgunichar): Tgboolean; cdecl; external libglib2;
function g_unichar_isdigit(c: Tgunichar): Tgboolean; cdecl; external libglib2;
function g_unichar_isgraph(c: Tgunichar): Tgboolean; cdecl; external libglib2;
function g_unichar_islower(c: Tgunichar): Tgboolean; cdecl; external libglib2;
function g_unichar_isprint(c: Tgunichar): Tgboolean; cdecl; external libglib2;
function g_unichar_ispunct(c: Tgunichar): Tgboolean; cdecl; external libglib2;
function g_unichar_isspace(c: Tgunichar): Tgboolean; cdecl; external libglib2;
function g_unichar_isupper(c: Tgunichar): Tgboolean; cdecl; external libglib2;
function g_unichar_isxdigit(c: Tgunichar): Tgboolean; cdecl; external libglib2;
function g_unichar_istitle(c: Tgunichar): Tgboolean; cdecl; external libglib2;
function g_unichar_isdefined(c: Tgunichar): Tgboolean; cdecl; external libglib2;
function g_unichar_iswide(c: Tgunichar): Tgboolean; cdecl; external libglib2;
function g_unichar_iswide_cjk(c: Tgunichar): Tgboolean; cdecl; external libglib2;
function g_unichar_iszerowidth(c: Tgunichar): Tgboolean; cdecl; external libglib2;
function g_unichar_ismark(c: Tgunichar): Tgboolean; cdecl; external libglib2;
function g_unichar_toupper(c: Tgunichar): Tgunichar; cdecl; external libglib2;
function g_unichar_tolower(c: Tgunichar): Tgunichar; cdecl; external libglib2;
function g_unichar_totitle(c: Tgunichar): Tgunichar; cdecl; external libglib2;
function g_unichar_digit_value(c: Tgunichar): Tgint; cdecl; external libglib2;
function g_unichar_xdigit_value(c: Tgunichar): Tgint; cdecl; external libglib2;
function g_unichar_type(c: Tgunichar): TGUnicodeType; cdecl; external libglib2;
function g_unichar_break_type(c: Tgunichar): TGUnicodeBreakType; cdecl; external libglib2;
function g_unichar_combining_class(uc: Tgunichar): Tgint; cdecl; external libglib2;
function g_unichar_get_mirror_char(ch: Tgunichar; mirrored_ch: Pgunichar): Tgboolean; cdecl; external libglib2;
function g_unichar_get_script(ch: Tgunichar): TGUnicodeScript; cdecl; external libglib2;
function g_unichar_validate(ch: Tgunichar): Tgboolean; cdecl; external libglib2;
function g_unichar_compose(a: Tgunichar; b: Tgunichar; ch: Pgunichar): Tgboolean; cdecl; external libglib2;
function g_unichar_decompose(ch: Tgunichar; a: Pgunichar; b: Pgunichar): Tgboolean; cdecl; external libglib2;
function g_unichar_fully_decompose(ch: Tgunichar; compat: Tgboolean; Result: Pgunichar; result_len: Tgsize): Tgsize; cdecl; external libglib2;

const
  G_UNICHAR_MAX_DECOMPOSITION_LENGTH = 18;

procedure g_unicode_canonical_ordering(_string: Pgunichar; len: Tgsize); cdecl; external libglib2;
function g_unicode_canonical_decomposition(ch: Tgunichar; result_len: Pgsize): Pgunichar; cdecl; external libglib2;

var
  //  g_utf8_skip: Pgchar; cvar;public;
  g_utf8_skip: Pgchar; cvar;external libglib2;


  {#define g_utf8_next_char(p) (char *)((p) + g_utf8_skip[*(const guchar *)(p)]) }

function g_utf8_get_char(p: Pgchar): Tgunichar; cdecl; external libglib2;
function g_utf8_get_char_validated(p: Pgchar; max_len: Tgssize): Tgunichar; cdecl; external libglib2;
function g_utf8_offset_to_pointer(str: Pgchar; offset: Tglong): Pgchar; cdecl; external libglib2;
function g_utf8_pointer_to_offset(str: Pgchar; pos: Pgchar): Tglong; cdecl; external libglib2;
function g_utf8_prev_char(p: Pgchar): Pgchar; cdecl; external libglib2;
function g_utf8_find_next_char(p: Pgchar; _end: Pgchar): Pgchar; cdecl; external libglib2;
function g_utf8_find_prev_char(str: Pgchar; p: Pgchar): Pgchar; cdecl; external libglib2;
function g_utf8_strlen(p: Pgchar; max: Tgssize): Tglong; cdecl; external libglib2;
function g_utf8_substring(str: Pgchar; start_pos: Tglong; end_pos: Tglong): Pgchar; cdecl; external libglib2;
function g_utf8_strncpy(dest: Pgchar; src: Pgchar; n: Tgsize): Pgchar; cdecl; external libglib2;
function g_utf8_truncate_middle(_string: Pgchar; truncate_length: Tgsize): Pgchar; cdecl; external libglib2;
function g_utf8_strchr(p: Pgchar; len: Tgssize; c: Tgunichar): Pgchar; cdecl; external libglib2;
function g_utf8_strrchr(p: Pgchar; len: Tgssize; c: Tgunichar): Pgchar; cdecl; external libglib2;
function g_utf8_strreverse(str: Pgchar; len: Tgssize): Pgchar; cdecl; external libglib2;
function g_utf8_to_utf16(str: Pgchar; len: Tglong; items_read: Pglong; items_written: Pglong; error: PPGError): Pgunichar2; cdecl; external libglib2;
function g_utf8_to_ucs4(str: Pgchar; len: Tglong; items_read: Pglong; items_written: Pglong; error: PPGError): Pgunichar; cdecl; external libglib2;
function g_utf8_to_ucs4_fast(str: Pgchar; len: Tglong; items_written: Pglong): Pgunichar; cdecl; external libglib2;
function g_utf16_to_ucs4(str: Pgunichar2; len: Tglong; items_read: Pglong; items_written: Pglong; error: PPGError): Pgunichar; cdecl; external libglib2;
function g_utf16_to_utf8(str: Pgunichar2; len: Tglong; items_read: Pglong; items_written: Pglong; error: PPGError): Pgchar; cdecl; external libglib2;
function g_ucs4_to_utf16(str: Pgunichar; len: Tglong; items_read: Pglong; items_written: Pglong; error: PPGError): Pgunichar2; cdecl; external libglib2;
function g_ucs4_to_utf8(str: Pgunichar; len: Tglong; items_read: Pglong; items_written: Pglong; error: PPGError): Pgchar; cdecl; external libglib2;
function g_unichar_to_utf8(c: Tgunichar; outbuf: Pgchar): Tgint; cdecl; external libglib2;
function g_utf8_validate(str: Pgchar; max_len: Tgssize; _end: PPgchar): Tgboolean; cdecl; external libglib2;
function g_utf8_validate_len(str: Pgchar; max_len: Tgsize; _end: PPgchar): Tgboolean; cdecl; external libglib2;
function g_utf8_strup(str: Pgchar; len: Tgssize): Pgchar; cdecl; external libglib2;
function g_utf8_strdown(str: Pgchar; len: Tgssize): Pgchar; cdecl; external libglib2;
function g_utf8_casefold(str: Pgchar; len: Tgssize): Pgchar; cdecl; external libglib2;

type
  PGNormalizeMode = ^TGNormalizeMode;
  TGNormalizeMode = longint;

const
  G_NORMALIZE_DEFAULT = 0;
  G_NORMALIZE_NFD = G_NORMALIZE_DEFAULT;
  G_NORMALIZE_DEFAULT_COMPOSE = (G_NORMALIZE_DEFAULT) + 1;
  G_NORMALIZE_NFC = G_NORMALIZE_DEFAULT_COMPOSE;
  G_NORMALIZE_ALL = (G_NORMALIZE_DEFAULT_COMPOSE) + 1;
  G_NORMALIZE_NFKD = G_NORMALIZE_ALL;
  G_NORMALIZE_ALL_COMPOSE = (G_NORMALIZE_ALL) + 1;
  G_NORMALIZE_NFKC = G_NORMALIZE_ALL_COMPOSE;

function g_utf8_normalize(str: Pgchar; len: Tgssize; mode: TGNormalizeMode): Pgchar; cdecl; external libglib2;
function g_utf8_collate(str1: Pgchar; str2: Pgchar): Tgint; cdecl; external libglib2;
function g_utf8_collate_key(str: Pgchar; len: Tgssize): Pgchar; cdecl; external libglib2;
function g_utf8_collate_key_for_filename(str: Pgchar; len: Tgssize): Pgchar; cdecl; external libglib2;
function g_utf8_make_valid(str: Pgchar; len: Tgssize): Pgchar; cdecl; external libglib2;

// === Konventiert am: 6-8-24 17:03:20 ===

function g_utf8_next_char(p: Pguchar): Pguchar;

implementation

function g_utf8_next_char(p: Pguchar): Pguchar;
begin
  g_utf8_next_char := p + Ord((g_utf8_skip + p^)^);     // needs to be tested
end;

end.
