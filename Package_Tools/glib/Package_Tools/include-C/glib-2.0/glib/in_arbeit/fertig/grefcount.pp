
unit grefcount;
interface

{
  Automatically converted by H2Pas 1.0.0 from grefcount.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    grefcount.h
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
Pgatomicrefcount  = ^gatomicrefcount;
Pgrefcount  = ^grefcount;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ grefcount.h: Reference counting
 *
 * Copyright 2018  Emmanuele Bassi
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
{$ifndef __GREFCOUNT_H__}
{$define __GREFCOUNT_H__}
{$if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)}
{$error "Only <glib.h> can be included directly."}
{$endif}
{$include <glib/gatomic.h>}
{$include <glib/gtypes.h>}

procedure g_ref_count_init(rc:Pgrefcount);cdecl;external;
procedure g_ref_count_inc(rc:Pgrefcount);cdecl;external;
function g_ref_count_dec(rc:Pgrefcount):Tgboolean;cdecl;external;
function g_ref_count_compare(rc:Pgrefcount; val:Tgint):Tgboolean;cdecl;external;
procedure g_atomic_ref_count_init(arc:Pgatomicrefcount);cdecl;external;
procedure g_atomic_ref_count_inc(arc:Pgatomicrefcount);cdecl;external;
function g_atomic_ref_count_dec(arc:Pgatomicrefcount):Tgboolean;cdecl;external;
function g_atomic_ref_count_compare(arc:Pgatomicrefcount; val:Tgint):Tgboolean;cdecl;external;
{*
 * G_REF_COUNT_INIT:
 *
 * Evaluates to the initial reference count for `grefcount`.
 *
 * This macro is useful for initializing `grefcount` fields inside
 * structures, for instance:
 *
 * |[<!-- language="C" -->
 * typedef struct 
 *   grefcount ref_count;
 *   char *name;
 *   char *address;
 *  Person;
 *
 * static const Person default_person = 
 *   .ref_count = G_REF_COUNT_INIT,
 *   .name = "Default name",
 *   .address = "Default address",
 * ;
 * ]|
 *
 * Since: 2.78
  }
const
  G_REF_COUNT_INIT = -(1);  
{*
 * G_ATOMIC_REF_COUNT_INIT:
 *
 * Evaluates to the initial reference count for `gatomicrefcount`.
 *
 * This macro is useful for initializing `gatomicrefcount` fields inside
 * structures, for instance:
 *
 * |[<!-- language="C" -->
 * typedef struct 
 *   gatomicrefcount ref_count;
 *   char *name;
 *   char *address;
 *  Person;
 *
 * static const Person default_person = 
 *   .ref_count = G_ATOMIC_REF_COUNT_INIT,
 *   .name = "Default name",
 *   .address = "Default address",
 * ;
 * ]|
 *
 * Since: 2.78
  }
  G_ATOMIC_REF_COUNT_INIT = 1;  
{ On GCC we can use __extension__ to inline the API without using
 * ancillary functions; we only do this when disabling checks, as
 * it disables warnings when saturating the reference counters
  }
{$endif}
{ __GREFCOUNT_H__  }

implementation


end.
