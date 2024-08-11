
unit gmain_dep;
interface

{
  Automatically converted by H2Pas 1.0.0 from gmain.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gmain.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

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
{$ifndef __G_DEPRECATED_MAIN_H__}
{$define __G_DEPRECATED_MAIN_H__}
{$if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)}
{$error "Only <glib.h> can be included directly."}
{$endif}
{$include <glib/gmain.h>}
{ ============== Compat main loop stuff ==================  }
{*
 * g_main_new:
 * @is_running: set to %TRUE to indicate that the loop is running. This
 *     is not very important since calling g_main_run() will set this
 *     to %TRUE anyway.
 *
 * Creates a new #GMainLoop for th default main context.
 *
 * Returns: a new #GMainLoop
 *
 * Deprecated: 2.2: Use g_main_loop_new() instead
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function g_main_new(is_running : longint) : longint;

{*
 * g_main_run:
 * @loop: a #GMainLoop
 *
 * Runs a main loop until it stops running.
 *
 * Deprecated: 2.2: Use g_main_loop_run() instead
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_main_run(loop : longint) : longint;

{*
 * g_main_quit:
 * @loop: a #GMainLoop
 *
 * Stops the #GMainLoop.
 * If g_main_run() was called to run the #GMainLoop, it will now return.
 *
 * Deprecated: 2.2: Use g_main_loop_quit() instead
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_main_quit(loop : longint) : longint;

{*
 * g_main_destroy:
 * @loop: a #GMainLoop
 *
 * Frees the memory allocated for the #GMainLoop.
 *
 * Deprecated: 2.2: Use g_main_loop_unref() instead
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_main_destroy(loop : longint) : longint;

{*
 * g_main_is_running:
 * @loop: a #GMainLoop
 *
 * Checks if the main loop is running.
 *
 * Returns: %TRUE if the main loop is running
 *
 * Deprecated: 2.2: Use g_main_loop_is_running() instead
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_main_is_running(loop : longint) : longint;

{*
 * g_main_iteration:
 * @may_block: set to %TRUE if it should block (i.e. wait) until an event
 *     source becomes ready. It will return after an event source has been
 *     processed. If set to %FALSE it will return immediately if no event
 *     source is ready to be processed.
 *
 * Runs a single iteration for the default #GMainContext.
 *
 * Returns: %TRUE if more events are pending.
 *
 * Deprecated: 2.2: Use g_main_context_iteration() instead.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_main_iteration(may_block : longint) : longint;

{*
 * g_main_pending:
 *
 * Checks if any events are pending for the default #GMainContext
 * (i.e. ready to be processed).
 *
 * Returns: %TRUE if any events are pending.
 *
 * Deprecated: 2.2: Use g_main_context_pending() instead.
  }
{ was #define dname(params) para_def_expr }
{ return type might be wrong }   
function g_main_pending : longint;

{*
 * g_main_set_poll_func:
 * @func: the function to call to poll all file descriptors
 *
 * Sets the function to use for the handle polling of file descriptors
 * for the default main context.
 *
 * Deprecated: 2.2: Use g_main_context_set_poll_func() again
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_main_set_poll_func(func : longint) : longint;

{$endif}
{ __G_DEPRECATED_MAIN_H__  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_main_new(is_running : longint) : longint;
begin
  g_main_new:=g_main_loop_new(NULL,is_running);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_main_run(loop : longint) : longint;
begin
  g_main_run:=g_main_loop_run(loop);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_main_quit(loop : longint) : longint;
begin
  g_main_quit:=g_main_loop_quit(loop);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_main_destroy(loop : longint) : longint;
begin
  g_main_destroy:=g_main_loop_unref(loop);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_main_is_running(loop : longint) : longint;
begin
  g_main_is_running:=g_main_loop_is_running(loop);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_main_iteration(may_block : longint) : longint;
begin
  g_main_iteration:=g_main_context_iteration(NULL,may_block);
end;

{ was #define dname(params) para_def_expr }
{ return type might be wrong }   
function g_main_pending : longint;
begin
  g_main_pending:=g_main_context_pending(NULL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_main_set_poll_func(func : longint) : longint;
begin
  g_main_set_poll_func:=g_main_context_set_poll_func(NULL,func);
end;


end.
