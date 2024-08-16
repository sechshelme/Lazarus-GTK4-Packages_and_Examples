
unit gdbusproxy;
interface

{
  Automatically converted by H2Pas 1.0.0 from gdbusproxy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gdbusproxy.h
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
Pgchar  = ^gchar;
PGDBusConnection  = ^GDBusConnection;
PGDBusInterfaceInfo  = ^GDBusInterfaceInfo;
PGDBusProxy  = ^GDBusProxy;
PGDBusProxyClass  = ^GDBusProxyClass;
PGDBusProxyPrivate  = ^GDBusProxyPrivate;
PGError  = ^GError;
PGUnixFDList  = ^GUnixFDList;
PGVariant  = ^GVariant;
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
{$ifndef __G_DBUS_PROXY_H__}
{$define __G_DBUS_PROXY_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}
{$include <gio/gdbusintrospection.h>}

{ was #define dname def_expr }
function G_TYPE_DBUS_PROXY : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DBUS_PROXY(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DBUS_PROXY_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_DBUS_PROXY(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_DBUS_PROXY_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DBUS_PROXY_GET_CLASS(o : longint) : longint;

type
{< private > }
  PGDBusProxy = ^TGDBusProxy;
  TGDBusProxy = record
      parent_instance : TGObject;
      priv : PGDBusProxyPrivate;
    end;

{*
 * GDBusProxyClass:
 * @g_properties_changed: Signal class handler for the #GDBusProxy::g-properties-changed signal.
 * @g_signal: Signal class handler for the #GDBusProxy::g-signal signal.
 *
 * Class structure for #GDBusProxy.
 *
 * Since: 2.26
  }
{< private > }
{< public > }
{ Signals  }
(* Const before type ignored *)
(* Const before declarator ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{< private > }
{ Padding for future expansion  }
  PGDBusProxyClass = ^TGDBusProxyClass;
  TGDBusProxyClass = record
      parent_class : TGObjectClass;
      g_properties_changed : procedure (proxy:PGDBusProxy; changed_properties:PGVariant; invalidated_properties:PPgchar);cdecl;
      g_signal : procedure (proxy:PGDBusProxy; sender_name:Pgchar; signal_name:Pgchar; parameters:PGVariant);cdecl;
      padding : array[0..31] of Tgpointer;
    end;


function g_dbus_proxy_get_type:TGType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure g_dbus_proxy_new(connection:PGDBusConnection; flags:TGDBusProxyFlags; info:PGDBusInterfaceInfo; name:Pgchar; object_path:Pgchar; 
            interface_name:Pgchar; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_dbus_proxy_new_finish(res:PGAsyncResult; error:PPGError):PGDBusProxy;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function g_dbus_proxy_new_sync(connection:PGDBusConnection; flags:TGDBusProxyFlags; info:PGDBusInterfaceInfo; name:Pgchar; object_path:Pgchar; 
           interface_name:Pgchar; cancellable:PGCancellable; error:PPGError):PGDBusProxy;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure g_dbus_proxy_new_for_bus(bus_type:TGBusType; flags:TGDBusProxyFlags; info:PGDBusInterfaceInfo; name:Pgchar; object_path:Pgchar; 
            interface_name:Pgchar; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_dbus_proxy_new_for_bus_finish(res:PGAsyncResult; error:PPGError):PGDBusProxy;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function g_dbus_proxy_new_for_bus_sync(bus_type:TGBusType; flags:TGDBusProxyFlags; info:PGDBusInterfaceInfo; name:Pgchar; object_path:Pgchar; 
           interface_name:Pgchar; cancellable:PGCancellable; error:PPGError):PGDBusProxy;cdecl;external;
function g_dbus_proxy_get_connection(proxy:PGDBusProxy):PGDBusConnection;cdecl;external;
function g_dbus_proxy_get_flags(proxy:PGDBusProxy):TGDBusProxyFlags;cdecl;external;
(* Const before type ignored *)
function g_dbus_proxy_get_name(proxy:PGDBusProxy):Pgchar;cdecl;external;
function g_dbus_proxy_get_name_owner(proxy:PGDBusProxy):Pgchar;cdecl;external;
(* Const before type ignored *)
function g_dbus_proxy_get_object_path(proxy:PGDBusProxy):Pgchar;cdecl;external;
(* Const before type ignored *)
function g_dbus_proxy_get_interface_name(proxy:PGDBusProxy):Pgchar;cdecl;external;
function g_dbus_proxy_get_default_timeout(proxy:PGDBusProxy):Tgint;cdecl;external;
procedure g_dbus_proxy_set_default_timeout(proxy:PGDBusProxy; timeout_msec:Tgint);cdecl;external;
function g_dbus_proxy_get_interface_info(proxy:PGDBusProxy):PGDBusInterfaceInfo;cdecl;external;
procedure g_dbus_proxy_set_interface_info(proxy:PGDBusProxy; info:PGDBusInterfaceInfo);cdecl;external;
(* Const before type ignored *)
function g_dbus_proxy_get_cached_property(proxy:PGDBusProxy; property_name:Pgchar):PGVariant;cdecl;external;
(* Const before type ignored *)
procedure g_dbus_proxy_set_cached_property(proxy:PGDBusProxy; property_name:Pgchar; value:PGVariant);cdecl;external;
function g_dbus_proxy_get_cached_property_names(proxy:PGDBusProxy):^Pgchar;cdecl;external;
(* Const before type ignored *)
procedure g_dbus_proxy_call(proxy:PGDBusProxy; method_name:Pgchar; parameters:PGVariant; flags:TGDBusCallFlags; timeout_msec:Tgint; 
            cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_dbus_proxy_call_finish(proxy:PGDBusProxy; res:PGAsyncResult; error:PPGError):PGVariant;cdecl;external;
(* Const before type ignored *)
function g_dbus_proxy_call_sync(proxy:PGDBusProxy; method_name:Pgchar; parameters:PGVariant; flags:TGDBusCallFlags; timeout_msec:Tgint; 
           cancellable:PGCancellable; error:PPGError):PGVariant;cdecl;external;
{$ifdef G_OS_UNIX}
(* Const before type ignored *)
procedure g_dbus_proxy_call_with_unix_fd_list(proxy:PGDBusProxy; method_name:Pgchar; parameters:PGVariant; flags:TGDBusCallFlags; timeout_msec:Tgint; 
            fd_list:PGUnixFDList; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_dbus_proxy_call_with_unix_fd_list_finish(proxy:PGDBusProxy; out_fd_list:PPGUnixFDList; res:PGAsyncResult; error:PPGError):PGVariant;cdecl;external;
(* Const before type ignored *)
function g_dbus_proxy_call_with_unix_fd_list_sync(proxy:PGDBusProxy; method_name:Pgchar; parameters:PGVariant; flags:TGDBusCallFlags; timeout_msec:Tgint; 
           fd_list:PGUnixFDList; out_fd_list:PPGUnixFDList; cancellable:PGCancellable; error:PPGError):PGVariant;cdecl;external;
{$endif}
{ G_OS_UNIX  }
{$endif}
{ __G_DBUS_PROXY_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_DBUS_PROXY : longint; { return type might be wrong }
  begin
    G_TYPE_DBUS_PROXY:=g_dbus_proxy_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DBUS_PROXY(o : longint) : longint;
begin
  G_DBUS_PROXY:=G_TYPE_CHECK_INSTANCE_CAST(o,G_TYPE_DBUS_PROXY,GDBusProxy);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DBUS_PROXY_CLASS(k : longint) : longint;
begin
  G_DBUS_PROXY_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,G_TYPE_DBUS_PROXY,GDBusProxyClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_DBUS_PROXY(o : longint) : longint;
begin
  G_IS_DBUS_PROXY:=G_TYPE_CHECK_INSTANCE_TYPE(o,G_TYPE_DBUS_PROXY);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_DBUS_PROXY_CLASS(k : longint) : longint;
begin
  G_IS_DBUS_PROXY_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,G_TYPE_DBUS_PROXY);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DBUS_PROXY_GET_CLASS(o : longint) : longint;
begin
  G_DBUS_PROXY_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,G_TYPE_DBUS_PROXY,GDBusProxyClass);
end;


end.
