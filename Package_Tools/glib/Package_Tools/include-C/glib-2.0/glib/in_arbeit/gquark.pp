
unit gquark;
interface

{
  Automatically converted by H2Pas 1.0.0 from gquark.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gquark.h
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
PGQuark  = ^GQuark;
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
{$ifndef __G_QUARK_H__}
{$define __G_QUARK_H__}
{$if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)}
{$error "Only <glib.h> can be included directly."}
{$endif}
{$include <glib/gtypes.h>}
type
  PGQuark = ^TGQuark;
  TGQuark = Tguint32;
{ Quarks (string<->id association)
  }
(* Const before type ignored *)

function g_quark_try_string(_string:Pgchar):TGQuark;cdecl;external;
(* Const before type ignored *)
function g_quark_from_static_string(_string:Pgchar):TGQuark;cdecl;external;
(* Const before type ignored *)
function g_quark_from_string(_string:Pgchar):TGQuark;cdecl;external;
(* Const before type ignored *)
function g_quark_to_string(quark:TGQuark):Pgchar;cdecl;external;
{
#define G_DEFINE_QUARK(QN, q_n)                                         \
GQuark                                                                  \
q_n##_quark (void)                                                      \
                                                                       \
  static GQuark q;                                                      \
                                                                        \
  if G_UNLIKELY (q == 0)                                                \
    q = g_quark_from_static_string (#QN);                               \
                                                                        \
  return q;                                                             \

 }
(* Const before type ignored *)
(* Const before type ignored *)
function g_intern_string(_string:Pgchar):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_intern_static_string(_string:Pgchar):Pgchar;cdecl;external;
{$endif}
{ __G_QUARK_H__  }

implementation


end.
