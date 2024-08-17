
unit gdbusintrospection;
interface

{
  Automatically converted by H2Pas 1.0.0 from gdbusintrospection.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gdbusintrospection.h
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
PGDBusAnnotationInfo  = ^GDBusAnnotationInfo;
PGDBusArgInfo  = ^GDBusArgInfo;
PGDBusInterfaceInfo  = ^GDBusInterfaceInfo;
PGDBusMethodInfo  = ^GDBusMethodInfo;
PGDBusNodeInfo  = ^GDBusNodeInfo;
PGDBusPropertyInfo  = ^GDBusPropertyInfo;
PGDBusSignalInfo  = ^GDBusSignalInfo;
PGError  = ^GError;
PGString  = ^GString;
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
{$ifndef __G_DBUS_INTROSPECTION_H__}
{$define __G_DBUS_INTROSPECTION_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}
{*
 * GDBusAnnotationInfo:
 * @ref_count: The reference count or -1 if statically allocated.
 * @key: The name of the annotation, e.g. "org.freedesktop.DBus.Deprecated".
 * @value: The value of the annotation.
 * @annotations: (array zero-terminated=1): A pointer to a %NULL-terminated array of pointers to #GDBusAnnotationInfo structures or %NULL if there are no annotations.
 *
 * Information about an annotation.
 *
 * Since: 2.26
  }
{< public > }
{ (atomic)  }
type
  PGDBusAnnotationInfo = ^TGDBusAnnotationInfo;
  TGDBusAnnotationInfo = record
      ref_count : Tgint;
      key : Pgchar;
      value : Pgchar;
      annotations : ^PGDBusAnnotationInfo;
    end;

{*
 * GDBusArgInfo:
 * @ref_count: The reference count or -1 if statically allocated.
 * @name: Name of the argument, e.g. @unix_user_id.
 * @signature: D-Bus signature of the argument (a single complete type).
 * @annotations: (array zero-terminated=1): A pointer to a %NULL-terminated array of pointers to #GDBusAnnotationInfo structures or %NULL if there are no annotations.
 *
 * Information about an argument for a method or a signal.
 *
 * Since: 2.26
  }
{< public > }
{ (atomic)  }
  PGDBusArgInfo = ^TGDBusArgInfo;
  TGDBusArgInfo = record
      ref_count : Tgint;
      name : Pgchar;
      signature : Pgchar;
      annotations : ^PGDBusAnnotationInfo;
    end;

{*
 * GDBusMethodInfo:
 * @ref_count: The reference count or -1 if statically allocated.
 * @name: The name of the D-Bus method, e.g. @RequestName.
 * @in_args: (array zero-terminated=1): A pointer to a %NULL-terminated array of pointers to #GDBusArgInfo structures or %NULL if there are no in arguments.
 * @out_args: (array zero-terminated=1): A pointer to a %NULL-terminated array of pointers to #GDBusArgInfo structures or %NULL if there are no out arguments.
 * @annotations: (array zero-terminated=1): A pointer to a %NULL-terminated array of pointers to #GDBusAnnotationInfo structures or %NULL if there are no annotations.
 *
 * Information about a method on an D-Bus interface.
 *
 * Since: 2.26
  }
{< public > }
{ (atomic)  }
  PGDBusMethodInfo = ^TGDBusMethodInfo;
  TGDBusMethodInfo = record
      ref_count : Tgint;
      name : Pgchar;
      in_args : ^PGDBusArgInfo;
      out_args : ^PGDBusArgInfo;
      annotations : ^PGDBusAnnotationInfo;
    end;

{*
 * GDBusSignalInfo:
 * @ref_count: The reference count or -1 if statically allocated.
 * @name: The name of the D-Bus signal, e.g. "NameOwnerChanged".
 * @args: (array zero-terminated=1): A pointer to a %NULL-terminated array of pointers to #GDBusArgInfo structures or %NULL if there are no arguments.
 * @annotations: (array zero-terminated=1): A pointer to a %NULL-terminated array of pointers to #GDBusAnnotationInfo structures or %NULL if there are no annotations.
 *
 * Information about a signal on a D-Bus interface.
 *
 * Since: 2.26
  }
{< public > }
{ (atomic)  }
  PGDBusSignalInfo = ^TGDBusSignalInfo;
  TGDBusSignalInfo = record
      ref_count : Tgint;
      name : Pgchar;
      args : ^PGDBusArgInfo;
      annotations : ^PGDBusAnnotationInfo;
    end;

{*
 * GDBusPropertyInfo:
 * @ref_count: The reference count or -1 if statically allocated.
 * @name: The name of the D-Bus property, e.g. "SupportedFilesystems".
 * @signature: The D-Bus signature of the property (a single complete type).
 * @flags: Access control flags for the property.
 * @annotations: (array zero-terminated=1): A pointer to a %NULL-terminated array of pointers to #GDBusAnnotationInfo structures or %NULL if there are no annotations.
 *
 * Information about a D-Bus property on a D-Bus interface.
 *
 * Since: 2.26
  }
{< public > }
{ (atomic)  }
  PGDBusPropertyInfo = ^TGDBusPropertyInfo;
  TGDBusPropertyInfo = record
      ref_count : Tgint;
      name : Pgchar;
      signature : Pgchar;
      flags : TGDBusPropertyInfoFlags;
      annotations : ^PGDBusAnnotationInfo;
    end;

{*
 * GDBusInterfaceInfo:
 * @ref_count: The reference count or -1 if statically allocated.
 * @name: The name of the D-Bus interface, e.g. "org.freedesktop.DBus.Properties".
 * @methods: (array zero-terminated=1): A pointer to a %NULL-terminated array of pointers to #GDBusMethodInfo structures or %NULL if there are no methods.
 * @signals: (array zero-terminated=1): A pointer to a %NULL-terminated array of pointers to #GDBusSignalInfo structures or %NULL if there are no signals.
 * @properties: (array zero-terminated=1): A pointer to a %NULL-terminated array of pointers to #GDBusPropertyInfo structures or %NULL if there are no properties.
 * @annotations: (array zero-terminated=1): A pointer to a %NULL-terminated array of pointers to #GDBusAnnotationInfo structures or %NULL if there are no annotations.
 *
 * Information about a D-Bus interface.
 *
 * Since: 2.26
  }
{< public > }
{ (atomic)  }
  PGDBusInterfaceInfo = ^TGDBusInterfaceInfo;
  TGDBusInterfaceInfo = record
      ref_count : Tgint;
      name : Pgchar;
      methods : ^PGDBusMethodInfo;
      signals : ^PGDBusSignalInfo;
      properties : ^PGDBusPropertyInfo;
      annotations : ^PGDBusAnnotationInfo;
    end;

{*
 * GDBusNodeInfo:
 * @ref_count: The reference count or -1 if statically allocated.
 * @path: The path of the node or %NULL if omitted. Note that this may be a relative path. See the D-Bus specification for more details.
 * @interfaces: (array zero-terminated=1): A pointer to a %NULL-terminated array of pointers to #GDBusInterfaceInfo structures or %NULL if there are no interfaces.
 * @nodes: (array zero-terminated=1): A pointer to a %NULL-terminated array of pointers to #GDBusNodeInfo structures or %NULL if there are no nodes.
 * @annotations: (array zero-terminated=1): A pointer to a %NULL-terminated array of pointers to #GDBusAnnotationInfo structures or %NULL if there are no annotations.
 *
 * Information about nodes in a remote object hierarchy.
 *
 * Since: 2.26
  }
{< public > }
{ (atomic)  }
  PGDBusNodeInfo = ^TGDBusNodeInfo;
  TGDBusNodeInfo = record
      ref_count : Tgint;
      path : Pgchar;
      interfaces : ^PGDBusInterfaceInfo;
      nodes : ^PGDBusNodeInfo;
      annotations : ^PGDBusAnnotationInfo;
    end;

(* Const before type ignored *)
(* Const before type ignored *)

function g_dbus_annotation_info_lookup(annotations:PPGDBusAnnotationInfo; name:Pgchar):Pgchar;cdecl;external;
(* Const before type ignored *)
function g_dbus_interface_info_lookup_method(info:PGDBusInterfaceInfo; name:Pgchar):PGDBusMethodInfo;cdecl;external;
(* Const before type ignored *)
function g_dbus_interface_info_lookup_signal(info:PGDBusInterfaceInfo; name:Pgchar):PGDBusSignalInfo;cdecl;external;
(* Const before type ignored *)
function g_dbus_interface_info_lookup_property(info:PGDBusInterfaceInfo; name:Pgchar):PGDBusPropertyInfo;cdecl;external;
procedure g_dbus_interface_info_cache_build(info:PGDBusInterfaceInfo);cdecl;external;
procedure g_dbus_interface_info_cache_release(info:PGDBusInterfaceInfo);cdecl;external;
procedure g_dbus_interface_info_generate_xml(info:PGDBusInterfaceInfo; indent:Tguint; string_builder:PGString);cdecl;external;
(* Const before type ignored *)
function g_dbus_node_info_new_for_xml(xml_data:Pgchar; error:PPGError):PGDBusNodeInfo;cdecl;external;
(* Const before type ignored *)
function g_dbus_node_info_lookup_interface(info:PGDBusNodeInfo; name:Pgchar):PGDBusInterfaceInfo;cdecl;external;
procedure g_dbus_node_info_generate_xml(info:PGDBusNodeInfo; indent:Tguint; string_builder:PGString);cdecl;external;
function g_dbus_node_info_ref(info:PGDBusNodeInfo):PGDBusNodeInfo;cdecl;external;
function g_dbus_interface_info_ref(info:PGDBusInterfaceInfo):PGDBusInterfaceInfo;cdecl;external;
function g_dbus_method_info_ref(info:PGDBusMethodInfo):PGDBusMethodInfo;cdecl;external;
function g_dbus_signal_info_ref(info:PGDBusSignalInfo):PGDBusSignalInfo;cdecl;external;
function g_dbus_property_info_ref(info:PGDBusPropertyInfo):PGDBusPropertyInfo;cdecl;external;
function g_dbus_arg_info_ref(info:PGDBusArgInfo):PGDBusArgInfo;cdecl;external;
function g_dbus_annotation_info_ref(info:PGDBusAnnotationInfo):PGDBusAnnotationInfo;cdecl;external;
procedure g_dbus_node_info_unref(info:PGDBusNodeInfo);cdecl;external;
procedure g_dbus_interface_info_unref(info:PGDBusInterfaceInfo);cdecl;external;
procedure g_dbus_method_info_unref(info:PGDBusMethodInfo);cdecl;external;
procedure g_dbus_signal_info_unref(info:PGDBusSignalInfo);cdecl;external;
procedure g_dbus_property_info_unref(info:PGDBusPropertyInfo);cdecl;external;
procedure g_dbus_arg_info_unref(info:PGDBusArgInfo);cdecl;external;
procedure g_dbus_annotation_info_unref(info:PGDBusAnnotationInfo);cdecl;external;
{*
 * G_TYPE_DBUS_NODE_INFO:
 *
 * The #GType for a boxed type holding a #GDBusNodeInfo.
 *
 * Since: 2.26
  }
{ was #define dname def_expr }
function G_TYPE_DBUS_NODE_INFO : longint; { return type might be wrong }

{*
 * G_TYPE_DBUS_INTERFACE_INFO:
 *
 * The #GType for a boxed type holding a #GDBusInterfaceInfo.
 *
 * Since: 2.26
  }
{ was #define dname def_expr }
function G_TYPE_DBUS_INTERFACE_INFO : longint; { return type might be wrong }

{*
 * G_TYPE_DBUS_METHOD_INFO:
 *
 * The #GType for a boxed type holding a #GDBusMethodInfo.
 *
 * Since: 2.26
  }
{ was #define dname def_expr }
function G_TYPE_DBUS_METHOD_INFO : longint; { return type might be wrong }

{*
 * G_TYPE_DBUS_SIGNAL_INFO:
 *
 * The #GType for a boxed type holding a #GDBusSignalInfo.
 *
 * Since: 2.26
  }
{ was #define dname def_expr }
function G_TYPE_DBUS_SIGNAL_INFO : longint; { return type might be wrong }

{*
 * G_TYPE_DBUS_PROPERTY_INFO:
 *
 * The #GType for a boxed type holding a #GDBusPropertyInfo.
 *
 * Since: 2.26
  }
{ was #define dname def_expr }
function G_TYPE_DBUS_PROPERTY_INFO : longint; { return type might be wrong }

{*
 * G_TYPE_DBUS_ARG_INFO:
 *
 * The #GType for a boxed type holding a #GDBusArgInfo.
 *
 * Since: 2.26
  }
{ was #define dname def_expr }
function G_TYPE_DBUS_ARG_INFO : longint; { return type might be wrong }

{*
 * G_TYPE_DBUS_ANNOTATION_INFO:
 *
 * The #GType for a boxed type holding a #GDBusAnnotationInfo.
 *
 * Since: 2.26
  }
{ was #define dname def_expr }
function G_TYPE_DBUS_ANNOTATION_INFO : longint; { return type might be wrong }

function g_dbus_node_info_get_type:TGType;cdecl;external;
function g_dbus_interface_info_get_type:TGType;cdecl;external;
function g_dbus_method_info_get_type:TGType;cdecl;external;
function g_dbus_signal_info_get_type:TGType;cdecl;external;
function g_dbus_property_info_get_type:TGType;cdecl;external;
function g_dbus_arg_info_get_type:TGType;cdecl;external;
function g_dbus_annotation_info_get_type:TGType;cdecl;external;
{$endif}
{ __G_DBUS_INTROSPECTION_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_DBUS_NODE_INFO : longint; { return type might be wrong }
  begin
    G_TYPE_DBUS_NODE_INFO:=g_dbus_node_info_get_type;
  end;

{ was #define dname def_expr }
function G_TYPE_DBUS_INTERFACE_INFO : longint; { return type might be wrong }
  begin
    G_TYPE_DBUS_INTERFACE_INFO:=g_dbus_interface_info_get_type;
  end;

{ was #define dname def_expr }
function G_TYPE_DBUS_METHOD_INFO : longint; { return type might be wrong }
  begin
    G_TYPE_DBUS_METHOD_INFO:=g_dbus_method_info_get_type;
  end;

{ was #define dname def_expr }
function G_TYPE_DBUS_SIGNAL_INFO : longint; { return type might be wrong }
  begin
    G_TYPE_DBUS_SIGNAL_INFO:=g_dbus_signal_info_get_type;
  end;

{ was #define dname def_expr }
function G_TYPE_DBUS_PROPERTY_INFO : longint; { return type might be wrong }
  begin
    G_TYPE_DBUS_PROPERTY_INFO:=g_dbus_property_info_get_type;
  end;

{ was #define dname def_expr }
function G_TYPE_DBUS_ARG_INFO : longint; { return type might be wrong }
  begin
    G_TYPE_DBUS_ARG_INFO:=g_dbus_arg_info_get_type;
  end;

{ was #define dname def_expr }
function G_TYPE_DBUS_ANNOTATION_INFO : longint; { return type might be wrong }
  begin
    G_TYPE_DBUS_ANNOTATION_INFO:=g_dbus_annotation_info_get_type;
  end;


end.
