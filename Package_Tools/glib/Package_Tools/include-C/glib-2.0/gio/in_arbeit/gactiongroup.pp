
unit gactiongroup;
interface

{
  Automatically converted by H2Pas 1.0.0 from gactiongroup.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gactiongroup.h
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
PGActionGroup  = ^GActionGroup;
PGActionGroupInterface  = ^GActionGroupInterface;
Pgboolean  = ^gboolean;
Pgchar  = ^gchar;
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
{$ifndef __G_ACTION_GROUP_H__}
{$define __G_ACTION_GROUP_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}

{ was #define dname def_expr }
function G_TYPE_ACTION_GROUP : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_ACTION_GROUP(inst : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_ACTION_GROUP(inst : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_ACTION_GROUP_GET_IFACE(inst : longint) : longint;

type
{ virtual functions  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{ signals  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{ more virtual functions  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
  PGActionGroupInterface = ^TGActionGroupInterface;
  TGActionGroupInterface = record
      g_iface : TGTypeInterface;
      has_action : function (action_group:PGActionGroup; action_name:Pgchar):Tgboolean;cdecl;
      list_actions : function (action_group:PGActionGroup):PPgchar;cdecl;
      get_action_enabled : function (action_group:PGActionGroup; action_name:Pgchar):Tgboolean;cdecl;
      get_action_parameter_type : function (action_group:PGActionGroup; action_name:Pgchar):PGVariantType;cdecl;
      get_action_state_type : function (action_group:PGActionGroup; action_name:Pgchar):PGVariantType;cdecl;
      get_action_state_hint : function (action_group:PGActionGroup; action_name:Pgchar):PGVariant;cdecl;
      get_action_state : function (action_group:PGActionGroup; action_name:Pgchar):PGVariant;cdecl;
      change_action_state : procedure (action_group:PGActionGroup; action_name:Pgchar; value:PGVariant);cdecl;
      activate_action : procedure (action_group:PGActionGroup; action_name:Pgchar; parameter:PGVariant);cdecl;
      action_added : procedure (action_group:PGActionGroup; action_name:Pgchar);cdecl;
      action_removed : procedure (action_group:PGActionGroup; action_name:Pgchar);cdecl;
      action_enabled_changed : procedure (action_group:PGActionGroup; action_name:Pgchar; enabled:Tgboolean);cdecl;
      action_state_changed : procedure (action_group:PGActionGroup; action_name:Pgchar; state:PGVariant);cdecl;
      query_action : function (action_group:PGActionGroup; action_name:Pgchar; enabled:Pgboolean; parameter_type:PPGVariantType; state_type:PPGVariantType; 
                   state_hint:PPGVariant; state:PPGVariant):Tgboolean;cdecl;
    end;


function g_action_group_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function g_action_group_has_action(action_group:PGActionGroup; action_name:Pgchar):Tgboolean;cdecl;external;
function g_action_group_list_actions(action_group:PGActionGroup):^Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_action_group_get_action_parameter_type(action_group:PGActionGroup; action_name:Pgchar):PGVariantType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_action_group_get_action_state_type(action_group:PGActionGroup; action_name:Pgchar):PGVariantType;cdecl;external;
(* Const before type ignored *)
function g_action_group_get_action_state_hint(action_group:PGActionGroup; action_name:Pgchar):PGVariant;cdecl;external;
(* Const before type ignored *)
function g_action_group_get_action_enabled(action_group:PGActionGroup; action_name:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_action_group_get_action_state(action_group:PGActionGroup; action_name:Pgchar):PGVariant;cdecl;external;
(* Const before type ignored *)
procedure g_action_group_change_action_state(action_group:PGActionGroup; action_name:Pgchar; value:PGVariant);cdecl;external;
(* Const before type ignored *)
procedure g_action_group_activate_action(action_group:PGActionGroup; action_name:Pgchar; parameter:PGVariant);cdecl;external;
{ signals  }
(* Const before type ignored *)
procedure g_action_group_action_added(action_group:PGActionGroup; action_name:Pgchar);cdecl;external;
(* Const before type ignored *)
procedure g_action_group_action_removed(action_group:PGActionGroup; action_name:Pgchar);cdecl;external;
(* Const before type ignored *)
procedure g_action_group_action_enabled_changed(action_group:PGActionGroup; action_name:Pgchar; enabled:Tgboolean);cdecl;external;
(* Const before type ignored *)
procedure g_action_group_action_state_changed(action_group:PGActionGroup; action_name:Pgchar; state:PGVariant);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function g_action_group_query_action(action_group:PGActionGroup; action_name:Pgchar; enabled:Pgboolean; parameter_type:PPGVariantType; state_type:PPGVariantType; 
           state_hint:PPGVariant; state:PPGVariant):Tgboolean;cdecl;external;
{$endif}
{ __G_ACTION_GROUP_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_ACTION_GROUP : longint; { return type might be wrong }
  begin
    G_TYPE_ACTION_GROUP:=g_action_group_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_ACTION_GROUP(inst : longint) : longint;
begin
  G_ACTION_GROUP:=G_TYPE_CHECK_INSTANCE_CAST(inst,G_TYPE_ACTION_GROUP,GActionGroup);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_ACTION_GROUP(inst : longint) : longint;
begin
  G_IS_ACTION_GROUP:=G_TYPE_CHECK_INSTANCE_TYPE(inst,G_TYPE_ACTION_GROUP);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_ACTION_GROUP_GET_IFACE(inst : longint) : longint;
begin
  G_ACTION_GROUP_GET_IFACE:=G_TYPE_INSTANCE_GET_INTERFACE(inst,G_TYPE_ACTION_GROUP,GActionGroupInterface);
end;


end.
