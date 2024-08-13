
unit gsignal;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsignal.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsignal.h
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
PGClosure  = ^GClosure;
PGConnectFlags  = ^GConnectFlags;
PGQuark  = ^GQuark;
PGSignalCMarshaller  = ^GSignalCMarshaller;
PGSignalCVaMarshaller  = ^GSignalCVaMarshaller;
PGSignalFlags  = ^GSignalFlags;
PGSignalInvocationHint  = ^GSignalInvocationHint;
PGSignalMatchType  = ^GSignalMatchType;
PGSignalQuery  = ^GSignalQuery;
PGType  = ^GType;
Pguint  = ^guint;
Pgulong  = ^gulong;
PGValue  = ^GValue;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GObject - GLib Type, Object, Parameter and Signal Library
 * Copyright (C) 2000-2001 Red Hat, Inc.
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
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General
 * Public License along with this library; if not, see <http://www.gnu.org/licenses/>.
  }
{$ifndef __G_SIGNAL_H__}
{$define __G_SIGNAL_H__}
{$if !defined (__GLIB_GOBJECT_H_INSIDE__) && !defined (GOBJECT_COMPILATION)}
{$error "Only <glib-object.h> can be included directly."}
{$endif}
{$include	<gobject/gclosure.h>}
{$include	<gobject/gvalue.h>}
{$include	<gobject/gparam.h>}
{$include	<gobject/gmarshal.h>}
{ --- typedefs ---  }
type
{*
 * GSignalCMarshaller:
 * 
 * This is the signature of marshaller functions, required to marshall
 * arrays of parameter values to signal emissions into C language callback
 * invocations.
 *
 * It is merely an alias to #GClosureMarshal since the #GClosure mechanism
 * takes over responsibility of actual function invocation for the signal
 * system.
  }

  PGSignalCMarshaller = ^TGSignalCMarshaller;
  TGSignalCMarshaller = TGClosureMarshal;
{*
 * GSignalCVaMarshaller:
 * 
 * This is the signature of va_list marshaller functions, an optional
 * marshaller that can be used in some situations to avoid
 * marshalling the signal argument into GValues.
  }

  PGSignalCVaMarshaller = ^TGSignalCVaMarshaller;
  TGSignalCVaMarshaller = TGVaClosureMarshal;
{*
 * GSignalEmissionHook:
 * @ihint: Signal invocation hint, see #GSignalInvocationHint.
 * @n_param_values: the number of parameters to the function, including
 *  the instance on which the signal was emitted.
 * @param_values: (array length=n_param_values): the instance on which
 *  the signal was emitted, followed by the parameters of the emission.
 * @data: user data associated with the hook.
 * 
 * A simple function pointer to get invoked when the signal is emitted.
 *
 * Emission hooks allow you to tie a hook to the signal type, so that it will
 * trap all emissions of that signal, from any object.
 * 
 * You may not attach these to signals created with the %G_SIGNAL_NO_HOOKS flag.
 * 
 * Returns: whether it wants to stay connected. If it returns %FALSE, the signal 
 *  hook is disconnected (and destroyed).
  }
(* Const before type ignored *)

  TGSignalEmissionHook = function (ihint:PGSignalInvocationHint; n_param_values:Tguint; param_values:PGValue; data:Tgpointer):Tgboolean;cdecl;
{*
 * GSignalAccumulator:
 * @ihint: Signal invocation hint, see #GSignalInvocationHint.
 * @return_accu: Accumulator to collect callback return values in, this
 *  is the return value of the current signal emission.
 * @handler_return: A #GValue holding the return value of the signal handler.
 * @data: Callback data that was specified when creating the signal.
 * 
 * The signal accumulator is a special callback function that can be used
 * to collect return values of the various callbacks that are called
 * during a signal emission.
 *
 * The signal accumulator is specified at signal creation time, if it is
 * left %NULL, no accumulation of callback return values is performed.
 * The return value of signal emissions is then the value returned by the
 * last callback.
 * 
 * Returns: The accumulator function returns whether the signal emission
 *  should be aborted. Returning %TRUE will continue with
 *  the signal emission. Returning %FALSE will abort the current emission.
 *  Since 2.62, returning %FALSE will skip to the CLEANUP stage. In this case,
 *  emission will occur as normal in the CLEANUP stage and the handler's
 *  return value will be accumulated.
  }
