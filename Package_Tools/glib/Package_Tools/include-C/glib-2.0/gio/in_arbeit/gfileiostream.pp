
unit gfileiostream;
interface

{
  Automatically converted by H2Pas 1.0.0 from gfileiostream.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gfileiostream.h
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
Pchar  = ^char;
PGAsyncResult  = ^GAsyncResult;
PGCancellable  = ^GCancellable;
PGError  = ^GError;
PGFileInfo  = ^GFileInfo;
PGFileIOStream  = ^GFileIOStream;
PGFileIOStreamClass  = ^GFileIOStreamClass;
PGFileIOStreamPrivate  = ^GFileIOStreamPrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GIO - GLib Input, Io and Streaming Library
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
{$ifndef __G_FILE_IO_STREAM_H__}
{$define __G_FILE_IO_STREAM_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giostream.h>}

{ was #define dname def_expr }
function G_TYPE_FILE_IO_STREAM : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_FILE_IO_STREAM(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_FILE_IO_STREAM_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_FILE_IO_STREAM(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_FILE_IO_STREAM_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_FILE_IO_STREAM_GET_CLASS(o : longint) : longint;

type
{< private > }
  PGFileIOStream = ^TGFileIOStream;
  TGFileIOStream = record
      parent_instance : TGIOStream;
      priv : PGFileIOStreamPrivate;
    end;

(* Const before type ignored *)
(* Const before type ignored *)
{ Padding for future expansion  }
  PGFileIOStreamClass = ^TGFileIOStreamClass;
  TGFileIOStreamClass = record
      parent_class : TGIOStreamClass;
      tell : function (stream:PGFileIOStream):Tgoffset;cdecl;
      can_seek : function (stream:PGFileIOStream):Tgboolean;cdecl;
      seek : function (stream:PGFileIOStream; offset:Tgoffset; _type:TGSeekType; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;
      can_truncate : function (stream:PGFileIOStream):Tgboolean;cdecl;
      truncate_fn : function (stream:PGFileIOStream; size:Tgoffset; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;
      query_info : function (stream:PGFileIOStream; attributes:Pchar; cancellable:PGCancellable; error:PPGError):PGFileInfo;cdecl;
      query_info_async : procedure (stream:PGFileIOStream; attributes:Pchar; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
                    user_data:Tgpointer);cdecl;
      query_info_finish : function (stream:PGFileIOStream; result:PGAsyncResult; error:PPGError):PGFileInfo;cdecl;
      get_etag : function (stream:PGFileIOStream):Pchar;cdecl;
      _g_reserved1 : procedure ;cdecl;
      _g_reserved2 : procedure ;cdecl;
      _g_reserved3 : procedure ;cdecl;
      _g_reserved4 : procedure ;cdecl;
      _g_reserved5 : procedure ;cdecl;
    end;


function g_file_io_stream_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function g_file_io_stream_query_info(stream:PGFileIOStream; attributes:Pchar; cancellable:PGCancellable; error:PPGError):PGFileInfo;cdecl;external;
(* Const before type ignored *)
procedure g_file_io_stream_query_info_async(stream:PGFileIOStream; attributes:Pchar; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external;
function g_file_io_stream_query_info_finish(stream:PGFileIOStream; result:PGAsyncResult; error:PPGError):PGFileInfo;cdecl;external;
function g_file_io_stream_get_etag(stream:PGFileIOStream):Pchar;cdecl;external;
{$endif}
{ __G_FILE_FILE_IO_STREAM_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_FILE_IO_STREAM : longint; { return type might be wrong }
  begin
    G_TYPE_FILE_IO_STREAM:=g_file_io_stream_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_FILE_IO_STREAM(o : longint) : longint;
begin
  G_FILE_IO_STREAM:=G_TYPE_CHECK_INSTANCE_CAST(o,G_TYPE_FILE_IO_STREAM,GFileIOStream);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_FILE_IO_STREAM_CLASS(k : longint) : longint;
begin
  G_FILE_IO_STREAM_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,G_TYPE_FILE_IO_STREAM,GFileIOStreamClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_FILE_IO_STREAM(o : longint) : longint;
begin
  G_IS_FILE_IO_STREAM:=G_TYPE_CHECK_INSTANCE_TYPE(o,G_TYPE_FILE_IO_STREAM);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_FILE_IO_STREAM_CLASS(k : longint) : longint;
begin
  G_IS_FILE_IO_STREAM_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,G_TYPE_FILE_IO_STREAM);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_FILE_IO_STREAM_GET_CLASS(o : longint) : longint;
begin
  G_FILE_IO_STREAM_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,G_TYPE_FILE_IO_STREAM,GFileIOStreamClass);
end;


end.
