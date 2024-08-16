
unit ginetaddressmask;
interface

{
  Automatically converted by H2Pas 1.0.0 from ginetaddressmask.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ginetaddressmask.h
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
PGError  = ^GError;
PGInetAddress  = ^GInetAddress;
PGInetAddressMask  = ^GInetAddressMask;
PGInetAddressMaskClass  = ^GInetAddressMaskClass;
PGInetAddressMaskPrivate  = ^GInetAddressMaskPrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GIO - GLib Input, Output and Streaming Library
 *
 * Copyright 2011 Red Hat, Inc.
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
  }
{$ifndef __G_INET_ADDRESS_MASK_H__}
{$define __G_INET_ADDRESS_MASK_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}

{ was #define dname def_expr }
function G_TYPE_INET_ADDRESS_MASK : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_INET_ADDRESS_MASK(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_INET_ADDRESS_MASK_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_INET_ADDRESS_MASK(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_INET_ADDRESS_MASK_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_INET_ADDRESS_MASK_GET_CLASS(o : longint) : longint;

type
{< private > }
  PGInetAddressMask = ^TGInetAddressMask;
  TGInetAddressMask = record
      parent_instance : TGObject;
      priv : PGInetAddressMaskPrivate;
    end;

  PGInetAddressMaskClass = ^TGInetAddressMaskClass;
  TGInetAddressMaskClass = record
      parent_class : TGObjectClass;
    end;


function g_inet_address_mask_get_type:TGType;cdecl;external;
function g_inet_address_mask_new(addr:PGInetAddress; length:Tguint; error:PPGError):PGInetAddressMask;cdecl;external;
(* Const before type ignored *)
function g_inet_address_mask_new_from_string(mask_string:Pgchar; error:PPGError):PGInetAddressMask;cdecl;external;
function g_inet_address_mask_to_string(mask:PGInetAddressMask):Pgchar;cdecl;external;
function g_inet_address_mask_get_family(mask:PGInetAddressMask):TGSocketFamily;cdecl;external;
function g_inet_address_mask_get_address(mask:PGInetAddressMask):PGInetAddress;cdecl;external;
function g_inet_address_mask_get_length(mask:PGInetAddressMask):Tguint;cdecl;external;
function g_inet_address_mask_matches(mask:PGInetAddressMask; address:PGInetAddress):Tgboolean;cdecl;external;
function g_inet_address_mask_equal(mask:PGInetAddressMask; mask2:PGInetAddressMask):Tgboolean;cdecl;external;
{$endif}
{ __G_INET_ADDRESS_MASK_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_INET_ADDRESS_MASK : longint; { return type might be wrong }
  begin
    G_TYPE_INET_ADDRESS_MASK:=g_inet_address_mask_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_INET_ADDRESS_MASK(o : longint) : longint;
begin
  G_INET_ADDRESS_MASK:=G_TYPE_CHECK_INSTANCE_CAST(o,G_TYPE_INET_ADDRESS_MASK,GInetAddressMask);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_INET_ADDRESS_MASK_CLASS(k : longint) : longint;
begin
  G_INET_ADDRESS_MASK_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,G_TYPE_INET_ADDRESS_MASK,GInetAddressMaskClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_INET_ADDRESS_MASK(o : longint) : longint;
begin
  G_IS_INET_ADDRESS_MASK:=G_TYPE_CHECK_INSTANCE_TYPE(o,G_TYPE_INET_ADDRESS_MASK);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_INET_ADDRESS_MASK_CLASS(k : longint) : longint;
begin
  G_IS_INET_ADDRESS_MASK_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,G_TYPE_INET_ADDRESS_MASK);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_INET_ADDRESS_MASK_GET_CLASS(o : longint) : longint;
begin
  G_INET_ADDRESS_MASK_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,G_TYPE_INET_ADDRESS_MASK,GInetAddressMaskClass);
end;


end.
