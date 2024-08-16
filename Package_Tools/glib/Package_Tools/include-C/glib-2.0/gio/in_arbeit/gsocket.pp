
unit gsocket;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsocket.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsocket.h
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
PGBytes  = ^GBytes;
PGCancellable  = ^GCancellable;
Pgchar  = ^gchar;
PGCredentials  = ^GCredentials;
PGError  = ^GError;
PGInetAddress  = ^GInetAddress;
PGInputMessage  = ^GInputMessage;
PGInputVector  = ^GInputVector;
Pgint  = ^gint;
PGOutputMessage  = ^GOutputMessage;
PGOutputVector  = ^GOutputVector;
Pgsize  = ^gsize;
PGSocket  = ^GSocket;
PGSocketAddress  = ^GSocketAddress;
PGSocketClass  = ^GSocketClass;
PGSocketControlMessage  = ^GSocketControlMessage;
PGSocketPrivate  = ^GSocketPrivate;
PGSource  = ^GSource;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2008 Christian Kellner, Samuel Cormier-Iijima
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
 * Authors: Christian Kellner <gicmo@gnome.org>
 *          Samuel Cormier-Iijima <sciyoshi@gmail.com>
 *          Ryan Lortie <desrt@desrt.ca>
  }
{$ifndef __G_SOCKET_H__}
{$define __G_SOCKET_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}

