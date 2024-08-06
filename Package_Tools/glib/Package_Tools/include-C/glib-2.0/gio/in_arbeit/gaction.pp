
unit gaction;
interface

{
  Automatically converted by H2Pas 1.0.0 from gaction.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gaction.h
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
PGAction  = ^GAction;
PGActionInterface  = ^GActionInterface;
Pgchar  = ^gchar;
PGError  = ^GError;
PGVariant  = ^GVariant;
PGVariantType  = ^GVariantType;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2010 Codethink Limited
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
{$ifndef __G_ACTION_H__}
{$define __G_ACTION_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}

{ was #define dname def_expr }
function G_TYPE_ACTION : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_ACTION(inst : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_ACTION(inst : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_ACTION_GET_IFACE(inst : longint) : longint;

type
{ virtual functions  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
  PGActionInterface = ^TGActionInterface;
  TGActionInterface = record
      g_iface : TGTypeInterface;
      get_name : function (action:PGAction):Pgchar;cdecl;
      get_parameter_type : function (action:PGAction):PGVariantType;cdecl;
      get_state_type : function (action:PGAction):PGVariantType;cdecl;
      get_state_hint : function (action:PGAction):PGVariant;cdecl;
      get_enabled : function (action:PGAction):Tgboolean;cdecl;
      get_state : function (action:PGAction):PGVariant;cdecl;
      change_state : procedure (action:PGAction; value:PGVariant);cdecl;
      activate : procedure (action:PGAction; parameter:PGVariant);cdecl;
    end;


function g_action_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function g_action_get_name(action:PGAction):Pgchar;cdecl;external;
(* Const before type ignored *)
function g_action_get_parameter_type(action:PGAction):PGVariantType;cdecl;external;
(* Const before type ignored *)
function g_action_get_state_type(action:PGAction):PGVariantType;cdecl;external;
function g_action_get_state_hint(action:PGAction):PGVariant;cdecl;external;
function g_action_get_enabled(action:PGAction):Tgboolean;cdecl;external;
function g_action_get_state(action:PGAction):PGVariant;cdecl;external;
procedure g_action_change_state(action:PGAction; value:PGVariant);cdecl;external;
procedure g_action_activate(action:PGAction; parameter:PGVariant);cdecl;external;
(* Const before type ignored *)
function g_action_name_is_valid(action_name:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_action_parse_detailed_name(detailed_name:Pgchar; action_name:PPgchar; target_value:PPGVariant; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_action_print_detailed_name(action_name:Pgchar; target_value:PGVariant):Pgchar;cdecl;external;
{$endif}
{ __G_ACTION_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_ACTION : longint; { return type might be wrong }
  begin
    G_TYPE_ACTION:=g_action_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_ACTION(inst : longint) : longint;
begin
  G_ACTION:=G_TYPE_CHECK_INSTANCE_CAST(inst,G_TYPE_ACTION,GAction);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_ACTION(inst : longint) : longint;
begin
  G_IS_ACTION:=G_TYPE_CHECK_INSTANCE_TYPE(inst,G_TYPE_ACTION);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_ACTION_GET_IFACE(inst : longint) : longint;
begin
  G_ACTION_GET_IFACE:=G_TYPE_INSTANCE_GET_INTERFACE(inst,G_TYPE_ACTION,GActionInterface);
end;


end.
