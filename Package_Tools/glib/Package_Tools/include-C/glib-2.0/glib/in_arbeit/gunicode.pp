
unit gunicode;
interface

{
  Automatically converted by H2Pas 1.0.0 from gunicode.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gunicode.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pgchar  = ^gchar;
PGError  = ^GError;
Pglong  = ^glong;
PGNormalizeMode  = ^GNormalizeMode;
Pgsize  = ^gsize;
Pgunichar  = ^gunichar;
Pgunichar2  = ^gunichar2;
PGUnicodeBreakType  = ^GUnicodeBreakType;
PGUnicodeScript  = ^GUnicodeScript;
PGUnicodeType  = ^GUnicodeType;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gunicode.h - Unicode manipulation functions
 *
 *  Copyright (C) 1999, 2000 Tom Tromey
 *  Copyright 2000, 2005 Red Hat, Inc.
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library; if not, see <http://www.gnu.org/licenses/>.
  }
{$ifndef __G_UNICODE_H__}
{$define __G_UNICODE_H__}
{$if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)}
{$error "Only <glib.h> can be included directly."}
{$endif}
{$include <glib/gerror.h>}
{$include <glib/gtypes.h>}
{*
 * gunichar:
 *
 * A type which can hold any UTF-32 or UCS-4 character code,
 * also known as a Unicode code point.
 *
 * If you want to produce the UTF-8 representation of a #gunichar,
 * use g_ucs4_to_utf8(). See also g_utf8_to_ucs4() for the reverse
 * process.
 *
 * To print/scan values of this type as integer, use
 * %G_GINT32_MODIFIER and/or %G_GUINT32_FORMAT.
 *
 * The notation to express a Unicode code point in running text is
 * as a hexadecimal number with four to six digits and uppercase
 * letters, prefixed by the string "U+". Leading zeros are omitted,
 * unless the code point would have fewer than four hexadecimal digits.
 * For example, "U+0041 LATIN CAPITAL LETTER A". To print a code point
 * in the U+-notation, use the format string "U+\%04"G_GINT32_FORMAT"X".
 * To scan, use the format string "U+\%06"G_GINT32_FORMAT"X".
 *
 * |[
 * gunichar c;
 * sscanf ("U+0041", "U+%06"G_GINT32_FORMAT"X", &amp;c)
 * g_print ("Read U+%04"G_GINT32_FORMAT"X", c);
 * ]|
  }
