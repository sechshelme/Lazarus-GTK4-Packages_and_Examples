
unit giostream;
interface

{
  Automatically converted by H2Pas 1.0.0 from giostream.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    giostream.h
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
PGCancellable  = ^GCancellable;
PGError  = ^GError;
PGInputStream  = ^GInputStream;
PGIOStream  = ^GIOStream;
PGIOStreamClass  = ^GIOStreamClass;
PGIOStreamPrivate  = ^GIOStreamPrivate;
PGOutputStream  = ^GOutputStream;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GIO - GLib Input, Output and Streaming Library
 *
 * Copyright © 2008, 2009 Codethink Limited
 * Copyright © 2009 Red Hat, Inc.
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * See the included COPYING file for more information.
 *
 * Authors: Ryan Lortie <desrt@desrt.ca>
 *          Alexander Larsson <alexl@redhat.com>
  }
{$ifndef __G_IO_STREAM_H__}
{$define __G_IO_STREAM_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/ginputstream.h>}
{$include <gio/goutputstream.h>}
{$include <gio/gcancellable.h>}
{$include <gio/gioerror.h>}

{ was #define dname def_expr }
function G_TYPE_IO_STREAM : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IO_STREAM(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IO_STREAM_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_IO_STREAM(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_IO_STREAM_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IO_STREAM_GET_CLASS(o : longint) : longint;

type
{< private > }
  PGIOStream = ^TGIOStream;
  TGIOStream = record
      parent_instance : TGObject;
      priv : PGIOStreamPrivate;
    end;

{< private > }
{ Padding for future expansion  }
  PGIOStreamClass = ^TGIOStreamClass;
  TGIOStreamClass = record
      parent_class : TGObjectClass;
      get_input_stream : function (stream:PGIOStream):PGInputStream;cdecl;
      get_output_stream : function (stream:PGIOStream):PGOutputStream;cdecl;
      close_fn : function (stream:PGIOStream; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;
      close_async : procedure (stream:PGIOStream; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;
      close_finish : function (stream:PGIOStream; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;
      _g_reserved1 : procedure ;cdecl;
      _g_reserved2 : procedure ;cdecl;
      _g_reserved3 : procedure ;cdecl;
      _g_reserved4 : procedure ;cdecl;
      _g_reserved5 : procedure ;cdecl;
      _g_reserved6 : procedure ;cdecl;
      _g_reserved7 : procedure ;cdecl;
      _g_reserved8 : procedure ;cdecl;
      _g_reserved9 : procedure ;cdecl;
      _g_reserved10 : procedure ;cdecl;
    end;


function g_io_stream_get_type:TGType;cdecl;external;
function g_io_stream_get_input_stream(stream:PGIOStream):PGInputStream;cdecl;external;
function g_io_stream_get_output_stream(stream:PGIOStream):PGOutputStream;cdecl;external;
procedure g_io_stream_splice_async(stream1:PGIOStream; stream2:PGIOStream; flags:TGIOStreamSpliceFlags; io_priority:longint; cancellable:PGCancellable; 
            callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_io_stream_splice_finish(result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
function g_io_stream_close(stream:PGIOStream; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
procedure g_io_stream_close_async(stream:PGIOStream; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_io_stream_close_finish(stream:PGIOStream; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
function g_io_stream_is_closed(stream:PGIOStream):Tgboolean;cdecl;external;
function g_io_stream_has_pending(stream:PGIOStream):Tgboolean;cdecl;external;
function g_io_stream_set_pending(stream:PGIOStream; error:PPGError):Tgboolean;cdecl;external;
procedure g_io_stream_clear_pending(stream:PGIOStream);cdecl;external;
{$endif}
{ __G_IO_STREAM_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_IO_STREAM : longint; { return type might be wrong }
  begin
    G_TYPE_IO_STREAM:=g_io_stream_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IO_STREAM(o : longint) : longint;
begin
  G_IO_STREAM:=G_TYPE_CHECK_INSTANCE_CAST(o,G_TYPE_IO_STREAM,GIOStream);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IO_STREAM_CLASS(k : longint) : longint;
begin
  G_IO_STREAM_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,G_TYPE_IO_STREAM,GIOStreamClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_IO_STREAM(o : longint) : longint;
begin
  G_IS_IO_STREAM:=G_TYPE_CHECK_INSTANCE_TYPE(o,G_TYPE_IO_STREAM);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_IO_STREAM_CLASS(k : longint) : longint;
begin
  G_IS_IO_STREAM_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,G_TYPE_IO_STREAM);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IO_STREAM_GET_CLASS(o : longint) : longint;
begin
  G_IO_STREAM_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,G_TYPE_IO_STREAM,GIOStreamClass);
end;


end.
