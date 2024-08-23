
unit gapplication;
interface

{
  Automatically converted by H2Pas 1.0.0 from gapplication.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gapplication.h
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
Pchar  = ^char;
PGActionGroup  = ^GActionGroup;
PGApplication  = ^GApplication;
PGApplicationClass  = ^GApplicationClass;
PGApplicationCommandLine  = ^GApplicationCommandLine;
PGApplicationPrivate  = ^GApplicationPrivate;
PGCancellable  = ^GCancellable;
Pgchar  = ^gchar;
PGDBusConnection  = ^GDBusConnection;
PGError  = ^GError;
PGFile  = ^GFile;
PGNotification  = ^GNotification;
PGOptionEntry  = ^GOptionEntry;
PGOptionGroup  = ^GOptionGroup;
PGVariant  = ^GVariant;
PGVariantBuilder  = ^GVariantBuilder;
PGVariantDict  = ^GVariantDict;
Plongint  = ^longint;
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
{$ifndef __G_APPLICATION_H__}
{$define __G_APPLICATION_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}

{ was #define dname def_expr }
function G_TYPE_APPLICATION : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_APPLICATION(inst : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_APPLICATION_CLASS(_class : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_APPLICATION(inst : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_APPLICATION_CLASS(_class : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_APPLICATION_GET_CLASS(inst : longint) : longint;

type
{< private > }
  PGApplication = ^TGApplication;
  TGApplication = record
      parent_instance : TGObject;
      priv : PGApplicationPrivate;
    end;

{< private > }
{< public > }
{ signals  }
(* Const before type ignored *)
{ vfuncs  }
{*
   * GApplicationClass::local_command_line:
   * @application: a #GApplication
   * @arguments: (inout) (array zero-terminated=1): array of command line arguments
   * @exit_status: (out): exit status to fill after processing the command line.
   *
   * This virtual function is always invoked in the local instance. It
   * gets passed a pointer to a %NULL-terminated copy of @argv and is
   * expected to remove arguments that it handled (shifting up remaining
   * arguments).
   *
   * The last argument to local_command_line() is a pointer to the @status
   * variable which can used to set the exit status that is returned from
   * g_application_run().
   *
   * See g_application_run() for more details on #GApplication startup.
   *
   * Returns: %TRUE if the commandline has been completely handled
    }
{ @platform_data comes from an external process and is untrusted. All value types
   * must be validated before being used.  }
{ Same as for @before_emit.  }
(* Const before type ignored *)
(* Const before type ignored *)
{< private > }
  PGApplicationClass = ^TGApplicationClass;
  TGApplicationClass = record
      parent_class : TGObjectClass;
      startup : procedure (application:PGApplication);cdecl;
      activate : procedure (application:PGApplication);cdecl;
      open : procedure (application:PGApplication; files:PPGFile; n_files:Tgint; hint:Pgchar);cdecl;
      command_line : function (application:PGApplication; command_line:PGApplicationCommandLine):longint;cdecl;
      local_command_line : function (application:PGApplication; arguments:PPPgchar; exit_status:Plongint):Tgboolean;cdecl;
      before_emit : procedure (application:PGApplication; platform_data:PGVariant);cdecl;
      after_emit : procedure (application:PGApplication; platform_data:PGVariant);cdecl;
      add_platform_data : procedure (application:PGApplication; builder:PGVariantBuilder);cdecl;
      quit_mainloop : procedure (application:PGApplication);cdecl;
      run_mainloop : procedure (application:PGApplication);cdecl;
      shutdown : procedure (application:PGApplication);cdecl;
      dbus_register : function (application:PGApplication; connection:PGDBusConnection; object_path:Pgchar; error:PPGError):Tgboolean;cdecl;
      dbus_unregister : procedure (application:PGApplication; connection:PGDBusConnection; object_path:Pgchar);cdecl;
      handle_local_options : function (application:PGApplication; options:PGVariantDict):Tgint;cdecl;
      name_lost : function (application:PGApplication):Tgboolean;cdecl;
      padding : array[0..6] of Tgpointer;
    end;


function g_application_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function g_application_id_is_valid(application_id:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_application_new(application_id:Pgchar; flags:TGApplicationFlags):PGApplication;cdecl;external;
(* Const before type ignored *)
function g_application_get_application_id(application:PGApplication):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure g_application_set_application_id(application:PGApplication; application_id:Pgchar);cdecl;external;
(* Const before type ignored *)
function g_application_get_version(application:PGApplication):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure g_application_set_version(application:PGApplication; version:Pgchar);cdecl;external;
function g_application_get_dbus_connection(application:PGApplication):PGDBusConnection;cdecl;external;
(* Const before type ignored *)
function g_application_get_dbus_object_path(application:PGApplication):Pgchar;cdecl;external;
function g_application_get_inactivity_timeout(application:PGApplication):Tguint;cdecl;external;
procedure g_application_set_inactivity_timeout(application:PGApplication; inactivity_timeout:Tguint);cdecl;external;
function g_application_get_flags(application:PGApplication):TGApplicationFlags;cdecl;external;
procedure g_application_set_flags(application:PGApplication; flags:TGApplicationFlags);cdecl;external;
(* Const before type ignored *)
function g_application_get_resource_base_path(application:PGApplication):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure g_application_set_resource_base_path(application:PGApplication; resource_path:Pgchar);cdecl;external;
procedure g_application_set_action_group(application:PGApplication; action_group:PGActionGroup);cdecl;external;
(* Const before type ignored *)
procedure g_application_add_main_option_entries(application:PGApplication; entries:PGOptionEntry);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure g_application_add_main_option(application:PGApplication; long_name:Pchar; short_name:char; flags:TGOptionFlags; arg:TGOptionArg; 
            description:Pchar; arg_description:Pchar);cdecl;external;
procedure g_application_add_option_group(application:PGApplication; group:PGOptionGroup);cdecl;external;
(* Const before type ignored *)
procedure g_application_set_option_context_parameter_string(application:PGApplication; parameter_string:Pgchar);cdecl;external;
(* Const before type ignored *)
procedure g_application_set_option_context_summary(application:PGApplication; summary:Pgchar);cdecl;external;
(* Const before type ignored *)
procedure g_application_set_option_context_description(application:PGApplication; description:Pgchar);cdecl;external;
function g_application_get_is_registered(application:PGApplication):Tgboolean;cdecl;external;
function g_application_get_is_remote(application:PGApplication):Tgboolean;cdecl;external;
function g_application_register(application:PGApplication; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
procedure g_application_hold(application:PGApplication);cdecl;external;
procedure g_application_release(application:PGApplication);cdecl;external;
procedure g_application_activate(application:PGApplication);cdecl;external;
(* Const before type ignored *)
procedure g_application_open(application:PGApplication; files:PPGFile; n_files:Tgint; hint:Pgchar);cdecl;external;
function g_application_run(application:PGApplication; argc:longint; argv:PPchar):longint;cdecl;external;
procedure g_application_quit(application:PGApplication);cdecl;external;
function g_application_get_default:PGApplication;cdecl;external;
procedure g_application_set_default(application:PGApplication);cdecl;external;
procedure g_application_mark_busy(application:PGApplication);cdecl;external;
procedure g_application_unmark_busy(application:PGApplication);cdecl;external;
function g_application_get_is_busy(application:PGApplication):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure g_application_send_notification(application:PGApplication; id:Pgchar; notification:PGNotification);cdecl;external;
(* Const before type ignored *)
procedure g_application_withdraw_notification(application:PGApplication; id:Pgchar);cdecl;external;
(* Const before type ignored *)
procedure g_application_bind_busy_property(application:PGApplication; object:Tgpointer; _property:Pgchar);cdecl;external;
(* Const before type ignored *)
procedure g_application_unbind_busy_property(application:PGApplication; object:Tgpointer; _property:Pgchar);cdecl;external;
{$endif}
{ __G_APPLICATION_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_APPLICATION : longint; { return type might be wrong }
  begin
    G_TYPE_APPLICATION:=g_application_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_APPLICATION(inst : longint) : longint;
begin
  G_APPLICATION:=G_TYPE_CHECK_INSTANCE_CAST(inst,G_TYPE_APPLICATION,GApplication);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_APPLICATION_CLASS(_class : longint) : longint;
begin
  G_APPLICATION_CLASS:=G_TYPE_CHECK_CLASS_CAST(_class,G_TYPE_APPLICATION,GApplicationClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_APPLICATION(inst : longint) : longint;
begin
  G_IS_APPLICATION:=G_TYPE_CHECK_INSTANCE_TYPE(inst,G_TYPE_APPLICATION);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_APPLICATION_CLASS(_class : longint) : longint;
begin
  G_IS_APPLICATION_CLASS:=G_TYPE_CHECK_CLASS_TYPE(_class,G_TYPE_APPLICATION);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_APPLICATION_GET_CLASS(inst : longint) : longint;
begin
  G_APPLICATION_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(inst,G_TYPE_APPLICATION,GApplicationClass);
end;


end.
