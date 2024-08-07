
unit gthread;
interface

{
  Automatically converted by H2Pas 1.0.0 from gthread.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gthread.h
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
PGCond  = ^GCond;
PGError  = ^GError;
PGMutex  = ^GMutex;
PGPrivate  = ^GPrivate;
PGStaticMutex  = ^GStaticMutex;
PGThread  = ^GThread;
PGThreadFunctions  = ^GThreadFunctions;
PGThreadPriority  = ^GThreadPriority;
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
{$ifndef __G_DEPRECATED_THREAD_H__}
{$define __G_DEPRECATED_THREAD_H__}
{$if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)}
{$error "Only <glib.h> can be included directly."}
{$endif}
{$include <glib/gthread.h>}
type
  PGThreadPriority = ^TGThreadPriority;
  TGThreadPriority =  Longint;
  Const
    G_THREAD_PRIORITY_LOW = 0;
    G_THREAD_PRIORITY_NORMAL = 1;
    G_THREAD_PRIORITY_HIGH = 2;
    G_THREAD_PRIORITY_URGENT = 3;
;
{< private > }
type
  PGThread = ^TGThread;
  TGThread = record
      func : TGThreadFunc;
      data : Tgpointer;
      joinable : Tgboolean;
      priority : TGThreadPriority;
    end;

  PGThreadFunctions = ^TGThreadFunctions;
  TGThreadFunctions = record
      mutex_new : function :PGMutex;cdecl;
      mutex_lock : procedure (mutex:PGMutex);cdecl;
      mutex_trylock : function (mutex:PGMutex):Tgboolean;cdecl;
      mutex_unlock : procedure (mutex:PGMutex);cdecl;
      mutex_free : procedure (mutex:PGMutex);cdecl;
      cond_new : function :PGCond;cdecl;
      cond_signal : procedure (cond:PGCond);cdecl;
      cond_broadcast : procedure (cond:PGCond);cdecl;
      cond_wait : procedure (cond:PGCond; mutex:PGMutex);cdecl;
      cond_timed_wait : function (cond:PGCond; mutex:PGMutex; end_time:PGTimeVal):Tgboolean;cdecl;
      cond_free : procedure (cond:PGCond);cdecl;
      private_new : function (destructor:TGDestroyNotify):PGPrivate;cdecl;
      private_get : function (private_key:PGPrivate):Tgpointer;cdecl;
      private_set : procedure (private_key:PGPrivate; data:Tgpointer);cdecl;
      thread_create : procedure (func:TGThreadFunc; data:Tgpointer; stack_size:Tgulong; joinable:Tgboolean; bound:Tgboolean; 
                    priority:TGThreadPriority; thread:Tgpointer; error:PPGError);cdecl;
      thread_yield : procedure ;cdecl;
      thread_join : procedure (thread:Tgpointer);cdecl;
      thread_exit : procedure ;cdecl;
      thread_set_priority : procedure (thread:Tgpointer; priority:TGThreadPriority);cdecl;
      thread_self : procedure (thread:Tgpointer);cdecl;
      thread_equal : function (thread1:Tgpointer; thread2:Tgpointer):Tgboolean;cdecl;
    end;

  var
    g_thread_functions_for_glib_use : TGThreadFunctions;cvar;public;
    g_thread_use_default_impl : Tgboolean;cvar;public;
    g_thread_gettime : function :Tguint64;cvar;public;

function g_thread_create(func:TGThreadFunc; data:Tgpointer; joinable:Tgboolean; error:PPGError):PGThread;cdecl;external;
function g_thread_create_full(func:TGThreadFunc; data:Tgpointer; stack_size:Tgulong; joinable:Tgboolean; bound:Tgboolean; 
           priority:TGThreadPriority; error:PPGError):PGThread;cdecl;external;
procedure g_thread_set_priority(thread:PGThread; priority:TGThreadPriority);cdecl;external;
procedure g_thread_foreach(thread_func:TGFunc; user_data:Tgpointer);cdecl;external;
{$ifndef G_OS_WIN32}
{$include <sys/types.h>}
{$include <pthread.h>}
{$endif}
{$ifndef __GI_SCANNER__}
{$ifndef G_OS_WIN32}
{ only for ABI compatibility reasons  }
{$endif}
{ !G_OS_WIN32  }
{$endif}
{ !__GI_SCANNER__  }
type
  PGStaticMutex = ^TGStaticMutex;
  TGStaticMutex = record
      mutex : PGMutex;
      unused : Tpthread_mutex_t;
    end;

procedure g_static_mutex_init(mutex:PGStaticMutex);cdecl;external;
procedure g_static_mutex_free(mutex:PGStaticMutex);cdecl;external;
function g_static_mutex_get_mutex_impl(mutex:PGStaticMutex):PGMutex;cdecl;external;
type
{< private > }
{< private > }
(* error 


implementation


end.
