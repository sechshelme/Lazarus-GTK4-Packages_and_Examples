
unit gcancellable;
interface

{
  Automatically converted by H2Pas 1.0.0 from gcancellable.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gcancellable.h
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
PGCancellable  = ^GCancellable;
PGCancellableClass  = ^GCancellableClass;
PGCancellablePrivate  = ^GCancellablePrivate;
PGError  = ^GError;
PGPollFD  = ^GPollFD;
PGSource  = ^GSource;
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
{$ifndef __G_CANCELLABLE_H__}
{$define __G_CANCELLABLE_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}

{ was #define dname def_expr }
function G_TYPE_CANCELLABLE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_CANCELLABLE(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_CANCELLABLE_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_CANCELLABLE(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_CANCELLABLE_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_CANCELLABLE_GET_CLASS(o : longint) : longint;

type
{< private > }
  PGCancellable = ^TGCancellable;
  TGCancellable = record
      parent_instance : TGObject;
      priv : PGCancellablePrivate;
    end;

{< private > }
{ Padding for future expansion  }
  PGCancellableClass = ^TGCancellableClass;
  TGCancellableClass = record
      parent_class : TGObjectClass;
      cancelled : procedure (cancellable:PGCancellable);cdecl;
      _g_reserved1 : procedure ;cdecl;
      _g_reserved2 : procedure ;cdecl;
      _g_reserved3 : procedure ;cdecl;
      _g_reserved4 : procedure ;cdecl;
      _g_reserved5 : procedure ;cdecl;
    end;


function g_cancellable_get_type:TGType;cdecl;external;
function g_cancellable_new:PGCancellable;cdecl;external;
{ These are only safe to call inside a cancellable op  }
function g_cancellable_is_cancelled(cancellable:PGCancellable):Tgboolean;cdecl;external;
function g_cancellable_set_error_if_cancelled(cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
function g_cancellable_get_fd(cancellable:PGCancellable):longint;cdecl;external;
function g_cancellable_make_pollfd(cancellable:PGCancellable; pollfd:PGPollFD):Tgboolean;cdecl;external;
procedure g_cancellable_release_fd(cancellable:PGCancellable);cdecl;external;
function g_cancellable_source_new(cancellable:PGCancellable):PGSource;cdecl;external;
function g_cancellable_get_current:PGCancellable;cdecl;external;
procedure g_cancellable_push_current(cancellable:PGCancellable);cdecl;external;
procedure g_cancellable_pop_current(cancellable:PGCancellable);cdecl;external;
procedure g_cancellable_reset(cancellable:PGCancellable);cdecl;external;
function g_cancellable_connect(cancellable:PGCancellable; callback:TGCallback; data:Tgpointer; data_destroy_func:TGDestroyNotify):Tgulong;cdecl;external;
procedure g_cancellable_disconnect(cancellable:PGCancellable; handler_id:Tgulong);cdecl;external;
{ This is safe to call from another thread  }
procedure g_cancellable_cancel(cancellable:PGCancellable);cdecl;external;
{$endif}
{ __G_CANCELLABLE_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_CANCELLABLE : longint; { return type might be wrong }
  begin
    G_TYPE_CANCELLABLE:=g_cancellable_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_CANCELLABLE(o : longint) : longint;
begin
  G_CANCELLABLE:=G_TYPE_CHECK_INSTANCE_CAST(o,G_TYPE_CANCELLABLE,GCancellable);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_CANCELLABLE_CLASS(k : longint) : longint;
begin
  G_CANCELLABLE_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,G_TYPE_CANCELLABLE,GCancellableClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_CANCELLABLE(o : longint) : longint;
begin
  G_IS_CANCELLABLE:=G_TYPE_CHECK_INSTANCE_TYPE(o,G_TYPE_CANCELLABLE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_CANCELLABLE_CLASS(k : longint) : longint;
begin
  G_IS_CANCELLABLE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,G_TYPE_CANCELLABLE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_CANCELLABLE_GET_CLASS(o : longint) : longint;
begin
  G_CANCELLABLE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,G_TYPE_CANCELLABLE,GCancellableClass);
end;


end.
