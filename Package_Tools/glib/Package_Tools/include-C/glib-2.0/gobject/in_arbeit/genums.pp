
unit genums;
interface

{
  Automatically converted by H2Pas 1.0.0 from genums.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    genums.h
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
PGEnumClass  = ^GEnumClass;
PGEnumValue  = ^GEnumValue;
PGFlagsClass  = ^GFlagsClass;
PGFlagsValue  = ^GFlagsValue;
PGTypeInfo  = ^GTypeInfo;
PGValue  = ^GValue;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GObject - GLib Type, Object, Parameter and Signal Library
 * Copyright (C) 1998-1999, 2000-2001 Tim Janik and Red Hat, Inc.
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
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General
 * Public License along with this library; if not, see <http://www.gnu.org/licenses/>.
  }
{$ifndef __G_ENUMS_H__}
{$define __G_ENUMS_H__}
{$if !defined (__GLIB_GOBJECT_H_INSIDE__) && !defined (GOBJECT_COMPILATION)}
{$error "Only <glib-object.h> can be included directly."}
{$endif}
{$include <gobject/gtype.h>}
{ --- type macros ---  }
{*
 * G_TYPE_IS_ENUM:
 * @type: a #GType ID.
 * 
 * Checks whether @type "is a" %G_TYPE_ENUM.
 *
 * Returns: %TRUE if @type "is a" %G_TYPE_ENUM.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function G_TYPE_IS_ENUM(_type : longint) : longint;

{*
 * G_ENUM_CLASS:
 * @class: a valid #GEnumClass
 * 
 * Casts a derived #GEnumClass structure into a #GEnumClass structure.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_ENUM_CLASS(_class : longint) : longint;

{*
 * G_IS_ENUM_CLASS:
 * @class: a #GEnumClass
 * 
 * Checks whether @class "is a" valid #GEnumClass structure of type %G_TYPE_ENUM
 * or derived.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_ENUM_CLASS(_class : longint) : longint;

{*
 * G_ENUM_CLASS_TYPE:
 * @class: a #GEnumClass
 * 
 * Get the type identifier from a given #GEnumClass structure.
 *
 * Returns: the #GType
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_ENUM_CLASS_TYPE(_class : longint) : longint;

{*
 * G_ENUM_CLASS_TYPE_NAME:
 * @class: a #GEnumClass
 * 
 * Get the static type name from a given #GEnumClass structure.
 *
 * Returns: the type name.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_ENUM_CLASS_TYPE_NAME(_class : longint) : longint;

{*
 * G_TYPE_IS_FLAGS:
 * @type: a #GType ID.
 *
 * Checks whether @type "is a" %G_TYPE_FLAGS. 
 *
 * Returns: %TRUE if @type "is a" %G_TYPE_FLAGS.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_IS_FLAGS(_type : longint) : longint;

{*
 * G_FLAGS_CLASS:
 * @class: a valid #GFlagsClass
 * 
 * Casts a derived #GFlagsClass structure into a #GFlagsClass structure.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_FLAGS_CLASS(_class : longint) : longint;

{*
 * G_IS_FLAGS_CLASS:
 * @class: a #GFlagsClass
 * 
 * Checks whether @class "is a" valid #GFlagsClass structure of type %G_TYPE_FLAGS
 * or derived.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_FLAGS_CLASS(_class : longint) : longint;

{*
 * G_FLAGS_CLASS_TYPE:
 * @class: a #GFlagsClass
 * 
 * Get the type identifier from a given #GFlagsClass structure.
 *
 * Returns: the #GType
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_FLAGS_CLASS_TYPE(_class : longint) : longint;

{*
 * G_FLAGS_CLASS_TYPE_NAME:
 * @class: a #GFlagsClass
 * 
 * Get the static type name from a given #GFlagsClass structure.
 *
 * Returns: the type name.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_FLAGS_CLASS_TYPE_NAME(_class : longint) : longint;

{*
 * G_VALUE_HOLDS_ENUM:
 * @value: a valid #GValue structure
 * 
 * Checks whether the given #GValue can hold values derived from type %G_TYPE_ENUM.
 * 
 * Returns: %TRUE on success.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_VALUE_HOLDS_ENUM(value : longint) : longint;

{*
 * G_VALUE_HOLDS_FLAGS:
 * @value: a valid #GValue structure
 * 
 * Checks whether the given #GValue can hold values derived from type %G_TYPE_FLAGS.
 * 
 * Returns: %TRUE on success.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_VALUE_HOLDS_FLAGS(value : longint) : longint;

{ --- enum/flag values & classes ---  }
type
{*
 * GEnumClass:
 * @g_type_class: the parent class
 * @minimum: the smallest possible value.
 * @maximum: the largest possible value.
 * @n_values: the number of possible values.
 * @values: an array of #GEnumValue structs describing the 
 *  individual values.
 * 
 * The class of an enumeration type holds information about its 
 * possible values.
  }
{< public > }  PGEnumClass = ^TGEnumClass;
  TGEnumClass = record
      g_type_class : TGTypeClass;
      minimum : Tgint;
      maximum : Tgint;
      n_values : Tguint;
      values : PGEnumValue;
    end;

{*
 * GFlagsClass:
 * @g_type_class: the parent class
 * @mask: a mask covering all possible values.
 * @n_values: the number of possible values.
 * @values: an array of #GFlagsValue structs describing the 
 *  individual values.
 * 
 * The class of a flags type holds information about its 
 * possible values.
  }
{< public > }  PGFlagsClass = ^TGFlagsClass;
  TGFlagsClass = record
      g_type_class : TGTypeClass;
      mask : Tguint;
      n_values : Tguint;
      values : PGFlagsValue;
    end;

{*
 * GEnumValue:
 * @value: the enum value
 * @value_name: the name of the value
 * @value_nick: the nickname of the value
 * 
 * A structure which contains a single enum value, its name, and its
 * nickname.
  }
(* Const before type ignored *)
(* Const before type ignored *)
  PGEnumValue = ^TGEnumValue;
  TGEnumValue = record
      value : Tgint;
      value_name : Pgchar;
      value_nick : Pgchar;
    end;

{*
 * GFlagsValue:
 * @value: the flags value
 * @value_name: the name of the value
 * @value_nick: the nickname of the value
 * 
 * A structure which contains a single flags value, its name, and its
 * nickname.
  }
(* Const before type ignored *)
(* Const before type ignored *)
  PGFlagsValue = ^TGFlagsValue;
  TGFlagsValue = record
      value : Tguint;
      value_name : Pgchar;
      value_nick : Pgchar;
    end;

{ --- prototypes ---  }

function g_enum_get_value(enum_class:PGEnumClass; value:Tgint):PGEnumValue;cdecl;external;
(* Const before type ignored *)
function g_enum_get_value_by_name(enum_class:PGEnumClass; name:Pgchar):PGEnumValue;cdecl;external;
(* Const before type ignored *)
function g_enum_get_value_by_nick(enum_class:PGEnumClass; nick:Pgchar):PGEnumValue;cdecl;external;
function g_flags_get_first_value(flags_class:PGFlagsClass; value:Tguint):PGFlagsValue;cdecl;external;
(* Const before type ignored *)
function g_flags_get_value_by_name(flags_class:PGFlagsClass; name:Pgchar):PGFlagsValue;cdecl;external;
(* Const before type ignored *)
function g_flags_get_value_by_nick(flags_class:PGFlagsClass; nick:Pgchar):PGFlagsValue;cdecl;external;
function g_enum_to_string(g_enum_type:TGType; value:Tgint):Pgchar;cdecl;external;
function g_flags_to_string(flags_type:TGType; value:Tguint):Pgchar;cdecl;external;
procedure g_value_set_enum(value:PGValue; v_enum:Tgint);cdecl;external;
(* Const before type ignored *)
function g_value_get_enum(value:PGValue):Tgint;cdecl;external;
procedure g_value_set_flags(value:PGValue; v_flags:Tguint);cdecl;external;
(* Const before type ignored *)
function g_value_get_flags(value:PGValue):Tguint;cdecl;external;
{ --- registration functions ---  }
{ const_static_values is a NULL terminated array of enum/flags
 * values that is taken over!
  }
(* Const before type ignored *)
(* Const before type ignored *)
function g_enum_register_static(name:Pgchar; const_static_values:PGEnumValue):TGType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_flags_register_static(name:Pgchar; const_static_values:PGFlagsValue):TGType;cdecl;external;
{ functions to complete the type information
 * for enums/flags implemented by plugins
  }
(* Const before type ignored *)
procedure g_enum_complete_type_info(g_enum_type:TGType; info:PGTypeInfo; const_values:PGEnumValue);cdecl;external;
(* Const before type ignored *)
procedure g_flags_complete_type_info(g_flags_type:TGType; info:PGTypeInfo; const_values:PGFlagsValue);cdecl;external;
{  Macros  }
{*
 * G_DEFINE_ENUM_VALUE:
 * @EnumValue: an enumeration value
 * @EnumNick: a short string representing the enumeration value
 *
 * Defines an enumeration value, and maps it to a "nickname".
 *
 * This macro can only be used with G_DEFINE_ENUM_TYPE() and
 * G_DEFINE_FLAGS_TYPE().
 *
 * Since: 2.74
  }
{//#define G_DEFINE_ENUM_VALUE(EnumValue, EnumNick) \ }
{   EnumValue, #EnumValue, EnumNick  \ }
{  GOBJECT_AVAILABLE_MACRO_IN_2_74 }
{*
 * G_DEFINE_ENUM_TYPE:
 * @TypeName: the enumeration type, in `CamelCase`
 * @type_name: the enumeration type prefixed, in `snake_case`
 * @...: a list of enumeration values, defined using G_DEFINE_ENUM_VALUE()
 *
 * A convenience macro for defining enumeration types.
 *
 * This macro will generate a `*_get_type()` function for the
 * given @TypeName, using @type_name as the function prefix.
 *
 * |[<!-- language="C" -->
 * G_DEFINE_ENUM_TYPE (GtkOrientation, gtk_orientation,
 *   G_DEFINE_ENUM_VALUE (GTK_ORIENTATION_HORIZONTAL, "horizontal"),
 *   G_DEFINE_ENUM_VALUE (GTK_ORIENTATION_VERTICAL, "vertical"))
 * ]|
 *
 * For projects that have multiple enumeration types, or enumeration
 * types with many values, you should consider using glib-mkenums to
 * generate the type function.
 *
 * Since: 2.74
  }
{*
 * G_DEFINE_FLAGS_TYPE:
 * @TypeName: the enumeration type, in `CamelCase`
 * @type_name: the enumeration type prefixed, in `snake_case`
 * @...: a list of enumeration values, defined using G_DEFINE_ENUM_VALUE()
 *
 * A convenience macro for defining flag types.
 *
 * This macro will generate a `*_get_type()` function for the
 * given @TypeName, using @type_name as the function prefix.
 *
 * |[<!-- language="C" -->
 * G_DEFINE_FLAGS_TYPE (GSettingsBindFlags, g_settings_bind_flags,
 *   G_DEFINE_ENUM_VALUE (G_SETTINGS_BIND_DEFAULT, "default"),
 *   G_DEFINE_ENUM_VALUE (G_SETTINGS_BIND_GET, "get"),
 *   G_DEFINE_ENUM_VALUE (G_SETTINGS_BIND_SET, "set"),
 *   G_DEFINE_ENUM_VALUE (G_SETTINGS_BIND_NO_SENSITIVITY, "no-sensitivity"),
 *   G_DEFINE_ENUM_VALUE (G_SETTINGS_BIND_GET_NO_CHANGES, "get-no-changes"),
 *   G_DEFINE_ENUM_VALUE (G_SETTINGS_BIND_INVERT_BOOLEAN, "invert-boolean"))
 * ]|
 *
 * For projects that have multiple enumeration types, or enumeration
 * types with many values, you should consider using glib-mkenums to
 * generate the type function.
 *
 * Since: 2.74
  }
{$endif}
{ __G_ENUMS_H__  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_IS_ENUM(_type : longint) : longint;
begin
  G_TYPE_IS_ENUM:=(G_TYPE_FUNDAMENTAL(_type))=G_TYPE_ENUM;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_ENUM_CLASS(_class : longint) : longint;
begin
  G_ENUM_CLASS:=G_TYPE_CHECK_CLASS_CAST(_class,G_TYPE_ENUM,GEnumClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_ENUM_CLASS(_class : longint) : longint;
begin
  G_IS_ENUM_CLASS:=G_TYPE_CHECK_CLASS_TYPE(_class,G_TYPE_ENUM);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_ENUM_CLASS_TYPE(_class : longint) : longint;
begin
  G_ENUM_CLASS_TYPE:=G_TYPE_FROM_CLASS(_class);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_ENUM_CLASS_TYPE_NAME(_class : longint) : longint;
begin
  G_ENUM_CLASS_TYPE_NAME:=g_type_name(G_ENUM_CLASS_TYPE(_class));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_IS_FLAGS(_type : longint) : longint;
begin
  G_TYPE_IS_FLAGS:=(G_TYPE_FUNDAMENTAL(_type))=G_TYPE_FLAGS;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_FLAGS_CLASS(_class : longint) : longint;
begin
  G_FLAGS_CLASS:=G_TYPE_CHECK_CLASS_CAST(_class,G_TYPE_FLAGS,GFlagsClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_FLAGS_CLASS(_class : longint) : longint;
begin
  G_IS_FLAGS_CLASS:=G_TYPE_CHECK_CLASS_TYPE(_class,G_TYPE_FLAGS);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_FLAGS_CLASS_TYPE(_class : longint) : longint;
begin
  G_FLAGS_CLASS_TYPE:=G_TYPE_FROM_CLASS(_class);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_FLAGS_CLASS_TYPE_NAME(_class : longint) : longint;
begin
  G_FLAGS_CLASS_TYPE_NAME:=g_type_name(G_FLAGS_CLASS_TYPE(_class));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_VALUE_HOLDS_ENUM(value : longint) : longint;
begin
  G_VALUE_HOLDS_ENUM:=G_TYPE_CHECK_VALUE_TYPE(value,G_TYPE_ENUM);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_VALUE_HOLDS_FLAGS(value : longint) : longint;
begin
  G_VALUE_HOLDS_FLAGS:=G_TYPE_CHECK_VALUE_TYPE(value,G_TYPE_FLAGS);
end;


end.
