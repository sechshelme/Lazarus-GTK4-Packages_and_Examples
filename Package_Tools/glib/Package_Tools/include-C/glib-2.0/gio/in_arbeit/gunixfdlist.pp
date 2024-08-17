
unit gunixfdlist;
interface

{
  Automatically converted by H2Pas 1.0.0 from gunixfdlist.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gunixfdlist.h
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
PGError  = ^GError;
Pgint  = ^gint;
PGUnixFDList  = ^GUnixFDList;
PGUnixFDListClass  = ^GUnixFDListClass;
PGUnixFDListPrivate  = ^GUnixFDListPrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GIO - GLib Input, Output and Streaming Library
 *
 * Copyright © 2009 Codethink Limited
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
 * Authors: Ryan Lortie <desrt@desrt.ca>
  }
{$ifndef __G_UNIX_FD_LIST_H__}
{$define __G_UNIX_FD_LIST_H__}
{$include <gio/gio.h>}

{ was #define dname def_expr }
function G_TYPE_UNIX_FD_LIST : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_UNIX_FD_LIST(inst : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_UNIX_FD_LIST_CLASS(_class : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_UNIX_FD_LIST(inst : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_UNIX_FD_LIST_CLASS(_class : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_UNIX_FD_LIST_GET_CLASS(inst : longint) : longint;

type
{< private > }
{ Padding for future expansion  }
  PGUnixFDListClass = ^TGUnixFDListClass;
  TGUnixFDListClass = record
      parent_class : TGObjectClass;
      _g_reserved1 : procedure ;cdecl;
      _g_reserved2 : procedure ;cdecl;
      _g_reserved3 : procedure ;cdecl;
      _g_reserved4 : procedure ;cdecl;
      _g_reserved5 : procedure ;cdecl;
    end;

  PGUnixFDList = ^TGUnixFDList;
  TGUnixFDList = record
      parent_instance : TGObject;
      priv : PGUnixFDListPrivate;
    end;


function g_unix_fd_list_get_type:TGType;cdecl;external;
function g_unix_fd_list_new:PGUnixFDList;cdecl;external;
(* Const before type ignored *)
function g_unix_fd_list_new_from_array(fds:Pgint; n_fds:Tgint):PGUnixFDList;cdecl;external;
function g_unix_fd_list_append(list:PGUnixFDList; fd:Tgint; error:PPGError):Tgint;cdecl;external;
function g_unix_fd_list_get_length(list:PGUnixFDList):Tgint;cdecl;external;
function g_unix_fd_list_get(list:PGUnixFDList; index_:Tgint; error:PPGError):Tgint;cdecl;external;
(* Const before type ignored *)
function g_unix_fd_list_peek_fds(list:PGUnixFDList; length:Pgint):Pgint;cdecl;external;
function g_unix_fd_list_steal_fds(list:PGUnixFDList; length:Pgint):Pgint;cdecl;external;
{$endif}
{ __G_UNIX_FD_LIST_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_UNIX_FD_LIST : longint; { return type might be wrong }
  begin
    G_TYPE_UNIX_FD_LIST:=g_unix_fd_list_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_UNIX_FD_LIST(inst : longint) : longint;
begin
  G_UNIX_FD_LIST:=G_TYPE_CHECK_INSTANCE_CAST(inst,G_TYPE_UNIX_FD_LIST,GUnixFDList);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_UNIX_FD_LIST_CLASS(_class : longint) : longint;
begin
  G_UNIX_FD_LIST_CLASS:=G_TYPE_CHECK_CLASS_CAST(_class,G_TYPE_UNIX_FD_LIST,GUnixFDListClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_UNIX_FD_LIST(inst : longint) : longint;
begin
  G_IS_UNIX_FD_LIST:=G_TYPE_CHECK_INSTANCE_TYPE(inst,G_TYPE_UNIX_FD_LIST);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_UNIX_FD_LIST_CLASS(_class : longint) : longint;
begin
  G_IS_UNIX_FD_LIST_CLASS:=G_TYPE_CHECK_CLASS_TYPE(_class,G_TYPE_UNIX_FD_LIST);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_UNIX_FD_LIST_GET_CLASS(inst : longint) : longint;
begin
  G_UNIX_FD_LIST_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(inst,G_TYPE_UNIX_FD_LIST,GUnixFDListClass);
end;


end.
