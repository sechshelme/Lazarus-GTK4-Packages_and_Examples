
unit goutputstream;
interface

{
  Automatically converted by H2Pas 1.0.0 from goutputstream.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    goutputstream.h
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
Pgchar  = ^gchar;
PGError  = ^GError;
PGInputStream  = ^GInputStream;
PGOutputStream  = ^GOutputStream;
PGOutputStreamClass  = ^GOutputStreamClass;
PGOutputStreamPrivate  = ^GOutputStreamPrivate;
PGOutputVector  = ^GOutputVector;
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
{$ifndef __G_OUTPUT_STREAM_H__}
{$define __G_OUTPUT_STREAM_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}

{ was #define dname def_expr }
function G_TYPE_OUTPUT_STREAM : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_OUTPUT_STREAM(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_OUTPUT_STREAM_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_OUTPUT_STREAM(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_OUTPUT_STREAM_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_OUTPUT_STREAM_GET_CLASS(o : longint) : longint;

type
{< private > }
  PGOutputStream = ^TGOutputStream;
  TGOutputStream = record
      parent_instance : TGObject;
      priv : PGOutputStreamPrivate;
    end;

{ Sync ops:  }
(* Const before type ignored *)
{ Async ops: (optional in derived classes)  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{< private > }
{ Padding for future expansion  }
  PGOutputStreamClass = ^TGOutputStreamClass;
  TGOutputStreamClass = record
      parent_class : TGObjectClass;
      write_fn : function (stream:PGOutputStream; buffer:pointer; count:Tgsize; cancellable:PGCancellable; error:PPGError):Tgssize;cdecl;
      splice : function (stream:PGOutputStream; source:PGInputStream; flags:TGOutputStreamSpliceFlags; cancellable:PGCancellable; error:PPGError):Tgssize;cdecl;
      flush : function (stream:PGOutputStream; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;
      close_fn : function (stream:PGOutputStream; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;
      write_async : procedure (stream:PGOutputStream; buffer:pointer; count:Tgsize; io_priority:longint; cancellable:PGCancellable; 
                    callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;
      write_finish : function (stream:PGOutputStream; result:PGAsyncResult; error:PPGError):Tgssize;cdecl;
      splice_async : procedure (stream:PGOutputStream; source:PGInputStream; flags:TGOutputStreamSpliceFlags; io_priority:longint; cancellable:PGCancellable; 
                    callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;
      splice_finish : function (stream:PGOutputStream; result:PGAsyncResult; error:PPGError):Tgssize;cdecl;
      flush_async : procedure (stream:PGOutputStream; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;
      flush_finish : function (stream:PGOutputStream; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;
      close_async : procedure (stream:PGOutputStream; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;
      close_finish : function (stream:PGOutputStream; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;
      writev_fn : function (stream:PGOutputStream; vectors:PGOutputVector; n_vectors:Tgsize; bytes_written:Pgsize; cancellable:PGCancellable; 
                   error:PPGError):Tgboolean;cdecl;
      writev_async : procedure (stream:PGOutputStream; vectors:PGOutputVector; n_vectors:Tgsize; io_priority:longint; cancellable:PGCancellable; 
                    callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;
      writev_finish : function (stream:PGOutputStream; result:PGAsyncResult; bytes_written:Pgsize; error:PPGError):Tgboolean;cdecl;
      _g_reserved4 : procedure ;cdecl;
      _g_reserved5 : procedure ;cdecl;
      _g_reserved6 : procedure ;cdecl;
      _g_reserved7 : procedure ;cdecl;
      _g_reserved8 : procedure ;cdecl;
    end;


function g_output_stream_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function g_output_stream_write(stream:PGOutputStream; buffer:pointer; count:Tgsize; cancellable:PGCancellable; error:PPGError):Tgssize;cdecl;external;
(* Const before type ignored *)
function g_output_stream_write_all(stream:PGOutputStream; buffer:pointer; count:Tgsize; bytes_written:Pgsize; cancellable:PGCancellable; 
           error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_output_stream_writev(stream:PGOutputStream; vectors:PGOutputVector; n_vectors:Tgsize; bytes_written:Pgsize; cancellable:PGCancellable; 
           error:PPGError):Tgboolean;cdecl;external;
function g_output_stream_writev_all(stream:PGOutputStream; vectors:PGOutputVector; n_vectors:Tgsize; bytes_written:Pgsize; cancellable:PGCancellable; 
           error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_output_stream_printf(stream:PGOutputStream; bytes_written:Pgsize; cancellable:PGCancellable; error:PPGError; format:Pgchar; 
           args:array of const):Tgboolean;cdecl;external;
function g_output_stream_printf(stream:PGOutputStream; bytes_written:Pgsize; cancellable:PGCancellable; error:PPGError; format:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_output_stream_vprintf(stream:PGOutputStream; bytes_written:Pgsize; cancellable:PGCancellable; error:PPGError; format:Pgchar; 
           args:Tva_list):Tgboolean;cdecl;external;
function g_output_stream_write_bytes(stream:PGOutputStream; bytes:PGBytes; cancellable:PGCancellable; error:PPGError):Tgssize;cdecl;external;
function g_output_stream_splice(stream:PGOutputStream; source:PGInputStream; flags:TGOutputStreamSpliceFlags; cancellable:PGCancellable; error:PPGError):Tgssize;cdecl;external;
function g_output_stream_flush(stream:PGOutputStream; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
function g_output_stream_close(stream:PGOutputStream; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure g_output_stream_write_async(stream:PGOutputStream; buffer:pointer; count:Tgsize; io_priority:longint; cancellable:PGCancellable; 
            callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_output_stream_write_finish(stream:PGOutputStream; result:PGAsyncResult; error:PPGError):Tgssize;cdecl;external;
(* Const before type ignored *)
procedure g_output_stream_write_all_async(stream:PGOutputStream; buffer:pointer; count:Tgsize; io_priority:longint; cancellable:PGCancellable; 
            callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_output_stream_write_all_finish(stream:PGOutputStream; result:PGAsyncResult; bytes_written:Pgsize; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure g_output_stream_writev_async(stream:PGOutputStream; vectors:PGOutputVector; n_vectors:Tgsize; io_priority:longint; cancellable:PGCancellable; 
            callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_output_stream_writev_finish(stream:PGOutputStream; result:PGAsyncResult; bytes_written:Pgsize; error:PPGError):Tgboolean;cdecl;external;
procedure g_output_stream_writev_all_async(stream:PGOutputStream; vectors:PGOutputVector; n_vectors:Tgsize; io_priority:longint; cancellable:PGCancellable; 
            callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_output_stream_writev_all_finish(stream:PGOutputStream; result:PGAsyncResult; bytes_written:Pgsize; error:PPGError):Tgboolean;cdecl;external;
procedure g_output_stream_write_bytes_async(stream:PGOutputStream; bytes:PGBytes; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external;
function g_output_stream_write_bytes_finish(stream:PGOutputStream; result:PGAsyncResult; error:PPGError):Tgssize;cdecl;external;
procedure g_output_stream_splice_async(stream:PGOutputStream; source:PGInputStream; flags:TGOutputStreamSpliceFlags; io_priority:longint; cancellable:PGCancellable; 
            callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_output_stream_splice_finish(stream:PGOutputStream; result:PGAsyncResult; error:PPGError):Tgssize;cdecl;external;
procedure g_output_stream_flush_async(stream:PGOutputStream; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_output_stream_flush_finish(stream:PGOutputStream; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
procedure g_output_stream_close_async(stream:PGOutputStream; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_output_stream_close_finish(stream:PGOutputStream; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
function g_output_stream_is_closed(stream:PGOutputStream):Tgboolean;cdecl;external;
function g_output_stream_is_closing(stream:PGOutputStream):Tgboolean;cdecl;external;
function g_output_stream_has_pending(stream:PGOutputStream):Tgboolean;cdecl;external;
function g_output_stream_set_pending(stream:PGOutputStream; error:PPGError):Tgboolean;cdecl;external;
procedure g_output_stream_clear_pending(stream:PGOutputStream);cdecl;external;
{$endif}
{ __G_OUTPUT_STREAM_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_OUTPUT_STREAM : longint; { return type might be wrong }
  begin
    G_TYPE_OUTPUT_STREAM:=g_output_stream_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_OUTPUT_STREAM(o : longint) : longint;
begin
  G_OUTPUT_STREAM:=G_TYPE_CHECK_INSTANCE_CAST(o,G_TYPE_OUTPUT_STREAM,GOutputStream);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_OUTPUT_STREAM_CLASS(k : longint) : longint;
begin
  G_OUTPUT_STREAM_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,G_TYPE_OUTPUT_STREAM,GOutputStreamClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_OUTPUT_STREAM(o : longint) : longint;
begin
  G_IS_OUTPUT_STREAM:=G_TYPE_CHECK_INSTANCE_TYPE(o,G_TYPE_OUTPUT_STREAM);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_OUTPUT_STREAM_CLASS(k : longint) : longint;
begin
  G_IS_OUTPUT_STREAM_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,G_TYPE_OUTPUT_STREAM);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_OUTPUT_STREAM_GET_CLASS(o : longint) : longint;
begin
  G_OUTPUT_STREAM_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,G_TYPE_OUTPUT_STREAM,GOutputStreamClass);
end;


end.
