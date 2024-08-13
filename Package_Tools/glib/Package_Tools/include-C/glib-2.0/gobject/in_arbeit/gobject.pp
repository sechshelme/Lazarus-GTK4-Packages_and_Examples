
unit gobject;
interface

{
  Automatically converted by H2Pas 1.0.0 from gobject.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gobject.h
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
Pgchar  = ^gchar;
PGClosure  = ^GClosure;
PGData  = ^GData;
PGDestroyNotify  = ^GDestroyNotify;
PGObject  = ^GObject;
PGObjectClass  = ^GObjectClass;
PGObjectConstructParam  = ^GObjectConstructParam;
PGParameter  = ^GParameter;
PGParamSpec  = ^GParamSpec;
Pgpointer  = ^gpointer;
PGSList  = ^GSList;
Pguint  = ^guint;
PGValue  = ^GValue;
PGWeakRef  = ^GWeakRef;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GObject - GLib Type, Object, Parameter and Signal Library
 * Copyright (C) 1998-1999, 2000-2001 Tim Janik and Red Hat, Inc.
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
{$ifndef __G_OBJECT_H__}
{$define __G_OBJECT_H__}
{$if !defined (__GLIB_GOBJECT_H_INSIDE__) && !defined (GOBJECT_COMPILATION)}
{$error "Only <glib-object.h> can be included directly."}
{$endif}
{$include        <gobject/gtype.h>}
{$include        <gobject/gvalue.h>}
{$include        <gobject/gparam.h>}
{$include        <gobject/gclosure.h>}
{$include        <gobject/gsignal.h>}
{$include        <gobject/gboxed.h>}
{ --- type macros ---  }
{*
 * G_TYPE_IS_OBJECT:
 * @type: Type id to check
 * 
 * Check if the passed in type id is a %G_TYPE_OBJECT or derived from it.
 * 
 * Returns: %FALSE or %TRUE, indicating whether @type is a %G_TYPE_OBJECT.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function G_TYPE_IS_OBJECT(_type : longint) : longint;

{*
 * G_OBJECT:
 * @object: Object which is subject to casting.
 * 
 * Casts a #GObject or derived pointer into a (GObject*) pointer.
 *
 * Depending on the current debugging level, this function may invoke
 * certain runtime checks to identify invalid casts.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_OBJECT(object : longint) : longint;

{*
 * G_OBJECT_CLASS:
 * @class: a valid #GObjectClass
 * 
 * Casts a derived #GObjectClass structure into a #GObjectClass structure.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_OBJECT_CLASS(_class : longint) : longint;

{*
 * G_IS_OBJECT:
 * @object: Instance to check for being a %G_TYPE_OBJECT.
 * 
 * Checks whether a valid #GTypeInstance pointer is of type %G_TYPE_OBJECT.
  }
{$if GLIB_VERSION_MAX_ALLOWED >= GLIB_VERSION_2_42}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function G_IS_OBJECT(object : longint) : longint;

{$else}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function G_IS_OBJECT(object : longint) : longint;

{$endif}
{*
 * G_IS_OBJECT_CLASS:
 * @class: a #GObjectClass
 * 
 * Checks whether @class "is a" valid #GObjectClass structure of type
 * %G_TYPE_OBJECT or derived.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function G_IS_OBJECT_CLASS(_class : longint) : longint;

{*
 * G_OBJECT_GET_CLASS:
 * @object: a #GObject instance.
 * 
 * Get the class structure associated to a #GObject instance.
 *
 * Returns: pointer to object class structure.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_OBJECT_GET_CLASS(object : longint) : longint;

{*
 * G_OBJECT_TYPE:
 * @object: Object to return the type id for.
 * 
 * Get the type id of an object.
 * 
 * Returns: Type id of @object.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_OBJECT_TYPE(object : longint) : longint;

{*
 * G_OBJECT_TYPE_NAME:
 * @object: Object to return the type name for.
 * 
 * Get the name of an object's type.
 * 
 * Returns: Type name of @object. The string is owned by the type system and 
 *  should not be freed.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_OBJECT_TYPE_NAME(object : longint) : longint;

{*
 * G_OBJECT_CLASS_TYPE:
 * @class: a valid #GObjectClass
 * 
 * Get the type id of a class structure.
 * 
 * Returns: Type id of @class.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_OBJECT_CLASS_TYPE(_class : longint) : longint;

{*
 * G_OBJECT_CLASS_NAME:
 * @class: a valid #GObjectClass
 * 
 * Return the name of a class structure's type.
 * 
 * Returns: Type name of @class. The string is owned by the type system and 
 *  should not be freed.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_OBJECT_CLASS_NAME(_class : longint) : longint;

{*
 * G_VALUE_HOLDS_OBJECT:
 * @value: a valid #GValue structure
 * 
 * Checks whether the given #GValue can hold values derived from type %G_TYPE_OBJECT.
 * 
 * Returns: %TRUE on success.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_VALUE_HOLDS_OBJECT(value : longint) : longint;

{ --- type macros ---  }
{*
 * G_TYPE_INITIALLY_UNOWNED:
 * 
 * The type for #GInitiallyUnowned.
  }
{ was #define dname def_expr }
function G_TYPE_INITIALLY_UNOWNED : longint; { return type might be wrong }

{*
 * G_INITIALLY_UNOWNED:
 * @object: Object which is subject to casting.
 * 
 * Casts a #GInitiallyUnowned or derived pointer into a (GInitiallyUnowned*) 
 * pointer.
 *
 * Depending on the current debugging level, this function may invoke
 * certain runtime checks to identify invalid casts.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_INITIALLY_UNOWNED(object : longint) : longint;

{*
 * G_INITIALLY_UNOWNED_CLASS:
 * @class: a valid #GInitiallyUnownedClass
 * 
 * Casts a derived #GInitiallyUnownedClass structure into a
 * #GInitiallyUnownedClass structure.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_INITIALLY_UNOWNED_CLASS(_class : longint) : longint;

{*
 * G_IS_INITIALLY_UNOWNED:
 * @object: Instance to check for being a %G_TYPE_INITIALLY_UNOWNED.
 * 
 * Checks whether a valid #GTypeInstance pointer is of type %G_TYPE_INITIALLY_UNOWNED.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_INITIALLY_UNOWNED(object : longint) : longint;

{*
 * G_IS_INITIALLY_UNOWNED_CLASS:
 * @class: a #GInitiallyUnownedClass
 * 
 * Checks whether @class "is a" valid #GInitiallyUnownedClass structure of type
 * %G_TYPE_INITIALLY_UNOWNED or derived.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_INITIALLY_UNOWNED_CLASS(_class : longint) : longint;

{*
 * G_INITIALLY_UNOWNED_GET_CLASS:
 * @object: a #GInitiallyUnowned instance.
 * 
 * Get the class structure associated to a #GInitiallyUnowned instance.
 *
 * Returns: pointer to object class structure.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_INITIALLY_UNOWNED_GET_CLASS(object : longint) : longint;

{ GInitiallyUnowned ia a GObject with initially floating reference count  }
{ --- typedefs & structures ---  }
type
  TGObject = TGInitiallyUnowned;
  TGObjectClass = TGInitiallyUnownedClass;
{*
 * GObjectGetPropertyFunc:
 * @object: a #GObject
 * @property_id: the numeric id under which the property was registered with
 *  g_object_class_install_property().
 * @value: a #GValue to return the property value in
 * @pspec: the #GParamSpec describing the property
 * 
 * The type of the @get_property function of #GObjectClass. 
  }

  TGObjectGetPropertyFunc = procedure (object:PGObject; property_id:Tguint; value:PGValue; pspec:PGParamSpec);cdecl;
{*
 * GObjectSetPropertyFunc:
 * @object: a #GObject
 * @property_id: the numeric id under which the property was registered with
 *  g_object_class_install_property().
 * @value: the new value for the property
 * @pspec: the #GParamSpec describing the property
 * 
 * The type of the @set_property function of #GObjectClass. 
  }
(* Const before type ignored *)

  TGObjectSetPropertyFunc = procedure (object:PGObject; property_id:Tguint; value:PGValue; pspec:PGParamSpec);cdecl;
{*
 * GObjectFinalizeFunc:
 * @object: the #GObject being finalized
 * 
 * The type of the @finalize function of #GObjectClass.
  }

  TGObjectFinalizeFunc = procedure (object:PGObject);cdecl;
{*
 * GWeakNotify:
 * @data: data that was provided when the weak reference was established
 * @where_the_object_was: the object being disposed
 * 
 * A #GWeakNotify function can be added to an object as a callback that gets
 * triggered when the object is finalized.
 *
 * Since the object is already being disposed when the #GWeakNotify is called,
 * there's not much you could do with the object, apart from e.g. using its
 * address as hash-index or the like.
 *
 * In particular, this means it’s invalid to call g_object_ref(),
 * g_weak_ref_init(), g_weak_ref_set(), g_object_add_toggle_ref(),
 * g_object_weak_ref(), g_object_add_weak_pointer() or any function which calls
 * them on the object from this callback.
  }

  TGWeakNotify = procedure (data:Tgpointer; where_the_object_was:PGObject);cdecl;
{< private > }
{ (atomic)  }
  PGObject = ^TGObject;
  TGObject = record
      g_type_instance : TGTypeInstance;cdecl;
      ref_count : Tguint;
      qdata : PGData;
    end;

{*
 * GObjectClass:
 * @g_type_class: the parent class
 * @constructor: the @constructor function is called by g_object_new () to 
 *  complete the object initialization after all the construction properties are
 *  set. The first thing a @constructor implementation must do is chain up to the
 *  @constructor of the parent class. Overriding @constructor should be rarely 
 *  needed, e.g. to handle construct properties, or to implement singletons.
 * @set_property: the generic setter for all properties of this type. Should be
 *  overridden for every type with properties. If implementations of
 *  @set_property don't emit property change notification explicitly, this will
 *  be done implicitly by the type system. However, if the notify signal is
 *  emitted explicitly, the type system will not emit it a second time.
 * @get_property: the generic getter for all properties of this type. Should be
 *  overridden for every type with properties.
 * @dispose: the @dispose function is supposed to drop all references to other 
 *  objects, but keep the instance otherwise intact, so that client method 
 *  invocations still work. It may be run multiple times (due to reference 
 *  loops). Before returning, @dispose should chain up to the @dispose method 
 *  of the parent class.
 * @finalize: instance finalization function, should finish the finalization of 
 *  the instance begun in @dispose and chain up to the @finalize method of the 
 *  parent class.
 * @dispatch_properties_changed: emits property change notification for a bunch
 *  of properties. Overriding @dispatch_properties_changed should be rarely 
 *  needed.
 * @notify: the class closure for the notify signal
 * @constructed: the @constructed function is called by g_object_new() as the
 *  final step of the object creation process.  At the point of the call, all
 *  construction properties have been set on the object.  The purpose of this
 *  call is to allow for object initialisation steps that can only be performed
 *  after construction properties have been set.  @constructed implementors
 *  should chain up to the @constructed call of their parent class to allow it
 *  to complete its initialisation.
 * 
 * The class structure for the GObject type.
 * 
 * |[<!-- language="C" -->
 * // Example of implementing a singleton using a constructor.
 * static MySingleton *the_singleton = NULL;
 * 
 * static GObject*
 * my_singleton_constructor (GType                  type,
 *                           guint                  n_construct_params,
 *                           GObjectConstructParam *construct_params)
 * 
 *   GObject *object;
 *   
 *   if (!the_singleton)
 *     
 *       object = G_OBJECT_CLASS (parent_class)->constructor (type,
 *                                                            n_construct_params,
 *                                                            construct_params);
 *       the_singleton = MY_SINGLETON (object);
 *     
 *   else
 *     object = g_object_ref (G_OBJECT (the_singleton));
 * 
 *   return object;
 * 
 * ]|
  }
{< private > }
{< public > }
{ seldom overridden  }
{ overridable methods  }
(* Const before type ignored *)
{ seldom overridden  }
{ signals  }
{ called when done constructing  }
{< private > }
{ padding  }
  PGObjectClass = ^TGObjectClass;
  TGObjectClass = record
      g_type_class : TGTypeClass;
      construct_properties : PGSList;
      constructor : function (_type:TGType; n_construct_properties:Tguint; construct_properties:PGObjectConstructParam):PGObject;cdecl;
      set_property : procedure (object:PGObject; property_id:Tguint; value:PGValue; pspec:PGParamSpec);cdecl;
      get_property : procedure (object:PGObject; property_id:Tguint; value:PGValue; pspec:PGParamSpec);cdecl;
      _dispose : procedure (object:PGObject);cdecl;
      finalize : procedure (object:PGObject);cdecl;
      dispatch_properties_changed : procedure (object:PGObject; n_pspecs:Tguint; pspecs:PPGParamSpec);cdecl;
      notify : procedure (object:PGObject; pspec:PGParamSpec);cdecl;
      constructed : procedure (object:PGObject);cdecl;
      flags : Tgsize;
      n_construct_properties : Tgsize;
      pspecs : Tgpointer;
      n_pspecs : Tgsize;
      pdummy : array[0..2] of Tgpointer;
    end;

{*
 * GObjectConstructParam:
 * @pspec: the #GParamSpec of the construct parameter
 * @value: the value to set the parameter to
 * 
 * The GObjectConstructParam struct is an auxiliary structure used to hand
 * #GParamSpec/#GValue pairs to the @constructor of a #GObjectClass.
  }
  PGObjectConstructParam = ^TGObjectConstructParam;
  TGObjectConstructParam = record
      pspec : PGParamSpec;
      value : PGValue;
    end;

{*
 * GInitiallyUnowned:
 *
 * A type for objects that have an initially floating reference.
 * 
 * All the fields in the `GInitiallyUnowned` structure are private to the
 * implementation and should never be accessed directly.
  }
{*
 * GInitiallyUnownedClass:
 * 
 * The class structure for the GInitiallyUnowned type.
  }
{ --- prototypes ---  }

function g_initially_unowned_get_type:TGType;cdecl;external;
procedure g_object_class_install_property(oclass:PGObjectClass; property_id:Tguint; pspec:PGParamSpec);cdecl;external;
(* Const before type ignored *)
function g_object_class_find_property(oclass:PGObjectClass; property_name:Pgchar):PGParamSpec;cdecl;external;
function g_object_class_list_properties(oclass:PGObjectClass; n_properties:Pguint):^PGParamSpec;cdecl;external;
(* Const before type ignored *)
procedure g_object_class_override_property(oclass:PGObjectClass; property_id:Tguint; name:Pgchar);cdecl;external;
procedure g_object_class_install_properties(oclass:PGObjectClass; n_pspecs:Tguint; pspecs:PPGParamSpec);cdecl;external;
procedure g_object_interface_install_property(g_iface:Tgpointer; pspec:PGParamSpec);cdecl;external;
(* Const before type ignored *)
function g_object_interface_find_property(g_iface:Tgpointer; property_name:Pgchar):PGParamSpec;cdecl;external;
function g_object_interface_list_properties(g_iface:Tgpointer; n_properties_p:Pguint):^PGParamSpec;cdecl;external;
function g_object_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function g_object_new(object_type:TGType; first_property_name:Pgchar; args:array of const):Tgpointer;cdecl;external;
function g_object_new(object_type:TGType; first_property_name:Pgchar):Tgpointer;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_object_new_with_properties(object_type:TGType; n_properties:Tguint; names:PPchar; values:PGValue):PGObject;cdecl;external;
function g_object_newv(object_type:TGType; n_parameters:Tguint; parameters:PGParameter):Tgpointer;cdecl;external;
(* Const before type ignored *)
function g_object_new_valist(object_type:TGType; first_property_name:Pgchar; var_args:Tva_list):PGObject;cdecl;external;
(* Const before type ignored *)
procedure g_object_set(object:Tgpointer; first_property_name:Pgchar; args:array of const);cdecl;external;
procedure g_object_set(object:Tgpointer; first_property_name:Pgchar);cdecl;external;
(* Const before type ignored *)
procedure g_object_get(object:Tgpointer; first_property_name:Pgchar; args:array of const);cdecl;external;
procedure g_object_get(object:Tgpointer; first_property_name:Pgchar);cdecl;external;
(* Const before type ignored *)
function g_object_connect(object:Tgpointer; signal_spec:Pgchar; args:array of const):Tgpointer;cdecl;external;
function g_object_connect(object:Tgpointer; signal_spec:Pgchar):Tgpointer;cdecl;external;
(* Const before type ignored *)
procedure g_object_disconnect(object:Tgpointer; signal_spec:Pgchar; args:array of const);cdecl;external;
procedure g_object_disconnect(object:Tgpointer; signal_spec:Pgchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure g_object_setv(object:PGObject; n_properties:Tguint; names:PPgchar; values:PGValue);cdecl;external;
(* Const before type ignored *)
procedure g_object_set_valist(object:PGObject; first_property_name:Pgchar; var_args:Tva_list);cdecl;external;
(* Const before type ignored *)
procedure g_object_getv(object:PGObject; n_properties:Tguint; names:PPgchar; values:PGValue);cdecl;external;
(* Const before type ignored *)
procedure g_object_get_valist(object:PGObject; first_property_name:Pgchar; var_args:Tva_list);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure g_object_set_property(object:PGObject; property_name:Pgchar; value:PGValue);cdecl;external;
(* Const before type ignored *)
procedure g_object_get_property(object:PGObject; property_name:Pgchar; value:PGValue);cdecl;external;
procedure g_object_freeze_notify(object:PGObject);cdecl;external;
(* Const before type ignored *)
procedure g_object_notify(object:PGObject; property_name:Pgchar);cdecl;external;
procedure g_object_notify_by_pspec(object:PGObject; pspec:PGParamSpec);cdecl;external;
procedure g_object_thaw_notify(object:PGObject);cdecl;external;
function g_object_is_floating(object:Tgpointer):Tgboolean;cdecl;external;
function g_object_ref_sink(object:Tgpointer):Tgpointer;cdecl;external;
function g_object_take_ref(object:Tgpointer):Tgpointer;cdecl;external;
function g_object_ref(object:Tgpointer):Tgpointer;cdecl;external;
procedure g_object_unref(object:Tgpointer);cdecl;external;
procedure g_object_weak_ref(object:PGObject; notify:TGWeakNotify; data:Tgpointer);cdecl;external;
procedure g_object_weak_unref(object:PGObject; notify:TGWeakNotify; data:Tgpointer);cdecl;external;
procedure g_object_add_weak_pointer(object:PGObject; weak_pointer_location:Pgpointer);cdecl;external;
procedure g_object_remove_weak_pointer(object:PGObject; weak_pointer_location:Pgpointer);cdecl;external;
{$if defined(glib_typeof) && GLIB_VERSION_MAX_ALLOWED >= GLIB_VERSION_2_56}
{ Make reference APIs type safe with macros  }
{#define g_object_ref(Obj) ((glib_typeof (Obj)) (g_object_ref) (Obj)) }
{#define g_object_ref_sink(Obj) ((glib_typeof (Obj)) (g_object_ref_sink) (Obj)) }
{$endif}
{*
 * GToggleNotify:
 * @data: Callback data passed to g_object_add_toggle_ref()
 * @object: The object on which g_object_add_toggle_ref() was called.
 * @is_last_ref: %TRUE if the toggle reference is now the
 *  last reference to the object. %FALSE if the toggle
 *  reference was the last reference and there are now other
 *  references.
 * 
 * A callback function used for notification when the state
 * of a toggle reference changes.
 *
 * See also: g_object_add_toggle_ref()
  }
type

  TGToggleNotify = procedure (data:Tgpointer; object:PGObject; is_last_ref:Tgboolean);cdecl;

procedure g_object_add_toggle_ref(object:PGObject; notify:TGToggleNotify; data:Tgpointer);cdecl;external;
procedure g_object_remove_toggle_ref(object:PGObject; notify:TGToggleNotify; data:Tgpointer);cdecl;external;
function g_object_get_qdata(object:PGObject; quark:TGQuark):Tgpointer;cdecl;external;
procedure g_object_set_qdata(object:PGObject; quark:TGQuark; data:Tgpointer);cdecl;external;
procedure g_object_set_qdata_full(object:PGObject; quark:TGQuark; data:Tgpointer; destroy:TGDestroyNotify);cdecl;external;
function g_object_steal_qdata(object:PGObject; quark:TGQuark):Tgpointer;cdecl;external;
function g_object_dup_qdata(object:PGObject; quark:TGQuark; dup_func:TGDuplicateFunc; user_data:Tgpointer):Tgpointer;cdecl;external;
function g_object_replace_qdata(object:PGObject; quark:TGQuark; oldval:Tgpointer; newval:Tgpointer; destroy:TGDestroyNotify; 
           old_destroy:PGDestroyNotify):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_object_get_data(object:PGObject; key:Pgchar):Tgpointer;cdecl;external;
(* Const before type ignored *)
procedure g_object_set_data(object:PGObject; key:Pgchar; data:Tgpointer);cdecl;external;
(* Const before type ignored *)
procedure g_object_set_data_full(object:PGObject; key:Pgchar; data:Tgpointer; destroy:TGDestroyNotify);cdecl;external;
(* Const before type ignored *)
function g_object_steal_data(object:PGObject; key:Pgchar):Tgpointer;cdecl;external;
(* Const before type ignored *)
function g_object_dup_data(object:PGObject; key:Pgchar; dup_func:TGDuplicateFunc; user_data:Tgpointer):Tgpointer;cdecl;external;
(* Const before type ignored *)
function g_object_replace_data(object:PGObject; key:Pgchar; oldval:Tgpointer; newval:Tgpointer; destroy:TGDestroyNotify; 
           old_destroy:PGDestroyNotify):Tgboolean;cdecl;external;
procedure g_object_watch_closure(object:PGObject; closure:PGClosure);cdecl;external;
function g_cclosure_new_object(callback_func:TGCallback; object:PGObject):PGClosure;cdecl;external;
function g_cclosure_new_object_swap(callback_func:TGCallback; object:PGObject):PGClosure;cdecl;external;
function g_closure_new_object(sizeof_closure:Tguint; object:PGObject):PGClosure;cdecl;external;
procedure g_value_set_object(value:PGValue; v_object:Tgpointer);cdecl;external;
(* Const before type ignored *)
function g_value_get_object(value:PGValue):Tgpointer;cdecl;external;
(* Const before type ignored *)
function g_value_dup_object(value:PGValue):Tgpointer;cdecl;external;
(* Const before type ignored *)
function g_signal_connect_object(instance:Tgpointer; detailed_signal:Pgchar; c_handler:TGCallback; gobject:Tgpointer; connect_flags:TGConnectFlags):Tgulong;cdecl;external;
{< protected > }
procedure g_object_force_floating(object:PGObject);cdecl;external;
procedure g_object_run_dispose(object:PGObject);cdecl;external;
procedure g_value_take_object(value:PGValue; v_object:Tgpointer);cdecl;external;
procedure g_value_set_object_take_ownership(value:PGValue; v_object:Tgpointer);cdecl;external;
function g_object_compat_control(what:Tgsize; data:Tgpointer):Tgsize;cdecl;external;
{ --- implementation macros ---  }
{
#define G_OBJECT_WARN_INVALID_PSPEC(object, pname, property_id, pspec) \
G_STMT_START  \
  GObject *_glib__object = (GObject*) (object); \
  GParamSpec *_glib__pspec = (GParamSpec*) (pspec); \
  guint _glib__property_id = (property_id); \
  g_warning ("%s:%d: invalid %s id %u for \"%s\" of type '%s' in '%s'", \
             __FILE__, __LINE__, \
             (pname), \
             _glib__property_id, \
             _glib__pspec->name, \
             g_type_name (G_PARAM_SPEC_TYPE (_glib__pspec)), \
             G_OBJECT_TYPE_NAME (_glib__object)); \
 G_STMT_END
 }
{*
 * G_OBJECT_WARN_INVALID_PROPERTY_ID:
 * @object: the #GObject on which set_property() or get_property() was called
 * @property_id: the numeric id of the property
 * @pspec: the #GParamSpec of the property
 * 
 * This macro should be used to emit a standard warning about unexpected 
 * properties in set_property() and get_property() implementations.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_OBJECT_WARN_INVALID_PROPERTY_ID(object,property_id,pspec : longint) : longint;

procedure g_clear_object(object_ptr:PPGObject);cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_clear_object(object_ptr : longint) : longint;

{*
 * g_set_object: (skip)
 * @object_ptr: (inout) (not optional) (nullable): a pointer to a #GObject reference
 * @new_object: (nullable) (transfer none): a pointer to the new #GObject to
 *   assign to @object_ptr, or %NULL to clear the pointer
 *
 * Updates a #GObject pointer to refer to @new_object.
 *
 * It increments the reference count of @new_object (if non-%NULL), decrements
 * the reference count of the current value of @object_ptr (if non-%NULL), and
 * assigns @new_object to @object_ptr. The assignment is not atomic.
 *
 * @object_ptr must not be %NULL, but can point to a %NULL value.
 *
 * A macro is also included that allows this function to be used without
 * pointer casts. The function itself is static inline, so its address may vary
 * between compilation units.
 *
 * One convenient usage of this function is in implementing property setters:
 * |[
 *   void
 *   foo_set_bar (Foo *foo,
 *                Bar *new_bar)
 *   
 *     g_return_if_fail (IS_FOO (foo));
 *     g_return_if_fail (new_bar == NULL || IS_BAR (new_bar));
 *
 *     if (g_set_object (&foo->bar, new_bar))
 *       g_object_notify (foo, "bar");
 *   
 * ]|
 *
 * Returns: %TRUE if the value of @object_ptr changed, %FALSE otherwise
 *
 * Since: 2.44
  }
{
static inline gboolean
(g_set_object) (GObject **object_ptr,
                GObject  *new_object)

  GObject *old_object = *object_ptr;

  if (old_object == new_object)
    return FALSE;

  if (new_object != NULL)
    g_object_ref (new_object);

  *object_ptr = new_object;

  if (old_object != NULL)
    g_object_unref (old_object);

  return TRUE;

 }
{ We need GCC for __extension__, which we need to sort out strict aliasing of @object_ptr  }
{$if defined(__GNUC__)}
{$define g_set_obje}
{ct(object_ptr, new_object) \
  (G_GNUC_EXTENSION ( \
    G_STATIC_ASSERT (sizeof *(object_ptr) == sizeof (new_object)); \
    union  char *in; GObject **out;  _object_ptr; \
    _object_ptr.in = (char *) (object_ptr); \
    (void) (0 ? *(object_ptr) = (new_object), FALSE : FALSE); \
    (g_set_object) (_object_ptr.out, (GObject *) new_object); \
  )) \
  GOBJECT_AVAILABLE_MACRO_IN_2_44

#else  

#define g_set_object(object_ptr, new_object) \
  0 ? *(object_ptr) = (new_object), FALSE : \
  (g_set_object) ((GObject **) (object_ptr), (GObject *) (new_object)) \
 )

#endif 
 }
{*
 * g_assert_finalize_object: (skip)
 * @object: (transfer full) (type GObject.Object): an object
 *
 * Assert that @object is non-%NULL, then release one reference to it with
 * g_object_unref() and assert that it has been finalized (i.e. that there
 * are no more references).
 *
 * If assertions are disabled via `G_DISABLE_ASSERT`,
 * this macro just calls g_object_unref() without any further checks.
 *
 * This macro should only be used in regression tests.
 *
 * Since: 2.62
  }
{
static inline void
(g_assert_finalize_object) (GObject *object)

  gpointer weak_pointer = object;

  g_assert_true (G_IS_OBJECT (weak_pointer));
  g_object_add_weak_pointer (object, &weak_pointer);
  g_object_unref (weak_pointer);
  g_assert_null (weak_pointer);

 }
{#ifdef G_DISABLE_ASSERT }
{#define g_assert_finalize_object(object) g_object_unref (object) }
{#else }
{#define g_assert_finalize_object(object) (g_assert_finalize_object ((GObject *) object)) }
{#endif }
{*
 * g_clear_weak_pointer: (skip)
 * @weak_pointer_location: The memory address of a pointer
 *
 * Clears a weak reference to a #GObject.
 *
 * @weak_pointer_location must not be %NULL.
 *
 * If the weak reference is %NULL then this function does nothing.
 * Otherwise, the weak reference to the object is removed for that location
 * and the pointer is set to %NULL.
 *
 * A macro is also included that allows this function to be used without
 * pointer casts. The function itself is static inline, so its address may vary
 * between compilation units.
 *
 * Since: 2.56
  }
{
static inline void
(g_clear_weak_pointer) (gpointer *weak_pointer_location)

  GObject *object = (GObject *) *weak_pointer_location;

  if (object != NULL)
    
      g_object_remove_weak_pointer (object, weak_pointer_location);
      *weak_pointer_location = NULL;
    


#define g_clear_weak_pointer(weak_pointer_location) \
  (g_clear_weak_pointer) ((gpointer *) (weak_pointer_location)) \
 )
 }
{*
 * g_set_weak_pointer: (skip)
 * @weak_pointer_location: the memory address of a pointer
 * @new_object: (nullable) (transfer none): a pointer to the new #GObject to
 *   assign to it, or %NULL to clear the pointer
 *
 * Updates a pointer to weakly refer to @new_object.
 *
 * It assigns @new_object to @weak_pointer_location and ensures
 * that @weak_pointer_location will automatically be set to %NULL
 * if @new_object gets destroyed. The assignment is not atomic.
 * The weak reference is not thread-safe, see g_object_add_weak_pointer()
 * for details.
 *
 * The @weak_pointer_location argument must not be %NULL.
 *
 * A macro is also included that allows this function to be used without
 * pointer casts. The function itself is static inline, so its address may vary
 * between compilation units.
 *
 * One convenient usage of this function is in implementing property setters:
 * |[
 *   void
 *   foo_set_bar (Foo *foo,
 *                Bar *new_bar)
 *   
 *     g_return_if_fail (IS_FOO (foo));
 *     g_return_if_fail (new_bar == NULL || IS_BAR (new_bar));
 *
 *     if (g_set_weak_pointer (&foo->bar, new_bar))
 *       g_object_notify (foo, "bar");
 *   
 * ]|
 *
 * Returns: %TRUE if the value of @weak_pointer_location changed, %FALSE otherwise
 *
 * Since: 2.56
  }
{
static inline gboolean
(g_set_weak_pointer) (gpointer *weak_pointer_location,
                      GObject  *new_object)

  GObject *old_object = (GObject *) *weak_pointer_location;


  if (old_object == new_object)
    return FALSE;

  if (old_object != NULL)
    g_object_remove_weak_pointer (old_object, weak_pointer_location);

  *weak_pointer_location = new_object;

  if (new_object != NULL)
    g_object_add_weak_pointer (new_object, weak_pointer_location);

  return TRUE;


#define g_set_weak_pointer(weak_pointer_location, new_object) \
  0 ? *(weak_pointer_location) = (new_object), FALSE : \
  (g_set_weak_pointer) ((gpointer *) (weak_pointer_location), (GObject *) (new_object)) \
 )
 }
{<private> }
type
  PGWeakRef = ^TGWeakRef;
  TGWeakRef = record
      priv : record
          case longint of
            0 : ( p : Tgpointer );
          end;
    end;

procedure g_weak_ref_init(weak_ref:PGWeakRef; object:Tgpointer);cdecl;external;
procedure g_weak_ref_clear(weak_ref:PGWeakRef);cdecl;external;
function g_weak_ref_get(weak_ref:PGWeakRef):Tgpointer;cdecl;external;
procedure g_weak_ref_set(weak_ref:PGWeakRef; object:Tgpointer);cdecl;external;
{$endif}
{ __G_OBJECT_H__  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_IS_OBJECT(_type : longint) : longint;
begin
  G_TYPE_IS_OBJECT:=(G_TYPE_FUNDAMENTAL(_type))=G_TYPE_OBJECT;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_OBJECT(object : longint) : longint;
begin
  G_OBJECT:=G_TYPE_CHECK_INSTANCE_CAST(object,G_TYPE_OBJECT,GObject);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_OBJECT_CLASS(_class : longint) : longint;
begin
  G_OBJECT_CLASS:=G_TYPE_CHECK_CLASS_CAST(_class,G_TYPE_OBJECT,GObjectClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_OBJECT(object : longint) : longint;
begin
  G_IS_OBJECT:=G_TYPE_CHECK_INSTANCE_FUNDAMENTAL_TYPE(object,G_TYPE_OBJECT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_OBJECT(object : longint) : longint;
begin
  G_IS_OBJECT:=G_TYPE_CHECK_INSTANCE_TYPE(object,G_TYPE_OBJECT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_OBJECT_CLASS(_class : longint) : longint;
begin
  G_IS_OBJECT_CLASS:=G_TYPE_CHECK_CLASS_TYPE(_class,G_TYPE_OBJECT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_OBJECT_GET_CLASS(object : longint) : longint;
begin
  G_OBJECT_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(object,G_TYPE_OBJECT,GObjectClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_OBJECT_TYPE(object : longint) : longint;
begin
  G_OBJECT_TYPE:=G_TYPE_FROM_INSTANCE(object);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_OBJECT_TYPE_NAME(object : longint) : longint;
begin
  G_OBJECT_TYPE_NAME:=g_type_name(G_OBJECT_TYPE(object));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_OBJECT_CLASS_TYPE(_class : longint) : longint;
begin
  G_OBJECT_CLASS_TYPE:=G_TYPE_FROM_CLASS(_class);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_OBJECT_CLASS_NAME(_class : longint) : longint;
begin
  G_OBJECT_CLASS_NAME:=g_type_name(G_OBJECT_CLASS_TYPE(_class));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_VALUE_HOLDS_OBJECT(value : longint) : longint;
begin
  G_VALUE_HOLDS_OBJECT:=G_TYPE_CHECK_VALUE_TYPE(value,G_TYPE_OBJECT);
end;

{ was #define dname def_expr }
function G_TYPE_INITIALLY_UNOWNED : longint; { return type might be wrong }
  begin
    G_TYPE_INITIALLY_UNOWNED:=g_initially_unowned_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_INITIALLY_UNOWNED(object : longint) : longint;
begin
  G_INITIALLY_UNOWNED:=G_TYPE_CHECK_INSTANCE_CAST(object,G_TYPE_INITIALLY_UNOWNED,GInitiallyUnowned);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_INITIALLY_UNOWNED_CLASS(_class : longint) : longint;
begin
  G_INITIALLY_UNOWNED_CLASS:=G_TYPE_CHECK_CLASS_CAST(_class,G_TYPE_INITIALLY_UNOWNED,GInitiallyUnownedClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_INITIALLY_UNOWNED(object : longint) : longint;
begin
  G_IS_INITIALLY_UNOWNED:=G_TYPE_CHECK_INSTANCE_TYPE(object,G_TYPE_INITIALLY_UNOWNED);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_INITIALLY_UNOWNED_CLASS(_class : longint) : longint;
begin
  G_IS_INITIALLY_UNOWNED_CLASS:=G_TYPE_CHECK_CLASS_TYPE(_class,G_TYPE_INITIALLY_UNOWNED);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_INITIALLY_UNOWNED_GET_CLASS(object : longint) : longint;
begin
  G_INITIALLY_UNOWNED_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(object,G_TYPE_INITIALLY_UNOWNED,GInitiallyUnownedClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_OBJECT_WARN_INVALID_PROPERTY_ID(object,property_id,pspec : longint) : longint;
begin
  G_OBJECT_WARN_INVALID_PROPERTY_ID:=G_OBJECT_WARN_INVALID_PSPEC(object,'property',property_id,pspec);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_clear_object(object_ptr : longint) : longint;
begin
  g_clear_object:=g_clear_pointer(object_ptr,g_object_unref);
end;


end.