{ was #define dname def_expr }
function G_TYPE_SOCKET : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SOCKET(inst : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SOCKET_CLASS(_class : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_SOCKET(inst : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_SOCKET_CLASS(_class : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SOCKET_GET_CLASS(inst : longint) : longint;

type
{< private > }
{ Padding for future expansion  }
  PGSocketClass = ^TGSocketClass;
  TGSocketClass = record
      parent_class : TGObjectClass;
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

  PGSocket = ^TGSocket;
  TGSocket = record
      parent_instance : TGObject;
      priv : PGSocketPrivate;
    end;


function g_socket_get_type:TGType;cdecl;external;
function g_socket_new(family:TGSocketFamily; _type:TGSocketType; protocol:TGSocketProtocol; error:PPGError):PGSocket;cdecl;external;
function g_socket_new_from_fd(fd:Tgint; error:PPGError):PGSocket;cdecl;external;
function g_socket_get_fd(socket:PGSocket):longint;cdecl;external;
function g_socket_get_family(socket:PGSocket):TGSocketFamily;cdecl;external;
function g_socket_get_socket_type(socket:PGSocket):TGSocketType;cdecl;external;
function g_socket_get_protocol(socket:PGSocket):TGSocketProtocol;cdecl;external;
function g_socket_get_local_address(socket:PGSocket; error:PPGError):PGSocketAddress;cdecl;external;
function g_socket_get_remote_address(socket:PGSocket; error:PPGError):PGSocketAddress;cdecl;external;
procedure g_socket_set_blocking(socket:PGSocket; blocking:Tgboolean);cdecl;external;
function g_socket_get_blocking(socket:PGSocket):Tgboolean;cdecl;external;
procedure g_socket_set_keepalive(socket:PGSocket; keepalive:Tgboolean);cdecl;external;
function g_socket_get_keepalive(socket:PGSocket):Tgboolean;cdecl;external;
function g_socket_get_listen_backlog(socket:PGSocket):Tgint;cdecl;external;
procedure g_socket_set_listen_backlog(socket:PGSocket; backlog:Tgint);cdecl;external;
function g_socket_get_timeout(socket:PGSocket):Tguint;cdecl;external;
procedure g_socket_set_timeout(socket:PGSocket; timeout:Tguint);cdecl;external;
function g_socket_get_ttl(socket:PGSocket):Tguint;cdecl;external;
procedure g_socket_set_ttl(socket:PGSocket; ttl:Tguint);cdecl;external;
function g_socket_get_broadcast(socket:PGSocket):Tgboolean;cdecl;external;
procedure g_socket_set_broadcast(socket:PGSocket; broadcast:Tgboolean);cdecl;external;
function g_socket_get_multicast_loopback(socket:PGSocket):Tgboolean;cdecl;external;
procedure g_socket_set_multicast_loopback(socket:PGSocket; loopback:Tgboolean);cdecl;external;
function g_socket_get_multicast_ttl(socket:PGSocket):Tguint;cdecl;external;
procedure g_socket_set_multicast_ttl(socket:PGSocket; ttl:Tguint);cdecl;external;
function g_socket_is_connected(socket:PGSocket):Tgboolean;cdecl;external;
function g_socket_bind(socket:PGSocket; address:PGSocketAddress; allow_reuse:Tgboolean; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_socket_join_multicast_group(socket:PGSocket; group:PGInetAddress; source_specific:Tgboolean; iface:Pgchar; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_socket_leave_multicast_group(socket:PGSocket; group:PGInetAddress; source_specific:Tgboolean; iface:Pgchar; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_socket_join_multicast_group_ssm(socket:PGSocket; group:PGInetAddress; source_specific:PGInetAddress; iface:Pgchar; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_socket_leave_multicast_group_ssm(socket:PGSocket; group:PGInetAddress; source_specific:PGInetAddress; iface:Pgchar; error:PPGError):Tgboolean;cdecl;external;
function g_socket_connect(socket:PGSocket; address:PGSocketAddress; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
function g_socket_check_connect_result(socket:PGSocket; error:PPGError):Tgboolean;cdecl;external;
function g_socket_get_available_bytes(socket:PGSocket):Tgssize;cdecl;external;
function g_socket_condition_check(socket:PGSocket; condition:TGIOCondition):TGIOCondition;cdecl;external;
function g_socket_condition_wait(socket:PGSocket; condition:TGIOCondition; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
function g_socket_condition_timed_wait(socket:PGSocket; condition:TGIOCondition; timeout_us:Tgint64; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
function g_socket_accept(socket:PGSocket; cancellable:PGCancellable; error:PPGError):PGSocket;cdecl;external;
function g_socket_listen(socket:PGSocket; error:PPGError):Tgboolean;cdecl;external;
function g_socket_receive(socket:PGSocket; buffer:Pgchar; size:Tgsize; cancellable:PGCancellable; error:PPGError):Tgssize;cdecl;external;
function g_socket_receive_bytes(socket:PGSocket; size:Tgsize; timeout_us:Tgint64; cancellable:PGCancellable; error:PPGError):PGBytes;cdecl;external;
function g_socket_receive_from(socket:PGSocket; address:PPGSocketAddress; buffer:Pgchar; size:Tgsize; cancellable:PGCancellable; 
           error:PPGError):Tgssize;cdecl;external;
function g_socket_receive_bytes_from(socket:PGSocket; address:PPGSocketAddress; size:Tgsize; timeout_us:Tgint64; cancellable:PGCancellable; 
           error:PPGError):PGBytes;cdecl;external;
(* Const before type ignored *)
function g_socket_send(socket:PGSocket; buffer:Pgchar; size:Tgsize; cancellable:PGCancellable; error:PPGError):Tgssize;cdecl;external;
(* Const before type ignored *)
function g_socket_send_to(socket:PGSocket; address:PGSocketAddress; buffer:Pgchar; size:Tgsize; cancellable:PGCancellable; 
           error:PPGError):Tgssize;cdecl;external;
function g_socket_receive_message(socket:PGSocket; address:PPGSocketAddress; vectors:PGInputVector; num_vectors:Tgint; messages:PPPGSocketControlMessage; 
           num_messages:Pgint; flags:Pgint; cancellable:PGCancellable; error:PPGError):Tgssize;cdecl;external;
function g_socket_send_message(socket:PGSocket; address:PGSocketAddress; vectors:PGOutputVector; num_vectors:Tgint; messages:PPGSocketControlMessage; 
           num_messages:Tgint; flags:Tgint; cancellable:PGCancellable; error:PPGError):Tgssize;cdecl;external;
function g_socket_receive_messages(socket:PGSocket; messages:PGInputMessage; num_messages:Tguint; flags:Tgint; cancellable:PGCancellable; 
           error:PPGError):Tgint;cdecl;external;
function g_socket_send_messages(socket:PGSocket; messages:PGOutputMessage; num_messages:Tguint; flags:Tgint; cancellable:PGCancellable; 
           error:PPGError):Tgint;cdecl;external;
function g_socket_close(socket:PGSocket; error:PPGError):Tgboolean;cdecl;external;
function g_socket_shutdown(socket:PGSocket; shutdown_read:Tgboolean; shutdown_write:Tgboolean; error:PPGError):Tgboolean;cdecl;external;
function g_socket_is_closed(socket:PGSocket):Tgboolean;cdecl;external;
function g_socket_create_source(socket:PGSocket; condition:TGIOCondition; cancellable:PGCancellable):PGSource;cdecl;external;
function g_socket_speaks_ipv4(socket:PGSocket):Tgboolean;cdecl;external;
function g_socket_get_credentials(socket:PGSocket; error:PPGError):PGCredentials;cdecl;external;
function g_socket_receive_with_blocking(socket:PGSocket; buffer:Pgchar; size:Tgsize; blocking:Tgboolean; cancellable:PGCancellable; 
           error:PPGError):Tgssize;cdecl;external;
(* Const before type ignored *)
function g_socket_send_with_blocking(socket:PGSocket; buffer:Pgchar; size:Tgsize; blocking:Tgboolean; cancellable:PGCancellable; 
           error:PPGError):Tgssize;cdecl;external;
(* Const before type ignored *)
function g_socket_send_message_with_timeout(socket:PGSocket; address:PGSocketAddress; vectors:PGOutputVector; num_vectors:Tgint; messages:PPGSocketControlMessage; 
           num_messages:Tgint; flags:Tgint; timeout_us:Tgint64; bytes_written:Pgsize; cancellable:PGCancellable; 
           error:PPGError):TGPollableReturn;cdecl;external;
function g_socket_get_option(socket:PGSocket; level:Tgint; optname:Tgint; value:Pgint; error:PPGError):Tgboolean;cdecl;external;
function g_socket_set_option(socket:PGSocket; level:Tgint; optname:Tgint; value:Tgint; error:PPGError):Tgboolean;cdecl;external;
{$endif}
{ __G_SOCKET_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_SOCKET : longint; { return type might be wrong }
  begin
    G_TYPE_SOCKET:=g_socket_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SOCKET(inst : longint) : longint;
begin
  G_SOCKET:=G_TYPE_CHECK_INSTANCE_CAST(inst,G_TYPE_SOCKET,GSocket);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SOCKET_CLASS(_class : longint) : longint;
begin
  G_SOCKET_CLASS:=G_TYPE_CHECK_CLASS_CAST(_class,G_TYPE_SOCKET,GSocketClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_SOCKET(inst : longint) : longint;
begin
  G_IS_SOCKET:=G_TYPE_CHECK_INSTANCE_TYPE(inst,G_TYPE_SOCKET);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_SOCKET_CLASS(_class : longint) : longint;
begin
  G_IS_SOCKET_CLASS:=G_TYPE_CHECK_CLASS_TYPE(_class,G_TYPE_SOCKET);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SOCKET_GET_CLASS(inst : longint) : longint;
begin
  G_SOCKET_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(inst,G_TYPE_SOCKET,GSocketClass);
end;


end.
