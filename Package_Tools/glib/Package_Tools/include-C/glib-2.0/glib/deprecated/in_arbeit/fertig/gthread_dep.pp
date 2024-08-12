
unit gthread_dep;
interface

{
  Automatically converted by H2Pas 1.0.0 from gthread_dep.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gthread_dep.h
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
Pgsize  = ^gsize;
PGStaticMutex  = ^GStaticMutex;
PGStaticPrivate  = ^GStaticPrivate;
PGStaticRecMutex  = ^GStaticRecMutex;
PGStaticRWLock  = ^GStaticRWLock;
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

{typedef struct _GThreadFunctions; }
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
{#define g_static_mutex_get_mutex g_static_mutex_get_mutex_impl GLIB_DEPRECATED_MACRO_IN_2_32 }
{#ifndef G_OS_WIN32 }
{#define G_STATIC_MUTEX_INIT  NULL, PTHREAD_MUTEX_INITIALIZER  GLIB_DEPRECATED_MACRO_IN_2_32_FOR(g_mutex_init) }
{#else }
{#define G_STATIC_MUTEX_INIT  NULL  GLIB_DEPRECATED_MACRO_IN_2_32_FOR(g_mutex_init) }
{#endif }
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
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function g_static_mutex_lock(mutex : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_static_mutex_trylock(mutex : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_static_mutex_unlock(mutex : longint) : longint;

procedure g_static_mutex_init(mutex:PGStaticMutex);cdecl;external;
procedure g_static_mutex_free(mutex:PGStaticMutex);cdecl;external;
function g_static_mutex_get_mutex_impl(mutex:PGStaticMutex):PGMutex;cdecl;external;
type
{< private > }
{$ifndef __GI_SCANNER__}
{ ABI compat only  }
{$ifdef G_OS_WIN32}
{$else}
{$endif}
{ !G_OS_WIN32  }
{$endif}
{ !__GI_SCANNER__  }
type
  PGStaticRecMutex = ^TGStaticRecMutex;
  TGStaticRecMutex = record
      mutex : TGStaticMutex;
      depth : Tguint;
      unused : record
          case longint of
            0 : ( owner : pointer );
            1 : ( owner : Tpthread_t );
            2 : ( dummy : Tgdouble );
          end;
    end;

{#define G_STATIC_REC_MUTEX_INIT  G_STATIC_MUTEX_INIT, 0,  0   GLIB_DEPRECATED_MACRO_IN_2_32_FOR(g_rec_mutex_init) }

procedure g_static_rec_mutex_init(mutex:PGStaticRecMutex);cdecl;external;
procedure g_static_rec_mutex_lock(mutex:PGStaticRecMutex);cdecl;external;
function g_static_rec_mutex_trylock(mutex:PGStaticRecMutex):Tgboolean;cdecl;external;
procedure g_static_rec_mutex_unlock(mutex:PGStaticRecMutex);cdecl;external;
procedure g_static_rec_mutex_lock_full(mutex:PGStaticRecMutex; depth:Tguint);cdecl;external;
function g_static_rec_mutex_unlock_full(mutex:PGStaticRecMutex):Tguint;cdecl;external;
procedure g_static_rec_mutex_free(mutex:PGStaticRecMutex);cdecl;external;
type
{< private > }
  PGStaticRWLock = ^TGStaticRWLock;
  TGStaticRWLock = record
      mutex : TGStaticMutex;
      read_cond : PGCond;
      write_cond : PGCond;
      read_counter : Tguint;
      have_writer : Tgboolean;
      want_to_read : Tguint;
      want_to_write : Tguint;
    end;

{#define G_STATIC_RW_LOCK_INIT  G_STATIC_MUTEX_INIT, NULL, NULL, 0, FALSE, 0, 0  }

procedure g_static_rw_lock_init(lock:PGStaticRWLock);cdecl;external;
procedure g_static_rw_lock_reader_lock(lock:PGStaticRWLock);cdecl;external;
function g_static_rw_lock_reader_trylock(lock:PGStaticRWLock):Tgboolean;cdecl;external;
procedure g_static_rw_lock_reader_unlock(lock:PGStaticRWLock);cdecl;external;
procedure g_static_rw_lock_writer_lock(lock:PGStaticRWLock);cdecl;external;
function g_static_rw_lock_writer_trylock(lock:PGStaticRWLock):Tgboolean;cdecl;external;
procedure g_static_rw_lock_writer_unlock(lock:PGStaticRWLock);cdecl;external;
procedure g_static_rw_lock_free(lock:PGStaticRWLock);cdecl;external;
function g_private_new(notify:TGDestroyNotify):PGPrivate;cdecl;external;
type
{< private > }
  PGStaticPrivate = ^TGStaticPrivate;
  TGStaticPrivate = record
      index : Tguint;
    end;

{#define G_STATIC_PRIVATE_INIT  0  GLIB_DEPRECATED_MACRO_IN_2_32_FOR(G_PRIVATE_INIT) }

procedure g_static_private_init(private_key:PGStaticPrivate);cdecl;external;
function g_static_private_get(private_key:PGStaticPrivate):Tgpointer;cdecl;external;
procedure g_static_private_set(private_key:PGStaticPrivate; data:Tgpointer; notify:TGDestroyNotify);cdecl;external;
procedure g_static_private_free(private_key:PGStaticPrivate);cdecl;external;
function g_once_init_enter_impl(location:Pgsize):Tgboolean;cdecl;external;
procedure g_thread_init(vtable:Tgpointer);cdecl;external;
procedure g_thread_init_with_errorcheck_mutexes(vtable:Tgpointer);cdecl;external;
function g_thread_get_initialized:Tgboolean;cdecl;external;
  var
    g_threads_got_initialized : Tgboolean;cvar;public;
{#define g_thread_supported()     (1) GLIB_DEPRECATED_MACRO_IN_2_32 }

function g_mutex_new:PGMutex;cdecl;external;
procedure g_mutex_free(mutex:PGMutex);cdecl;external;
function g_cond_new:PGCond;cdecl;external;
procedure g_cond_free(cond:PGCond);cdecl;external;
function g_cond_timed_wait(cond:PGCond; mutex:PGMutex; abs_time:PGTimeVal):Tgboolean;cdecl;external;
{$endif}
{ __G_DEPRECATED_THREAD_H__  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_static_mutex_lock(mutex : longint) : longint;
begin
  g_static_mutex_lock:=g_mutex_lock(g_static_mutex_get_mutex(mutex));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_static_mutex_trylock(mutex : longint) : longint;
begin
  g_static_mutex_trylock:=g_mutex_trylock(g_static_mutex_get_mutex(mutex));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_static_mutex_unlock(mutex : longint) : longint;
begin
  g_static_mutex_unlock:=g_mutex_unlock(g_static_mutex_get_mutex(mutex));
end;


end.
