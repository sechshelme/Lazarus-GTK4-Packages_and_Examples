
unit gvalue;
interface

{
  Automatically converted by H2Pas 1.0.0 from gvalue.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gvalue.h
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
PGValue  = ^GValue;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GObject - GLib Type, Object, Parameter and Signal Library
 * Copyright (C) 1997-1999, 2000-2001 Tim Janik and Red Hat, Inc.
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
 * You should have received a copy of the GNU Lesser General
 * Public License along with this library; if not, see <http://www.gnu.org/licenses/>.
 *
 * gvalue.h: generic GValue functions
  }
{$ifndef __G_VALUE_H__}
{$define __G_VALUE_H__}
{$if !defined (__GLIB_GOBJECT_H_INSIDE__) && !defined (GOBJECT_COMPILATION)}
{$error "Only <glib-object.h> can be included directly."}
{$endif}
{$include	<gobject/gtype.h>}
{ --- type macros ---  }
{*
 * G_TYPE_IS_VALUE:
 * @type: A #GType value.
 * 
 * Checks whether the passed in type ID can be used for g_value_init().
 *
 * That is, this macro checks whether this type provides an implementation
 * of the #GTypeValueTable functions required for a type to create a #GValue of.
 * 
 * Returns: Whether @type is suitable as a #GValue type.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function G_TYPE_IS_VALUE(_type : longint) : longint;

{*
 * G_IS_VALUE:
 * @value: A #GValue structure.
 * 
 * Checks if @value is a valid and initialized #GValue structure.
 *
 * Returns: %TRUE on success.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_VALUE(value : longint) : longint;

{*
 * G_VALUE_TYPE:
 * @value: A #GValue structure.
 *
 * Get the type identifier of @value.
 *
 * Returns: the #GType.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_VALUE_TYPE(value : longint) : longint;

{*
 * G_VALUE_TYPE_NAME:
 * @value: A #GValue structure.
 *
 * Gets the type name of @value.
 *
 * Returns: the type name.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_VALUE_TYPE_NAME(value : longint) : longint;

{*
 * G_VALUE_HOLDS:
 * @value: A #GValue structure.
 * @type: A #GType value.
 *
 * Checks if @value holds (or contains) a value of @type.
 * This macro will also check for @value != %NULL and issue a
 * warning if the check fails.
 *
 * Returns: %TRUE if @value holds the @type.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_VALUE_HOLDS(value,_type : longint) : longint;

{ --- typedefs & structures ---  }
{*
 * GValueTransform:
 * @src_value: Source value.
 * @dest_value: Target value.
 * 
 * The type of value transformation functions which can be registered with
 * g_value_register_transform_func().
 *
 * @dest_value will be initialized to the correct destination type.
  }
(* Const before type ignored *)
type

  TGValueTransform = procedure (src_value:PGValue; dest_value:PGValue);cdecl;
{*
 * GValue:
 * 
 * An opaque structure used to hold different types of values.
 *
 * The data within the structure has protected scope: it is accessible only
 * to functions within a #GTypeValueTable structure, or implementations of
 * the g_value_*() API. That is, code portions which implement new fundamental
 * types.
 *
 * #GValue users cannot make any assumptions about how data is stored
 * within the 2 element @data union, and the @g_type member should
 * only be accessed through the G_VALUE_TYPE() macro.
  }
{< private > }
{ public for GTypeValueTable methods  }
  PGValue = ^TGValue;
  TGValue = record
      g_type : TGType;cdecl;
      data : array[0..1] of record
          case longint of
            0 : ( v_int : Tgint );
            1 : ( v_uint : Tguint );
            2 : ( v_long : Tglong );
            3 : ( v_ulong : Tgulong );
            4 : ( v_int64 : Tgint64 );
            5 : ( v_uint64 : Tguint64 );
            6 : ( v_float : Tgfloat );
            7 : ( v_double : Tgdouble );
            8 : ( v_pointer : Tgpointer );
          end;
    end;

{ --- prototypes ---  }

function g_value_init(value:PGValue; g_type:TGType):PGValue;cdecl;external;
(* Const before type ignored *)
procedure g_value_copy(src_value:PGValue; dest_value:PGValue);cdecl;external;
function g_value_reset(value:PGValue):PGValue;cdecl;external;
procedure g_value_unset(value:PGValue);cdecl;external;
procedure g_value_set_instance(value:PGValue; instance:Tgpointer);cdecl;external;
procedure g_value_init_from_instance(value:PGValue; instance:Tgpointer);cdecl;external;
{ --- private ---  }
(* Const before type ignored *)
function g_value_fits_pointer(value:PGValue):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_value_peek_pointer(value:PGValue):Tgpointer;cdecl;external;
{ --- implementation details ---  }
function g_value_type_compatible(src_type:TGType; dest_type:TGType):Tgboolean;cdecl;external;
function g_value_type_transformable(src_type:TGType; dest_type:TGType):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_value_transform(src_value:PGValue; dest_value:PGValue):Tgboolean;cdecl;external;
procedure g_value_register_transform_func(src_type:TGType; dest_type:TGType; transform_func:TGValueTransform);cdecl;external;
{*
 * G_VALUE_NOCOPY_CONTENTS:
 *
 * If passed to G_VALUE_COLLECT(), allocated data won't be copied
 * but used verbatim. This does not affect ref-counted types like
 * objects. This does not affect usage of g_value_copy(), the data will
 * be copied if it is not ref-counted.
  }
const
  G_VALUE_NOCOPY_CONTENTS = 1 shl 27;  
{*
 * G_VALUE_INTERNED_STRING:
 *
 * For string values, indicates that the string contained is canonical and will
 * exist for the duration of the process. See g_value_set_interned_string().
 *
 * Since: 2.66
  }
  G_VALUE_INTERNED_STRING = 1 shl 28;  
{*
 * G_VALUE_INIT:
 *
 * A #GValue must be initialized before it can be used. This macro can
 * be used as initializer instead of an explicit ` 0 ` when declaring
 * a variable, but it cannot be assigned to a variable.
 *
 * |[<!-- language="C" -->
 *   GValue value = G_VALUE_INIT;
 * ]|
 *
 * Since: 2.30
  }
{#define G_VALUE_INIT   0,   0    }
{$endif}
{ __G_VALUE_H__  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_IS_VALUE(_type : longint) : longint;
begin
  G_TYPE_IS_VALUE:=g_type_check_is_value_type(_type);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_VALUE(value : longint) : longint;
begin
  G_IS_VALUE:=G_TYPE_CHECK_VALUE(value);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_VALUE_TYPE(value : longint) : longint;
begin
  G_VALUE_TYPE:=(PGValue(value))^.g_type;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_VALUE_TYPE_NAME(value : longint) : longint;
begin
  G_VALUE_TYPE_NAME:=g_type_name(G_VALUE_TYPE(value));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_VALUE_HOLDS(value,_type : longint) : longint;
begin
  G_VALUE_HOLDS:=G_TYPE_CHECK_VALUE_TYPE(value,_type);
end;


end.
