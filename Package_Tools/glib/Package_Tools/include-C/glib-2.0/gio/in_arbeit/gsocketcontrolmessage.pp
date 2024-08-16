
unit gsocketcontrolmessage;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsocketcontrolmessage.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsocketcontrolmessage.h
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
PGSocketControlMessage  = ^GSocketControlMessage;
PGSocketControlMessageClass  = ^GSocketControlMessageClass;
PGSocketControlMessagePrivate  = ^GSocketControlMessagePrivate;
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
{$ifndef __G_SOCKET_CONTROL_MESSAGE_H__}
{$define __G_SOCKET_CONTROL_MESSAGE_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}

{ was #define dname def_expr }
function G_TYPE_SOCKET_CONTROL_MESSAGE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SOCKET_CONTROL_MESSAGE(inst : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SOCKET_CONTROL_MESSAGE_CLASS(_class : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_SOCKET_CONTROL_MESSAGE(inst : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_SOCKET_CONTROL_MESSAGE_CLASS(_class : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SOCKET_CONTROL_MESSAGE_GET_CLASS(inst : longint) : longint;

type
{*
 * GSocketControlMessageClass:
 * @get_size: gets the size of the message.
 * @get_level: gets the protocol of the message.
 * @get_type: gets the protocol specific type of the message.
 * @serialize: Writes out the message data.
 * @deserialize: Tries to deserialize a message.
 *
 * Class structure for #GSocketControlMessage.
 * }
{< private > }
{ Padding for future expansion  }
  PGSocketControlMessageClass = ^TGSocketControlMessageClass;
  TGSocketControlMessageClass = record
      parent_class : TGObjectClass;
      get_size : function (message:PGSocketControlMessage):Tgsize;cdecl;
      get_level : function (message:PGSocketControlMessage):longint;cdecl;
      get_type : function (message:PGSocketControlMessage):longint;cdecl;
      serialize : procedure (message:PGSocketControlMessage; data:Tgpointer);cdecl;
      deserialize : function (level:longint; _type:longint; size:Tgsize; data:Tgpointer):PGSocketControlMessage;cdecl;
      _g_reserved1 : procedure ;cdecl;
      _g_reserved2 : procedure ;cdecl;
      _g_reserved3 : procedure ;cdecl;
      _g_reserved4 : procedure ;cdecl;
      _g_reserved5 : procedure ;cdecl;
    end;

  PGSocketControlMessage = ^TGSocketControlMessage;
  TGSocketControlMessage = record
      parent_instance : TGObject;
      priv : PGSocketControlMessagePrivate;
    end;


function g_socket_control_message_get_type:TGType;cdecl;external;
function g_socket_control_message_get_size(message:PGSocketControlMessage):Tgsize;cdecl;external;
function g_socket_control_message_get_level(message:PGSocketControlMessage):longint;cdecl;external;
function g_socket_control_message_get_msg_type(message:PGSocketControlMessage):longint;cdecl;external;
procedure g_socket_control_message_serialize(message:PGSocketControlMessage; data:Tgpointer);cdecl;external;
function g_socket_control_message_deserialize(level:longint; _type:longint; size:Tgsize; data:Tgpointer):PGSocketControlMessage;cdecl;external;
{$endif}
{ __G_SOCKET_CONTROL_MESSAGE_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_SOCKET_CONTROL_MESSAGE : longint; { return type might be wrong }
  begin
    G_TYPE_SOCKET_CONTROL_MESSAGE:=g_socket_control_message_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SOCKET_CONTROL_MESSAGE(inst : longint) : longint;
begin
  G_SOCKET_CONTROL_MESSAGE:=G_TYPE_CHECK_INSTANCE_CAST(inst,G_TYPE_SOCKET_CONTROL_MESSAGE,GSocketControlMessage);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SOCKET_CONTROL_MESSAGE_CLASS(_class : longint) : longint;
begin
  G_SOCKET_CONTROL_MESSAGE_CLASS:=G_TYPE_CHECK_CLASS_CAST(_class,G_TYPE_SOCKET_CONTROL_MESSAGE,GSocketControlMessageClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_SOCKET_CONTROL_MESSAGE(inst : longint) : longint;
begin
  G_IS_SOCKET_CONTROL_MESSAGE:=G_TYPE_CHECK_INSTANCE_TYPE(inst,G_TYPE_SOCKET_CONTROL_MESSAGE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_SOCKET_CONTROL_MESSAGE_CLASS(_class : longint) : longint;
begin
  G_IS_SOCKET_CONTROL_MESSAGE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(_class,G_TYPE_SOCKET_CONTROL_MESSAGE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SOCKET_CONTROL_MESSAGE_GET_CLASS(inst : longint) : longint;
begin
  G_SOCKET_CONTROL_MESSAGE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(inst,G_TYPE_SOCKET_CONTROL_MESSAGE,GSocketControlMessageClass);
end;


end.
