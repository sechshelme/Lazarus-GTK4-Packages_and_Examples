
unit gdbusobjectmanagerclient;
interface

{
  Automatically converted by H2Pas 1.0.0 from gdbusobjectmanagerclient.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gdbusobjectmanagerclient.h
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
PGDBusObjectManager  = ^GDBusObjectManager;
PGDBusObjectManagerClient  = ^GDBusObjectManagerClient;
PGDBusObjectManagerClientClass  = ^GDBusObjectManagerClientClass;
PGDBusObjectManagerClientPrivate  = ^GDBusObjectManagerClientPrivate;
PGDBusObjectProxy  = ^GDBusObjectProxy;
PGDBusProxy  = ^GDBusProxy;
PGError  = ^GError;
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
{$ifndef __G_DBUS_OBJECT_MANAGER_CLIENT_H__}
{$define __G_DBUS_OBJECT_MANAGER_CLIENT_H__}
{$include <gio/giotypes.h>}

{ was #define dname def_expr }
function G_TYPE_DBUS_OBJECT_MANAGER_CLIENT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DBUS_OBJECT_MANAGER_CLIENT(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DBUS_OBJECT_MANAGER_CLIENT_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_DBUS_OBJECT_MANAGER_CLIENT(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_DBUS_OBJECT_MANAGER_CLIENT_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DBUS_OBJECT_MANAGER_CLIENT_GET_CLASS(o : longint) : longint;

type
{< private > }
  PGDBusObjectManagerClient = ^TGDBusObjectManagerClient;
  TGDBusObjectManagerClient = record
      parent_instance : TGObject;
      priv : PGDBusObjectManagerClientPrivate;
    end;

{*
 * GDBusObjectManagerClientClass:
 * @parent_class: The parent class.
 * @interface_proxy_signal: Signal class handler for the #GDBusObjectManagerClient::interface-proxy-signal signal.
 * @interface_proxy_properties_changed: Signal class handler for the #GDBusObjectManagerClient::interface-proxy-properties-changed signal.
 *
 * Class structure for #GDBusObjectManagerClient.
 *
 * Since: 2.30
  }
{ signals  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before declarator ignored *)
{< private > }
  PGDBusObjectManagerClientClass = ^TGDBusObjectManagerClientClass;
  TGDBusObjectManagerClientClass = record
      parent_class : TGObjectClass;
      interface_proxy_signal : procedure (manager:PGDBusObjectManagerClient; object_proxy:PGDBusObjectProxy; interface_proxy:PGDBusProxy; sender_name:Pgchar; signal_name:Pgchar; 
                    parameters:PGVariant);cdecl;
      interface_proxy_properties_changed : procedure (manager:PGDBusObjectManagerClient; object_proxy:PGDBusObjectProxy; interface_proxy:PGDBusProxy; changed_properties:PGVariant; invalidated_properties:PPgchar);cdecl;
      padding : array[0..7] of Tgpointer;
    end;


function g_dbus_object_manager_client_get_type:TGType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure g_dbus_object_manager_client_new(connection:PGDBusConnection; flags:TGDBusObjectManagerClientFlags; name:Pgchar; object_path:Pgchar; get_proxy_type_func:TGDBusProxyTypeFunc; 
            get_proxy_type_user_data:Tgpointer; get_proxy_type_destroy_notify:TGDestroyNotify; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_dbus_object_manager_client_new_finish(res:PGAsyncResult; error:PPGError):PGDBusObjectManager;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_dbus_object_manager_client_new_sync(connection:PGDBusConnection; flags:TGDBusObjectManagerClientFlags; name:Pgchar; object_path:Pgchar; get_proxy_type_func:TGDBusProxyTypeFunc; 
           get_proxy_type_user_data:Tgpointer; get_proxy_type_destroy_notify:TGDestroyNotify; cancellable:PGCancellable; error:PPGError):PGDBusObjectManager;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure g_dbus_object_manager_client_new_for_bus(bus_type:TGBusType; flags:TGDBusObjectManagerClientFlags; name:Pgchar; object_path:Pgchar; get_proxy_type_func:TGDBusProxyTypeFunc; 
            get_proxy_type_user_data:Tgpointer; get_proxy_type_destroy_notify:TGDestroyNotify; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_dbus_object_manager_client_new_for_bus_finish(res:PGAsyncResult; error:PPGError):PGDBusObjectManager;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_dbus_object_manager_client_new_for_bus_sync(bus_type:TGBusType; flags:TGDBusObjectManagerClientFlags; name:Pgchar; object_path:Pgchar; get_proxy_type_func:TGDBusProxyTypeFunc; 
           get_proxy_type_user_data:Tgpointer; get_proxy_type_destroy_notify:TGDestroyNotify; cancellable:PGCancellable; error:PPGError):PGDBusObjectManager;cdecl;external;
function g_dbus_object_manager_client_get_connection(manager:PGDBusObjectManagerClient):PGDBusConnection;cdecl;external;
function g_dbus_object_manager_client_get_flags(manager:PGDBusObjectManagerClient):TGDBusObjectManagerClientFlags;cdecl;external;
(* Const before type ignored *)
function g_dbus_object_manager_client_get_name(manager:PGDBusObjectManagerClient):Pgchar;cdecl;external;
function g_dbus_object_manager_client_get_name_owner(manager:PGDBusObjectManagerClient):Pgchar;cdecl;external;
{$endif}
{ __G_DBUS_OBJECT_MANAGER_CLIENT_H  }

implementation

{ was #define dname def_expr }
function G_TYPE_DBUS_OBJECT_MANAGER_CLIENT : longint; { return type might be wrong }
  begin
    G_TYPE_DBUS_OBJECT_MANAGER_CLIENT:=g_dbus_object_manager_client_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DBUS_OBJECT_MANAGER_CLIENT(o : longint) : longint;
begin
  G_DBUS_OBJECT_MANAGER_CLIENT:=G_TYPE_CHECK_INSTANCE_CAST(o,G_TYPE_DBUS_OBJECT_MANAGER_CLIENT,GDBusObjectManagerClient);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DBUS_OBJECT_MANAGER_CLIENT_CLASS(k : longint) : longint;
begin
  G_DBUS_OBJECT_MANAGER_CLIENT_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,G_TYPE_DBUS_OBJECT_MANAGER_CLIENT,GDBusObjectManagerClientClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_DBUS_OBJECT_MANAGER_CLIENT(o : longint) : longint;
begin
  G_IS_DBUS_OBJECT_MANAGER_CLIENT:=G_TYPE_CHECK_INSTANCE_TYPE(o,G_TYPE_DBUS_OBJECT_MANAGER_CLIENT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_DBUS_OBJECT_MANAGER_CLIENT_CLASS(k : longint) : longint;
begin
  G_IS_DBUS_OBJECT_MANAGER_CLIENT_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,G_TYPE_DBUS_OBJECT_MANAGER_CLIENT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DBUS_OBJECT_MANAGER_CLIENT_GET_CLASS(o : longint) : longint;
begin
  G_DBUS_OBJECT_MANAGER_CLIENT_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,G_TYPE_DBUS_OBJECT_MANAGER_CLIENT,GDBusObjectManagerClientClass);
end;


end.
