
unit gvarianttype;
interface

{
  Automatically converted by H2Pas 1.0.0 from gvarianttype.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gvarianttype.h
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
PGVariantType  = ^GVariantType;
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
{$ifndef __G_VARIANT_TYPE_H__}
{$define __G_VARIANT_TYPE_H__}
{$if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)}
{$error "Only <glib.h> can be included directly."}
{$endif}
{$include <glib/gtypes.h>}
type
{*
 * G_VARIANT_TYPE_BOOLEAN:
 *
 * The type of a value that can be either %TRUE or %FALSE.
 * }
(* Const before type ignored *)

{ was #define dname def_expr }
function G_VARIANT_TYPE_BOOLEAN : PGVariantType;  

{*
 * G_VARIANT_TYPE_BYTE:
 *
 * The type of an integer value that can range from 0 to 255.
 * }
(* Const before type ignored *)
{ was #define dname def_expr }
function G_VARIANT_TYPE_BYTE : PGVariantType;  

{*
 * G_VARIANT_TYPE_INT16:
 *
 * The type of an integer value that can range from -32768 to 32767.
 * }
(* Const before type ignored *)
{ was #define dname def_expr }
function G_VARIANT_TYPE_INT16 : PGVariantType;  

{*
 * G_VARIANT_TYPE_UINT16:
 *
 * The type of an integer value that can range from 0 to 65535.
 * There were about this many people living in Toronto in the 1870s.
 * }
(* Const before type ignored *)
{ was #define dname def_expr }
function G_VARIANT_TYPE_UINT16 : PGVariantType;  

{*
 * G_VARIANT_TYPE_INT32:
 *
 * The type of an integer value that can range from -2147483648 to
 * 2147483647.
 * }
(* Const before type ignored *)
{ was #define dname def_expr }
function G_VARIANT_TYPE_INT32 : PGVariantType;  

{*
 * G_VARIANT_TYPE_UINT32:
 *
 * The type of an integer value that can range from 0 to 4294967295.
 * That's one number for everyone who was around in the late 1970s.
 * }
(* Const before type ignored *)
{ was #define dname def_expr }
function G_VARIANT_TYPE_UINT32 : PGVariantType;  

{*
 * G_VARIANT_TYPE_INT64:
 *
 * The type of an integer value that can range from
 * -9223372036854775808 to 9223372036854775807.
 * }
(* Const before type ignored *)
{ was #define dname def_expr }
function G_VARIANT_TYPE_INT64 : PGVariantType;  

{*
 * G_VARIANT_TYPE_UINT64:
 *
 * The type of an integer value that can range from 0
 * to 18446744073709551615 (inclusive).  That's a really big number,
 * but a Rubik's cube can have a bit more than twice as many possible
 * positions.
 * }
(* Const before type ignored *)
{ was #define dname def_expr }
function G_VARIANT_TYPE_UINT64 : PGVariantType;  

{*
 * G_VARIANT_TYPE_DOUBLE:
 *
 * The type of a double precision IEEE754 floating point number.
 * These guys go up to about 1.80e308 (plus and minus) but miss out on
 * some numbers in between.  In any case, that's far greater than the
 * estimated number of fundamental particles in the observable
 * universe.
 * }
(* Const before type ignored *)
{ was #define dname def_expr }
function G_VARIANT_TYPE_DOUBLE : PGVariantType;  

{*
 * G_VARIANT_TYPE_STRING:
 *
 * The type of a string.  "" is a string.  %NULL is not a string.
 * }
(* Const before type ignored *)
{ was #define dname def_expr }
function G_VARIANT_TYPE_STRING : PGVariantType;  

{*
 * G_VARIANT_TYPE_OBJECT_PATH:
 *
 * The type of a D-Bus object reference.  These are strings of a
 * specific format used to identify objects at a given destination on
 * the bus.
 *
 * If you are not interacting with D-Bus, then there is no reason to make
 * use of this type.  If you are, then the D-Bus specification contains a
 * precise description of valid object paths.
 * }
(* Const before type ignored *)
{ was #define dname def_expr }
function G_VARIANT_TYPE_OBJECT_PATH : PGVariantType;  

{*
 * G_VARIANT_TYPE_SIGNATURE:
 *
 * The type of a D-Bus type signature.  These are strings of a specific
 * format used as type signatures for D-Bus methods and messages.
 *
 * If you are not interacting with D-Bus, then there is no reason to make
 * use of this type.  If you are, then the D-Bus specification contains a
 * precise description of valid signature strings.
 * }
(* Const before type ignored *)
{ was #define dname def_expr }
function G_VARIANT_TYPE_SIGNATURE : PGVariantType;  

{*
 * G_VARIANT_TYPE_VARIANT:
 *
 * The type of a box that contains any other value (including another
 * variant).
 * }
(* Const before type ignored *)
{ was #define dname def_expr }
function G_VARIANT_TYPE_VARIANT : PGVariantType;  

{*
 * G_VARIANT_TYPE_HANDLE:
 *
 * The type of a 32bit signed integer value, that by convention, is used
 * as an index into an array of file descriptors that are sent alongside
 * a D-Bus message.
 *
 * If you are not interacting with D-Bus, then there is no reason to make
 * use of this type.
 * }
(* Const before type ignored *)
{ was #define dname def_expr }
function G_VARIANT_TYPE_HANDLE : PGVariantType;  

{*
 * G_VARIANT_TYPE_UNIT:
 *
 * The empty tuple type.  Has only one instance.  Known also as "triv"
 * or "void".
 * }
(* Const before type ignored *)
{ was #define dname def_expr }
function G_VARIANT_TYPE_UNIT : PGVariantType;  

{*
 * G_VARIANT_TYPE_ANY:
 *
 * An indefinite type that is a supertype of every type (including
 * itself).
 * }
(* Const before type ignored *)
{ was #define dname def_expr }
function G_VARIANT_TYPE_ANY : PGVariantType;  

{*
 * G_VARIANT_TYPE_BASIC:
 *
 * An indefinite type that is a supertype of every basic (ie:
 * non-container) type.
 * }
(* Const before type ignored *)
{ was #define dname def_expr }
function G_VARIANT_TYPE_BASIC : PGVariantType;  

{*
 * G_VARIANT_TYPE_MAYBE:
 *
 * An indefinite type that is a supertype of every maybe type.
 * }
(* Const before type ignored *)
{ was #define dname def_expr }
function G_VARIANT_TYPE_MAYBE : PGVariantType;  

{*
 * G_VARIANT_TYPE_ARRAY:
 *
 * An indefinite type that is a supertype of every array type.
 * }
(* Const before type ignored *)
{ was #define dname def_expr }
function G_VARIANT_TYPE_ARRAY : PGVariantType;  

{*
 * G_VARIANT_TYPE_TUPLE:
 *
 * An indefinite type that is a supertype of every tuple type,
 * regardless of the number of items in the tuple.
 * }
(* Const before type ignored *)
{ was #define dname def_expr }
function G_VARIANT_TYPE_TUPLE : PGVariantType;  

{*
 * G_VARIANT_TYPE_DICT_ENTRY:
 *
 * An indefinite type that is a supertype of every dictionary entry
 * type.
 * }
(* Const before type ignored *)
{ was #define dname def_expr }
function G_VARIANT_TYPE_DICT_ENTRY : PGVariantType;  

{*
 * G_VARIANT_TYPE_DICTIONARY:
 *
 * An indefinite type that is a supertype of every dictionary type --
 * that is, any array type that has an element type equal to any
 * dictionary entry type.
 * }
(* Const before type ignored *)
{ was #define dname def_expr }
function G_VARIANT_TYPE_DICTIONARY : PGVariantType;  

{*
 * G_VARIANT_TYPE_STRING_ARRAY:
 *
 * The type of an array of strings.
 * }
(* Const before type ignored *)
{ was #define dname def_expr }
function G_VARIANT_TYPE_STRING_ARRAY : PGVariantType;  

{*
 * G_VARIANT_TYPE_OBJECT_PATH_ARRAY:
 *
 * The type of an array of object paths.
 * }
(* Const before type ignored *)
{ was #define dname def_expr }
function G_VARIANT_TYPE_OBJECT_PATH_ARRAY : PGVariantType;  

{*
 * G_VARIANT_TYPE_BYTESTRING:
 *
 * The type of an array of bytes.  This type is commonly used to pass
 * around strings that may not be valid utf8.  In that case, the
 * convention is that the nul terminator character should be included as
 * the last character in the array.
 * }
(* Const before type ignored *)
{ was #define dname def_expr }
function G_VARIANT_TYPE_BYTESTRING : PGVariantType;  

{*
 * G_VARIANT_TYPE_BYTESTRING_ARRAY:
 *
 * The type of an array of byte strings (an array of arrays of bytes).
 * }
(* Const before type ignored *)
{ was #define dname def_expr }
function G_VARIANT_TYPE_BYTESTRING_ARRAY : PGVariantType;  

{*
 * G_VARIANT_TYPE_VARDICT:
 *
 * The type of a dictionary mapping strings to variants (the ubiquitous
 * "asv" type).
 *
 * Since: 2.30
 * }
(* Const before type ignored *)
{ was #define dname def_expr }
function G_VARIANT_TYPE_VARDICT : PGVariantType;  

{*
 * G_VARIANT_TYPE:
 * @type_string: a well-formed #GVariantType type string
 *
 * Converts a string to a const #GVariantType.  Depending on the
 * current debugging level, this function may perform a runtime check
 * to ensure that @string is a valid GVariant type string.
 *
 * It is always a programmer error to use this macro with an invalid
 * type string. If in doubt, use g_variant_type_string_is_valid() to
 * check if the string is valid.
 *
 * Since 2.24
 * }
{$ifndef G_DISABLE_CHECKS}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function G_VARIANT_TYPE(type_string : longint) : longint;

{$else}
(* Const before type ignored *)
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function G_VARIANT_TYPE(type_string : longint) : PGVariantType;

{$endif}
{ type string checking  }
(* Const before type ignored *)

function g_variant_type_string_is_valid(type_string:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function g_variant_type_string_scan(_string:Pgchar; limit:Pgchar; endptr:PPgchar):Tgboolean;cdecl;external;
{ create/destroy  }
procedure g_variant_type_free(_type:PGVariantType);cdecl;external;
(* Const before type ignored *)
function g_variant_type_copy(_type:PGVariantType):PGVariantType;cdecl;external;
(* Const before type ignored *)
function g_variant_type_new(type_string:Pgchar):PGVariantType;cdecl;external;
{ getters  }
(* Const before type ignored *)
function g_variant_type_get_string_length(_type:PGVariantType):Tgsize;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_variant_type_peek_string(_type:PGVariantType):Pgchar;cdecl;external;
(* Const before type ignored *)
function g_variant_type_dup_string(_type:PGVariantType):Pgchar;cdecl;external;
{ classification  }
(* Const before type ignored *)
function g_variant_type_is_definite(_type:PGVariantType):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_variant_type_is_container(_type:PGVariantType):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_variant_type_is_basic(_type:PGVariantType):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_variant_type_is_maybe(_type:PGVariantType):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_variant_type_is_array(_type:PGVariantType):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_variant_type_is_tuple(_type:PGVariantType):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_variant_type_is_dict_entry(_type:PGVariantType):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_variant_type_is_variant(_type:PGVariantType):Tgboolean;cdecl;external;
{ for hash tables  }
function g_variant_type_hash(_type:Tgconstpointer):Tguint;cdecl;external;
function g_variant_type_equal(type1:Tgconstpointer; type2:Tgconstpointer):Tgboolean;cdecl;external;
{ subtypes  }
(* Const before type ignored *)
(* Const before type ignored *)
function g_variant_type_is_subtype_of(_type:PGVariantType; supertype:PGVariantType):Tgboolean;cdecl;external;
{ type iterator interface  }
(* Const before type ignored *)
(* Const before type ignored *)
function g_variant_type_element(_type:PGVariantType):PGVariantType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_variant_type_first(_type:PGVariantType):PGVariantType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_variant_type_next(_type:PGVariantType):PGVariantType;cdecl;external;
(* Const before type ignored *)
function g_variant_type_n_items(_type:PGVariantType):Tgsize;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_variant_type_key(_type:PGVariantType):PGVariantType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_variant_type_value(_type:PGVariantType):PGVariantType;cdecl;external;
{ constructors  }
(* Const before type ignored *)
function g_variant_type_new_array(element:PGVariantType):PGVariantType;cdecl;external;
(* Const before type ignored *)
function g_variant_type_new_maybe(element:PGVariantType):PGVariantType;cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
function g_variant_type_new_tuple(items:PPGVariantType; length:Tgint):PGVariantType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_variant_type_new_dict_entry(key:PGVariantType; value:PGVariantType):PGVariantType;cdecl;external;
{< private > }
(* Const before type ignored *)
(* Const before type ignored *)
function g_variant_type_checked_(type_string:Pgchar):PGVariantType;cdecl;external;
(* Const before type ignored *)
function g_variant_type_string_get_depth_(type_string:Pgchar):Tgsize;cdecl;external;
{$endif}
{ __G_VARIANT_TYPE_H__  }

implementation

{ was #define dname def_expr }
function G_VARIANT_TYPE_BOOLEAN : PGVariantType;
  begin
    G_VARIANT_TYPE_BOOLEAN:=PGVariantType('b');
  end;

{ was #define dname def_expr }
function G_VARIANT_TYPE_BYTE : PGVariantType;
  begin
    G_VARIANT_TYPE_BYTE:=PGVariantType('y');
  end;

{ was #define dname def_expr }
function G_VARIANT_TYPE_INT16 : PGVariantType;
  begin
    G_VARIANT_TYPE_INT16:=PGVariantType('n');
  end;

{ was #define dname def_expr }
function G_VARIANT_TYPE_UINT16 : PGVariantType;
  begin
    G_VARIANT_TYPE_UINT16:=PGVariantType('q');
  end;

{ was #define dname def_expr }
function G_VARIANT_TYPE_INT32 : PGVariantType;
  begin
    G_VARIANT_TYPE_INT32:=PGVariantType('i');
  end;

{ was #define dname def_expr }
function G_VARIANT_TYPE_UINT32 : PGVariantType;
  begin
    G_VARIANT_TYPE_UINT32:=PGVariantType('u');
  end;

{ was #define dname def_expr }
function G_VARIANT_TYPE_INT64 : PGVariantType;
  begin
    G_VARIANT_TYPE_INT64:=PGVariantType('x');
  end;

{ was #define dname def_expr }
function G_VARIANT_TYPE_UINT64 : PGVariantType;
  begin
    G_VARIANT_TYPE_UINT64:=PGVariantType('t');
  end;

{ was #define dname def_expr }
function G_VARIANT_TYPE_DOUBLE : PGVariantType;
  begin
    G_VARIANT_TYPE_DOUBLE:=PGVariantType('d');
  end;

{ was #define dname def_expr }
function G_VARIANT_TYPE_STRING : PGVariantType;
  begin
    G_VARIANT_TYPE_STRING:=PGVariantType('s');
  end;

{ was #define dname def_expr }
function G_VARIANT_TYPE_OBJECT_PATH : PGVariantType;
  begin
    G_VARIANT_TYPE_OBJECT_PATH:=PGVariantType('o');
  end;

{ was #define dname def_expr }
function G_VARIANT_TYPE_SIGNATURE : PGVariantType;
  begin
    G_VARIANT_TYPE_SIGNATURE:=PGVariantType('g');
  end;

{ was #define dname def_expr }
function G_VARIANT_TYPE_VARIANT : PGVariantType;
  begin
    G_VARIANT_TYPE_VARIANT:=PGVariantType('v');
  end;

{ was #define dname def_expr }
function G_VARIANT_TYPE_HANDLE : PGVariantType;
  begin
    G_VARIANT_TYPE_HANDLE:=PGVariantType('h');
  end;

{ was #define dname def_expr }
function G_VARIANT_TYPE_UNIT : PGVariantType;
  begin
    G_VARIANT_TYPE_UNIT:=PGVariantType('()');
  end;

{ was #define dname def_expr }
function G_VARIANT_TYPE_ANY : PGVariantType;
  begin
    G_VARIANT_TYPE_ANY:=PGVariantType('*');
  end;

{ was #define dname def_expr }
function G_VARIANT_TYPE_BASIC : PGVariantType;
  begin
    G_VARIANT_TYPE_BASIC:=PGVariantType('?');
  end;

{ was #define dname def_expr }
function G_VARIANT_TYPE_MAYBE : PGVariantType;
  begin
    G_VARIANT_TYPE_MAYBE:=PGVariantType('m*');
  end;

{ was #define dname def_expr }
function G_VARIANT_TYPE_ARRAY : PGVariantType;
  begin
    G_VARIANT_TYPE_ARRAY:=PGVariantType('a*');
  end;

{ was #define dname def_expr }
function G_VARIANT_TYPE_TUPLE : PGVariantType;
  begin
    G_VARIANT_TYPE_TUPLE:=PGVariantType('r');
  end;

{ was #define dname def_expr }
function G_VARIANT_TYPE_DICT_ENTRY : PGVariantType;
  begin
    G_VARIANT_TYPE_DICT_ENTRY:=PGVariantType('{?*}');
  end;

{ was #define dname def_expr }
function G_VARIANT_TYPE_DICTIONARY : PGVariantType;
  begin
    G_VARIANT_TYPE_DICTIONARY:=PGVariantType('a{?*}');
  end;

{ was #define dname def_expr }
function G_VARIANT_TYPE_STRING_ARRAY : PGVariantType;
  begin
    G_VARIANT_TYPE_STRING_ARRAY:=PGVariantType('as');
  end;

{ was #define dname def_expr }
function G_VARIANT_TYPE_OBJECT_PATH_ARRAY : PGVariantType;
  begin
    G_VARIANT_TYPE_OBJECT_PATH_ARRAY:=PGVariantType('ao');
  end;

{ was #define dname def_expr }
function G_VARIANT_TYPE_BYTESTRING : PGVariantType;
  begin
    G_VARIANT_TYPE_BYTESTRING:=PGVariantType('ay');
  end;

{ was #define dname def_expr }
function G_VARIANT_TYPE_BYTESTRING_ARRAY : PGVariantType;
  begin
    G_VARIANT_TYPE_BYTESTRING_ARRAY:=PGVariantType('aay');
  end;

{ was #define dname def_expr }
function G_VARIANT_TYPE_VARDICT : PGVariantType;
  begin
    G_VARIANT_TYPE_VARDICT:=PGVariantType('a{sv}');
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_VARIANT_TYPE(type_string : longint) : longint;
begin
  G_VARIANT_TYPE:=g_variant_type_checked_(type_string);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function G_VARIANT_TYPE(type_string : longint) : PGVariantType;
begin
  G_VARIANT_TYPE:=PGVariantType(type_string);
end;


end.
