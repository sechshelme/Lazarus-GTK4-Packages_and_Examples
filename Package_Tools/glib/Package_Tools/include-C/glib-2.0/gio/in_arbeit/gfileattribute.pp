
unit gfileattribute;
interface

{
  Automatically converted by H2Pas 1.0.0 from gfileattribute.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gfileattribute.h
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
Pchar  = ^char;
PGFileAttributeInfo  = ^GFileAttributeInfo;
PGFileAttributeInfoList  = ^GFileAttributeInfoList;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GIO - GLib Input, Output and Streaming Library
 *
 * Copyright (C) 2006-2007 Red Hat, Inc.
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
 * Author: Alexander Larsson <alexl@redhat.com>
  }
{$ifndef __G_FILE_ATTRIBUTE_H__}
{$define __G_FILE_ATTRIBUTE_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}
{*
 * GFileAttributeInfo:
 * @name: the name of the attribute.
 * @type: the #GFileAttributeType type of the attribute.
 * @flags: a set of #GFileAttributeInfoFlags.
 *
 * Information about a specific attribute.
 * }
type
  PGFileAttributeInfo = ^TGFileAttributeInfo;
  TGFileAttributeInfo = record
      name : Pchar;
      _type : TGFileAttributeType;
      flags : TGFileAttributeInfoFlags;
    end;

{*
 * GFileAttributeInfoList:
 * @infos: an array of #GFileAttributeInfos.
 * @n_infos: the number of values in the array.
 *
 * Acts as a lightweight registry for possible valid file attributes.
 * The registry stores Key-Value pair formats as #GFileAttributeInfos.
 * }
  PGFileAttributeInfoList = ^TGFileAttributeInfoList;
  TGFileAttributeInfoList = record
      infos : PGFileAttributeInfo;
      n_infos : longint;
    end;


{ was #define dname def_expr }
function G_TYPE_FILE_ATTRIBUTE_INFO_LIST : longint; { return type might be wrong }

function g_file_attribute_info_list_get_type:TGType;cdecl;external;
function g_file_attribute_info_list_new:PGFileAttributeInfoList;cdecl;external;
function g_file_attribute_info_list_ref(list:PGFileAttributeInfoList):PGFileAttributeInfoList;cdecl;external;
procedure g_file_attribute_info_list_unref(list:PGFileAttributeInfoList);cdecl;external;
function g_file_attribute_info_list_dup(list:PGFileAttributeInfoList):PGFileAttributeInfoList;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_file_attribute_info_list_lookup(list:PGFileAttributeInfoList; name:Pchar):PGFileAttributeInfo;cdecl;external;
(* Const before type ignored *)
procedure g_file_attribute_info_list_add(list:PGFileAttributeInfoList; name:Pchar; _type:TGFileAttributeType; flags:TGFileAttributeInfoFlags);cdecl;external;
{$endif}
{ __G_FILE_INFO_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_FILE_ATTRIBUTE_INFO_LIST : longint; { return type might be wrong }
  begin
    G_TYPE_FILE_ATTRIBUTE_INFO_LIST:=g_file_attribute_info_list_get_type;
  end;


end.