(* Const before type ignored *)

  TGSignalAccumulator = function (ihint:PGSignalInvocationHint; return_accu:PGValue; handler_return:PGValue; data:Tgpointer):Tgboolean;cdecl;
{ --- run, match and connect types ---  }
{*
 * GSignalFlags:
 * @G_SIGNAL_RUN_FIRST: Invoke the object method handler in the first emission stage.
 * @G_SIGNAL_RUN_LAST: Invoke the object method handler in the third emission stage.
 * @G_SIGNAL_RUN_CLEANUP: Invoke the object method handler in the last emission stage.
 * @G_SIGNAL_NO_RECURSE: Signals being emitted for an object while currently being in
 *  emission for this very object will not be emitted recursively,
 *  but instead cause the first emission to be restarted.
 * @G_SIGNAL_DETAILED: This signal supports "::detail" appendices to the signal name
 *  upon handler connections and emissions.
 * @G_SIGNAL_ACTION: Action signals are signals that may freely be emitted on alive
 *  objects from user code via g_signal_emit() and friends, without
 *  the need of being embedded into extra code that performs pre or
 *  post emission adjustments on the object. They can also be thought
 *  of as object methods which can be called generically by 
 *  third-party code.
 * @G_SIGNAL_NO_HOOKS: No emissions hooks are supported for this signal.
 * @G_SIGNAL_MUST_COLLECT: Varargs signal emission will always collect the
 *   arguments, even if there are no signal handlers connected.  Since 2.30.
 * @G_SIGNAL_DEPRECATED: The signal is deprecated and will be removed
 *   in a future version. A warning will be generated if it is connected while
 *   running with G_ENABLE_DIAGNOSTIC=1.  Since 2.32.
 * @G_SIGNAL_ACCUMULATOR_FIRST_RUN: Only used in #GSignalAccumulator accumulator
 *   functions for the #GSignalInvocationHint::run_type field to mark the first
 *   call to the accumulator function for a signal emission.  Since 2.68.
 *
 * The signal flags are used to specify a signal's behaviour.
  }
{ normal signal flags until 1 << 16  }

  PGSignalFlags = ^TGSignalFlags;
  TGSignalFlags =  Longint;
  Const
    G_SIGNAL_RUN_FIRST = 1 shl 0;
    G_SIGNAL_RUN_LAST = 1 shl 1;
    G_SIGNAL_RUN_CLEANUP = 1 shl 2;
    G_SIGNAL_NO_RECURSE = 1 shl 3;
    G_SIGNAL_DETAILED = 1 shl 4;
    G_SIGNAL_ACTION = 1 shl 5;
    G_SIGNAL_NO_HOOKS = 1 shl 6;
    G_SIGNAL_MUST_COLLECT = 1 shl 7;
    G_SIGNAL_DEPRECATED = 1 shl 8;
    G_SIGNAL_ACCUMULATOR_FIRST_RUN = 1 shl 17;
;
{*
 * G_SIGNAL_FLAGS_MASK:
 * 
 * A mask for all #GSignalFlags bits.
  }
  G_SIGNAL_FLAGS_MASK = $1ff;  
{*
 * GConnectFlags:
 * @G_CONNECT_DEFAULT: Default behaviour (no special flags). Since: 2.74
 * @G_CONNECT_AFTER: If set, the handler should be called after the
 *  default handler of the signal. Normally, the handler is called before
 *  the default handler.
 * @G_CONNECT_SWAPPED: If set, the instance and data should be swapped when
 *  calling the handler; see g_signal_connect_swapped() for an example.
 * 
 * The connection flags are used to specify the behaviour of a signal's 
 * connection.
  }
type
  PGConnectFlags = ^TGConnectFlags;
  TGConnectFlags =  Longint;
  Const
    G_CONNECT_DEFAULT = 0;
    G_CONNECT_AFTER = 1 shl 0;
    G_CONNECT_SWAPPED = 1 shl 1;
