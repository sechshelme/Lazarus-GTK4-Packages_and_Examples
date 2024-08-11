
unit grel;
interface

{
  Automatically converted by H2Pas 1.0.0 from grel.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    grel.h
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
PGRelation  = ^GRelation;
PGTuples  = ^GTuples;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GLIB - Library of useful routines for C programming
 * Copyright (C) 1995-1997  Peter Mattis, Spencer Kimball and Josh MacDonald
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
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  }
{
 * Modified by the GLib Team and others 1997-2000.  See the AUTHORS
 * file for a list of people on the GLib Team.  See the ChangeLog
 * files for a list of changes.  These files are distributed with
 * GLib at ftp://ftp.gtk.org/pub/gtk/.
  }
{$ifndef __G_REL_H__}
{$define __G_REL_H__}
{$if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)}
{$error "Only <glib.h> can be included directly."}
{$endif}
{$include <glib/gtypes.h>}
type
  PGTuples = ^TGTuples;
  TGTuples = record
      len : Tguint;
    end;


function g_relation_new(fields:Tgint):PGRelation;cdecl;external;
procedure g_relation_destroy(relation:PGRelation);cdecl;external;
procedure g_relation_index(relation:PGRelation; field:Tgint; hash_func:TGHashFunc; key_equal_func:TGEqualFunc);cdecl;external;
procedure g_relation_insert(relation:PGRelation; args:array of const);cdecl;external;
procedure g_relation_insert(relation:PGRelation);cdecl;external;
function g_relation_delete(relation:PGRelation; key:Tgconstpointer; field:Tgint):Tgint;cdecl;external;
function g_relation_select(relation:PGRelation; key:Tgconstpointer; field:Tgint):PGTuples;cdecl;external;
function g_relation_count(relation:PGRelation; key:Tgconstpointer; field:Tgint):Tgint;cdecl;external;
function g_relation_exists(relation:PGRelation; args:array of const):Tgboolean;cdecl;external;
function g_relation_exists(relation:PGRelation):Tgboolean;cdecl;external;
procedure g_relation_print(relation:PGRelation);cdecl;external;
procedure g_tuples_destroy(tuples:PGTuples);cdecl;external;
function g_tuples_index(tuples:PGTuples; index_:Tgint; field:Tgint):Tgpointer;cdecl;external;
{$endif}
{ __G_REL_H__  }

implementation


end.
