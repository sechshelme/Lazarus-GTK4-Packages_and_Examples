
unit gcache;
interface

{
  Automatically converted by H2Pas 1.0.0 from gcache.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gcache.h
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
PGCache  = ^GCache;
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
{$ifndef __G_CACHE_H__}
{$define __G_CACHE_H__}
{$if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)}
{$error "Only <glib.h> can be included directly."}
{$endif}
{$include <glib/glist.h>}
{typedef struct _GCache       ; }
type

  TGCacheNewFunc = function (key:Tgpointer):Tgpointer;cdecl;

  TGCacheDupFunc = function (value:Tgpointer):Tgpointer;cdecl;

  TGCacheDestroyFunc = procedure (value:Tgpointer);cdecl;
{ Caches
  }

function g_cache_new(value_new_func:TGCacheNewFunc; value_destroy_func:TGCacheDestroyFunc; key_dup_func:TGCacheDupFunc; key_destroy_func:TGCacheDestroyFunc; hash_key_func:TGHashFunc; 
           hash_value_func:TGHashFunc; key_equal_func:TGEqualFunc):PGCache;cdecl;external;
procedure g_cache_destroy(cache:PGCache);cdecl;external;
function g_cache_insert(cache:PGCache; key:Tgpointer):Tgpointer;cdecl;external;
procedure g_cache_remove(cache:PGCache; value:Tgconstpointer);cdecl;external;
procedure g_cache_key_foreach(cache:PGCache; func:TGHFunc; user_data:Tgpointer);cdecl;external;
procedure g_cache_value_foreach(cache:PGCache; func:TGHFunc; user_data:Tgpointer);cdecl;external;
{$endif}
{ __G_CACHE_H__  }

implementation


end.