;
{*
 * GSignalMatchType:
 * @G_SIGNAL_MATCH_ID: The signal id must be equal.
 * @G_SIGNAL_MATCH_DETAIL: The signal detail must be equal.
 * @G_SIGNAL_MATCH_CLOSURE: The closure must be the same.
 * @G_SIGNAL_MATCH_FUNC: The C closure callback must be the same.
 * @G_SIGNAL_MATCH_DATA: The closure data must be the same.
 * @G_SIGNAL_MATCH_UNBLOCKED: Only unblocked signals may be matched.
 * 
 * The match types specify what g_signal_handlers_block_matched(),
 * g_signal_handlers_unblock_matched() and g_signal_handlers_disconnect_matched()
 * match signals by.
  }
type
  PGSignalMatchType = ^TGSignalMatchType;
  TGSignalMatchType =  Longint;
  Const
    G_SIGNAL_MATCH_ID = 1 shl 0;
    G_SIGNAL_MATCH_DETAIL = 1 shl 1;
    G_SIGNAL_MATCH_CLOSURE = 1 shl 2;
    G_SIGNAL_MATCH_FUNC = 1 shl 3;
    G_SIGNAL_MATCH_DATA = 1 shl 4;
    G_SIGNAL_MATCH_UNBLOCKED = 1 shl 5;
;
{*
 * G_SIGNAL_MATCH_MASK:
 * 
 * A mask for all #GSignalMatchType bits.
  }
  G_SIGNAL_MATCH_MASK = $3f;  
{*
 * G_SIGNAL_TYPE_STATIC_SCOPE:
 * 
 * This macro flags signal argument types for which the signal system may 
 * assume that instances thereof remain persistent across all signal emissions
 * they are used in. This is only useful for non ref-counted, value-copy types.
 * 
 * To flag a signal argument in this way, add `| G_SIGNAL_TYPE_STATIC_SCOPE`
 * to the corresponding argument of g_signal_new().
 * |[
 * g_signal_new ("size_request",
 *   G_TYPE_FROM_CLASS (gobject_class),
 * 	 G_SIGNAL_RUN_FIRST,
 * 	 G_STRUCT_OFFSET (GtkWidgetClass, size_request),
 * 	 NULL, NULL,
 * 	 _gtk_marshal_VOID__BOXED,
 * 	 G_TYPE_NONE, 1,
 * 	 GTK_TYPE_REQUISITION | G_SIGNAL_TYPE_STATIC_SCOPE);
 * ]|
  }
  G_SIGNAL_TYPE_STATIC_SCOPE = G_TYPE_FLAG_RESERVED_ID_BIT;  
{ --- signal information ---  }
{*
 * GSignalInvocationHint:
 * @signal_id: The signal id of the signal invoking the callback
 * @detail: The detail passed on for this emission
 * @run_type: The stage the signal emission is currently in, this
 *  field will contain one of %G_SIGNAL_RUN_FIRST,
 *  %G_SIGNAL_RUN_LAST or %G_SIGNAL_RUN_CLEANUP and %G_SIGNAL_ACCUMULATOR_FIRST_RUN.
 *  %G_SIGNAL_ACCUMULATOR_FIRST_RUN is only set for the first run of the accumulator
 *  function for a signal emission.
 * 
 * The #GSignalInvocationHint structure is used to pass on additional information
 * to callbacks during a signal emission.
  }
type
  PGSignalInvocationHint = ^TGSignalInvocationHint;
  TGSignalInvocationHint = record
      signal_id : Tguint;
      detail : TGQuark;
      run_type : TGSignalFlags;
    end;

