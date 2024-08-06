
unit gvariant;
interface

{
  Automatically converted by H2Pas 1.0.0 from gvariant.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gvariant.h
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
PGBytes  = ^GBytes;
Pgchar  = ^gchar;
PGError  = ^GError;
Pgsize  = ^gsize;
PGString  = ^GString;
PGVariant  = ^GVariant;
PGVariantBuilder  = ^GVariantBuilder;
PGVariantClass  = ^GVariantClass;
PGVariantDict  = ^GVariantDict;
PGVariantIter  = ^GVariantIter;
PGVariantParseError  = ^GVariantParseError;
PGVariantType  = ^GVariantType;
Pva_list  = ^va_list;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2007, 2008 Ryan Lortie
 * Copyright © 2009, 2010 Codethink Limited
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
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, see <http://www.gnu.org/licenses/>.
 *
 * Author: Ryan Lortie <desrt@desrt.ca>
  }
{$ifndef __G_VARIANT_H__}
{$define __G_VARIANT_H__}
{$if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)}
{$error "Only <glib.h> can be included directly."}
{$endif}
{$include <glib/gvarianttype.h>}
{$include <glib/gstring.h>}
{$include <glib/gbytes.h>}
type

  PGVariantClass = ^TGVariantClass;
  TGVariantClass =  Longint;
  Const
    G_VARIANT_CLASS_BOOLEAN = 'b';
    G_VARIANT_CLASS_BYTE = 'y';
    G_VARIANT_CLASS_INT16 = 'n';
    G_VARIANT_CLASS_UINT16 = 'q';
    G_VARIANT_CLASS_INT32 = 'i';
    G_VARIANT_CLASS_UINT32 = 'u';
    G_VARIANT_CLASS_INT64 = 'x';
    G_VARIANT_CLASS_UINT64 = 't';
    G_VARIANT_CLASS_HANDLE = 'h';
    G_VARIANT_CLASS_DOUBLE = 'd';
    G_VARIANT_CLASS_STRING = 's';
    G_VARIANT_CLASS_OBJECT_PATH = 'o';
    G_VARIANT_CLASS_SIGNATURE = 'g';
    G_VARIANT_CLASS_VARIANT = 'v';
    G_VARIANT_CLASS_MAYBE = 'm';
    G_VARIANT_CLASS_ARRAY = 'a';
    G_VARIANT_CLASS_TUPLE = '(';
    G_VARIANT_CLASS_DICT_ENTRY = '{';
;

