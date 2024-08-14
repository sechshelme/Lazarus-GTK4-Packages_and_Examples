
unit gparamspecs;
interface

{
  Automatically converted by H2Pas 1.0.0 from gparamspecs.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gparamspecs.h
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
PGFlagsClass  = ^GFlagsClass;
PGParamSpec  = ^GParamSpec;
PGParamSpecBoolean  = ^GParamSpecBoolean;
PGParamSpecBoxed  = ^GParamSpecBoxed;
PGParamSpecChar  = ^GParamSpecChar;
PGParamSpecDouble  = ^GParamSpecDouble;
PGParamSpecEnum  = ^GParamSpecEnum;
PGParamSpecFlags  = ^GParamSpecFlags;
PGParamSpecFloat  = ^GParamSpecFloat;
PGParamSpecGType  = ^GParamSpecGType;
PGParamSpecInt  = ^GParamSpecInt;
PGParamSpecInt64  = ^GParamSpecInt64;
PGParamSpecLong  = ^GParamSpecLong;
PGParamSpecObject  = ^GParamSpecObject;
PGParamSpecOverride  = ^GParamSpecOverride;
PGParamSpecParam  = ^GParamSpecParam;
PGParamSpecPointer  = ^GParamSpecPointer;
PGParamSpecString  = ^GParamSpecString;
PGParamSpecUChar  = ^GParamSpecUChar;
PGParamSpecUInt  = ^GParamSpecUInt;
PGParamSpecUInt64  = ^GParamSpecUInt64;
PGParamSpecULong  = ^GParamSpecULong;
PGParamSpecUnichar  = ^GParamSpecUnichar;
PGParamSpecValueArray  = ^GParamSpecValueArray;
PGParamSpecVariant  = ^GParamSpecVariant;
PGType  = ^GType;
PGVariant  = ^GVariant;
PGVariantType  = ^GVariantType;
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
 * gparamspecs.h: GLib default param specs
  }
{$ifndef __G_PARAMSPECS_H__}
{$define __G_PARAMSPECS_H__}
{$if !defined (__GLIB_GOBJECT_H_INSIDE__) && !defined (GOBJECT_COMPILATION)}
{$error "Only <glib-object.h> can be included directly."}
{$endif}
{$include        <gobject/gvalue.h>}
{$include        <gobject/genums.h>}
{$include        <gobject/gboxed.h>}
{$include        <gobject/gobject.h>}
{ --- type macros ---  }
{*
 * G_TYPE_PARAM_CHAR:
 * 
 * The #GType of #GParamSpecChar.
  }

