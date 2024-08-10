
unit gasyncqueue;
interface

{
  Automatically converted by H2Pas 1.0.0 from gasyncqueue.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gasyncqueue.h
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
PGAsyncQueue  = ^GAsyncQueue;
PGTimeVal  = ^GTimeVal;
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
{$ifndef __G_ASYNCQUEUE_H__}
{$define __G_ASYNCQUEUE_H__}
{$if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)}
{$error "Only <glib.h> can be included directly."}
{$endif}
{$include <glib/gthread.h>}
type

function g_async_queue_new:PGAsyncQueue;cdecl;external;
function g_async_queue_new_full(item_free_func:TGDestroyNotify):PGAsyncQueue;cdecl;external;
procedure g_async_queue_lock(queue:PGAsyncQueue);cdecl;external;
procedure g_async_queue_unlock(queue:PGAsyncQueue);cdecl;external;
function g_async_queue_ref(queue:PGAsyncQueue):PGAsyncQueue;cdecl;external;
procedure g_async_queue_unref(queue:PGAsyncQueue);cdecl;external;
procedure g_async_queue_ref_unlocked(queue:PGAsyncQueue);cdecl;external;
procedure g_async_queue_unref_and_unlock(queue:PGAsyncQueue);cdecl;external;
procedure g_async_queue_push(queue:PGAsyncQueue; data:Tgpointer);cdecl;external;
procedure g_async_queue_push_unlocked(queue:PGAsyncQueue; data:Tgpointer);cdecl;external;
procedure g_async_queue_push_sorted(queue:PGAsyncQueue; data:Tgpointer; func:TGCompareDataFunc; user_data:Tgpointer);cdecl;external;
procedure g_async_queue_push_sorted_unlocked(queue:PGAsyncQueue; data:Tgpointer; func:TGCompareDataFunc; user_data:Tgpointer);cdecl;external;
function g_async_queue_pop(queue:PGAsyncQueue):Tgpointer;cdecl;external;
function g_async_queue_pop_unlocked(queue:PGAsyncQueue):Tgpointer;cdecl;external;
function g_async_queue_try_pop(queue:PGAsyncQueue):Tgpointer;cdecl;external;
function g_async_queue_try_pop_unlocked(queue:PGAsyncQueue):Tgpointer;cdecl;external;
function g_async_queue_timeout_pop(queue:PGAsyncQueue; timeout:Tguint64):Tgpointer;cdecl;external;
function g_async_queue_timeout_pop_unlocked(queue:PGAsyncQueue; timeout:Tguint64):Tgpointer;cdecl;external;
function g_async_queue_length(queue:PGAsyncQueue):Tgint;cdecl;external;
function g_async_queue_length_unlocked(queue:PGAsyncQueue):Tgint;cdecl;external;
procedure g_async_queue_sort(queue:PGAsyncQueue; func:TGCompareDataFunc; user_data:Tgpointer);cdecl;external;
procedure g_async_queue_sort_unlocked(queue:PGAsyncQueue; func:TGCompareDataFunc; user_data:Tgpointer);cdecl;external;
function g_async_queue_remove(queue:PGAsyncQueue; item:Tgpointer):Tgboolean;cdecl;external;
function g_async_queue_remove_unlocked(queue:PGAsyncQueue; item:Tgpointer):Tgboolean;cdecl;external;
procedure g_async_queue_push_front(queue:PGAsyncQueue; item:Tgpointer);cdecl;external;
procedure g_async_queue_push_front_unlocked(queue:PGAsyncQueue; item:Tgpointer);cdecl;external;
function g_async_queue_timed_pop(queue:PGAsyncQueue; end_time:PGTimeVal):Tgpointer;cdecl;external;
function g_async_queue_timed_pop_unlocked(queue:PGAsyncQueue; end_time:PGTimeVal):Tgpointer;cdecl;external;
{$endif}
{ __G_ASYNCQUEUE_H__  }

implementation


end.
