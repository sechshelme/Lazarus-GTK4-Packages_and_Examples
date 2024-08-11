
unit gcompletion;
interface

{
  Automatically converted by H2Pas 1.0.0 from gcompletion.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gcompletion.h
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
PGCompletion  = ^GCompletion;
PGCompletionFunc  = ^GCompletionFunc;
PGList  = ^GList;
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
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
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
{$ifndef __G_COMPLETION_H__}
{$define __G_COMPLETION_H__}
{$if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)}
{$error "Only <glib.h> can be included directly."}
{$endif}
{$include <glib/glist.h>}
type

  PGCompletionFunc = ^TGCompletionFunc;
  TGCompletionFunc = function (item:Tgpointer):Pgchar;cdecl;
{ GCompletion
  }
(* Const before type ignored *)
(* Const before type ignored *)

  TGCompletionStrncmpFunc = function (s1:Pgchar; s2:Pgchar; n:Tgsize):Tgint;cdecl;
  PGCompletion = ^TGCompletion;
  TGCompletion = record
      items : PGList;cdecl;
      func : TGCompletionFunc;
      prefix : Pgchar;
      cache : PGList;
      strncmp_func : TGCompletionStrncmpFunc;
    end;


function g_completion_new(func:TGCompletionFunc):PGCompletion;cdecl;external;
procedure g_completion_add_items(cmp:PGCompletion; items:PGList);cdecl;external;
procedure g_completion_remove_items(cmp:PGCompletion; items:PGList);cdecl;external;
procedure g_completion_clear_items(cmp:PGCompletion);cdecl;external;
(* Const before type ignored *)
function g_completion_complete(cmp:PGCompletion; prefix:Pgchar; new_prefix:PPgchar):PGList;cdecl;external;
(* Const before type ignored *)
function g_completion_complete_utf8(cmp:PGCompletion; prefix:Pgchar; new_prefix:PPgchar):PGList;cdecl;external;
procedure g_completion_set_compare(cmp:PGCompletion; strncmp_func:TGCompletionStrncmpFunc);cdecl;external;
procedure g_completion_free(cmp:PGCompletion);cdecl;external;
{$endif}
{ __G_COMPLETION_H__  }

implementation


end.
