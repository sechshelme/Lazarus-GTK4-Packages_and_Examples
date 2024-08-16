
unit gsocketaddress;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsocketaddress.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsocketaddress.h
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
PGSocketAddress  = ^GSocketAddress;
PGSocketAddressClass  = ^GSocketAddressClass;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GIO - GLib Input, Output and Streaming Library
 *
 * Copyright (C) 2008 Christian Kellner, Samuel Cormier-Iijima
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
 * Authors: Christian Kellner <gicmo@gnome.org>
 *          Samuel Cormier-Iijima <sciyoshi@gmail.com>
  }
{$ifndef __G_SOCKET_ADDRESS_H__}
{$define __G_SOCKET_ADDRESS_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}

{ was #define dname def_expr }
function G_TYPE_SOCKET_ADDRESS : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SOCKET_ADDRESS(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SOCKET_ADDRESS_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_SOCKET_ADDRESS(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_SOCKET_ADDRESS_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SOCKET_ADDRESS_GET_CLASS(o : longint) : longint;

type
  PGSocketAddress = ^TGSocketAddress;
  TGSocketAddress = record
      parent_instance : TGObject;
    end;

  PGSocketAddressClass = ^TGSocketAddressClass;
  TGSocketAddressClass = record
      parent_class : TGObjectClass;
      get_family : function (address:PGSocketAddress):TGSocketFamily;cdecl;
      get_native_size : function (address:PGSocketAddress):Tgssize;cdecl;
      to_native : function (address:PGSocketAddress; dest:Tgpointer; destlen:Tgsize; error:PPGError):Tgboolean;cdecl;
    end;


function g_socket_address_get_type:TGType;cdecl;external;
function g_socket_address_get_family(address:PGSocketAddress):TGSocketFamily;cdecl;external;
function g_socket_address_new_from_native(native:Tgpointer; len:Tgsize):PGSocketAddress;cdecl;external;
function g_socket_address_to_native(address:PGSocketAddress; dest:Tgpointer; destlen:Tgsize; error:PPGError):Tgboolean;cdecl;external;
function g_socket_address_get_native_size(address:PGSocketAddress):Tgssize;cdecl;external;
{$endif}
{ __G_SOCKET_ADDRESS_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_SOCKET_ADDRESS : longint; { return type might be wrong }
  begin
    G_TYPE_SOCKET_ADDRESS:=g_socket_address_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SOCKET_ADDRESS(o : longint) : longint;
begin
  G_SOCKET_ADDRESS:=G_TYPE_CHECK_INSTANCE_CAST(o,G_TYPE_SOCKET_ADDRESS,GSocketAddress);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SOCKET_ADDRESS_CLASS(k : longint) : longint;
begin
  G_SOCKET_ADDRESS_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,G_TYPE_SOCKET_ADDRESS,GSocketAddressClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_SOCKET_ADDRESS(o : longint) : longint;
begin
  G_IS_SOCKET_ADDRESS:=G_TYPE_CHECK_INSTANCE_TYPE(o,G_TYPE_SOCKET_ADDRESS);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_SOCKET_ADDRESS_CLASS(k : longint) : longint;
begin
  G_IS_SOCKET_ADDRESS_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,G_TYPE_SOCKET_ADDRESS);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SOCKET_ADDRESS_GET_CLASS(o : longint) : longint;
begin
  G_SOCKET_ADDRESS_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,G_TYPE_SOCKET_ADDRESS,GSocketAddressClass);
end;


end.