procedure g_variant_unref(value:PGVariant);cdecl;external;
function g_variant_ref(value:PGVariant):PGVariant;cdecl;external;
function g_variant_ref_sink(value:PGVariant):PGVariant;cdecl;external;
function g_variant_is_floating(value:PGVariant):Tgboolean;cdecl;external;
function g_variant_take_ref(value:PGVariant):PGVariant;cdecl;external;
(* Const before type ignored *)
function g_variant_get_type(value:PGVariant):PGVariantType;cdecl;external;
(* Const before type ignored *)
function g_variant_get_type_string(value:PGVariant):Pgchar;cdecl;external;
(* Const before type ignored *)
function g_variant_is_of_type(value:PGVariant; _type:PGVariantType):Tgboolean;cdecl;external;
function g_variant_is_container(value:PGVariant):Tgboolean;cdecl;external;
function g_variant_classify(value:PGVariant):TGVariantClass;cdecl;external;
function g_variant_new_boolean(value:Tgboolean):PGVariant;cdecl;external;
function g_variant_new_byte(value:Tguint8):PGVariant;cdecl;external;
function g_variant_new_int16(value:Tgint16):PGVariant;cdecl;external;
function g_variant_new_uint16(value:Tguint16):PGVariant;cdecl;external;
function g_variant_new_int32(value:Tgint32):PGVariant;cdecl;external;
function g_variant_new_uint32(value:Tguint32):PGVariant;cdecl;external;
function g_variant_new_int64(value:Tgint64):PGVariant;cdecl;external;
function g_variant_new_uint64(value:Tguint64):PGVariant;cdecl;external;
function g_variant_new_handle(value:Tgint32):PGVariant;cdecl;external;
function g_variant_new_double(value:Tgdouble):PGVariant;cdecl;external;
(* Const before type ignored *)
function g_variant_new_string(_string:Pgchar):PGVariant;cdecl;external;
function g_variant_new_take_string(_string:Pgchar):PGVariant;cdecl;external;
(* Const before type ignored *)
function g_variant_new_printf(format_string:Pgchar; args:array of const):PGVariant;cdecl;external;
function g_variant_new_printf(format_string:Pgchar):PGVariant;cdecl;external;
(* Const before type ignored *)
function g_variant_new_object_path(object_path:Pgchar):PGVariant;cdecl;external;
(* Const before type ignored *)
function g_variant_is_object_path(_string:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_variant_new_signature(signature:Pgchar):PGVariant;cdecl;external;
(* Const before type ignored *)
function g_variant_is_signature(_string:Pgchar):Tgboolean;cdecl;external;
function g_variant_new_variant(value:PGVariant):PGVariant;cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
function g_variant_new_strv(strv:PPgchar; length:Tgssize):PGVariant;cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
function g_variant_new_objv(strv:PPgchar; length:Tgssize):PGVariant;cdecl;external;
(* Const before type ignored *)
function g_variant_new_bytestring(_string:Pgchar):PGVariant;cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
function g_variant_new_bytestring_array(strv:PPgchar; length:Tgssize):PGVariant;cdecl;external;
(* Const before type ignored *)
function g_variant_new_fixed_array(element_type:PGVariantType; elements:Tgconstpointer; n_elements:Tgsize; element_size:Tgsize):PGVariant;cdecl;external;
function g_variant_get_boolean(value:PGVariant):Tgboolean;cdecl;external;
function g_variant_get_byte(value:PGVariant):Tguint8;cdecl;external;
function g_variant_get_int16(value:PGVariant):Tgint16;cdecl;external;
function g_variant_get_uint16(value:PGVariant):Tguint16;cdecl;external;
function g_variant_get_int32(value:PGVariant):Tgint32;cdecl;external;
function g_variant_get_uint32(value:PGVariant):Tguint32;cdecl;external;
function g_variant_get_int64(value:PGVariant):Tgint64;cdecl;external;
function g_variant_get_uint64(value:PGVariant):Tguint64;cdecl;external;
function g_variant_get_handle(value:PGVariant):Tgint32;cdecl;external;
function g_variant_get_double(value:PGVariant):Tgdouble;cdecl;external;
function g_variant_get_variant(value:PGVariant):PGVariant;cdecl;external;
(* Const before type ignored *)
function g_variant_get_string(value:PGVariant; length:Pgsize):Pgchar;cdecl;external;
function g_variant_dup_string(value:PGVariant; length:Pgsize):Pgchar;cdecl;external;
(* Const before type ignored *)
function g_variant_get_strv(value:PGVariant; length:Pgsize):^Pgchar;cdecl;external;
function g_variant_dup_strv(value:PGVariant; length:Pgsize):^Pgchar;cdecl;external;
(* Const before type ignored *)
function g_variant_get_objv(value:PGVariant; length:Pgsize):^Pgchar;cdecl;external;
function g_variant_dup_objv(value:PGVariant; length:Pgsize):^Pgchar;cdecl;external;
(* Const before type ignored *)
function g_variant_get_bytestring(value:PGVariant):Pgchar;cdecl;external;
function g_variant_dup_bytestring(value:PGVariant; length:Pgsize):Pgchar;cdecl;external;
(* Const before type ignored *)
function g_variant_get_bytestring_array(value:PGVariant; length:Pgsize):^Pgchar;cdecl;external;
function g_variant_dup_bytestring_array(value:PGVariant; length:Pgsize):^Pgchar;cdecl;external;
(* Const before type ignored *)
function g_variant_new_maybe(child_type:PGVariantType; child:PGVariant):PGVariant;cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
function g_variant_new_array(child_type:PGVariantType; children:PPGVariant; n_children:Tgsize):PGVariant;cdecl;external;
(* Const before declarator ignored *)
function g_variant_new_tuple(children:PPGVariant; n_children:Tgsize):PGVariant;cdecl;external;
function g_variant_new_dict_entry(key:PGVariant; value:PGVariant):PGVariant;cdecl;external;
function g_variant_get_maybe(value:PGVariant):PGVariant;cdecl;external;
function g_variant_n_children(value:PGVariant):Tgsize;cdecl;external;
(* Const before type ignored *)
procedure g_variant_get_child(value:PGVariant; index_:Tgsize; format_string:Pgchar; args:array of const);cdecl;external;
procedure g_variant_get_child(value:PGVariant; index_:Tgsize; format_string:Pgchar);cdecl;external;
function g_variant_get_child_value(value:PGVariant; index_:Tgsize):PGVariant;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_variant_lookup(dictionary:PGVariant; key:Pgchar; format_string:Pgchar; args:array of const):Tgboolean;cdecl;external;
function g_variant_lookup(dictionary:PGVariant; key:Pgchar; format_string:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_variant_lookup_value(dictionary:PGVariant; key:Pgchar; expected_type:PGVariantType):PGVariant;cdecl;external;
function g_variant_get_fixed_array(value:PGVariant; n_elements:Pgsize; element_size:Tgsize):Tgconstpointer;cdecl;external;
function g_variant_get_size(value:PGVariant):Tgsize;cdecl;external;
function g_variant_get_data(value:PGVariant):Tgconstpointer;cdecl;external;
function g_variant_get_data_as_bytes(value:PGVariant):PGBytes;cdecl;external;
procedure g_variant_store(value:PGVariant; data:Tgpointer);cdecl;external;
function g_variant_print(value:PGVariant; type_annotate:Tgboolean):Pgchar;cdecl;external;
function g_variant_print_string(value:PGVariant; _string:PGString; type_annotate:Tgboolean):PGString;cdecl;external;
function g_variant_hash(value:Tgconstpointer):Tguint;cdecl;external;
function g_variant_equal(one:Tgconstpointer; two:Tgconstpointer):Tgboolean;cdecl;external;
function g_variant_get_normal_form(value:PGVariant):PGVariant;cdecl;external;
function g_variant_is_normal_form(value:PGVariant):Tgboolean;cdecl;external;
function g_variant_byteswap(value:PGVariant):PGVariant;cdecl;external;
(* Const before type ignored *)
function g_variant_new_from_bytes(_type:PGVariantType; bytes:PGBytes; trusted:Tgboolean):PGVariant;cdecl;external;
(* Const before type ignored *)
function g_variant_new_from_data(_type:PGVariantType; data:Tgconstpointer; size:Tgsize; trusted:Tgboolean; notify:TGDestroyNotify; 
           user_data:Tgpointer):PGVariant;cdecl;external;
type
{< private > }
  PGVariantIter = ^TGVariantIter;
  TGVariantIter = record
      x : array[0..15] of Tguintptr;
    end;


function g_variant_iter_new(value:PGVariant):PGVariantIter;cdecl;external;
function g_variant_iter_init(iter:PGVariantIter; value:PGVariant):Tgsize;cdecl;external;
function g_variant_iter_copy(iter:PGVariantIter):PGVariantIter;cdecl;external;
function g_variant_iter_n_children(iter:PGVariantIter):Tgsize;cdecl;external;
procedure g_variant_iter_free(iter:PGVariantIter);cdecl;external;
function g_variant_iter_next_value(iter:PGVariantIter):PGVariant;cdecl;external;
(* Const before type ignored *)
function g_variant_iter_next(iter:PGVariantIter; format_string:Pgchar; args:array of const):Tgboolean;cdecl;external;
function g_variant_iter_next(iter:PGVariantIter; format_string:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_variant_iter_loop(iter:PGVariantIter; format_string:Pgchar; args:array of const):Tgboolean;cdecl;external;
function g_variant_iter_loop(iter:PGVariantIter; format_string:Pgchar):Tgboolean;cdecl;external;
type
{< private > }
(* Const before type ignored *)
  PGVariantBuilder = ^TGVariantBuilder;
  TGVariantBuilder = record
      u : record
          case longint of
            0 : ( s : record
                partial_magic : Tgsize;
                _type : PGVariantType;
                y : array[0..13] of Tguintptr;
              end );
            1 : ( x : array[0..15] of Tguintptr );
          end;
    end;


  PGVariantParseError = ^TGVariantParseError;
  TGVariantParseError =  Longint;
  Const
    G_VARIANT_PARSE_ERROR_FAILED = 0;
    G_VARIANT_PARSE_ERROR_BASIC_TYPE_EXPECTED = 1;
    G_VARIANT_PARSE_ERROR_CANNOT_INFER_TYPE = 2;
    G_VARIANT_PARSE_ERROR_DEFINITE_TYPE_EXPECTED = 3;
    G_VARIANT_PARSE_ERROR_INPUT_NOT_AT_END = 4;
    G_VARIANT_PARSE_ERROR_INVALID_CHARACTER = 5;
    G_VARIANT_PARSE_ERROR_INVALID_FORMAT_STRING = 6;
    G_VARIANT_PARSE_ERROR_INVALID_OBJECT_PATH = 7;
    G_VARIANT_PARSE_ERROR_INVALID_SIGNATURE = 8;
    G_VARIANT_PARSE_ERROR_INVALID_TYPE_STRING = 9;
    G_VARIANT_PARSE_ERROR_NO_COMMON_TYPE = 10;
    G_VARIANT_PARSE_ERROR_NUMBER_OUT_OF_RANGE = 11;
    G_VARIANT_PARSE_ERROR_NUMBER_TOO_BIG = 12;
    G_VARIANT_PARSE_ERROR_TYPE_ERROR = 13;
    G_VARIANT_PARSE_ERROR_UNEXPECTED_TOKEN = 14;
    G_VARIANT_PARSE_ERROR_UNKNOWN_KEYWORD = 15;
    G_VARIANT_PARSE_ERROR_UNTERMINATED_STRING_CONSTANT = 16;
    G_VARIANT_PARSE_ERROR_VALUE_EXPECTED = 17;
    G_VARIANT_PARSE_ERROR_RECURSION = 18;
;

{ was #define dname def_expr }
function G_VARIANT_PARSE_ERROR : longint; { return type might be wrong }

function g_variant_parser_get_error_quark:TGQuark;cdecl;external;
function g_variant_parse_error_quark:TGQuark;cdecl;external;
{*
 * G_VARIANT_BUILDER_INIT:
 * @variant_type: a const GVariantType*
 *
 * A stack-allocated #GVariantBuilder must be initialized if it is
 * used together with g_auto() to avoid warnings or crashes if
 * function returns before g_variant_builder_init() is called on the
 * builder.
 *
 * This macro can be used as initializer instead of an
 * explicit zeroing a variable when declaring it and a following
 * g_variant_builder_init(), but it cannot be assigned to a variable.
 *
 * The passed @variant_type should be a static GVariantType to avoid
 * lifetime issues, as copying the @variant_type does not happen in
 * the G_VARIANT_BUILDER_INIT() call, but rather in functions that
 * make sure that #GVariantBuilder is valid.
 *
 * |[<!-- language="C" -->
 *   g_auto(GVariantBuilder) builder = G_VARIANT_BUILDER_INIT (G_VARIANT_TYPE_BYTESTRING);
 * ]|
 *
 * Since: 2.50
  }
{#define G_VARIANT_BUILDER_INIT(variant_type)                                          \ }
{                                                                                     \ }
{                                                                                     \ }
{                                                                                     \ }
{        2942751021u /* == GVSB_MAGIC_PARTIAL, see gvariant.c */, variant_type,  0,  \ }
{                                                                                     \ }
{                                                                                     \ }
{   }
(* Const before type ignored *)
function g_variant_builder_new(_type:PGVariantType):PGVariantBuilder;cdecl;external;
procedure g_variant_builder_unref(builder:PGVariantBuilder);cdecl;external;
function g_variant_builder_ref(builder:PGVariantBuilder):PGVariantBuilder;cdecl;external;
(* Const before type ignored *)
procedure g_variant_builder_init(builder:PGVariantBuilder; _type:PGVariantType);cdecl;external;
function g_variant_builder_end(builder:PGVariantBuilder):PGVariant;cdecl;external;
procedure g_variant_builder_clear(builder:PGVariantBuilder);cdecl;external;
(* Const before type ignored *)
procedure g_variant_builder_open(builder:PGVariantBuilder; _type:PGVariantType);cdecl;external;
procedure g_variant_builder_close(builder:PGVariantBuilder);cdecl;external;
procedure g_variant_builder_add_value(builder:PGVariantBuilder; value:PGVariant);cdecl;external;
(* Const before type ignored *)
procedure g_variant_builder_add(builder:PGVariantBuilder; format_string:Pgchar; args:array of const);cdecl;external;
procedure g_variant_builder_add(builder:PGVariantBuilder; format_string:Pgchar);cdecl;external;
(* Const before type ignored *)
procedure g_variant_builder_add_parsed(builder:PGVariantBuilder; format:Pgchar; args:array of const);cdecl;external;
procedure g_variant_builder_add_parsed(builder:PGVariantBuilder; format:Pgchar);cdecl;external;
(* Const before type ignored *)
function g_variant_new(format_string:Pgchar; args:array of const):PGVariant;cdecl;external;
function g_variant_new(format_string:Pgchar):PGVariant;cdecl;external;
(* Const before type ignored *)
procedure g_variant_get(value:PGVariant; format_string:Pgchar; args:array of const);cdecl;external;
procedure g_variant_get(value:PGVariant; format_string:Pgchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_variant_new_va(format_string:Pgchar; endptr:PPgchar; app:Pva_list):PGVariant;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure g_variant_get_va(value:PGVariant; format_string:Pgchar; endptr:PPgchar; app:Pva_list);cdecl;external;
(* Const before type ignored *)
function g_variant_check_format_string(value:PGVariant; format_string:Pgchar; copy_only:Tgboolean):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function g_variant_parse(_type:PGVariantType; text:Pgchar; limit:Pgchar; endptr:PPgchar; error:PPGError):PGVariant;cdecl;external;
(* Const before type ignored *)
function g_variant_new_parsed(format:Pgchar; args:array of const):PGVariant;cdecl;external;
function g_variant_new_parsed(format:Pgchar):PGVariant;cdecl;external;
(* Const before type ignored *)
function g_variant_new_parsed_va(format:Pgchar; app:Pva_list):PGVariant;cdecl;external;
(* Const before type ignored *)
function g_variant_parse_error_print_context(error:PGError; source_str:Pgchar):Pgchar;cdecl;external;
function g_variant_compare(one:Tgconstpointer; two:Tgconstpointer):Tgint;cdecl;external;
type
{< private > }
  PGVariantDict = ^TGVariantDict;
  TGVariantDict = record
      u : record
          case longint of
            0 : ( s : record
                asv : PGVariant;
                partial_magic : Tgsize;
                y : array[0..13] of Tguintptr;
              end );
            1 : ( x : array[0..15] of Tguintptr );
          end;
    end;

{*
 * G_VARIANT_DICT_INIT:
 * @asv: (nullable): a GVariant*
 *
 * A stack-allocated #GVariantDict must be initialized if it is used
 * together with g_auto() to avoid warnings or crashes if function
 * returns before g_variant_dict_init() is called on the builder.
 *
 * This macro can be used as initializer instead of an explicit
 * zeroing a variable when declaring it and a following
 * g_variant_dict_init(), but it cannot be assigned to a variable.
 *
 * The passed @asv has to live long enough for #GVariantDict to gather
 * the entries from, as the gathering does not happen in the
 * G_VARIANT_DICT_INIT() call, but rather in functions that make sure
 * that #GVariantDict is valid.  In context where the initialization
 * value has to be a constant expression, the only possible value of
 * @asv is %NULL.  It is still possible to call g_variant_dict_init()
 * safely with a different @asv right after the variable was
 * initialized with G_VARIANT_DICT_INIT().
 *
 * |[<!-- language="C" -->
 *   g_autoptr(GVariant) variant = get_asv_variant ();
 *   g_auto(GVariantDict) dict = G_VARIANT_DICT_INIT (variant);
 * ]|
 *
 * Since: 2.50
  }
{#define G_VARIANT_DICT_INIT(asv)                                             \ }
{                                                                            \ }
{                                                                            \ }
{                                                                            \ }
{        asv, 3488698669u /* == GVSD_MAGIC_PARTIAL, see gvariant.c */,  0,  \ }
{                                                                            \ }
{                                                                            \ }
{   }

function g_variant_dict_new(from_asv:PGVariant):PGVariantDict;cdecl;external;
procedure g_variant_dict_init(dict:PGVariantDict; from_asv:PGVariant);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_variant_dict_lookup(dict:PGVariantDict; key:Pgchar; format_string:Pgchar; args:array of const):Tgboolean;cdecl;external;
function g_variant_dict_lookup(dict:PGVariantDict; key:Pgchar; format_string:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_variant_dict_lookup_value(dict:PGVariantDict; key:Pgchar; expected_type:PGVariantType):PGVariant;cdecl;external;
(* Const before type ignored *)
function g_variant_dict_contains(dict:PGVariantDict; key:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure g_variant_dict_insert(dict:PGVariantDict; key:Pgchar; format_string:Pgchar; args:array of const);cdecl;external;
procedure g_variant_dict_insert(dict:PGVariantDict; key:Pgchar; format_string:Pgchar);cdecl;external;
(* Const before type ignored *)
procedure g_variant_dict_insert_value(dict:PGVariantDict; key:Pgchar; value:PGVariant);cdecl;external;
(* Const before type ignored *)
function g_variant_dict_remove(dict:PGVariantDict; key:Pgchar):Tgboolean;cdecl;external;
procedure g_variant_dict_clear(dict:PGVariantDict);cdecl;external;
function g_variant_dict_end(dict:PGVariantDict):PGVariant;cdecl;external;
function g_variant_dict_ref(dict:PGVariantDict):PGVariantDict;cdecl;external;
procedure g_variant_dict_unref(dict:PGVariantDict);cdecl;external;
{$endif}
{ __G_VARIANT_H__  }

implementation

{ was #define dname def_expr }
function G_VARIANT_PARSE_ERROR : longint; { return type might be wrong }
  begin
    G_VARIANT_PARSE_ERROR:=g_variant_parse_error_quark;
  end;


end.
