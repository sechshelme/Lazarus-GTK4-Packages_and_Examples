
unit gfileenumerator;
interface

{
  Automatically converted by H2Pas 1.0.0 from gfileenumerator.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gfileenumerator.h
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
PGFile  = ^GFile;
PGFileEnumerator  = ^GFileEnumerator;
PGFileEnumeratorClass  = ^GFileEnumeratorClass;
PGFileEnumeratorPrivate  = ^GFileEnumeratorPrivate;
PGFileInfo  = ^GFileInfo;
PGList  = ^GList;
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
{$ifndef __G_FILE_ENUMERATOR_H__}
{$define __G_FILE_ENUMERATOR_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}

{ was #define dname def_expr }
function G_TYPE_FILE_ENUMERATOR : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_FILE_ENUMERATOR(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_FILE_ENUMERATOR_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_FILE_ENUMERATOR(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_FILE_ENUMERATOR_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_FILE_ENUMERATOR_GET_CLASS(o : longint) : longint;

type
{< private > }
  PGFileEnumerator = ^TGFileEnumerator;
  TGFileEnumerator = record
      parent_instance : TGObject;
      priv : PGFileEnumeratorPrivate;
    end;

{ Virtual Table  }
{< private > }
{ Padding for future expansion  }
  PGFileEnumeratorClass = ^TGFileEnumeratorClass;
  TGFileEnumeratorClass = record
      parent_class : TGObjectClass;
      next_file : function (enumerator:PGFileEnumerator; cancellable:PGCancellable; error:PPGError):PGFileInfo;cdecl;
      close_fn : function (enumerator:PGFileEnumerator; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;
      next_files_async : procedure (enumerator:PGFileEnumerator; num_files:longint; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
                    user_data:Tgpointer);cdecl;
      next_files_finish : function (enumerator:PGFileEnumerator; result:PGAsyncResult; error:PPGError):PGList;cdecl;
      close_async : procedure (enumerator:PGFileEnumerator; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;
      close_finish : function (enumerator:PGFileEnumerator; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;
      _g_reserved1 : procedure ;cdecl;
      _g_reserved2 : procedure ;cdecl;
      _g_reserved3 : procedure ;cdecl;
      _g_reserved4 : procedure ;cdecl;
      _g_reserved5 : procedure ;cdecl;
      _g_reserved6 : procedure ;cdecl;
      _g_reserved7 : procedure ;cdecl;
    end;


function g_file_enumerator_get_type:TGType;cdecl;external;
function g_file_enumerator_next_file(enumerator:PGFileEnumerator; cancellable:PGCancellable; error:PPGError):PGFileInfo;cdecl;external;
function g_file_enumerator_close(enumerator:PGFileEnumerator; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
procedure g_file_enumerator_next_files_async(enumerator:PGFileEnumerator; num_files:longint; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external;
function g_file_enumerator_next_files_finish(enumerator:PGFileEnumerator; result:PGAsyncResult; error:PPGError):PGList;cdecl;external;
procedure g_file_enumerator_close_async(enumerator:PGFileEnumerator; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_file_enumerator_close_finish(enumerator:PGFileEnumerator; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
function g_file_enumerator_is_closed(enumerator:PGFileEnumerator):Tgboolean;cdecl;external;
function g_file_enumerator_has_pending(enumerator:PGFileEnumerator):Tgboolean;cdecl;external;
procedure g_file_enumerator_set_pending(enumerator:PGFileEnumerator; pending:Tgboolean);cdecl;external;
function g_file_enumerator_get_container(enumerator:PGFileEnumerator):PGFile;cdecl;external;
function g_file_enumerator_get_child(enumerator:PGFileEnumerator; info:PGFileInfo):PGFile;cdecl;external;
function g_file_enumerator_iterate(direnum:PGFileEnumerator; out_info:PPGFileInfo; out_child:PPGFile; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
{$endif}
{ __G_FILE_ENUMERATOR_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_FILE_ENUMERATOR : longint; { return type might be wrong }
  begin
    G_TYPE_FILE_ENUMERATOR:=g_file_enumerator_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_FILE_ENUMERATOR(o : longint) : longint;
begin
  G_FILE_ENUMERATOR:=G_TYPE_CHECK_INSTANCE_CAST(o,G_TYPE_FILE_ENUMERATOR,GFileEnumerator);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_FILE_ENUMERATOR_CLASS(k : longint) : longint;
begin
  G_FILE_ENUMERATOR_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,G_TYPE_FILE_ENUMERATOR,GFileEnumeratorClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_FILE_ENUMERATOR(o : longint) : longint;
begin
  G_IS_FILE_ENUMERATOR:=G_TYPE_CHECK_INSTANCE_TYPE(o,G_TYPE_FILE_ENUMERATOR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_FILE_ENUMERATOR_CLASS(k : longint) : longint;
begin
  G_IS_FILE_ENUMERATOR_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,G_TYPE_FILE_ENUMERATOR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_FILE_ENUMERATOR_GET_CLASS(o : longint) : longint;
begin
  G_FILE_ENUMERATOR_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,G_TYPE_FILE_ENUMERATOR,GFileEnumeratorClass);
end;


end.