{*
 * GSignalQuery:
 * @signal_id: The signal id of the signal being queried, or 0 if the
 *  signal to be queried was unknown.
 * @signal_name: The signal name.
 * @itype: The interface/instance type that this signal can be emitted for.
 * @signal_flags: The signal flags as passed in to g_signal_new().
 * @return_type: The return type for user callbacks.
 * @n_params: The number of parameters that user callbacks take.
 * @param_types: (array length=n_params): The individual parameter types for
 *  user callbacks, note that the effective callback signature is:
 *  |[<!-- language="C" -->
 *  @return_type callback (#gpointer     data1,
 *  [param_types param_names,]
 *  gpointer     data2);
 *  ]|
 * 
 * A structure holding in-depth information for a specific signal.
 *
 * See also: g_signal_query()
  }
(* Const before type ignored *)
{ mangled with G_SIGNAL_TYPE_STATIC_SCOPE flag  }
(* Const before type ignored *)
{ mangled with G_SIGNAL_TYPE_STATIC_SCOPE flag  }
  PGSignalQuery = ^TGSignalQuery;
  TGSignalQuery = record
      signal_id : Tguint;
      signal_name : Pgchar;
      itype : TGType;
      signal_flags : TGSignalFlags;
      return_type : TGType;
      n_params : Tguint;
      param_types : PGType;
    end;

{ --- signals ---  }
(* Const before type ignored *)

function g_signal_newv(signal_name:Pgchar; itype:TGType; signal_flags:TGSignalFlags; class_closure:PGClosure; accumulator:TGSignalAccumulator; 
           accu_data:Tgpointer; c_marshaller:TGSignalCMarshaller; return_type:TGType; n_params:Tguint; param_types:PGType):Tguint;cdecl;external;
(* Const before type ignored *)
function g_signal_new_valist(signal_name:Pgchar; itype:TGType; signal_flags:TGSignalFlags; class_closure:PGClosure; accumulator:TGSignalAccumulator; 
           accu_data:Tgpointer; c_marshaller:TGSignalCMarshaller; return_type:TGType; n_params:Tguint; args:Tva_list):Tguint;cdecl;external;
(* Const before type ignored *)
function g_signal_new(signal_name:Pgchar; itype:TGType; signal_flags:TGSignalFlags; class_offset:Tguint; accumulator:TGSignalAccumulator; 
           accu_data:Tgpointer; c_marshaller:TGSignalCMarshaller; return_type:TGType; n_params:Tguint; args:array of const):Tguint;cdecl;external;
function g_signal_new(signal_name:Pgchar; itype:TGType; signal_flags:TGSignalFlags; class_offset:Tguint; accumulator:TGSignalAccumulator; 
           accu_data:Tgpointer; c_marshaller:TGSignalCMarshaller; return_type:TGType; n_params:Tguint):Tguint;cdecl;external;
(* Const before type ignored *)
function g_signal_new_class_handler(signal_name:Pgchar; itype:TGType; signal_flags:TGSignalFlags; class_handler:TGCallback; accumulator:TGSignalAccumulator; 
           accu_data:Tgpointer; c_marshaller:TGSignalCMarshaller; return_type:TGType; n_params:Tguint; args:array of const):Tguint;cdecl;external;
function g_signal_new_class_handler(signal_name:Pgchar; itype:TGType; signal_flags:TGSignalFlags; class_handler:TGCallback; accumulator:TGSignalAccumulator; 
           accu_data:Tgpointer; c_marshaller:TGSignalCMarshaller; return_type:TGType; n_params:Tguint):Tguint;cdecl;external;
