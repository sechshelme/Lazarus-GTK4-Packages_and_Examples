
unit ginetaddress;
interface

{
  Automatically converted by H2Pas 1.0.0 from ginetaddress.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ginetaddress.h
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
Pgchar  = ^gchar;
PGInetAddress  = ^GInetAddress;
PGInetAddressClass  = ^GInetAddressClass;
PGInetAddressPrivate  = ^GInetAddressPrivate;
Pguint8  = ^guint8;
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
{$ifndef __G_INET_ADDRESS_H__}
{$define __G_INET_ADDRESS_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}

{ was #define dname def_expr }
function G_TYPE_INET_ADDRESS : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_INET_ADDRESS(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_INET_ADDRESS_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_INET_ADDRESS(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_INET_ADDRESS_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_INET_ADDRESS_GET_CLASS(o : longint) : longint;

type
{< private > }
  PGInetAddress = ^TGInetAddress;
  TGInetAddress = record
      parent_instance : TGObject;
      priv : PGInetAddressPrivate;
    end;

(* Const before type ignored *)
  PGInetAddressClass = ^TGInetAddressClass;
  TGInetAddressClass = record
      parent_class : TGObjectClass;
      to_string : function (address:PGInetAddress):Pgchar;cdecl;
      to_bytes : function (address:PGInetAddress):Pguint8;cdecl;
    end;


function g_inet_address_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function g_inet_address_new_from_string(_string:Pgchar):PGInetAddress;cdecl;external;
(* Const before type ignored *)
function g_inet_address_new_from_bytes(bytes:Pguint8; family:TGSocketFamily):PGInetAddress;cdecl;external;
function g_inet_address_new_loopback(family:TGSocketFamily):PGInetAddress;cdecl;external;
function g_inet_address_new_any(family:TGSocketFamily):PGInetAddress;cdecl;external;
function g_inet_address_equal(address:PGInetAddress; other_address:PGInetAddress):Tgboolean;cdecl;external;
function g_inet_address_to_string(address:PGInetAddress):Pgchar;cdecl;external;
(* Const before type ignored *)
function g_inet_address_to_bytes(address:PGInetAddress):Pguint8;cdecl;external;
function g_inet_address_get_native_size(address:PGInetAddress):Tgsize;cdecl;external;
function g_inet_address_get_family(address:PGInetAddress):TGSocketFamily;cdecl;external;
function g_inet_address_get_is_any(address:PGInetAddress):Tgboolean;cdecl;external;
function g_inet_address_get_is_loopback(address:PGInetAddress):Tgboolean;cdecl;external;
function g_inet_address_get_is_link_local(address:PGInetAddress):Tgboolean;cdecl;external;
function g_inet_address_get_is_site_local(address:PGInetAddress):Tgboolean;cdecl;external;
function g_inet_address_get_is_multicast(address:PGInetAddress):Tgboolean;cdecl;external;
function g_inet_address_get_is_mc_global(address:PGInetAddress):Tgboolean;cdecl;external;
function g_inet_address_get_is_mc_link_local(address:PGInetAddress):Tgboolean;cdecl;external;
function g_inet_address_get_is_mc_node_local(address:PGInetAddress):Tgboolean;cdecl;external;
function g_inet_address_get_is_mc_org_local(address:PGInetAddress):Tgboolean;cdecl;external;
function g_inet_address_get_is_mc_site_local(address:PGInetAddress):Tgboolean;cdecl;external;
{$endif}
{ __G_INET_ADDRESS_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_INET_ADDRESS : longint; { return type might be wrong }
  begin
    G_TYPE_INET_ADDRESS:=g_inet_address_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_INET_ADDRESS(o : longint) : longint;
begin
  G_INET_ADDRESS:=G_TYPE_CHECK_INSTANCE_CAST(o,G_TYPE_INET_ADDRESS,GInetAddress);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_INET_ADDRESS_CLASS(k : longint) : longint;
begin
  G_INET_ADDRESS_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,G_TYPE_INET_ADDRESS,GInetAddressClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_INET_ADDRESS(o : longint) : longint;
begin
  G_IS_INET_ADDRESS:=G_TYPE_CHECK_INSTANCE_TYPE(o,G_TYPE_INET_ADDRESS);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_INET_ADDRESS_CLASS(k : longint) : longint;
begin
  G_IS_INET_ADDRESS_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,G_TYPE_INET_ADDRESS);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_INET_ADDRESS_GET_CLASS(o : longint) : longint;
begin
  G_INET_ADDRESS_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,G_TYPE_INET_ADDRESS,GInetAddressClass);
end;


end.