type
  Pgunichar = ^Tgunichar;
  Tgunichar = Tguint32;
{*
 * gunichar2:
 *
 * A type which can hold any UTF-16 code
 * point<footnote id="utf16_surrogate_pairs">UTF-16 also has so called
 * <firstterm>surrogate pairs</firstterm> to encode characters beyond
 * the BMP as pairs of 16bit numbers. Surrogate pairs cannot be stored
 * in a single gunichar2 field, but all GLib functions accepting gunichar2
 * arrays will correctly interpret surrogate pairs.</footnote>.
 *
 * To print/scan values of this type to/from text you need to convert
 * to/from UTF-8, using g_utf16_to_utf8()/g_utf8_to_utf16().
 *
 * To print/scan values of this type as integer, use
 * %G_GINT16_MODIFIER and/or %G_GUINT16_FORMAT.
  }

  Pgunichar2 = ^Tgunichar2;
  Tgunichar2 = Tguint16;
{*
 * GUnicodeType:
 * @G_UNICODE_CONTROL: General category "Other, Control" (Cc)
 * @G_UNICODE_FORMAT: General category "Other, Format" (Cf)
 * @G_UNICODE_UNASSIGNED: General category "Other, Not Assigned" (Cn)
 * @G_UNICODE_PRIVATE_USE: General category "Other, Private Use" (Co)
 * @G_UNICODE_SURROGATE: General category "Other, Surrogate" (Cs)
 * @G_UNICODE_LOWERCASE_LETTER: General category "Letter, Lowercase" (Ll)
 * @G_UNICODE_MODIFIER_LETTER: General category "Letter, Modifier" (Lm)
 * @G_UNICODE_OTHER_LETTER: General category "Letter, Other" (Lo)
 * @G_UNICODE_TITLECASE_LETTER: General category "Letter, Titlecase" (Lt)
 * @G_UNICODE_UPPERCASE_LETTER: General category "Letter, Uppercase" (Lu)
 * @G_UNICODE_SPACING_MARK: General category "Mark, Spacing" (Mc)
 * @G_UNICODE_ENCLOSING_MARK: General category "Mark, Enclosing" (Me)
 * @G_UNICODE_NON_SPACING_MARK: General category "Mark, Nonspacing" (Mn)
 * @G_UNICODE_DECIMAL_NUMBER: General category "Number, Decimal Digit" (Nd)
 * @G_UNICODE_LETTER_NUMBER: General category "Number, Letter" (Nl)
 * @G_UNICODE_OTHER_NUMBER: General category "Number, Other" (No)
 * @G_UNICODE_CONNECT_PUNCTUATION: General category "Punctuation, Connector" (Pc)
 * @G_UNICODE_DASH_PUNCTUATION: General category "Punctuation, Dash" (Pd)
 * @G_UNICODE_CLOSE_PUNCTUATION: General category "Punctuation, Close" (Pe)
 * @G_UNICODE_FINAL_PUNCTUATION: General category "Punctuation, Final quote" (Pf)
 * @G_UNICODE_INITIAL_PUNCTUATION: General category "Punctuation, Initial quote" (Pi)
 * @G_UNICODE_OTHER_PUNCTUATION: General category "Punctuation, Other" (Po)
 * @G_UNICODE_OPEN_PUNCTUATION: General category "Punctuation, Open" (Ps)
 * @G_UNICODE_CURRENCY_SYMBOL: General category "Symbol, Currency" (Sc)
 * @G_UNICODE_MODIFIER_SYMBOL: General category "Symbol, Modifier" (Sk)
 * @G_UNICODE_MATH_SYMBOL: General category "Symbol, Math" (Sm)
 * @G_UNICODE_OTHER_SYMBOL: General category "Symbol, Other" (So)
 * @G_UNICODE_LINE_SEPARATOR: General category "Separator, Line" (Zl)
 * @G_UNICODE_PARAGRAPH_SEPARATOR: General category "Separator, Paragraph" (Zp)
 * @G_UNICODE_SPACE_SEPARATOR: General category "Separator, Space" (Zs)
 *
 * These are the possible character classifications from the
 * Unicode specification.
 * See [Unicode Character Database](http://www.unicode.org/reports/tr44/#General_Category_Values).
  }

  PGUnicodeType = ^TGUnicodeType;
  TGUnicodeType =  Longint;
  Const
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
;
{*
 * G_UNICODE_COMBINING_MARK:
 *
 * Older name for %G_UNICODE_SPACING_MARK.
 *
 * Deprecated: 2.30: Use %G_UNICODE_SPACING_MARK.
  }
{#define G_UNICODE_COMBINING_MARK G_UNICODE_SPACING_MARK _MACRO_IN_2_30_FOR(G_UNICODE_SPACING_MARK) }
{*
 * GUnicodeBreakType:
 * @G_UNICODE_BREAK_MANDATORY: Mandatory Break (BK)
 * @G_UNICODE_BREAK_CARRIAGE_RETURN: Carriage Return (CR)
 * @G_UNICODE_BREAK_LINE_FEED: Line Feed (LF)
 * @G_UNICODE_BREAK_COMBINING_MARK: Attached Characters and Combining Marks (CM)
 * @G_UNICODE_BREAK_SURROGATE: Surrogates (SG)
 * @G_UNICODE_BREAK_ZERO_WIDTH_SPACE: Zero Width Space (ZW)
 * @G_UNICODE_BREAK_INSEPARABLE: Inseparable (IN)
 * @G_UNICODE_BREAK_NON_BREAKING_GLUE: Non-breaking ("Glue") (GL)
 * @G_UNICODE_BREAK_CONTINGENT: Contingent Break Opportunity (CB)
 * @G_UNICODE_BREAK_SPACE: Space (SP)
 * @G_UNICODE_BREAK_AFTER: Break Opportunity After (BA)
 * @G_UNICODE_BREAK_BEFORE: Break Opportunity Before (BB)
 * @G_UNICODE_BREAK_BEFORE_AND_AFTER: Break Opportunity Before and After (B2)
 * @G_UNICODE_BREAK_HYPHEN: Hyphen (HY)
 * @G_UNICODE_BREAK_NON_STARTER: Nonstarter (NS)
 * @G_UNICODE_BREAK_OPEN_PUNCTUATION: Opening Punctuation (OP)
 * @G_UNICODE_BREAK_CLOSE_PUNCTUATION: Closing Punctuation (CL)
 * @G_UNICODE_BREAK_QUOTATION: Ambiguous Quotation (QU)
 * @G_UNICODE_BREAK_EXCLAMATION: Exclamation/Interrogation (EX)
 * @G_UNICODE_BREAK_IDEOGRAPHIC: Ideographic (ID)
 * @G_UNICODE_BREAK_NUMERIC: Numeric (NU)
 * @G_UNICODE_BREAK_INFIX_SEPARATOR: Infix Separator (Numeric) (IS)
 * @G_UNICODE_BREAK_SYMBOL: Symbols Allowing Break After (SY)
 * @G_UNICODE_BREAK_ALPHABETIC: Ordinary Alphabetic and Symbol Characters (AL)
 * @G_UNICODE_BREAK_PREFIX: Prefix (Numeric) (PR)
 * @G_UNICODE_BREAK_POSTFIX: Postfix (Numeric) (PO)
 * @G_UNICODE_BREAK_COMPLEX_CONTEXT: Complex Content Dependent (South East Asian) (SA)
 * @G_UNICODE_BREAK_AMBIGUOUS: Ambiguous (Alphabetic or Ideographic) (AI)
 * @G_UNICODE_BREAK_UNKNOWN: Unknown (XX)
 * @G_UNICODE_BREAK_NEXT_LINE: Next Line (NL)
 * @G_UNICODE_BREAK_WORD_JOINER: Word Joiner (WJ)
 * @G_UNICODE_BREAK_HANGUL_L_JAMO: Hangul L Jamo (JL)
 * @G_UNICODE_BREAK_HANGUL_V_JAMO: Hangul V Jamo (JV)
 * @G_UNICODE_BREAK_HANGUL_T_JAMO: Hangul T Jamo (JT)
 * @G_UNICODE_BREAK_HANGUL_LV_SYLLABLE: Hangul LV Syllable (H2)
 * @G_UNICODE_BREAK_HANGUL_LVT_SYLLABLE: Hangul LVT Syllable (H3)
 * @G_UNICODE_BREAK_CLOSE_PARANTHESIS: Closing Parenthesis (CP). Since 2.28. Deprecated: 2.70: Use %G_UNICODE_BREAK_CLOSE_PARENTHESIS instead.
 * @G_UNICODE_BREAK_CLOSE_PARENTHESIS: Closing Parenthesis (CP). Since 2.70
 * @G_UNICODE_BREAK_CONDITIONAL_JAPANESE_STARTER: Conditional Japanese Starter (CJ). Since: 2.32
 * @G_UNICODE_BREAK_HEBREW_LETTER: Hebrew Letter (HL). Since: 2.32
 * @G_UNICODE_BREAK_REGIONAL_INDICATOR: Regional Indicator (RI). Since: 2.36
 * @G_UNICODE_BREAK_EMOJI_BASE: Emoji Base (EB). Since: 2.50
 * @G_UNICODE_BREAK_EMOJI_MODIFIER: Emoji Modifier (EM). Since: 2.50
 * @G_UNICODE_BREAK_ZERO_WIDTH_JOINER: Zero Width Joiner (ZWJ). Since: 2.50
 * @G_UNICODE_BREAK_AKSARA: Aksara (AK). Since: 2.80
 * @G_UNICODE_BREAK_AKSARA_PRE_BASE (AP). Since: 2.80
 * @G_UNICODE_BREAK_AKSARA_START (AS). Since: 2.80
 * @G_UNICODE_BREAK_VIRAMA_FINAL (VF). Since: 2.80
 * @G_UNICODE_BREAK_VIRAMA (VI). Since: 2.80
 *
 * These are the possible line break classifications.
 *
 * Since new Unicode versions may add new types here, applications should be ready
 * to handle unknown values. They may be regarded as %G_UNICODE_BREAK_UNKNOWN.
 *
 * See [Unicode Line Breaking Algorithm](https://www.unicode.org/reports/tr14/).
  }
{  G_UNICODE_BREAK_CLOSE_PARENTHESIS GLIB_AVAILABLE_ENUMERATOR_IN_2_70 = G_UNICODE_BREAK_CLOSE_PARANTHESIS, }
type
  PGUnicodeBreakType = ^TGUnicodeBreakType;
  TGUnicodeBreakType =  Longint;
  Const
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
;
{*
 * GUnicodeScript:
 * @G_UNICODE_SCRIPT_INVALID_CODE:
 *                               a value never returned from g_unichar_get_script()
 * @G_UNICODE_SCRIPT_COMMON:     a character used by multiple different scripts
 * @G_UNICODE_SCRIPT_INHERITED:  a mark glyph that takes its script from the
 *                               base glyph to which it is attached
 * @G_UNICODE_SCRIPT_ARABIC:     Arabic
 * @G_UNICODE_SCRIPT_ARMENIAN:   Armenian
 * @G_UNICODE_SCRIPT_BENGALI:    Bengali
 * @G_UNICODE_SCRIPT_BOPOMOFO:   Bopomofo
 * @G_UNICODE_SCRIPT_CHEROKEE:   Cherokee
 * @G_UNICODE_SCRIPT_COPTIC:     Coptic
 * @G_UNICODE_SCRIPT_CYRILLIC:   Cyrillic
 * @G_UNICODE_SCRIPT_DESERET:    Deseret
 * @G_UNICODE_SCRIPT_DEVANAGARI: Devanagari
 * @G_UNICODE_SCRIPT_ETHIOPIC:   Ethiopic
 * @G_UNICODE_SCRIPT_GEORGIAN:   Georgian
 * @G_UNICODE_SCRIPT_GOTHIC:     Gothic
 * @G_UNICODE_SCRIPT_GREEK:      Greek
 * @G_UNICODE_SCRIPT_GUJARATI:   Gujarati
 * @G_UNICODE_SCRIPT_GURMUKHI:   Gurmukhi
 * @G_UNICODE_SCRIPT_HAN:        Han
 * @G_UNICODE_SCRIPT_HANGUL:     Hangul
 * @G_UNICODE_SCRIPT_HEBREW:     Hebrew
 * @G_UNICODE_SCRIPT_HIRAGANA:   Hiragana
 * @G_UNICODE_SCRIPT_KANNADA:    Kannada
 * @G_UNICODE_SCRIPT_KATAKANA:   Katakana
 * @G_UNICODE_SCRIPT_KHMER:      Khmer
 * @G_UNICODE_SCRIPT_LAO:        Lao
 * @G_UNICODE_SCRIPT_LATIN:      Latin
 * @G_UNICODE_SCRIPT_MALAYALAM:  Malayalam
 * @G_UNICODE_SCRIPT_MONGOLIAN:  Mongolian
 * @G_UNICODE_SCRIPT_MYANMAR:    Myanmar
 * @G_UNICODE_SCRIPT_OGHAM:      Ogham
 * @G_UNICODE_SCRIPT_OLD_ITALIC: Old Italic
 * @G_UNICODE_SCRIPT_ORIYA:      Oriya
 * @G_UNICODE_SCRIPT_RUNIC:      Runic
 * @G_UNICODE_SCRIPT_SINHALA:    Sinhala
 * @G_UNICODE_SCRIPT_SYRIAC:     Syriac
 * @G_UNICODE_SCRIPT_TAMIL:      Tamil
 * @G_UNICODE_SCRIPT_TELUGU:     Telugu
 * @G_UNICODE_SCRIPT_THAANA:     Thaana
 * @G_UNICODE_SCRIPT_THAI:       Thai
 * @G_UNICODE_SCRIPT_TIBETAN:    Tibetan
 * @G_UNICODE_SCRIPT_CANADIAN_ABORIGINAL:
 *                               Canadian Aboriginal
 * @G_UNICODE_SCRIPT_YI:         Yi
 * @G_UNICODE_SCRIPT_TAGALOG:    Tagalog
 * @G_UNICODE_SCRIPT_HANUNOO:    Hanunoo
 * @G_UNICODE_SCRIPT_BUHID:      Buhid
 * @G_UNICODE_SCRIPT_TAGBANWA:   Tagbanwa
 * @G_UNICODE_SCRIPT_BRAILLE:    Braille
 * @G_UNICODE_SCRIPT_CYPRIOT:    Cypriot
 * @G_UNICODE_SCRIPT_LIMBU:      Limbu
 * @G_UNICODE_SCRIPT_OSMANYA:    Osmanya
 * @G_UNICODE_SCRIPT_SHAVIAN:    Shavian
 * @G_UNICODE_SCRIPT_LINEAR_B:   Linear B
 * @G_UNICODE_SCRIPT_TAI_LE:     Tai Le
 * @G_UNICODE_SCRIPT_UGARITIC:   Ugaritic
 * @G_UNICODE_SCRIPT_NEW_TAI_LUE:
 *                               New Tai Lue
 * @G_UNICODE_SCRIPT_BUGINESE:   Buginese
 * @G_UNICODE_SCRIPT_GLAGOLITIC: Glagolitic
 * @G_UNICODE_SCRIPT_TIFINAGH:   Tifinagh
 * @G_UNICODE_SCRIPT_SYLOTI_NAGRI:
 *                               Syloti Nagri
 * @G_UNICODE_SCRIPT_OLD_PERSIAN:
 *                               Old Persian
 * @G_UNICODE_SCRIPT_KHAROSHTHI: Kharoshthi
 * @G_UNICODE_SCRIPT_UNKNOWN:    an unassigned code point
 * @G_UNICODE_SCRIPT_BALINESE:   Balinese
 * @G_UNICODE_SCRIPT_CUNEIFORM:  Cuneiform
 * @G_UNICODE_SCRIPT_PHOENICIAN: Phoenician
 * @G_UNICODE_SCRIPT_PHAGS_PA:   Phags-pa
 * @G_UNICODE_SCRIPT_NKO:        N'Ko
 * @G_UNICODE_SCRIPT_KAYAH_LI:   Kayah Li. Since 2.16.3
 * @G_UNICODE_SCRIPT_LEPCHA:     Lepcha. Since 2.16.3
 * @G_UNICODE_SCRIPT_REJANG:     Rejang. Since 2.16.3
 * @G_UNICODE_SCRIPT_SUNDANESE:  Sundanese. Since 2.16.3
 * @G_UNICODE_SCRIPT_SAURASHTRA: Saurashtra. Since 2.16.3
 * @G_UNICODE_SCRIPT_CHAM:       Cham. Since 2.16.3
 * @G_UNICODE_SCRIPT_OL_CHIKI:   Ol Chiki. Since 2.16.3
 * @G_UNICODE_SCRIPT_VAI:        Vai. Since 2.16.3
 * @G_UNICODE_SCRIPT_CARIAN:     Carian. Since 2.16.3
 * @G_UNICODE_SCRIPT_LYCIAN:     Lycian. Since 2.16.3
 * @G_UNICODE_SCRIPT_LYDIAN:     Lydian. Since 2.16.3
 * @G_UNICODE_SCRIPT_AVESTAN:    Avestan. Since 2.26
 * @G_UNICODE_SCRIPT_BAMUM:      Bamum. Since 2.26
 * @G_UNICODE_SCRIPT_EGYPTIAN_HIEROGLYPHS:
 *                               Egyptian Hieroglpyhs. Since 2.26
 * @G_UNICODE_SCRIPT_IMPERIAL_ARAMAIC:
 *                               Imperial Aramaic. Since 2.26
 * @G_UNICODE_SCRIPT_INSCRIPTIONAL_PAHLAVI:
 *                               Inscriptional Pahlavi. Since 2.26
 * @G_UNICODE_SCRIPT_INSCRIPTIONAL_PARTHIAN:
 *                               Inscriptional Parthian. Since 2.26
 * @G_UNICODE_SCRIPT_JAVANESE:   Javanese. Since 2.26
 * @G_UNICODE_SCRIPT_KAITHI:     Kaithi. Since 2.26
 * @G_UNICODE_SCRIPT_LISU:       Lisu. Since 2.26
 * @G_UNICODE_SCRIPT_MEETEI_MAYEK:
 *                               Meetei Mayek. Since 2.26
 * @G_UNICODE_SCRIPT_OLD_SOUTH_ARABIAN:
 *                               Old South Arabian. Since 2.26
 * @G_UNICODE_SCRIPT_OLD_TURKIC: Old Turkic. Since 2.28
 * @G_UNICODE_SCRIPT_SAMARITAN:  Samaritan. Since 2.26
 * @G_UNICODE_SCRIPT_TAI_THAM:   Tai Tham. Since 2.26
 * @G_UNICODE_SCRIPT_TAI_VIET:   Tai Viet. Since 2.26
 * @G_UNICODE_SCRIPT_BATAK:      Batak. Since 2.28
 * @G_UNICODE_SCRIPT_BRAHMI:     Brahmi. Since 2.28
 * @G_UNICODE_SCRIPT_MANDAIC:    Mandaic. Since 2.28
 * @G_UNICODE_SCRIPT_CHAKMA:               Chakma. Since: 2.32
 * @G_UNICODE_SCRIPT_MEROITIC_CURSIVE:     Meroitic Cursive. Since: 2.32
 * @G_UNICODE_SCRIPT_MEROITIC_HIEROGLYPHS: Meroitic Hieroglyphs. Since: 2.32
 * @G_UNICODE_SCRIPT_MIAO:                 Miao. Since: 2.32
 * @G_UNICODE_SCRIPT_SHARADA:              Sharada. Since: 2.32
 * @G_UNICODE_SCRIPT_SORA_SOMPENG:         Sora Sompeng. Since: 2.32
 * @G_UNICODE_SCRIPT_TAKRI:                Takri. Since: 2.32
 * @G_UNICODE_SCRIPT_BASSA_VAH:            Bassa. Since: 2.42
 * @G_UNICODE_SCRIPT_CAUCASIAN_ALBANIAN:   Caucasian Albanian. Since: 2.42
 * @G_UNICODE_SCRIPT_DUPLOYAN:             Duployan. Since: 2.42
 * @G_UNICODE_SCRIPT_ELBASAN:              Elbasan. Since: 2.42
 * @G_UNICODE_SCRIPT_GRANTHA:              Grantha. Since: 2.42
 * @G_UNICODE_SCRIPT_KHOJKI:               Kjohki. Since: 2.42
 * @G_UNICODE_SCRIPT_KHUDAWADI:            Khudawadi, Sindhi. Since: 2.42
 * @G_UNICODE_SCRIPT_LINEAR_A:             Linear A. Since: 2.42
 * @G_UNICODE_SCRIPT_MAHAJANI:             Mahajani. Since: 2.42
 * @G_UNICODE_SCRIPT_MANICHAEAN:           Manichaean. Since: 2.42
 * @G_UNICODE_SCRIPT_MENDE_KIKAKUI:        Mende Kikakui. Since: 2.42
 * @G_UNICODE_SCRIPT_MODI:                 Modi. Since: 2.42
 * @G_UNICODE_SCRIPT_MRO:                  Mro. Since: 2.42
 * @G_UNICODE_SCRIPT_NABATAEAN:            Nabataean. Since: 2.42
 * @G_UNICODE_SCRIPT_OLD_NORTH_ARABIAN:    Old North Arabian. Since: 2.42
 * @G_UNICODE_SCRIPT_OLD_PERMIC:           Old Permic. Since: 2.42
 * @G_UNICODE_SCRIPT_PAHAWH_HMONG:         Pahawh Hmong. Since: 2.42
 * @G_UNICODE_SCRIPT_PALMYRENE:            Palmyrene. Since: 2.42
 * @G_UNICODE_SCRIPT_PAU_CIN_HAU:          Pau Cin Hau. Since: 2.42
 * @G_UNICODE_SCRIPT_PSALTER_PAHLAVI:      Psalter Pahlavi. Since: 2.42
 * @G_UNICODE_SCRIPT_SIDDHAM:              Siddham. Since: 2.42
 * @G_UNICODE_SCRIPT_TIRHUTA:              Tirhuta. Since: 2.42
 * @G_UNICODE_SCRIPT_WARANG_CITI:          Warang Citi. Since: 2.42
 * @G_UNICODE_SCRIPT_AHOM:                 Ahom. Since: 2.48
 * @G_UNICODE_SCRIPT_ANATOLIAN_HIEROGLYPHS: Anatolian Hieroglyphs. Since: 2.48
 * @G_UNICODE_SCRIPT_HATRAN:               Hatran. Since: 2.48
 * @G_UNICODE_SCRIPT_MULTANI:              Multani. Since: 2.48
 * @G_UNICODE_SCRIPT_OLD_HUNGARIAN:        Old Hungarian. Since: 2.48
 * @G_UNICODE_SCRIPT_SIGNWRITING:          Signwriting. Since: 2.48
 * @G_UNICODE_SCRIPT_ADLAM:                Adlam. Since: 2.50
 * @G_UNICODE_SCRIPT_BHAIKSUKI:            Bhaiksuki. Since: 2.50
 * @G_UNICODE_SCRIPT_MARCHEN:              Marchen. Since: 2.50
 * @G_UNICODE_SCRIPT_NEWA:                 Newa. Since: 2.50
 * @G_UNICODE_SCRIPT_OSAGE:                Osage. Since: 2.50
 * @G_UNICODE_SCRIPT_TANGUT:               Tangut. Since: 2.50
 * @G_UNICODE_SCRIPT_MASARAM_GONDI:        Masaram Gondi. Since: 2.54
 * @G_UNICODE_SCRIPT_NUSHU:                Nushu. Since: 2.54
 * @G_UNICODE_SCRIPT_SOYOMBO:              Soyombo. Since: 2.54
 * @G_UNICODE_SCRIPT_ZANABAZAR_SQUARE:     Zanabazar Square. Since: 2.54
 * @G_UNICODE_SCRIPT_DOGRA:                Dogra. Since: 2.58
 * @G_UNICODE_SCRIPT_GUNJALA_GONDI:        Gunjala Gondi. Since: 2.58
 * @G_UNICODE_SCRIPT_HANIFI_ROHINGYA:      Hanifi Rohingya. Since: 2.58
 * @G_UNICODE_SCRIPT_MAKASAR:              Makasar. Since: 2.58
 * @G_UNICODE_SCRIPT_MEDEFAIDRIN:          Medefaidrin. Since: 2.58
 * @G_UNICODE_SCRIPT_OLD_SOGDIAN:          Old Sogdian. Since: 2.58
 * @G_UNICODE_SCRIPT_SOGDIAN:              Sogdian. Since: 2.58
 * @G_UNICODE_SCRIPT_ELYMAIC:              Elym. Since: 2.62
 * @G_UNICODE_SCRIPT_NANDINAGARI:          Nand. Since: 2.62
 * @G_UNICODE_SCRIPT_NYIAKENG_PUACHUE_HMONG: Rohg. Since: 2.62
 * @G_UNICODE_SCRIPT_WANCHO:               Wcho. Since: 2.62
 * @G_UNICODE_SCRIPT_CHORASMIAN:           Chorasmian. Since: 2.66
 * @G_UNICODE_SCRIPT_DIVES_AKURU:          Dives Akuru. Since: 2.66
 * @G_UNICODE_SCRIPT_KHITAN_SMALL_SCRIPT:  Khitan small script. Since: 2.66
 * @G_UNICODE_SCRIPT_YEZIDI:               Yezidi. Since: 2.66
 * @G_UNICODE_SCRIPT_CYPRO_MINOAN:         Cypro-Minoan. Since: 2.72
 * @G_UNICODE_SCRIPT_OLD_UYGHUR:           Old Uyghur. Since: 2.72
 * @G_UNICODE_SCRIPT_TANGSA:               Tangsa. Since: 2.72
 * @G_UNICODE_SCRIPT_TOTO:                 Toto. Since: 2.72
 * @G_UNICODE_SCRIPT_VITHKUQI:             Vithkuqi. Since: 2.72
 * @G_UNICODE_SCRIPT_MATH:                 Mathematical notation. Since: 2.72
 * @G_UNICODE_SCRIPT_KAWI:                 Kawi. Since 2.74
 * @G_UNICODE_SCRIPT_NAG_MUNDARI:          Nag Mundari. Since 2.74
 *
 * The #GUnicodeScript enumeration identifies different writing
 * systems. The values correspond to the names as defined in the
 * Unicode standard. The enumeration has been added in GLib 2.14,
 * and is interchangeable with #PangoScript.
 *
 * Note that new types may be added in the future. Applications
 * should be ready to handle unknown values.
 * See [Unicode Standard Annex #24: Script names](http://www.unicode.org/reports/tr24/).
  }
{ ISO 15924 code  }
{ Zyyy  }
{ Zinh (Qaai)  }
{ Arab  }
{ Armn  }
{ Beng  }
{ Bopo  }
{ Cher  }
{ Copt (Qaac)  }
{ Cyrl (Cyrs)  }
{ Dsrt  }
{ Deva  }
{ Ethi  }
{ Geor (Geon, Geoa)  }
{ Goth  }
{ Grek  }
{ Gujr  }
{ Guru  }
{ Hani  }
{ Hang  }
{ Hebr  }
{ Hira  }
{ Knda  }
{ Kana  }
{ Khmr  }
{ Laoo  }
{ Latn (Latf, Latg)  }
{ Mlym  }
{ Mong  }
{ Mymr  }
{ Ogam  }
{ Ital  }
{ Orya  }
{ Runr  }
{ Sinh  }
{ Syrc (Syrj, Syrn, Syre)  }
{ Taml  }
{ Telu  }
{ Thaa  }
{ Thai  }
{ Tibt  }
{ Cans  }
{ Yiii  }
{ Tglg  }
{ Hano  }
{ Buhd  }
{ Tagb  }
{ Unicode-4.0 additions  }
{ Brai  }
{ Cprt  }
{ Limb  }
{ Osma  }
{ Shaw  }
{ Linb  }
{ Tale  }
{ Ugar  }
{ Unicode-4.1 additions  }
{ Talu  }
{ Bugi  }
{ Glag  }
{ Tfng  }
{ Sylo  }
{ Xpeo  }
{ Khar  }
{ Unicode-5.0 additions  }
{ Zzzz  }
{ Bali  }
{ Xsux  }
{ Phnx  }
{ Phag  }
{ Nkoo  }
{ Unicode-5.1 additions  }
{ Kali  }
{ Lepc  }
{ Rjng  }
{ Sund  }
{ Saur  }
{ Cham  }
{ Olck  }
{ Vaii  }
{ Cari  }
{ Lyci  }
{ Lydi  }
{ Unicode-5.2 additions  }
{ Avst  }
{ Bamu  }
{ Egyp  }
{ Armi  }
{ Phli  }
{ Prti  }
{ Java  }
{ Kthi  }
{ Lisu  }
{ Mtei  }
{ Sarb  }
{ Orkh  }
{ Samr  }
{ Lana  }
{ Tavt  }
{ Unicode-6.0 additions  }
{ Batk  }
{ Brah  }
{ Mand  }
{ Unicode-6.1 additions  }
{ Cakm  }
{ Merc  }
{ Mero  }
{ Plrd  }
{ Shrd  }
{ Sora  }
{ Takr  }
{ Unicode 7.0 additions  }
{ Bass  }
{ Aghb  }
{ Dupl  }
{ Elba  }
{ Gran  }
{ Khoj  }
{ Sind  }
{ Lina  }
{ Mahj  }
{ Mani  }
{ Mend  }
{ Modi  }
{ Mroo  }
{ Nbat  }
{ Narb  }
{ Perm  }
{ Hmng  }
{ Palm  }
{ Pauc  }
{ Phlp  }
{ Sidd  }
{ Tirh  }
{ Wara  }
{ Unicode 8.0 additions  }
{ Ahom  }
{ Hluw  }
{ Hatr  }
{ Mult  }
{ Hung  }
{ Sgnw  }
{ Unicode 9.0 additions  }
{ Adlm  }
{ Bhks  }
{ Marc  }
{ Newa  }
{ Osge  }
{ Tang  }
{ Unicode 10.0 additions  }
{ Gonm  }
{ Nshu  }
{ Soyo  }
{ Zanb  }
{ Unicode 11.0 additions  }
{ Dogr  }
{ Gong  }
{ Rohg  }
{ Maka  }
{ Medf  }
{ Sogo  }
{ Sogd  }
{ Unicode 12.0 additions  }
{ Elym  }
{ Nand  }
{ Rohg  }
{ Wcho  }
{ Unicode 13.0 additions  }
{ Chrs  }
{ Diak  }
{ Kits  }
{ Yezi  }
{ Unicode 14.0 additions  }
{ Cpmn  }
{ Ougr  }
{ Tnsa  }
{ Toto  }
{ Vith  }
{ not really a Unicode script, but part of ISO 15924  }
{ Zmth  }
{ Unicode 15.0 additions  }
{  G_UNICODE_SCRIPT_KAWI GLIB_AVAILABLE_ENUMERATOR_IN_2_74,          /* Kawi */ }
{  G_UNICODE_SCRIPT_NAG_MUNDARI GLIB_AVAILABLE_ENUMERATOR_IN_2_74,   /* Nag Mundari */ }
type
  PGUnicodeScript = ^TGUnicodeScript;
  TGUnicodeScript =  Longint;
  Const
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
;

function g_unicode_script_to_iso15924(script:TGUnicodeScript):Tguint32;cdecl;external;
function g_unicode_script_from_iso15924(iso15924:Tguint32):TGUnicodeScript;cdecl;external;
{ These are all analogs of the <ctype.h> functions.
  }
function g_unichar_isalnum(c:Tgunichar):Tgboolean;cdecl;external;
function g_unichar_isalpha(c:Tgunichar):Tgboolean;cdecl;external;
function g_unichar_iscntrl(c:Tgunichar):Tgboolean;cdecl;external;
function g_unichar_isdigit(c:Tgunichar):Tgboolean;cdecl;external;
function g_unichar_isgraph(c:Tgunichar):Tgboolean;cdecl;external;
function g_unichar_islower(c:Tgunichar):Tgboolean;cdecl;external;
function g_unichar_isprint(c:Tgunichar):Tgboolean;cdecl;external;
function g_unichar_ispunct(c:Tgunichar):Tgboolean;cdecl;external;
function g_unichar_isspace(c:Tgunichar):Tgboolean;cdecl;external;
function g_unichar_isupper(c:Tgunichar):Tgboolean;cdecl;external;
function g_unichar_isxdigit(c:Tgunichar):Tgboolean;cdecl;external;
function g_unichar_istitle(c:Tgunichar):Tgboolean;cdecl;external;
function g_unichar_isdefined(c:Tgunichar):Tgboolean;cdecl;external;
function g_unichar_iswide(c:Tgunichar):Tgboolean;cdecl;external;
function g_unichar_iswide_cjk(c:Tgunichar):Tgboolean;cdecl;external;
function g_unichar_iszerowidth(c:Tgunichar):Tgboolean;cdecl;external;
function g_unichar_ismark(c:Tgunichar):Tgboolean;cdecl;external;
{ More <ctype.h> functions.  These convert between the three cases.
 * See the Unicode book to understand title case.   }
function g_unichar_toupper(c:Tgunichar):Tgunichar;cdecl;external;
function g_unichar_tolower(c:Tgunichar):Tgunichar;cdecl;external;
function g_unichar_totitle(c:Tgunichar):Tgunichar;cdecl;external;
{ If C is a digit (according to 'g_unichar_isdigit'), then return its
   numeric value.  Otherwise return -1.   }
function g_unichar_digit_value(c:Tgunichar):Tgint;cdecl;external;
function g_unichar_xdigit_value(c:Tgunichar):Tgint;cdecl;external;
{ Return the Unicode character type of a given character.   }
function g_unichar_type(c:Tgunichar):TGUnicodeType;cdecl;external;
{ Return the line break property for a given character  }
function g_unichar_break_type(c:Tgunichar):TGUnicodeBreakType;cdecl;external;
{ Returns the combining class for a given character  }
function g_unichar_combining_class(uc:Tgunichar):Tgint;cdecl;external;
function g_unichar_get_mirror_char(ch:Tgunichar; mirrored_ch:Pgunichar):Tgboolean;cdecl;external;
function g_unichar_get_script(ch:Tgunichar):TGUnicodeScript;cdecl;external;
{ Validate a Unicode character  }
function g_unichar_validate(ch:Tgunichar):Tgboolean;cdecl;external;
{ Pairwise canonical compose/decompose  }
function g_unichar_compose(a:Tgunichar; b:Tgunichar; ch:Pgunichar):Tgboolean;cdecl;external;
function g_unichar_decompose(ch:Tgunichar; a:Pgunichar; b:Pgunichar):Tgboolean;cdecl;external;
function g_unichar_fully_decompose(ch:Tgunichar; compat:Tgboolean; result:Pgunichar; result_len:Tgsize):Tgsize;cdecl;external;
{*
 * G_UNICHAR_MAX_DECOMPOSITION_LENGTH:
 *
 * The maximum length (in codepoints) of a compatibility or canonical
 * decomposition of a single Unicode character.
 *
 * This is as defined by Unicode 6.1.
 *
 * Since: 2.32
  }
{ codepoints  }
const
  G_UNICHAR_MAX_DECOMPOSITION_LENGTH = 18;  
{ Compute canonical ordering of a string in-place.  This rearranges
   decomposed characters in the string according to their combining
   classes.  See the Unicode manual for more information.   }

procedure g_unicode_canonical_ordering(_string:Pgunichar; len:Tgsize);cdecl;external;
function g_unicode_canonical_decomposition(ch:Tgunichar; result_len:Pgsize):Pgunichar;cdecl;external;
{ Array of skip-bytes-per-initial character.
  }
(* Const before type ignored *)
(* Const before declarator ignored *)
  var
    g_utf8_skip : Pgchar;cvar;public;
{*
 * g_utf8_next_char:
 * @p: Pointer to the start of a valid UTF-8 character
 *
 * Skips to the next character in a UTF-8 string.
 *
 * The string must be valid; this macro is as fast as possible, and has
 * no error-checking.
 *
 * You would use this macro to iterate over a string character by character.
 *
 * The macro returns the start of the next UTF-8 character.
 *
 * Before using this macro, use g_utf8_validate() to validate strings
 * that may contain invalid UTF-8.
  }
{#define g_utf8_next_char(p) (char *)((p) + g_utf8_skip[*(const guchar *)(p)]) }
(* Const before type ignored *)

function g_utf8_get_char(p:Pgchar):Tgunichar;cdecl;external;
(* Const before type ignored *)
function g_utf8_get_char_validated(p:Pgchar; max_len:Tgssize):Tgunichar;cdecl;external;
(* Const before type ignored *)
function g_utf8_offset_to_pointer(str:Pgchar; offset:Tglong):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_utf8_pointer_to_offset(str:Pgchar; pos:Pgchar):Tglong;cdecl;external;
(* Const before type ignored *)
function g_utf8_prev_char(p:Pgchar):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_utf8_find_next_char(p:Pgchar; end:Pgchar):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_utf8_find_prev_char(str:Pgchar; p:Pgchar):Pgchar;cdecl;external;
(* Const before type ignored *)
function g_utf8_strlen(p:Pgchar; max:Tgssize):Tglong;cdecl;external;
(* Const before type ignored *)
function g_utf8_substring(str:Pgchar; start_pos:Tglong; end_pos:Tglong):Pgchar;cdecl;external;
(* Const before type ignored *)
function g_utf8_strncpy(dest:Pgchar; src:Pgchar; n:Tgsize):Pgchar;cdecl;external;
(* Const before type ignored *)
function g_utf8_truncate_middle(_string:Pgchar; truncate_length:Tgsize):Pgchar;cdecl;external;
{ Find the UTF-8 character corresponding to ch, in string p. These
   functions are equivalants to strchr and strrchr  }
(* Const before type ignored *)
function g_utf8_strchr(p:Pgchar; len:Tgssize; c:Tgunichar):Pgchar;cdecl;external;
(* Const before type ignored *)
function g_utf8_strrchr(p:Pgchar; len:Tgssize; c:Tgunichar):Pgchar;cdecl;external;
(* Const before type ignored *)
function g_utf8_strreverse(str:Pgchar; len:Tgssize):Pgchar;cdecl;external;
(* Const before type ignored *)
function g_utf8_to_utf16(str:Pgchar; len:Tglong; items_read:Pglong; items_written:Pglong; error:PPGError):Pgunichar2;cdecl;external;
(* Const before type ignored *)
function g_utf8_to_ucs4(str:Pgchar; len:Tglong; items_read:Pglong; items_written:Pglong; error:PPGError):Pgunichar;cdecl;external;
(* Const before type ignored *)
function g_utf8_to_ucs4_fast(str:Pgchar; len:Tglong; items_written:Pglong):Pgunichar;cdecl;external;
(* Const before type ignored *)
function g_utf16_to_ucs4(str:Pgunichar2; len:Tglong; items_read:Pglong; items_written:Pglong; error:PPGError):Pgunichar;cdecl;external;
(* Const before type ignored *)
function g_utf16_to_utf8(str:Pgunichar2; len:Tglong; items_read:Pglong; items_written:Pglong; error:PPGError):Pgchar;cdecl;external;
(* Const before type ignored *)
function g_ucs4_to_utf16(str:Pgunichar; len:Tglong; items_read:Pglong; items_written:Pglong; error:PPGError):Pgunichar2;cdecl;external;
(* Const before type ignored *)
function g_ucs4_to_utf8(str:Pgunichar; len:Tglong; items_read:Pglong; items_written:Pglong; error:PPGError):Pgchar;cdecl;external;
function g_unichar_to_utf8(c:Tgunichar; outbuf:Pgchar):Tgint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_utf8_validate(str:Pgchar; max_len:Tgssize; end:PPgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_utf8_validate_len(str:Pgchar; max_len:Tgsize; end:PPgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_utf8_strup(str:Pgchar; len:Tgssize):Pgchar;cdecl;external;
(* Const before type ignored *)
function g_utf8_strdown(str:Pgchar; len:Tgssize):Pgchar;cdecl;external;
(* Const before type ignored *)
function g_utf8_casefold(str:Pgchar; len:Tgssize):Pgchar;cdecl;external;
{*
 * GNormalizeMode:
 * @G_NORMALIZE_DEFAULT: standardize differences that do not affect the
 *     text content, such as the above-mentioned accent representation
 * @G_NORMALIZE_NFD: another name for %G_NORMALIZE_DEFAULT
 * @G_NORMALIZE_DEFAULT_COMPOSE: like %G_NORMALIZE_DEFAULT, but with
 *     composed forms rather than a maximally decomposed form
 * @G_NORMALIZE_NFC: another name for %G_NORMALIZE_DEFAULT_COMPOSE
 * @G_NORMALIZE_ALL: beyond %G_NORMALIZE_DEFAULT also standardize the
 *     "compatibility" characters in Unicode, such as SUPERSCRIPT THREE
 *     to the standard forms (in this case DIGIT THREE). Formatting
 *     information may be lost but for most text operations such
 *     characters should be considered the same
 * @G_NORMALIZE_NFKD: another name for %G_NORMALIZE_ALL
 * @G_NORMALIZE_ALL_COMPOSE: like %G_NORMALIZE_ALL, but with composed
 *     forms rather than a maximally decomposed form
 * @G_NORMALIZE_NFKC: another name for %G_NORMALIZE_ALL_COMPOSE
 *
 * Defines how a Unicode string is transformed in a canonical
 * form, standardizing such issues as whether a character with
 * an accent is represented as a base character and combining
 * accent or as a single precomposed character. Unicode strings
 * should generally be normalized before comparing them.
  }
type
  PGNormalizeMode = ^TGNormalizeMode;
  TGNormalizeMode =  Longint;
  Const
    G_NORMALIZE_DEFAULT = 0;
    G_NORMALIZE_NFD = G_NORMALIZE_DEFAULT;
    G_NORMALIZE_DEFAULT_COMPOSE = (G_NORMALIZE_DEFAULT)+1;
    G_NORMALIZE_NFC = G_NORMALIZE_DEFAULT_COMPOSE;
    G_NORMALIZE_ALL = (G_NORMALIZE_DEFAULT_COMPOSE)+1;
    G_NORMALIZE_NFKD = G_NORMALIZE_ALL;
    G_NORMALIZE_ALL_COMPOSE = (G_NORMALIZE_ALL)+1;
    G_NORMALIZE_NFKC = G_NORMALIZE_ALL_COMPOSE;
;
(* Const before type ignored *)

function g_utf8_normalize(str:Pgchar; len:Tgssize; mode:TGNormalizeMode):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_utf8_collate(str1:Pgchar; str2:Pgchar):Tgint;cdecl;external;
(* Const before type ignored *)
function g_utf8_collate_key(str:Pgchar; len:Tgssize):Pgchar;cdecl;external;
(* Const before type ignored *)
function g_utf8_collate_key_for_filename(str:Pgchar; len:Tgssize):Pgchar;cdecl;external;
(* Const before type ignored *)
function g_utf8_make_valid(str:Pgchar; len:Tgssize):Pgchar;cdecl;external;
{$endif}
{ __G_UNICODE_H__  }

implementation


end.