{ was #define dname def_expr }
function G_TYPE_PARAM_CHAR : longint; { return type might be wrong }

{*
 * G_IS_PARAM_SPEC_CHAR:
 * @pspec: a valid #GParamSpec instance
 * 
 * Checks whether the given #GParamSpec is of type %G_TYPE_PARAM_CHAR.
 * 
 * Returns: %TRUE on success.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_PARAM_SPEC_CHAR(pspec : longint) : longint;

{*
 * G_PARAM_SPEC_CHAR:
 * @pspec: a valid #GParamSpec instance
 * 
 * Cast a #GParamSpec instance into a #GParamSpecChar.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PARAM_SPEC_CHAR(pspec : longint) : longint;

{*
 * G_TYPE_PARAM_UCHAR:
 * 
 * The #GType of #GParamSpecUChar.
  }
{ was #define dname def_expr }
function G_TYPE_PARAM_UCHAR : longint; { return type might be wrong }

{*
 * G_IS_PARAM_SPEC_UCHAR:
 * @pspec: a valid #GParamSpec instance
 * 
 * Checks whether the given #GParamSpec is of type %G_TYPE_PARAM_UCHAR.
 * 
 * Returns: %TRUE on success.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_PARAM_SPEC_UCHAR(pspec : longint) : longint;

{*
 * G_PARAM_SPEC_UCHAR:
 * @pspec: a valid #GParamSpec instance
 * 
 * Cast a #GParamSpec instance into a #GParamSpecUChar.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PARAM_SPEC_UCHAR(pspec : longint) : longint;

{*
 * G_TYPE_PARAM_BOOLEAN:
 * 
 * The #GType of #GParamSpecBoolean.
  }
{ was #define dname def_expr }
function G_TYPE_PARAM_BOOLEAN : longint; { return type might be wrong }

{*
 * G_IS_PARAM_SPEC_BOOLEAN:
 * @pspec: a valid #GParamSpec instance
 * 
 * Checks whether the given #GParamSpec is of type %G_TYPE_PARAM_BOOLEAN.
 * 
 * Returns: %TRUE on success.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_PARAM_SPEC_BOOLEAN(pspec : longint) : longint;

{*
 * G_PARAM_SPEC_BOOLEAN:
 * @pspec: a valid #GParamSpec instance
 * 
 * Cast a #GParamSpec instance into a #GParamSpecBoolean.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PARAM_SPEC_BOOLEAN(pspec : longint) : longint;

{*
 * G_TYPE_PARAM_INT:
 * 
 * The #GType of #GParamSpecInt.
  }
{ was #define dname def_expr }
function G_TYPE_PARAM_INT : longint; { return type might be wrong }

{*
 * G_IS_PARAM_SPEC_INT:
 * @pspec: a valid #GParamSpec instance
 * 
 * Checks whether the given #GParamSpec is of type %G_TYPE_PARAM_INT.
 * 
 * Returns: %TRUE on success.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_PARAM_SPEC_INT(pspec : longint) : longint;

{*
 * G_PARAM_SPEC_INT:
 * @pspec: a valid #GParamSpec instance
 * 
 * Cast a #GParamSpec instance into a #GParamSpecInt.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PARAM_SPEC_INT(pspec : longint) : longint;

{*
 * G_TYPE_PARAM_UINT:
 * 
 * The #GType of #GParamSpecUInt.
  }
{ was #define dname def_expr }
function G_TYPE_PARAM_UINT : longint; { return type might be wrong }

{*
 * G_IS_PARAM_SPEC_UINT:
 * @pspec: a valid #GParamSpec instance
 * 
 * Checks whether the given #GParamSpec is of type %G_TYPE_PARAM_UINT.
 * 
 * Returns: %TRUE on success.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_PARAM_SPEC_UINT(pspec : longint) : longint;

{*
 * G_PARAM_SPEC_UINT:
 * @pspec: a valid #GParamSpec instance
 * 
 * Cast a #GParamSpec instance into a #GParamSpecUInt.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PARAM_SPEC_UINT(pspec : longint) : longint;

{*
 * G_TYPE_PARAM_LONG:
 * 
 * The #GType of #GParamSpecLong.
  }
{ was #define dname def_expr }
function G_TYPE_PARAM_LONG : longint; { return type might be wrong }

{*
 * G_IS_PARAM_SPEC_LONG:
 * @pspec: a valid #GParamSpec instance
 * 
 * Checks whether the given #GParamSpec is of type %G_TYPE_PARAM_LONG.
 * 
 * Returns: %TRUE on success.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_PARAM_SPEC_LONG(pspec : longint) : longint;

{*
 * G_PARAM_SPEC_LONG:
 * @pspec: a valid #GParamSpec instance
 * 
 * Cast a #GParamSpec instance into a #GParamSpecLong.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PARAM_SPEC_LONG(pspec : longint) : longint;

{*
 * G_TYPE_PARAM_ULONG:
 * 
 * The #GType of #GParamSpecULong.
  }
{ was #define dname def_expr }
function G_TYPE_PARAM_ULONG : longint; { return type might be wrong }

{*
 * G_IS_PARAM_SPEC_ULONG:
 * @pspec: a valid #GParamSpec instance
 * 
 * Checks whether the given #GParamSpec is of type %G_TYPE_PARAM_ULONG.
 * 
 * Returns: %TRUE on success.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_PARAM_SPEC_ULONG(pspec : longint) : longint;

{*
 * G_PARAM_SPEC_ULONG:
 * @pspec: a valid #GParamSpec instance
 * 
 * Cast a #GParamSpec instance into a #GParamSpecULong.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PARAM_SPEC_ULONG(pspec : longint) : longint;

{*
 * G_TYPE_PARAM_INT64:
 * 
 * The #GType of #GParamSpecInt64.
  }
{ was #define dname def_expr }
function G_TYPE_PARAM_INT64 : longint; { return type might be wrong }

{*
 * G_IS_PARAM_SPEC_INT64:
 * @pspec: a valid #GParamSpec instance
 * 
 * Checks whether the given #GParamSpec is of type %G_TYPE_PARAM_INT64.
 *
 * Returns: %TRUE on success.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_PARAM_SPEC_INT64(pspec : longint) : longint;

{*
 * G_PARAM_SPEC_INT64:
 * @pspec: a valid #GParamSpec instance
 * 
 * Cast a #GParamSpec instance into a #GParamSpecInt64.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PARAM_SPEC_INT64(pspec : longint) : longint;

{*
 * G_TYPE_PARAM_UINT64:
 * 
 * The #GType of #GParamSpecUInt64.
  }
{ was #define dname def_expr }
function G_TYPE_PARAM_UINT64 : longint; { return type might be wrong }

{*
 * G_IS_PARAM_SPEC_UINT64:
 * @pspec: a valid #GParamSpec instance
 * 
 * Checks whether the given #GParamSpec is of type %G_TYPE_PARAM_UINT64.
 * 
 * Returns: %TRUE on success.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_PARAM_SPEC_UINT64(pspec : longint) : longint;

{*
 * G_PARAM_SPEC_UINT64:
 * @pspec: a valid #GParamSpec instance
 * 
 * Cast a #GParamSpec instance into a #GParamSpecUInt64.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PARAM_SPEC_UINT64(pspec : longint) : longint;

{*
 * G_TYPE_PARAM_UNICHAR:
 * 
 * The #GType of #GParamSpecUnichar.
  }
{ was #define dname def_expr }
function G_TYPE_PARAM_UNICHAR : longint; { return type might be wrong }

{*
 * G_PARAM_SPEC_UNICHAR:
 * @pspec: a valid #GParamSpec instance
 * 
 * Cast a #GParamSpec instance into a #GParamSpecUnichar.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PARAM_SPEC_UNICHAR(pspec : longint) : longint;

{*
 * G_IS_PARAM_SPEC_UNICHAR:
 * @pspec: a valid #GParamSpec instance
 * 
 * Checks whether the given #GParamSpec is of type %G_TYPE_PARAM_UNICHAR.
 * 
 * Returns: %TRUE on success.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_PARAM_SPEC_UNICHAR(pspec : longint) : longint;

{*
 * G_TYPE_PARAM_ENUM:
 * 
 * The #GType of #GParamSpecEnum.
  }
{ was #define dname def_expr }
function G_TYPE_PARAM_ENUM : longint; { return type might be wrong }

{*
 * G_IS_PARAM_SPEC_ENUM:
 * @pspec: a valid #GParamSpec instance
 * 
 * Checks whether the given #GParamSpec is of type %G_TYPE_PARAM_ENUM.
 * 
 * Returns: %TRUE on success.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_PARAM_SPEC_ENUM(pspec : longint) : longint;

{*
 * G_PARAM_SPEC_ENUM:
 * @pspec: a valid #GParamSpec instance
 * 
 * Cast a #GParamSpec instance into a #GParamSpecEnum.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PARAM_SPEC_ENUM(pspec : longint) : longint;

{*
 * G_TYPE_PARAM_FLAGS:
 * 
 * The #GType of #GParamSpecFlags.
  }
{ was #define dname def_expr }
function G_TYPE_PARAM_FLAGS : longint; { return type might be wrong }

{*
 * G_IS_PARAM_SPEC_FLAGS:
 * @pspec: a valid #GParamSpec instance
 * 
 * Checks whether the given #GParamSpec is of type %G_TYPE_PARAM_FLAGS.
 * 
 * Returns: %TRUE on success.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_PARAM_SPEC_FLAGS(pspec : longint) : longint;

{*
 * G_PARAM_SPEC_FLAGS:
 * @pspec: a valid #GParamSpec instance
 * 
 * Cast a #GParamSpec instance into a #GParamSpecFlags.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PARAM_SPEC_FLAGS(pspec : longint) : longint;

{*
 * G_TYPE_PARAM_FLOAT:
 * 
 * The #GType of #GParamSpecFloat.
  }
{ was #define dname def_expr }
function G_TYPE_PARAM_FLOAT : longint; { return type might be wrong }

{*
 * G_IS_PARAM_SPEC_FLOAT:
 * @pspec: a valid #GParamSpec instance
 * 
 * Checks whether the given #GParamSpec is of type %G_TYPE_PARAM_FLOAT.
 * 
 * Returns: %TRUE on success.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_PARAM_SPEC_FLOAT(pspec : longint) : longint;

{*
 * G_PARAM_SPEC_FLOAT:
 * @pspec: a valid #GParamSpec instance
 * 
 * Cast a #GParamSpec instance into a #GParamSpecFloat.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PARAM_SPEC_FLOAT(pspec : longint) : longint;

{*
 * G_TYPE_PARAM_DOUBLE:
 * 
 * The #GType of #GParamSpecDouble.
  }
{ was #define dname def_expr }
function G_TYPE_PARAM_DOUBLE : longint; { return type might be wrong }

{*
 * G_IS_PARAM_SPEC_DOUBLE:
 * @pspec: a valid #GParamSpec instance
 * 
 * Checks whether the given #GParamSpec is of type %G_TYPE_PARAM_DOUBLE.
 * 
 * Returns: %TRUE on success.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_PARAM_SPEC_DOUBLE(pspec : longint) : longint;

{*
 * G_PARAM_SPEC_DOUBLE:
 * @pspec: a valid #GParamSpec instance
 * 
 * Cast a #GParamSpec instance into a #GParamSpecDouble.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PARAM_SPEC_DOUBLE(pspec : longint) : longint;

{*
 * G_TYPE_PARAM_STRING:
 * 
 * The #GType of #GParamSpecString.
  }
{ was #define dname def_expr }
function G_TYPE_PARAM_STRING : longint; { return type might be wrong }

{*
 * G_IS_PARAM_SPEC_STRING:
 * @pspec: a valid #GParamSpec instance
 * 
 * Checks whether the given #GParamSpec is of type %G_TYPE_PARAM_STRING.
 * 
 * Returns: %TRUE on success.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_PARAM_SPEC_STRING(pspec : longint) : longint;

{*
 * G_PARAM_SPEC_STRING:
 * @pspec: a valid #GParamSpec instance
 * 
 * Casts a #GParamSpec instance into a #GParamSpecString.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PARAM_SPEC_STRING(pspec : longint) : longint;

{*
 * G_TYPE_PARAM_PARAM:
 * 
 * The #GType of #GParamSpecParam.
  }
{ was #define dname def_expr }
function G_TYPE_PARAM_PARAM : longint; { return type might be wrong }

{*
 * G_IS_PARAM_SPEC_PARAM:
 * @pspec: a valid #GParamSpec instance
 * 
 * Checks whether the given #GParamSpec is of type %G_TYPE_PARAM_PARAM.
 * 
 * Returns: %TRUE on success.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_PARAM_SPEC_PARAM(pspec : longint) : longint;

{*
 * G_PARAM_SPEC_PARAM:
 * @pspec: a valid #GParamSpec instance
 * 
 * Casts a #GParamSpec instance into a #GParamSpecParam.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PARAM_SPEC_PARAM(pspec : longint) : longint;

{*
 * G_TYPE_PARAM_BOXED:
 * 
 * The #GType of #GParamSpecBoxed.
  }
{ was #define dname def_expr }
function G_TYPE_PARAM_BOXED : longint; { return type might be wrong }

{*
 * G_IS_PARAM_SPEC_BOXED:
 * @pspec: a valid #GParamSpec instance
 * 
 * Checks whether the given #GParamSpec is of type %G_TYPE_PARAM_BOXED.
 * 
 * Returns: %TRUE on success.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_PARAM_SPEC_BOXED(pspec : longint) : longint;

{*
 * G_PARAM_SPEC_BOXED:
 * @pspec: a valid #GParamSpec instance
 * 
 * Cast a #GParamSpec instance into a #GParamSpecBoxed.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PARAM_SPEC_BOXED(pspec : longint) : longint;

{*
 * G_TYPE_PARAM_POINTER:
 * 
 * The #GType of #GParamSpecPointer.
  }
{ was #define dname def_expr }
function G_TYPE_PARAM_POINTER : longint; { return type might be wrong }

{*
 * G_IS_PARAM_SPEC_POINTER:
 * @pspec: a valid #GParamSpec instance
 * 
 * Checks whether the given #GParamSpec is of type %G_TYPE_PARAM_POINTER.
 * 
 * Returns: %TRUE on success.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_PARAM_SPEC_POINTER(pspec : longint) : longint;

{*
 * G_PARAM_SPEC_POINTER:
 * @pspec: a valid #GParamSpec instance
 * 
 * Casts a #GParamSpec instance into a #GParamSpecPointer.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PARAM_SPEC_POINTER(pspec : longint) : longint;

{*
 * G_TYPE_PARAM_VALUE_ARRAY:
 * 
 * The #GType of #GParamSpecValueArray.
 *
 * Deprecated: 2.32: Use #GArray instead of #GValueArray
  }
{ was #define dname def_expr }
function G_TYPE_PARAM_VALUE_ARRAY : longint; { return type might be wrong }

{*
 * G_IS_PARAM_SPEC_VALUE_ARRAY:
 * @pspec: a valid #GParamSpec instance
 * 
 * Checks whether the given #GParamSpec is of type %G_TYPE_PARAM_VALUE_ARRAY.
 * 
 * Returns: %TRUE on success.
 *
 * Deprecated: 2.32: Use #GArray instead of #GValueArray
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_PARAM_SPEC_VALUE_ARRAY(pspec : longint) : longint;

{*
 * G_PARAM_SPEC_VALUE_ARRAY:
 * @pspec: a valid #GParamSpec instance
 * 
 * Cast a #GParamSpec instance into a #GParamSpecValueArray.
 *
 * Deprecated: 2.32: Use #GArray instead of #GValueArray
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PARAM_SPEC_VALUE_ARRAY(pspec : longint) : longint;

{*
 * G_TYPE_PARAM_OBJECT:
 * 
 * The #GType of #GParamSpecObject.
  }
{ was #define dname def_expr }
function G_TYPE_PARAM_OBJECT : longint; { return type might be wrong }

{*
 * G_IS_PARAM_SPEC_OBJECT:
 * @pspec: a valid #GParamSpec instance
 * 
 * Checks whether the given #GParamSpec is of type %G_TYPE_PARAM_OBJECT.
 * 
 * Returns: %TRUE on success.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_PARAM_SPEC_OBJECT(pspec : longint) : longint;

{*
 * G_PARAM_SPEC_OBJECT:
 * @pspec: a valid #GParamSpec instance
 * 
 * Casts a #GParamSpec instance into a #GParamSpecObject.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PARAM_SPEC_OBJECT(pspec : longint) : longint;

{*
 * G_TYPE_PARAM_OVERRIDE:
 * 
 * The #GType of #GParamSpecOverride.
 * 
 * Since: 2.4
  }
{ was #define dname def_expr }
function G_TYPE_PARAM_OVERRIDE : longint; { return type might be wrong }

{*
 * G_IS_PARAM_SPEC_OVERRIDE:
 * @pspec: a #GParamSpec
 * 
 * Checks whether the given #GParamSpec is of type %G_TYPE_PARAM_OVERRIDE.
 * 
 * Since: 2.4
 * Returns: %TRUE on success.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_PARAM_SPEC_OVERRIDE(pspec : longint) : longint;

{*
 * G_PARAM_SPEC_OVERRIDE:
 * @pspec: a #GParamSpec
 * 
 * Casts a #GParamSpec into a #GParamSpecOverride.
 * 
 * Since: 2.4
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PARAM_SPEC_OVERRIDE(pspec : longint) : longint;

{*
 * G_TYPE_PARAM_GTYPE:
 * 
 * The #GType of #GParamSpecGType.
 * 
 * Since: 2.10
  }
{ was #define dname def_expr }
function G_TYPE_PARAM_GTYPE : longint; { return type might be wrong }

{*
 * G_IS_PARAM_SPEC_GTYPE:
 * @pspec: a #GParamSpec
 * 
 * Checks whether the given #GParamSpec is of type %G_TYPE_PARAM_GTYPE.
 * 
 * Since: 2.10
 * Returns: %TRUE on success. 
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_PARAM_SPEC_GTYPE(pspec : longint) : longint;

{*
 * G_PARAM_SPEC_GTYPE:
 * @pspec: a #GParamSpec
 * 
 * Casts a #GParamSpec into a #GParamSpecGType.
 * 
 * Since: 2.10
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PARAM_SPEC_GTYPE(pspec : longint) : longint;

{*
 * G_TYPE_PARAM_VARIANT:
 *
 * The #GType of #GParamSpecVariant.
 *
 * Since: 2.26
  }
{ was #define dname def_expr }
function G_TYPE_PARAM_VARIANT : longint; { return type might be wrong }

{*
 * G_IS_PARAM_SPEC_VARIANT:
 * @pspec: a #GParamSpec
 *
 * Checks whether the given #GParamSpec is of type %G_TYPE_PARAM_VARIANT.
 *
 * Returns: %TRUE on success
 *
 * Since: 2.26
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_PARAM_SPEC_VARIANT(pspec : longint) : longint;

{*
 * G_PARAM_SPEC_VARIANT:
 * @pspec: a #GParamSpec
 *
 * Casts a #GParamSpec into a #GParamSpecVariant.
 *
 * Since: 2.26
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PARAM_SPEC_VARIANT(pspec : longint) : longint;

{ --- typedefs & structures ---  }
type
{*
 * GParamSpecChar:
 * @parent_instance: private #GParamSpec portion
 * @minimum: minimum value for the property specified
 * @maximum: maximum value for the property specified
 * @default_value: default value for the property specified
 * 
 * A #GParamSpec derived structure that contains the meta data for character properties.
  }
  PGParamSpecChar = ^TGParamSpecChar;
  TGParamSpecChar = record
      parent_instance : TGParamSpec;
      minimum : Tgint8;
      maximum : Tgint8;
      default_value : Tgint8;
    end;

{*
 * GParamSpecUChar:
 * @parent_instance: private #GParamSpec portion
 * @minimum: minimum value for the property specified
 * @maximum: maximum value for the property specified
 * @default_value: default value for the property specified
 * 
 * A #GParamSpec derived structure that contains the meta data for unsigned character properties.
  }
  PGParamSpecUChar = ^TGParamSpecUChar;
  TGParamSpecUChar = record
      parent_instance : TGParamSpec;
      minimum : Tguint8;
      maximum : Tguint8;
      default_value : Tguint8;
    end;

{*
 * GParamSpecBoolean:
 * @parent_instance: private #GParamSpec portion
 * @default_value: default value for the property specified
 * 
 * A #GParamSpec derived structure that contains the meta data for boolean properties.
  }
  PGParamSpecBoolean = ^TGParamSpecBoolean;
  TGParamSpecBoolean = record
      parent_instance : TGParamSpec;
      default_value : Tgboolean;
    end;

{*
 * GParamSpecInt:
 * @parent_instance: private #GParamSpec portion
 * @minimum: minimum value for the property specified
 * @maximum: maximum value for the property specified
 * @default_value: default value for the property specified
 * 
 * A #GParamSpec derived structure that contains the meta data for integer properties.
  }
  PGParamSpecInt = ^TGParamSpecInt;
  TGParamSpecInt = record
      parent_instance : TGParamSpec;
      minimum : Tgint;
      maximum : Tgint;
      default_value : Tgint;
    end;

{*
 * GParamSpecUInt:
 * @parent_instance: private #GParamSpec portion
 * @minimum: minimum value for the property specified
 * @maximum: maximum value for the property specified
 * @default_value: default value for the property specified
 * 
 * A #GParamSpec derived structure that contains the meta data for unsigned integer properties.
  }
  PGParamSpecUInt = ^TGParamSpecUInt;
  TGParamSpecUInt = record
      parent_instance : TGParamSpec;
      minimum : Tguint;
      maximum : Tguint;
      default_value : Tguint;
    end;

{*
 * GParamSpecLong:
 * @parent_instance: private #GParamSpec portion
 * @minimum: minimum value for the property specified
 * @maximum: maximum value for the property specified
 * @default_value: default value for the property specified
 * 
 * A #GParamSpec derived structure that contains the meta data for long integer properties.
  }
  PGParamSpecLong = ^TGParamSpecLong;
  TGParamSpecLong = record
      parent_instance : TGParamSpec;
      minimum : Tglong;
      maximum : Tglong;
      default_value : Tglong;
    end;

{*
 * GParamSpecULong:
 * @parent_instance: private #GParamSpec portion
 * @minimum: minimum value for the property specified
 * @maximum: maximum value for the property specified
 * @default_value: default value for the property specified
 * 
 * A #GParamSpec derived structure that contains the meta data for unsigned long integer properties.
  }
  PGParamSpecULong = ^TGParamSpecULong;
  TGParamSpecULong = record
      parent_instance : TGParamSpec;
      minimum : Tgulong;
      maximum : Tgulong;
      default_value : Tgulong;
    end;

{*
 * GParamSpecInt64:
 * @parent_instance: private #GParamSpec portion
 * @minimum: minimum value for the property specified
 * @maximum: maximum value for the property specified
 * @default_value: default value for the property specified
 * 
 * A #GParamSpec derived structure that contains the meta data for 64bit integer properties.
  }
  PGParamSpecInt64 = ^TGParamSpecInt64;
  TGParamSpecInt64 = record
      parent_instance : TGParamSpec;
      minimum : Tgint64;
      maximum : Tgint64;
      default_value : Tgint64;
    end;

{*
 * GParamSpecUInt64:
 * @parent_instance: private #GParamSpec portion
 * @minimum: minimum value for the property specified
 * @maximum: maximum value for the property specified
 * @default_value: default value for the property specified
 * 
 * A #GParamSpec derived structure that contains the meta data for unsigned 64bit integer properties.
  }
  PGParamSpecUInt64 = ^TGParamSpecUInt64;
  TGParamSpecUInt64 = record
      parent_instance : TGParamSpec;
      minimum : Tguint64;
      maximum : Tguint64;
      default_value : Tguint64;
    end;

{*
 * GParamSpecUnichar:
 * @parent_instance: private #GParamSpec portion
 * @default_value: default value for the property specified
 * 
 * A #GParamSpec derived structure that contains the meta data for unichar (unsigned integer) properties.
  }
  PGParamSpecUnichar = ^TGParamSpecUnichar;
  TGParamSpecUnichar = record
      parent_instance : TGParamSpec;
      default_value : Tgunichar;
    end;

{*
 * GParamSpecEnum:
 * @parent_instance: private #GParamSpec portion
 * @enum_class: the #GEnumClass for the enum
 * @default_value: default value for the property specified
 * 
 * A #GParamSpec derived structure that contains the meta data for enum 
 * properties.
  }
  PGParamSpecEnum = ^TGParamSpecEnum;
  TGParamSpecEnum = record
      parent_instance : TGParamSpec;
      enum_class : PGEnumClass;
      default_value : Tgint;
    end;

{*
 * GParamSpecFlags:
 * @parent_instance: private #GParamSpec portion
 * @flags_class: the #GFlagsClass for the flags
 * @default_value: default value for the property specified
 * 
 * A #GParamSpec derived structure that contains the meta data for flags
 * properties.
  }
  PGParamSpecFlags = ^TGParamSpecFlags;
  TGParamSpecFlags = record
      parent_instance : TGParamSpec;
      flags_class : PGFlagsClass;
      default_value : Tguint;
    end;

{*
 * GParamSpecFloat:
 * @parent_instance: private #GParamSpec portion
 * @minimum: minimum value for the property specified
 * @maximum: maximum value for the property specified
 * @default_value: default value for the property specified
 * @epsilon: values closer than @epsilon will be considered identical
 *  by g_param_values_cmp(); the default value is 1e-30.
 * 
 * A #GParamSpec derived structure that contains the meta data for float properties.
  }
  PGParamSpecFloat = ^TGParamSpecFloat;
  TGParamSpecFloat = record
      parent_instance : TGParamSpec;
      minimum : Tgfloat;
      maximum : Tgfloat;
      default_value : Tgfloat;
      epsilon : Tgfloat;
    end;

{*
 * GParamSpecDouble:
 * @parent_instance: private #GParamSpec portion
 * @minimum: minimum value for the property specified
 * @maximum: maximum value for the property specified
 * @default_value: default value for the property specified
 * @epsilon: values closer than @epsilon will be considered identical
 *  by g_param_values_cmp(); the default value is 1e-90.
 * 
 * A #GParamSpec derived structure that contains the meta data for double properties.
  }
  PGParamSpecDouble = ^TGParamSpecDouble;
  TGParamSpecDouble = record
      parent_instance : TGParamSpec;
      minimum : Tgdouble;
      maximum : Tgdouble;
      default_value : Tgdouble;
      epsilon : Tgdouble;
    end;

{*
 * GParamSpecString:
 * @parent_instance: private #GParamSpec portion
 * @default_value: default value for the property specified
 * @cset_first: a string containing the allowed values for the first byte
 * @cset_nth: a string containing the allowed values for the subsequent bytes
 * @substitutor: the replacement byte for bytes which don't match @cset_first or @cset_nth.
 * @null_fold_if_empty: replace empty string by %NULL
 * @ensure_non_null: replace %NULL strings by an empty string
 * 
 * A #GParamSpec derived structure that contains the meta data for string
 * properties.
  }
  PGParamSpecString = ^TGParamSpecString;
  TGParamSpecString = record
      parent_instance : TGParamSpec;
      default_value : Pgchar;
      cset_first : Pgchar;
      cset_nth : Pgchar;
      substitutor : Tgchar;
      flag0 : word;
    end;


const
  bm_TGParamSpecString_null_fold_if_empty = $1;
  bp_TGParamSpecString_null_fold_if_empty = 0;
  bm_TGParamSpecString_ensure_non_null = $2;
  bp_TGParamSpecString_ensure_non_null = 1;

function null_fold_if_empty(var a : TGParamSpecString) : Tguint;
procedure set_null_fold_if_empty(var a : TGParamSpecString; __null_fold_if_empty : Tguint);
function ensure_non_null(var a : TGParamSpecString) : Tguint;
procedure set_ensure_non_null(var a : TGParamSpecString; __ensure_non_null : Tguint);
{*
 * GParamSpecParam:
 * @parent_instance: private #GParamSpec portion
 * 
 * A #GParamSpec derived structure that contains the meta data for %G_TYPE_PARAM
 * properties.
  }
type
  PGParamSpecParam = ^TGParamSpecParam;
  TGParamSpecParam = record
      parent_instance : TGParamSpec;
    end;

{*
 * GParamSpecBoxed:
 * @parent_instance: private #GParamSpec portion
 * 
 * A #GParamSpec derived structure that contains the meta data for boxed properties.
  }
  PGParamSpecBoxed = ^TGParamSpecBoxed;
  TGParamSpecBoxed = record
      parent_instance : TGParamSpec;
    end;

{*
 * GParamSpecPointer:
 * @parent_instance: private #GParamSpec portion
 * 
 * A #GParamSpec derived structure that contains the meta data for pointer properties.
  }
  PGParamSpecPointer = ^TGParamSpecPointer;
  TGParamSpecPointer = record
      parent_instance : TGParamSpec;
    end;

{*
 * GParamSpecValueArray:
 * @parent_instance: private #GParamSpec portion
 * @element_spec: a #GParamSpec describing the elements contained in arrays of this property, may be %NULL
 * @fixed_n_elements: if greater than 0, arrays of this property will always have this many elements
 * 
 * A #GParamSpec derived structure that contains the meta data for #GValueArray properties.
  }
  PGParamSpecValueArray = ^TGParamSpecValueArray;
  TGParamSpecValueArray = record
      parent_instance : TGParamSpec;
      element_spec : PGParamSpec;
      fixed_n_elements : Tguint;
    end;

{*
 * GParamSpecObject:
 * @parent_instance: private #GParamSpec portion
 * 
 * A #GParamSpec derived structure that contains the meta data for object properties.
  }
  PGParamSpecObject = ^TGParamSpecObject;
  TGParamSpecObject = record
      parent_instance : TGParamSpec;
    end;

{*
 * GParamSpecOverride:
 *
 * A #GParamSpec derived structure that redirects operations to
 * other types of #GParamSpec.
 * 
 * All operations other than getting or setting the value are redirected,
 * including accessing the nick and blurb, validating a value, and so
 * forth.
 *
 * See g_param_spec_get_redirect_target() for retrieving the overridden
 * property. #GParamSpecOverride is used in implementing
 * g_object_class_override_property(), and will not be directly useful
 * unless you are implementing a new base type similar to GObject.
 * 
 * Since: 2.4
  }
{< private > }
  PGParamSpecOverride = ^TGParamSpecOverride;
  TGParamSpecOverride = record
      parent_instance : TGParamSpec;
      overridden : PGParamSpec;
    end;

{*
 * GParamSpecGType:
 * @parent_instance: private #GParamSpec portion
 * @is_a_type: a #GType whose subtypes can occur as values
 * 
 * A #GParamSpec derived structure that contains the meta data for #GType properties.
 * 
 * Since: 2.10
  }
  PGParamSpecGType = ^TGParamSpecGType;
  TGParamSpecGType = record
      parent_instance : TGParamSpec;
      is_a_type : TGType;
    end;

{*
 * GParamSpecVariant:
 * @parent_instance: private #GParamSpec portion
 * @type: a #GVariantType, or %NULL
 * @default_value: a #GVariant, or %NULL
 *
 * A #GParamSpec derived structure that contains the meta data for #GVariant properties.
 *
 * When comparing values with g_param_values_cmp(), scalar values with the same
 * type will be compared with g_variant_compare(). Other non-%NULL variants will
 * be checked for equality with g_variant_equal(), and their sort order is
 * otherwise undefined. %NULL is ordered before non-%NULL variants. Two %NULL
 * values compare equal.
 *
 * Since: 2.26
  }
{< private > }
  PGParamSpecVariant = ^TGParamSpecVariant;
  TGParamSpecVariant = record
      parent_instance : TGParamSpec;
      _type : PGVariantType;
      default_value : PGVariant;
      padding : array[0..3] of Tgpointer;
    end;

{ --- GParamSpec prototypes ---  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

function g_param_spec_char(name:Pgchar; nick:Pgchar; blurb:Pgchar; minimum:Tgint8; maximum:Tgint8; 
           default_value:Tgint8; flags:TGParamFlags):PGParamSpec;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function g_param_spec_uchar(name:Pgchar; nick:Pgchar; blurb:Pgchar; minimum:Tguint8; maximum:Tguint8; 
           default_value:Tguint8; flags:TGParamFlags):PGParamSpec;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function g_param_spec_boolean(name:Pgchar; nick:Pgchar; blurb:Pgchar; default_value:Tgboolean; flags:TGParamFlags):PGParamSpec;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function g_param_spec_int(name:Pgchar; nick:Pgchar; blurb:Pgchar; minimum:Tgint; maximum:Tgint; 
           default_value:Tgint; flags:TGParamFlags):PGParamSpec;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function g_param_spec_uint(name:Pgchar; nick:Pgchar; blurb:Pgchar; minimum:Tguint; maximum:Tguint; 
           default_value:Tguint; flags:TGParamFlags):PGParamSpec;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function g_param_spec_long(name:Pgchar; nick:Pgchar; blurb:Pgchar; minimum:Tglong; maximum:Tglong; 
           default_value:Tglong; flags:TGParamFlags):PGParamSpec;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function g_param_spec_ulong(name:Pgchar; nick:Pgchar; blurb:Pgchar; minimum:Tgulong; maximum:Tgulong; 
           default_value:Tgulong; flags:TGParamFlags):PGParamSpec;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function g_param_spec_int64(name:Pgchar; nick:Pgchar; blurb:Pgchar; minimum:Tgint64; maximum:Tgint64; 
           default_value:Tgint64; flags:TGParamFlags):PGParamSpec;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function g_param_spec_uint64(name:Pgchar; nick:Pgchar; blurb:Pgchar; minimum:Tguint64; maximum:Tguint64; 
           default_value:Tguint64; flags:TGParamFlags):PGParamSpec;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function g_param_spec_unichar(name:Pgchar; nick:Pgchar; blurb:Pgchar; default_value:Tgunichar; flags:TGParamFlags):PGParamSpec;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function g_param_spec_enum(name:Pgchar; nick:Pgchar; blurb:Pgchar; enum_type:TGType; default_value:Tgint; 
           flags:TGParamFlags):PGParamSpec;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function g_param_spec_flags(name:Pgchar; nick:Pgchar; blurb:Pgchar; flags_type:TGType; default_value:Tguint; 
           flags:TGParamFlags):PGParamSpec;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function g_param_spec_float(name:Pgchar; nick:Pgchar; blurb:Pgchar; minimum:Tgfloat; maximum:Tgfloat; 
           default_value:Tgfloat; flags:TGParamFlags):PGParamSpec;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function g_param_spec_double(name:Pgchar; nick:Pgchar; blurb:Pgchar; minimum:Tgdouble; maximum:Tgdouble; 
           default_value:Tgdouble; flags:TGParamFlags):PGParamSpec;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function g_param_spec_string(name:Pgchar; nick:Pgchar; blurb:Pgchar; default_value:Pgchar; flags:TGParamFlags):PGParamSpec;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function g_param_spec_param(name:Pgchar; nick:Pgchar; blurb:Pgchar; param_type:TGType; flags:TGParamFlags):PGParamSpec;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function g_param_spec_boxed(name:Pgchar; nick:Pgchar; blurb:Pgchar; boxed_type:TGType; flags:TGParamFlags):PGParamSpec;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function g_param_spec_pointer(name:Pgchar; nick:Pgchar; blurb:Pgchar; flags:TGParamFlags):PGParamSpec;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function g_param_spec_value_array(name:Pgchar; nick:Pgchar; blurb:Pgchar; element_spec:PGParamSpec; flags:TGParamFlags):PGParamSpec;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function g_param_spec_object(name:Pgchar; nick:Pgchar; blurb:Pgchar; object_type:TGType; flags:TGParamFlags):PGParamSpec;cdecl;external;
(* Const before type ignored *)
function g_param_spec_override(name:Pgchar; overridden:PGParamSpec):PGParamSpec;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function g_param_spec_gtype(name:Pgchar; nick:Pgchar; blurb:Pgchar; is_a_type:TGType; flags:TGParamFlags):PGParamSpec;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function g_param_spec_variant(name:Pgchar; nick:Pgchar; blurb:Pgchar; _type:PGVariantType; default_value:PGVariant; 
           flags:TGParamFlags):PGParamSpec;cdecl;external;
  var
    g_param_spec_types : PGType;cvar;public;
{$endif}
{ __G_PARAMSPECS_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_PARAM_CHAR : longint; { return type might be wrong }
  begin
    G_TYPE_PARAM_CHAR:=g_param_spec_types[0];
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_PARAM_SPEC_CHAR(pspec : longint) : longint;
begin
  G_IS_PARAM_SPEC_CHAR:=G_TYPE_CHECK_INSTANCE_TYPE(pspec,G_TYPE_PARAM_CHAR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PARAM_SPEC_CHAR(pspec : longint) : longint;
begin
  G_PARAM_SPEC_CHAR:=G_TYPE_CHECK_INSTANCE_CAST(pspec,G_TYPE_PARAM_CHAR,GParamSpecChar);
end;

{ was #define dname def_expr }
function G_TYPE_PARAM_UCHAR : longint; { return type might be wrong }
  begin
    G_TYPE_PARAM_UCHAR:=g_param_spec_types[1];
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_PARAM_SPEC_UCHAR(pspec : longint) : longint;
begin
  G_IS_PARAM_SPEC_UCHAR:=G_TYPE_CHECK_INSTANCE_TYPE(pspec,G_TYPE_PARAM_UCHAR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PARAM_SPEC_UCHAR(pspec : longint) : longint;
begin
  G_PARAM_SPEC_UCHAR:=G_TYPE_CHECK_INSTANCE_CAST(pspec,G_TYPE_PARAM_UCHAR,GParamSpecUChar);
end;

{ was #define dname def_expr }
function G_TYPE_PARAM_BOOLEAN : longint; { return type might be wrong }
  begin
    G_TYPE_PARAM_BOOLEAN:=g_param_spec_types[2];
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_PARAM_SPEC_BOOLEAN(pspec : longint) : longint;
begin
  G_IS_PARAM_SPEC_BOOLEAN:=G_TYPE_CHECK_INSTANCE_TYPE(pspec,G_TYPE_PARAM_BOOLEAN);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PARAM_SPEC_BOOLEAN(pspec : longint) : longint;
begin
  G_PARAM_SPEC_BOOLEAN:=G_TYPE_CHECK_INSTANCE_CAST(pspec,G_TYPE_PARAM_BOOLEAN,GParamSpecBoolean);
end;

{ was #define dname def_expr }
function G_TYPE_PARAM_INT : longint; { return type might be wrong }
  begin
    G_TYPE_PARAM_INT:=g_param_spec_types[3];
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_PARAM_SPEC_INT(pspec : longint) : longint;
begin
  G_IS_PARAM_SPEC_INT:=G_TYPE_CHECK_INSTANCE_TYPE(pspec,G_TYPE_PARAM_INT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PARAM_SPEC_INT(pspec : longint) : longint;
begin
  G_PARAM_SPEC_INT:=G_TYPE_CHECK_INSTANCE_CAST(pspec,G_TYPE_PARAM_INT,GParamSpecInt);
end;

{ was #define dname def_expr }
function G_TYPE_PARAM_UINT : longint; { return type might be wrong }
  begin
    G_TYPE_PARAM_UINT:=g_param_spec_types[4];
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_PARAM_SPEC_UINT(pspec : longint) : longint;
begin
  G_IS_PARAM_SPEC_UINT:=G_TYPE_CHECK_INSTANCE_TYPE(pspec,G_TYPE_PARAM_UINT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PARAM_SPEC_UINT(pspec : longint) : longint;
begin
  G_PARAM_SPEC_UINT:=G_TYPE_CHECK_INSTANCE_CAST(pspec,G_TYPE_PARAM_UINT,GParamSpecUInt);
end;

{ was #define dname def_expr }
function G_TYPE_PARAM_LONG : longint; { return type might be wrong }
  begin
    G_TYPE_PARAM_LONG:=g_param_spec_types[5];
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_PARAM_SPEC_LONG(pspec : longint) : longint;
begin
  G_IS_PARAM_SPEC_LONG:=G_TYPE_CHECK_INSTANCE_TYPE(pspec,G_TYPE_PARAM_LONG);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PARAM_SPEC_LONG(pspec : longint) : longint;
begin
  G_PARAM_SPEC_LONG:=G_TYPE_CHECK_INSTANCE_CAST(pspec,G_TYPE_PARAM_LONG,GParamSpecLong);
end;

{ was #define dname def_expr }
function G_TYPE_PARAM_ULONG : longint; { return type might be wrong }
  begin
    G_TYPE_PARAM_ULONG:=g_param_spec_types[6];
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_PARAM_SPEC_ULONG(pspec : longint) : longint;
begin
  G_IS_PARAM_SPEC_ULONG:=G_TYPE_CHECK_INSTANCE_TYPE(pspec,G_TYPE_PARAM_ULONG);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PARAM_SPEC_ULONG(pspec : longint) : longint;
begin
  G_PARAM_SPEC_ULONG:=G_TYPE_CHECK_INSTANCE_CAST(pspec,G_TYPE_PARAM_ULONG,GParamSpecULong);
end;

{ was #define dname def_expr }
function G_TYPE_PARAM_INT64 : longint; { return type might be wrong }
  begin
    G_TYPE_PARAM_INT64:=g_param_spec_types[7];
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_PARAM_SPEC_INT64(pspec : longint) : longint;
begin
  G_IS_PARAM_SPEC_INT64:=G_TYPE_CHECK_INSTANCE_TYPE(pspec,G_TYPE_PARAM_INT64);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PARAM_SPEC_INT64(pspec : longint) : longint;
begin
  G_PARAM_SPEC_INT64:=G_TYPE_CHECK_INSTANCE_CAST(pspec,G_TYPE_PARAM_INT64,GParamSpecInt64);
end;

{ was #define dname def_expr }
function G_TYPE_PARAM_UINT64 : longint; { return type might be wrong }
  begin
    G_TYPE_PARAM_UINT64:=g_param_spec_types[8];
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_PARAM_SPEC_UINT64(pspec : longint) : longint;
begin
  G_IS_PARAM_SPEC_UINT64:=G_TYPE_CHECK_INSTANCE_TYPE(pspec,G_TYPE_PARAM_UINT64);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PARAM_SPEC_UINT64(pspec : longint) : longint;
begin
  G_PARAM_SPEC_UINT64:=G_TYPE_CHECK_INSTANCE_CAST(pspec,G_TYPE_PARAM_UINT64,GParamSpecUInt64);
end;

{ was #define dname def_expr }
function G_TYPE_PARAM_UNICHAR : longint; { return type might be wrong }
  begin
    G_TYPE_PARAM_UNICHAR:=g_param_spec_types[9];
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PARAM_SPEC_UNICHAR(pspec : longint) : longint;
begin
  G_PARAM_SPEC_UNICHAR:=G_TYPE_CHECK_INSTANCE_CAST(pspec,G_TYPE_PARAM_UNICHAR,GParamSpecUnichar);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_PARAM_SPEC_UNICHAR(pspec : longint) : longint;
begin
  G_IS_PARAM_SPEC_UNICHAR:=G_TYPE_CHECK_INSTANCE_TYPE(pspec,G_TYPE_PARAM_UNICHAR);
end;

{ was #define dname def_expr }
function G_TYPE_PARAM_ENUM : longint; { return type might be wrong }
  begin
    G_TYPE_PARAM_ENUM:=g_param_spec_types[10];
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_PARAM_SPEC_ENUM(pspec : longint) : longint;
begin
  G_IS_PARAM_SPEC_ENUM:=G_TYPE_CHECK_INSTANCE_TYPE(pspec,G_TYPE_PARAM_ENUM);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PARAM_SPEC_ENUM(pspec : longint) : longint;
begin
  G_PARAM_SPEC_ENUM:=G_TYPE_CHECK_INSTANCE_CAST(pspec,G_TYPE_PARAM_ENUM,GParamSpecEnum);
end;

{ was #define dname def_expr }
function G_TYPE_PARAM_FLAGS : longint; { return type might be wrong }
  begin
    G_TYPE_PARAM_FLAGS:=g_param_spec_types[11];
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_PARAM_SPEC_FLAGS(pspec : longint) : longint;
begin
  G_IS_PARAM_SPEC_FLAGS:=G_TYPE_CHECK_INSTANCE_TYPE(pspec,G_TYPE_PARAM_FLAGS);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PARAM_SPEC_FLAGS(pspec : longint) : longint;
begin
  G_PARAM_SPEC_FLAGS:=G_TYPE_CHECK_INSTANCE_CAST(pspec,G_TYPE_PARAM_FLAGS,GParamSpecFlags);
end;

{ was #define dname def_expr }
function G_TYPE_PARAM_FLOAT : longint; { return type might be wrong }
  begin
    G_TYPE_PARAM_FLOAT:=g_param_spec_types[12];
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_PARAM_SPEC_FLOAT(pspec : longint) : longint;
begin
  G_IS_PARAM_SPEC_FLOAT:=G_TYPE_CHECK_INSTANCE_TYPE(pspec,G_TYPE_PARAM_FLOAT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PARAM_SPEC_FLOAT(pspec : longint) : longint;
begin
  G_PARAM_SPEC_FLOAT:=G_TYPE_CHECK_INSTANCE_CAST(pspec,G_TYPE_PARAM_FLOAT,GParamSpecFloat);
end;

{ was #define dname def_expr }
function G_TYPE_PARAM_DOUBLE : longint; { return type might be wrong }
  begin
    G_TYPE_PARAM_DOUBLE:=g_param_spec_types[13];
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_PARAM_SPEC_DOUBLE(pspec : longint) : longint;
begin
  G_IS_PARAM_SPEC_DOUBLE:=G_TYPE_CHECK_INSTANCE_TYPE(pspec,G_TYPE_PARAM_DOUBLE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PARAM_SPEC_DOUBLE(pspec : longint) : longint;
begin
  G_PARAM_SPEC_DOUBLE:=G_TYPE_CHECK_INSTANCE_CAST(pspec,G_TYPE_PARAM_DOUBLE,GParamSpecDouble);
end;

{ was #define dname def_expr }
function G_TYPE_PARAM_STRING : longint; { return type might be wrong }
  begin
    G_TYPE_PARAM_STRING:=g_param_spec_types[14];
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_PARAM_SPEC_STRING(pspec : longint) : longint;
begin
  G_IS_PARAM_SPEC_STRING:=G_TYPE_CHECK_INSTANCE_TYPE(pspec,G_TYPE_PARAM_STRING);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PARAM_SPEC_STRING(pspec : longint) : longint;
begin
  G_PARAM_SPEC_STRING:=G_TYPE_CHECK_INSTANCE_CAST(pspec,G_TYPE_PARAM_STRING,GParamSpecString);
end;

{ was #define dname def_expr }
function G_TYPE_PARAM_PARAM : longint; { return type might be wrong }
  begin
    G_TYPE_PARAM_PARAM:=g_param_spec_types[15];
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_PARAM_SPEC_PARAM(pspec : longint) : longint;
begin
  G_IS_PARAM_SPEC_PARAM:=G_TYPE_CHECK_INSTANCE_TYPE(pspec,G_TYPE_PARAM_PARAM);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PARAM_SPEC_PARAM(pspec : longint) : longint;
begin
  G_PARAM_SPEC_PARAM:=G_TYPE_CHECK_INSTANCE_CAST(pspec,G_TYPE_PARAM_PARAM,GParamSpecParam);
end;

{ was #define dname def_expr }
function G_TYPE_PARAM_BOXED : longint; { return type might be wrong }
  begin
    G_TYPE_PARAM_BOXED:=g_param_spec_types[16];
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_PARAM_SPEC_BOXED(pspec : longint) : longint;
begin
  G_IS_PARAM_SPEC_BOXED:=G_TYPE_CHECK_INSTANCE_TYPE(pspec,G_TYPE_PARAM_BOXED);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PARAM_SPEC_BOXED(pspec : longint) : longint;
begin
  G_PARAM_SPEC_BOXED:=G_TYPE_CHECK_INSTANCE_CAST(pspec,G_TYPE_PARAM_BOXED,GParamSpecBoxed);
end;

{ was #define dname def_expr }
function G_TYPE_PARAM_POINTER : longint; { return type might be wrong }
  begin
    G_TYPE_PARAM_POINTER:=g_param_spec_types[17];
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_PARAM_SPEC_POINTER(pspec : longint) : longint;
begin
  G_IS_PARAM_SPEC_POINTER:=G_TYPE_CHECK_INSTANCE_TYPE(pspec,G_TYPE_PARAM_POINTER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PARAM_SPEC_POINTER(pspec : longint) : longint;
begin
  G_PARAM_SPEC_POINTER:=G_TYPE_CHECK_INSTANCE_CAST(pspec,G_TYPE_PARAM_POINTER,GParamSpecPointer);
end;

{ was #define dname def_expr }
function G_TYPE_PARAM_VALUE_ARRAY : longint; { return type might be wrong }
  begin
    G_TYPE_PARAM_VALUE_ARRAY:=g_param_spec_types[18];
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_PARAM_SPEC_VALUE_ARRAY(pspec : longint) : longint;
begin
  G_IS_PARAM_SPEC_VALUE_ARRAY:=G_TYPE_CHECK_INSTANCE_TYPE(pspec,G_TYPE_PARAM_VALUE_ARRAY);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PARAM_SPEC_VALUE_ARRAY(pspec : longint) : longint;
begin
  G_PARAM_SPEC_VALUE_ARRAY:=G_TYPE_CHECK_INSTANCE_CAST(pspec,G_TYPE_PARAM_VALUE_ARRAY,GParamSpecValueArray);
end;

{ was #define dname def_expr }
function G_TYPE_PARAM_OBJECT : longint; { return type might be wrong }
  begin
    G_TYPE_PARAM_OBJECT:=g_param_spec_types[19];
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_PARAM_SPEC_OBJECT(pspec : longint) : longint;
begin
  G_IS_PARAM_SPEC_OBJECT:=G_TYPE_CHECK_INSTANCE_TYPE(pspec,G_TYPE_PARAM_OBJECT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PARAM_SPEC_OBJECT(pspec : longint) : longint;
begin
  G_PARAM_SPEC_OBJECT:=G_TYPE_CHECK_INSTANCE_CAST(pspec,G_TYPE_PARAM_OBJECT,GParamSpecObject);
end;

{ was #define dname def_expr }
function G_TYPE_PARAM_OVERRIDE : longint; { return type might be wrong }
  begin
    G_TYPE_PARAM_OVERRIDE:=g_param_spec_types[20];
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_PARAM_SPEC_OVERRIDE(pspec : longint) : longint;
begin
  G_IS_PARAM_SPEC_OVERRIDE:=G_TYPE_CHECK_INSTANCE_TYPE(pspec,G_TYPE_PARAM_OVERRIDE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PARAM_SPEC_OVERRIDE(pspec : longint) : longint;
begin
  G_PARAM_SPEC_OVERRIDE:=G_TYPE_CHECK_INSTANCE_CAST(pspec,G_TYPE_PARAM_OVERRIDE,GParamSpecOverride);
end;

{ was #define dname def_expr }
function G_TYPE_PARAM_GTYPE : longint; { return type might be wrong }
  begin
    G_TYPE_PARAM_GTYPE:=g_param_spec_types[21];
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_PARAM_SPEC_GTYPE(pspec : longint) : longint;
begin
  G_IS_PARAM_SPEC_GTYPE:=G_TYPE_CHECK_INSTANCE_TYPE(pspec,G_TYPE_PARAM_GTYPE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PARAM_SPEC_GTYPE(pspec : longint) : longint;
begin
  G_PARAM_SPEC_GTYPE:=G_TYPE_CHECK_INSTANCE_CAST(pspec,G_TYPE_PARAM_GTYPE,GParamSpecGType);
end;

{ was #define dname def_expr }
function G_TYPE_PARAM_VARIANT : longint; { return type might be wrong }
  begin
    G_TYPE_PARAM_VARIANT:=g_param_spec_types[22];
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_PARAM_SPEC_VARIANT(pspec : longint) : longint;
begin
  G_IS_PARAM_SPEC_VARIANT:=G_TYPE_CHECK_INSTANCE_TYPE(pspec,G_TYPE_PARAM_VARIANT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PARAM_SPEC_VARIANT(pspec : longint) : longint;
begin
  G_PARAM_SPEC_VARIANT:=G_TYPE_CHECK_INSTANCE_CAST(pspec,G_TYPE_PARAM_VARIANT,GParamSpecVariant);
end;

function null_fold_if_empty(var a : TGParamSpecString) : Tguint;
begin
  null_fold_if_empty:=(a.flag0 and bm_TGParamSpecString_null_fold_if_empty) shr bp_TGParamSpecString_null_fold_if_empty;
end;

procedure set_null_fold_if_empty(var a : TGParamSpecString; __null_fold_if_empty : Tguint);
begin
  a.flag0:=a.flag0 or ((__null_fold_if_empty shl bp_TGParamSpecString_null_fold_if_empty) and bm_TGParamSpecString_null_fold_if_empty);
end;

function ensure_non_null(var a : TGParamSpecString) : Tguint;
begin
  ensure_non_null:=(a.flag0 and bm_TGParamSpecString_ensure_non_null) shr bp_TGParamSpecString_ensure_non_null;
end;

procedure set_ensure_non_null(var a : TGParamSpecString; __ensure_non_null : Tguint);
begin
  a.flag0:=a.flag0 or ((__ensure_non_null shl bp_TGParamSpecString_ensure_non_null) and bm_TGParamSpecString_ensure_non_null);
end;


end.
