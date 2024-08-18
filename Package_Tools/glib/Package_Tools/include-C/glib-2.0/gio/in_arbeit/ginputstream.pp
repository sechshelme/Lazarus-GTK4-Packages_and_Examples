
unit ginputstream;
interface

{
  Automatically converted by H2Pas 1.0.0 from ginputstream.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ginputstream.h
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
PGAsyncResult  = ^GAsyncResult;
PGBytes  = ^GBytes;
PGCancellable  = ^GCancellable;
PGError  = ^GError;
PGInputStream  = ^GInputStream;
PGInputStreamClass  = ^GInputStreamClass;
PGInputStreamPrivate  = ^GInputStreamPrivate;
Pgsize  = ^gsize;
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
{$ifndef __G_INPUT_STREAM_H__}
{$define __G_INPUT_STREAM_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}

{ was #define dname def_expr }
function G_TYPE_INPUT_STREAM : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_INPUT_STREAM(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_INPUT_STREAM_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_INPUT_STREAM(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_INPUT_STREAM_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_INPUT_STREAM_GET_CLASS(o : longint) : longint;

type
{< private > }
  PGInputStream = ^TGInputStream;
  TGInputStream = record
      parent_instance : TGObject;
      priv : PGInputStreamPrivate;
    end;

{ Sync ops:  }
{ Async ops: (optional in derived classes)  }
{< private > }
{ Padding for future expansion  }
  PGInputStreamClass = ^TGInputStreamClass;
  TGInputStreamClass = record
      parent_class : TGObjectClass;
      read_fn : function (stream:PGInputStream; buffer:pointer; count:Tgsize; cancellable:PGCancellable; error:PPGError):Tgssize;cdecl;
      skip : function (stream:PGInputStream; count:Tgsize; cancellable:PGCancellable; error:PPGError):Tgssize;cdecl;
      close_fn : function (stream:PGInputStream; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;
      read_async : procedure (stream:PGInputStream; buffer:pointer; count:Tgsize; io_priority:longint; cancellable:PGCancellable; 
                    callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;
      read_finish : function (stream:PGInputStream; result:PGAsyncResult; error:PPGError):Tgssize;cdecl;
      skip_async : procedure (stream:PGInputStream; count:Tgsize; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
                    user_data:Tgpointer);cdecl;
      skip_finish : function (stream:PGInputStream; result:PGAsyncResult; error:PPGError):Tgssize;cdecl;
      close_async : procedure (stream:PGInputStream; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;
      close_finish : function (stream:PGInputStream; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;
      _g_reserved1 : procedure ;cdecl;
      _g_reserved2 : procedure ;cdecl;
      _g_reserved3 : procedure ;cdecl;
      _g_reserved4 : procedure ;cdecl;
      _g_reserved5 : procedure ;cdecl;
    end;


function g_input_stream_get_type:TGType;cdecl;external;
function g_input_stream_read(stream:PGInputStream; buffer:pointer; count:Tgsize; cancellable:PGCancellable; error:PPGError):Tgssize;cdecl;external;
function g_input_stream_read_all(stream:PGInputStream; buffer:pointer; count:Tgsize; bytes_read:Pgsize; cancellable:PGCancellable; 
           error:PPGError):Tgboolean;cdecl;external;
function g_input_stream_read_bytes(stream:PGInputStream; count:Tgsize; cancellable:PGCancellable; error:PPGError):PGBytes;cdecl;external;
function g_input_stream_skip(stream:PGInputStream; count:Tgsize; cancellable:PGCancellable; error:PPGError):Tgssize;cdecl;external;
function g_input_stream_close(stream:PGInputStream; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
procedure g_input_stream_read_async(stream:PGInputStream; buffer:pointer; count:Tgsize; io_priority:longint; cancellable:PGCancellable; 
            callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_input_stream_read_finish(stream:PGInputStream; result:PGAsyncResult; error:PPGError):Tgssize;cdecl;external;
procedure g_input_stream_read_all_async(stream:PGInputStream; buffer:pointer; count:Tgsize; io_priority:longint; cancellable:PGCancellable; 
            callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_input_stream_read_all_finish(stream:PGInputStream; result:PGAsyncResult; bytes_read:Pgsize; error:PPGError):Tgboolean;cdecl;external;
procedure g_input_stream_read_bytes_async(stream:PGInputStream; count:Tgsize; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external;
function g_input_stream_read_bytes_finish(stream:PGInputStream; result:PGAsyncResult; error:PPGError):PGBytes;cdecl;external;
procedure g_input_stream_skip_async(stream:PGInputStream; count:Tgsize; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external;
function g_input_stream_skip_finish(stream:PGInputStream; result:PGAsyncResult; error:PPGError):Tgssize;cdecl;external;
procedure g_input_stream_close_async(stream:PGInputStream; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_input_stream_close_finish(stream:PGInputStream; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
{ For implementations:  }
function g_input_stream_is_closed(stream:PGInputStream):Tgboolean;cdecl;external;
function g_input_stream_has_pending(stream:PGInputStream):Tgboolean;cdecl;external;
function g_input_stream_set_pending(stream:PGInputStream; error:PPGError):Tgboolean;cdecl;external;
procedure g_input_stream_clear_pending(stream:PGInputStream);cdecl;external;
{$endif}
{ __G_INPUT_STREAM_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_INPUT_STREAM : longint; { return type might be wrong }
  begin
    G_TYPE_INPUT_STREAM:=g_input_stream_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_INPUT_STREAM(o : longint) : longint;
begin
  G_INPUT_STREAM:=G_TYPE_CHECK_INSTANCE_CAST(o,G_TYPE_INPUT_STREAM,GInputStream);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_INPUT_STREAM_CLASS(k : longint) : longint;
begin
  G_INPUT_STREAM_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,G_TYPE_INPUT_STREAM,GInputStreamClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_INPUT_STREAM(o : longint) : longint;
begin
  G_IS_INPUT_STREAM:=G_TYPE_CHECK_INSTANCE_TYPE(o,G_TYPE_INPUT_STREAM);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_INPUT_STREAM_CLASS(k : longint) : longint;
begin
  G_IS_INPUT_STREAM_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,G_TYPE_INPUT_STREAM);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_INPUT_STREAM_GET_CLASS(o : longint) : longint;
begin
  G_INPUT_STREAM_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,G_TYPE_INPUT_STREAM,GInputStreamClass);
end;


end.