procedure g_signal_set_va_marshaller(signal_id:Tguint; instance_type:TGType; va_marshaller:TGSignalCVaMarshaller);cdecl;external;
(* Const before type ignored *)
procedure g_signal_emitv(instance_and_params:PGValue; signal_id:Tguint; detail:TGQuark; return_value:PGValue);cdecl;external;
procedure g_signal_emit_valist(instance:Tgpointer; signal_id:Tguint; detail:TGQuark; var_args:Tva_list);cdecl;external;
procedure g_signal_emit(instance:Tgpointer; signal_id:Tguint; detail:TGQuark; args:array of const);cdecl;external;
procedure g_signal_emit(instance:Tgpointer; signal_id:Tguint; detail:TGQuark);cdecl;external;
(* Const before type ignored *)
procedure g_signal_emit_by_name(instance:Tgpointer; detailed_signal:Pgchar; args:array of const);cdecl;external;
procedure g_signal_emit_by_name(instance:Tgpointer; detailed_signal:Pgchar);cdecl;external;
(* Const before type ignored *)
function g_signal_lookup(name:Pgchar; itype:TGType):Tguint;cdecl;external;
(* Const before type ignored *)
function g_signal_name(signal_id:Tguint):Pgchar;cdecl;external;
procedure g_signal_query(signal_id:Tguint; query:PGSignalQuery);cdecl;external;
function g_signal_list_ids(itype:TGType; n_ids:Pguint):Pguint;cdecl;external;
(* Const before type ignored *)
function g_signal_is_valid_name(name:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_signal_parse_name(detailed_signal:Pgchar; itype:TGType; signal_id_p:Pguint; detail_p:PGQuark; force_detail_quark:Tgboolean):Tgboolean;cdecl;external;
function g_signal_get_invocation_hint(instance:Tgpointer):PGSignalInvocationHint;cdecl;external;
{ --- signal emissions ---  }
procedure g_signal_stop_emission(instance:Tgpointer; signal_id:Tguint; detail:TGQuark);cdecl;external;
(* Const before type ignored *)
procedure g_signal_stop_emission_by_name(instance:Tgpointer; detailed_signal:Pgchar);cdecl;external;
function g_signal_add_emission_hook(signal_id:Tguint; detail:TGQuark; hook_func:TGSignalEmissionHook; hook_data:Tgpointer; data_destroy:TGDestroyNotify):Tgulong;cdecl;external;
procedure g_signal_remove_emission_hook(signal_id:Tguint; hook_id:Tgulong);cdecl;external;
{ --- signal handlers ---  }
function g_signal_has_handler_pending(instance:Tgpointer; signal_id:Tguint; detail:TGQuark; may_be_blocked:Tgboolean):Tgboolean;cdecl;external;
function g_signal_connect_closure_by_id(instance:Tgpointer; signal_id:Tguint; detail:TGQuark; closure:PGClosure; after:Tgboolean):Tgulong;cdecl;external;
(* Const before type ignored *)
function g_signal_connect_closure(instance:Tgpointer; detailed_signal:Pgchar; closure:PGClosure; after:Tgboolean):Tgulong;cdecl;external;
(* Const before type ignored *)
function g_signal_connect_data(instance:Tgpointer; detailed_signal:Pgchar; c_handler:TGCallback; data:Tgpointer; destroy_data:TGClosureNotify; 
           connect_flags:TGConnectFlags):Tgulong;cdecl;external;
procedure g_signal_handler_block(instance:Tgpointer; handler_id:Tgulong);cdecl;external;
procedure g_signal_handler_unblock(instance:Tgpointer; handler_id:Tgulong);cdecl;external;
procedure g_signal_handler_disconnect(instance:Tgpointer; handler_id:Tgulong);cdecl;external;
function g_signal_handler_is_connected(instance:Tgpointer; handler_id:Tgulong):Tgboolean;cdecl;external;
function g_signal_handler_find(instance:Tgpointer; mask:TGSignalMatchType; signal_id:Tguint; detail:TGQuark; closure:PGClosure; 
           func:Tgpointer; data:Tgpointer):Tgulong;cdecl;external;
function g_signal_handlers_block_matched(instance:Tgpointer; mask:TGSignalMatchType; signal_id:Tguint; detail:TGQuark; closure:PGClosure; 
           func:Tgpointer; data:Tgpointer):Tguint;cdecl;external;
function g_signal_handlers_unblock_matched(instance:Tgpointer; mask:TGSignalMatchType; signal_id:Tguint; detail:TGQuark; closure:PGClosure; 
           func:Tgpointer; data:Tgpointer):Tguint;cdecl;external;
function g_signal_handlers_disconnect_matched(instance:Tgpointer; mask:TGSignalMatchType; signal_id:Tguint; detail:TGQuark; closure:PGClosure; 
           func:Tgpointer; data:Tgpointer):Tguint;cdecl;external;
procedure g_clear_signal_handler(handler_id_ptr:Pgulong; instance:Tgpointer);cdecl;external;
{ --- overriding and chaining ---  }
procedure g_signal_override_class_closure(signal_id:Tguint; instance_type:TGType; class_closure:PGClosure);cdecl;external;
(* Const before type ignored *)
procedure g_signal_override_class_handler(signal_name:Pgchar; instance_type:TGType; class_handler:TGCallback);cdecl;external;
(* Const before type ignored *)
procedure g_signal_chain_from_overridden(instance_and_params:PGValue; return_value:PGValue);cdecl;external;
procedure g_signal_chain_from_overridden_handler(instance:Tgpointer; args:array of const);cdecl;external;
procedure g_signal_chain_from_overridden_handler(instance:Tgpointer);cdecl;external;
{ --- convenience ---  }
{*
 * g_signal_connect:
 * @instance: the instance to connect to.
 * @detailed_signal: a string of the form "signal-name::detail".
 * @c_handler: the #GCallback to connect.
 * @data: data to pass to @c_handler calls.
 * 
 * Connects a [type@GObject.Callback] function to a signal for a particular object.
 * 
 * The handler will be called synchronously, before the default handler of the signal.
 * [func@GObject.signal_emit] will not return control until all handlers are called.
 *
 * See [memory management of signal handlers](signals.html#Memory_management_of_signal_handlers) for
 * details on how to handle the return value and memory management of @data.
 * 
 * This function cannot fail. If the given signal doesn’t exist, a critical
 * warning is emitted.
 *
 * Returns: the handler ID, of type `gulong` (always greater than 0)
  }
{ Intentionally not using G_CONNECT_DEFAULT here to avoid deprecation
 * warnings with older GLIB_VERSION_MAX_ALLOWED  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_signal_connect(instance,detailed_signal,c_handler,data : longint) : longint;

{*
 * g_signal_connect_after:
 * @instance: the instance to connect to.
 * @detailed_signal: a string of the form "signal-name::detail".
 * @c_handler: the #GCallback to connect.
 * @data: data to pass to @c_handler calls.
 * 
 * Connects a #GCallback function to a signal for a particular object.
 * 
 * The handler will be called synchronously, after the default handler of the signal.
 * 
 * This function cannot fail. If the given signal doesn’t exist, a critical
 * warning is emitted.
 *
 * Returns: the handler ID, of type `gulong` (always greater than 0)
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_signal_connect_after(instance,detailed_signal,c_handler,data : longint) : longint;

{*
 * g_signal_connect_swapped:
 * @instance: the instance to connect to.
 * @detailed_signal: a string of the form "signal-name::detail".
 * @c_handler: the #GCallback to connect.
 * @data: data to pass to @c_handler calls.
 * 
 * Connects a #GCallback function to a signal for a particular object.
 * 
 * The instance on which the signal is emitted and @data will be swapped when 
 * calling the handler. This is useful when calling pre-existing functions to
 * operate purely on the @data, rather than the @instance: swapping the
 * parameters avoids the need to write a wrapper function.
 *
 * For example, this allows the shorter code:
 * |[<!-- language="C" -->
 * g_signal_connect_swapped (button, "clicked",
 *                           (GCallback) gtk_widget_hide, other_widget);
 * ]|
 *
 * Rather than the cumbersome:
 * |[<!-- language="C" -->
 * static void
 * button_clicked_cb (GtkButton *button, GtkWidget *other_widget)
 * 
 *     gtk_widget_hide (other_widget);
 * 
 *
 * ...
 *
 * g_signal_connect (button, "clicked",
 *                   (GCallback) button_clicked_cb, other_widget);
 * ]|
 * 
 * This function cannot fail. If the given signal doesn’t exist, a critical
 * warning is emitted.
 *
 * Returns: the handler ID, of type `gulong` (always greater than 0)
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_signal_connect_swapped(instance,detailed_signal,c_handler,data : longint) : longint;

{*
 * g_signal_handlers_disconnect_by_func:
 * @instance: The instance to remove handlers from.
 * @func: The C closure callback of the handlers (useless for non-C closures).
 * @data: The closure data of the handlers' closures.
 * 
 * Disconnects all handlers on an instance that match @func and @data.
 * 
 * Returns: The number of handlers that matched.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_signal_handlers_disconnect_by_func(instance,func,data : longint) : longint;

{*
 * g_signal_handlers_disconnect_by_data:
 * @instance: The instance to remove handlers from
 * @data: the closure data of the handlers' closures
 *
 * Disconnects all handlers on an instance that match @data.
 *
 * Returns: The number of handlers that matched.
 *
 * Since: 2.32
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_signal_handlers_disconnect_by_data(instance,data : longint) : longint;

{*
 * g_signal_handlers_block_by_func:
 * @instance: The instance to block handlers from.
 * @func: The C closure callback of the handlers (useless for non-C closures).
 * @data: The closure data of the handlers' closures.
 * 
 * Blocks all handlers on an instance that match @func and @data.
 * 
 * Returns: The number of handlers that matched.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_signal_handlers_block_by_func(instance,func,data : longint) : longint;

{*
 * g_signal_handlers_unblock_by_func:
 * @instance: The instance to unblock handlers from.
 * @func: The C closure callback of the handlers (useless for non-C closures).
 * @data: The closure data of the handlers' closures.
 * 
 * Unblocks all handlers on an instance that match @func and @data.
 * 
 * Returns: The number of handlers that matched.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_signal_handlers_unblock_by_func(instance,func,data : longint) : longint;

(* Const before type ignored *)
function g_signal_accumulator_true_handled(ihint:PGSignalInvocationHint; return_accu:PGValue; handler_return:PGValue; dummy:Tgpointer):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_signal_accumulator_first_wins(ihint:PGSignalInvocationHint; return_accu:PGValue; handler_return:PGValue; dummy:Tgpointer):Tgboolean;cdecl;external;
{< private > }
procedure g_signal_handlers_destroy(instance:Tgpointer);cdecl;external;
procedure _g_signals_destroy(itype:TGType);cdecl;external;
{$endif}
{ __G_SIGNAL_H__  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_signal_connect(instance,detailed_signal,c_handler,data : longint) : longint;
begin
  g_signal_connect:=g_signal_connect_data(instance,detailed_signal,c_handler,data,NULL,TGConnectFlags(0));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_signal_connect_after(instance,detailed_signal,c_handler,data : longint) : longint;
begin
  g_signal_connect_after:=g_signal_connect_data(instance,detailed_signal,c_handler,data,NULL,G_CONNECT_AFTER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_signal_connect_swapped(instance,detailed_signal,c_handler,data : longint) : longint;
begin
  g_signal_connect_swapped:=g_signal_connect_data(instance,detailed_signal,c_handler,data,NULL,G_CONNECT_SWAPPED);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_signal_handlers_disconnect_by_func(instance,func,data : longint) : longint;
begin
  g_signal_handlers_disconnect_by_func:=g_signal_handlers_disconnect_matched(instance,TGSignalMatchType(G_SIGNAL_MATCH_FUNC or G_SIGNAL_MATCH_DATA),0,0,NULL,func,data);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_signal_handlers_disconnect_by_data(instance,data : longint) : longint;
begin
  g_signal_handlers_disconnect_by_data:=g_signal_handlers_disconnect_matched(instance,G_SIGNAL_MATCH_DATA,0,0,NULL,NULL,data);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_signal_handlers_block_by_func(instance,func,data : longint) : longint;
begin
  g_signal_handlers_block_by_func:=g_signal_handlers_block_matched(instance,TGSignalMatchType(G_SIGNAL_MATCH_FUNC or G_SIGNAL_MATCH_DATA),0,0,NULL,func,data);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_signal_handlers_unblock_by_func(instance,func,data : longint) : longint;
begin
  g_signal_handlers_unblock_by_func:=g_signal_handlers_unblock_matched(instance,TGSignalMatchType(G_SIGNAL_MATCH_FUNC or G_SIGNAL_MATCH_DATA),0,0,NULL,func,data);
end;


end.
