
unit gdbusobjectproxy;
interface

{
  Automatically converted by H2Pas 1.0.0 from gdbusobjectproxy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gdbusobjectproxy.h
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
PGDBusConnection  = ^GDBusConnection;
PGDBusObjectProxy  = ^GDBusObjectProxy;
PGDBusObjectProxyClass  = ^GDBusObjectProxyClass;
PGDBusObjectProxyPrivate  = ^GDBusObjectProxyPrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GDBus - GLib D-Bus Library
 *
 * Copyright (C) 2008-2010 Red Hat, Inc.
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
 * Author: David Zeuthen <davidz@redhat.com>
  }
{$ifndef __G_DBUS_OBJECT_PROXY_H__}
{$define __G_DBUS_OBJECT_PROXY_H__}
{$include <gio/giotypes.h>}

{ was #define dname def_expr }
function G_TYPE_DBUS_OBJECT_PROXY : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DBUS_OBJECT_PROXY(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DBUS_OBJECT_PROXY_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_DBUS_OBJECT_PROXY(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_DBUS_OBJECT_PROXY_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DBUS_OBJECT_PROXY_GET_CLASS(o : longint) : longint;

type
{< private > }
  PGDBusObjectProxy = ^TGDBusObjectProxy;
  TGDBusObjectProxy = record
      parent_instance : TGObject;
      priv : PGDBusObjectProxyPrivate;
    end;

{*
 * GDBusObjectProxyClass:
 * @parent_class: The parent class.
 *
 * Class structure for #GDBusObjectProxy.
 *
 * Since: 2.30
  }
{< private > }
  PGDBusObjectProxyClass = ^TGDBusObjectProxyClass;
  TGDBusObjectProxyClass = record
      parent_class : TGObjectClass;
      padding : array[0..7] of Tgpointer;
    end;


function g_dbus_object_proxy_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function g_dbus_object_proxy_new(connection:PGDBusConnection; object_path:Pgchar):PGDBusObjectProxy;cdecl;external;
function g_dbus_object_proxy_get_connection(proxy:PGDBusObjectProxy):PGDBusConnection;cdecl;external;
{$endif}
{ __G_DBUS_OBJECT_PROXY_H  }

implementation

{ was #define dname def_expr }
function G_TYPE_DBUS_OBJECT_PROXY : longint; { return type might be wrong }
  begin
    G_TYPE_DBUS_OBJECT_PROXY:=g_dbus_object_proxy_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DBUS_OBJECT_PROXY(o : longint) : longint;
begin
  G_DBUS_OBJECT_PROXY:=G_TYPE_CHECK_INSTANCE_CAST(o,G_TYPE_DBUS_OBJECT_PROXY,GDBusObjectProxy);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DBUS_OBJECT_PROXY_CLASS(k : longint) : longint;
begin
  G_DBUS_OBJECT_PROXY_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,G_TYPE_DBUS_OBJECT_PROXY,GDBusObjectProxyClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_DBUS_OBJECT_PROXY(o : longint) : longint;
begin
  G_IS_DBUS_OBJECT_PROXY:=G_TYPE_CHECK_INSTANCE_TYPE(o,G_TYPE_DBUS_OBJECT_PROXY);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_DBUS_OBJECT_PROXY_CLASS(k : longint) : longint;
begin
  G_IS_DBUS_OBJECT_PROXY_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,G_TYPE_DBUS_OBJECT_PROXY);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DBUS_OBJECT_PROXY_GET_CLASS(o : longint) : longint;
begin
  G_DBUS_OBJECT_PROXY_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,G_TYPE_DBUS_OBJECT_PROXY,GDBusObjectProxyClass);
end;


end.
