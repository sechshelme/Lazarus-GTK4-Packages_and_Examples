
unit gclosure;
interface

{
  Automatically converted by H2Pas 1.0.0 from gclosure.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gclosure.h
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
PGCClosure  = ^GCClosure;
PGClosure  = ^GClosure;
PGClosureNotifyData  = ^GClosureNotifyData;
PGType  = ^GType;
PGValue  = ^GValue;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GObject - GLib Type, Object, Parameter and Signal Library
 * Copyright (C) 2000-2001 Red Hat, Inc.
 * Copyright (C) 2005 Imendio AB
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
{$ifndef __G_CLOSURE_H__}
{$define __G_CLOSURE_H__}
{$if !defined (__GLIB_GOBJECT_H_INSIDE__) && !defined (GOBJECT_COMPILATION)}
{$error "Only <glib-object.h> can be included directly."}
{$endif}
{$include        <gobject/gtype.h>}
{ --- defines ---  }
{*
 * G_CLOSURE_NEEDS_MARSHAL:
 * @closure: a #GClosure
 * 
 * Check if the closure still needs a marshaller. See g_closure_set_marshal().
 *
 * Returns: %TRUE if a #GClosureMarshal marshaller has not yet been set on 
 * @closure.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function G_CLOSURE_NEEDS_MARSHAL(closure : longint) : longint;

{*
 * G_CLOSURE_N_NOTIFIERS:
 * @cl: a #GClosure
 * 
 * Get the total number of notifiers connected with the closure @cl. 
 *
 * The count includes the meta marshaller, the finalize and invalidate notifiers 
 * and the marshal guards. Note that each guard counts as two notifiers. 
 * See g_closure_set_meta_marshal(), g_closure_add_finalize_notifier(),
 * g_closure_add_invalidate_notifier() and g_closure_add_marshal_guards().
 *
 * Returns: number of notifiers
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_CLOSURE_N_NOTIFIERS(cl : longint) : longint;

{*
 * G_CCLOSURE_SWAP_DATA:
 * @cclosure: a #GCClosure
 * 
 * Checks whether the user data of the #GCClosure should be passed as the
 * first parameter to the callback. See g_cclosure_new_swap().
 *
 * Returns: %TRUE if data has to be swapped.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_CCLOSURE_SWAP_DATA(cclosure : longint) : longint;

{*
 * G_CALLBACK:
 * @f: a function pointer.
 * 
 * Cast a function pointer to a #GCallback.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function G_CALLBACK(f : longint) : TGCallback;

{ -- typedefs ---  }
type
{*
 * GCallback:
 * 
 * The type used for callback functions in structure definitions and function 
 * signatures.
 *
 * This doesn't mean that all callback functions must take no  parameters and
 * return void. The required signature of a callback function is determined by
 * the context in which is used (e.g. the signal to which it is connected).
 *
 * Use G_CALLBACK() to cast the callback function to a #GCallback. 
  }

  TGCallback = procedure (para1:pointer);cdecl;
{*
 * GClosureNotify:
 * @data: data specified when registering the notification callback
 * @closure: the #GClosure on which the notification is emitted
 * 
 * The type used for the various notification callbacks which can be registered
 * on closures.
  }

  TGClosureNotify = procedure (data:Tgpointer; closure:PGClosure);cdecl;
{*
 * GClosureMarshal:
 * @closure: the #GClosure to which the marshaller belongs
 * @return_value: (nullable): a #GValue to store the return
 *  value. May be %NULL if the callback of @closure doesn't return a
 *  value.
 * @n_param_values: the length of the @param_values array
 * @param_values: (array length=n_param_values): an array of
 *  #GValues holding the arguments on which to invoke the
 *  callback of @closure
 * @invocation_hint: (nullable): the invocation hint given as the
 *  last argument to g_closure_invoke()
 * @marshal_data: (nullable): additional data specified when
 *  registering the marshaller, see g_closure_set_marshal() and
 *  g_closure_set_meta_marshal()
 * 
 * The type used for marshaller functions.
  }
(* Const before type ignored *)

  TGClosureMarshal = procedure (closure:PGClosure; return_value:PGValue; n_param_values:Tguint; param_values:PGValue; invocation_hint:Tgpointer; 
                marshal_data:Tgpointer);cdecl;
{*
 * GVaClosureMarshal:
 * @closure: the #GClosure to which the marshaller belongs
 * @return_value: (nullable): a #GValue to store the return
 *  value. May be %NULL if the callback of @closure doesn't return a
 *  value.
 * @instance: (type GObject.TypeInstance): the instance on which the closure is
 *  invoked.
 * @args: va_list of arguments to be passed to the closure.
 * @marshal_data: (nullable): additional data specified when
 *  registering the marshaller, see g_closure_set_marshal() and
 *  g_closure_set_meta_marshal()
 * @n_params: the length of the @param_types array
 * @param_types: (array length=n_params): the #GType of each argument from
 *  @args.
 *
 * This is the signature of va_list marshaller functions, an optional
 * marshaller that can be used in some situations to avoid
 * marshalling the signal argument into GValues.
  }

  TGVaClosureMarshal = procedure (closure:PGClosure; return_value:PGValue; instance:Tgpointer; args:Tva_list; marshal_data:Tgpointer; 
                n_params:longint; param_types:PGType);cdecl;
{*
 * GCClosure:
 * @closure: the #GClosure
 * @callback: the callback function
 * 
 * A #GCClosure is a specialization of #GClosure for C function callbacks.
  }
{ --- structures ---  }
  PGClosureNotifyData = ^TGClosureNotifyData;
  TGClosureNotifyData = record
      data : Tgpointer;cdecl;
      notify : TGClosureNotify;
    end;

{< private > }
{ (atomic)  }
{ meta_marshal is not used anymore but must be zero for historical reasons
     as it was exposed in the G_CLOSURE_N_NOTIFIERS macro  }
{ (atomic)  }
{ (atomic)  }
{ finalization notifiers (atomic)  }
{ invalidation notifiers (atomic)  }
{ (atomic)  }
{ (atomic)  }
{< protected > }
{ (atomic)  }
{< public > }
{ (atomic)  }
{ (atomic)  }
{< private > }{out }(* Const before type ignored *)
{< protected > }{< private > }{ invariants/constraints:
   * - ->marshal and ->data are _invalid_ as soon as ->is_invalid==TRUE
   * - invocation of all inotifiers occurs prior to fnotifiers
   * - order of inotifiers is random
   *   inotifiers may _not_ free/invalidate parameter values (e.g. ->data)
   * - order of fnotifiers is random
   * - each notifier may only be removed before or during its invocation
   * - reference counting may only happen prior to fnotify invocation
   *   (in that sense, fnotifiers are really finalization handlers)
    }
  PGClosure = ^TGClosure;
  TGClosure = record
      flag0 : longint;
      marshal : procedure (closure:PGClosure; return_value:PGValue; n_param_values:Tguint; param_values:PGValue; invocation_hint:Tgpointer; 
                    marshal_data:Tgpointer);cdecl;
      data : Tgpointer;
      notifiers : PGClosureNotifyData;
    end;


const
  bm_TGClosure_ref_count = $7FFF;
  bp_TGClosure_ref_count = 0;
  bm_TGClosure_meta_marshal_nouse = $8000;
  bp_TGClosure_meta_marshal_nouse = 15;
  bm_TGClosure_n_guards = $10000;
  bp_TGClosure_n_guards = 16;
  bm_TGClosure_n_fnotifiers = $60000;
  bp_TGClosure_n_fnotifiers = 17;
  bm_TGClosure_n_inotifiers = $7F80000;
  bp_TGClosure_n_inotifiers = 19;
  bm_TGClosure_in_inotify = $8000000;
  bp_TGClosure_in_inotify = 27;
  bm_TGClosure_floating = $10000000;
  bp_TGClosure_floating = 28;
  bm_TGClosure_derivative_flag = $20000000;
  bp_TGClosure_derivative_flag = 29;
  bm_TGClosure_in_marshal = $40000000;
  bp_TGClosure_in_marshal = 30;
  bm_TGClosure_is_invalid = $80000000;
  bp_TGClosure_is_invalid = 31;

function ref_count(var a : TGClosure) : Tguint;
procedure set_ref_count(var a : TGClosure; __ref_count : Tguint);
function meta_marshal_nouse(var a : TGClosure) : Tguint;
procedure set_meta_marshal_nouse(var a : TGClosure; __meta_marshal_nouse : Tguint);
function n_guards(var a : TGClosure) : Tguint;
procedure set_n_guards(var a : TGClosure; __n_guards : Tguint);
function n_fnotifiers(var a : TGClosure) : Tguint;
procedure set_n_fnotifiers(var a : TGClosure; __n_fnotifiers : Tguint);
function n_inotifiers(var a : TGClosure) : Tguint;
procedure set_n_inotifiers(var a : TGClosure; __n_inotifiers : Tguint);
function in_inotify(var a : TGClosure) : Tguint;
procedure set_in_inotify(var a : TGClosure; __in_inotify : Tguint);
function floating(var a : TGClosure) : Tguint;
procedure set_floating(var a : TGClosure; __floating : Tguint);
function derivative_flag(var a : TGClosure) : Tguint;
procedure set_derivative_flag(var a : TGClosure; __derivative_flag : Tguint);
function in_marshal(var a : TGClosure) : Tguint;
procedure set_in_marshal(var a : TGClosure; __in_marshal : Tguint);
function is_invalid(var a : TGClosure) : Tguint;
procedure set_is_invalid(var a : TGClosure; __is_invalid : Tguint);
{ closure for C function calls, callback() is the user function
  }
type
  PGCClosure = ^TGCClosure;
  TGCClosure = record
      closure : TGClosure;
      callback : Tgpointer;
    end;

{ --- prototypes ---  }

function g_cclosure_new(callback_func:TGCallback; user_data:Tgpointer; destroy_data:TGClosureNotify):PGClosure;cdecl;external;
function g_cclosure_new_swap(callback_func:TGCallback; user_data:Tgpointer; destroy_data:TGClosureNotify):PGClosure;cdecl;external;
function g_signal_type_cclosure_new(itype:TGType; struct_offset:Tguint):PGClosure;cdecl;external;
{ --- prototypes ---  }
function g_closure_ref(closure:PGClosure):PGClosure;cdecl;external;
procedure g_closure_sink(closure:PGClosure);cdecl;external;
procedure g_closure_unref(closure:PGClosure);cdecl;external;
{ intimidating  }
function g_closure_new_simple(sizeof_closure:Tguint; data:Tgpointer):PGClosure;cdecl;external;
procedure g_closure_add_finalize_notifier(closure:PGClosure; notify_data:Tgpointer; notify_func:TGClosureNotify);cdecl;external;
procedure g_closure_remove_finalize_notifier(closure:PGClosure; notify_data:Tgpointer; notify_func:TGClosureNotify);cdecl;external;
procedure g_closure_add_invalidate_notifier(closure:PGClosure; notify_data:Tgpointer; notify_func:TGClosureNotify);cdecl;external;
procedure g_closure_remove_invalidate_notifier(closure:PGClosure; notify_data:Tgpointer; notify_func:TGClosureNotify);cdecl;external;
procedure g_closure_add_marshal_guards(closure:PGClosure; pre_marshal_data:Tgpointer; pre_marshal_notify:TGClosureNotify; post_marshal_data:Tgpointer; post_marshal_notify:TGClosureNotify);cdecl;external;
procedure g_closure_set_marshal(closure:PGClosure; marshal:TGClosureMarshal);cdecl;external;
procedure g_closure_set_meta_marshal(closure:PGClosure; marshal_data:Tgpointer; meta_marshal:TGClosureMarshal);cdecl;external;
procedure g_closure_invalidate(closure:PGClosure);cdecl;external;
{out }(* Const before type ignored *)
procedure g_closure_invoke(closure:PGClosure; return_value:PGValue; n_param_values:Tguint; param_values:PGValue; invocation_hint:Tgpointer);cdecl;external;
{ FIXME:
   OK:  data_object::destroy		-> closure_invalidate();
   MIS:	closure_invalidate()		-> disconnect(closure);
   MIS:	disconnect(closure)		-> (unlink) closure_unref();
   OK:	closure_finalize()		-> g_free (data_string);

   random remarks:
   - need marshaller repo with decent aliasing to base types
   - provide marshaller collection, virtually covering anything out there
 }
(* Const before type ignored *)
procedure g_cclosure_marshal_generic(closure:PGClosure; return_gvalue:PGValue; n_param_values:Tguint; param_values:PGValue; invocation_hint:Tgpointer; 
            marshal_data:Tgpointer);cdecl;external;
procedure g_cclosure_marshal_generic_va(closure:PGClosure; return_value:PGValue; instance:Tgpointer; args_list:Tva_list; marshal_data:Tgpointer; 
            n_params:longint; param_types:PGType);cdecl;external;
{$endif}
{ __G_CLOSURE_H__  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_CLOSURE_NEEDS_MARSHAL(closure : longint) : longint;
begin
  G_CLOSURE_NEEDS_MARSHAL:=((PGClosure(closure))^.marshal)=NULL;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_CLOSURE_N_NOTIFIERS(cl : longint) : longint;
begin
  G_CLOSURE_N_NOTIFIERS:=(((cl^.n_guards) shl 1)+(cl^.n_fnotifiers))+(cl^.n_inotifiers);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_CCLOSURE_SWAP_DATA(cclosure : longint) : longint;
begin
  G_CCLOSURE_SWAP_DATA:=(PGClosure(cclosure))^.derivative_flag;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function G_CALLBACK(f : longint) : TGCallback;
begin
  G_CALLBACK:=TGCallback(f);
end;

function ref_count(var a : TGClosure) : Tguint;
begin
  ref_count:=(a.flag0 and bm_TGClosure_ref_count) shr bp_TGClosure_ref_count;
end;

procedure set_ref_count(var a : TGClosure; __ref_count : Tguint);
begin
  a.flag0:=a.flag0 or ((__ref_count shl bp_TGClosure_ref_count) and bm_TGClosure_ref_count);
end;

function meta_marshal_nouse(var a : TGClosure) : Tguint;
begin
  meta_marshal_nouse:=(a.flag0 and bm_TGClosure_meta_marshal_nouse) shr bp_TGClosure_meta_marshal_nouse;
end;

procedure set_meta_marshal_nouse(var a : TGClosure; __meta_marshal_nouse : Tguint);
begin
  a.flag0:=a.flag0 or ((__meta_marshal_nouse shl bp_TGClosure_meta_marshal_nouse) and bm_TGClosure_meta_marshal_nouse);
end;

function n_guards(var a : TGClosure) : Tguint;
begin
  n_guards:=(a.flag0 and bm_TGClosure_n_guards) shr bp_TGClosure_n_guards;
end;

procedure set_n_guards(var a : TGClosure; __n_guards : Tguint);
begin
  a.flag0:=a.flag0 or ((__n_guards shl bp_TGClosure_n_guards) and bm_TGClosure_n_guards);
end;

function n_fnotifiers(var a : TGClosure) : Tguint;
begin
  n_fnotifiers:=(a.flag0 and bm_TGClosure_n_fnotifiers) shr bp_TGClosure_n_fnotifiers;
end;

procedure set_n_fnotifiers(var a : TGClosure; __n_fnotifiers : Tguint);
begin
  a.flag0:=a.flag0 or ((__n_fnotifiers shl bp_TGClosure_n_fnotifiers) and bm_TGClosure_n_fnotifiers);
end;

function n_inotifiers(var a : TGClosure) : Tguint;
begin
  n_inotifiers:=(a.flag0 and bm_TGClosure_n_inotifiers) shr bp_TGClosure_n_inotifiers;
end;

procedure set_n_inotifiers(var a : TGClosure; __n_inotifiers : Tguint);
begin
  a.flag0:=a.flag0 or ((__n_inotifiers shl bp_TGClosure_n_inotifiers) and bm_TGClosure_n_inotifiers);
end;

function in_inotify(var a : TGClosure) : Tguint;
begin
  in_inotify:=(a.flag0 and bm_TGClosure_in_inotify) shr bp_TGClosure_in_inotify;
end;

procedure set_in_inotify(var a : TGClosure; __in_inotify : Tguint);
begin
  a.flag0:=a.flag0 or ((__in_inotify shl bp_TGClosure_in_inotify) and bm_TGClosure_in_inotify);
end;

function floating(var a : TGClosure) : Tguint;
begin
  floating:=(a.flag0 and bm_TGClosure_floating) shr bp_TGClosure_floating;
end;

procedure set_floating(var a : TGClosure; __floating : Tguint);
begin
  a.flag0:=a.flag0 or ((__floating shl bp_TGClosure_floating) and bm_TGClosure_floating);
end;

function derivative_flag(var a : TGClosure) : Tguint;
begin
  derivative_flag:=(a.flag0 and bm_TGClosure_derivative_flag) shr bp_TGClosure_derivative_flag;
end;

procedure set_derivative_flag(var a : TGClosure; __derivative_flag : Tguint);
begin
  a.flag0:=a.flag0 or ((__derivative_flag shl bp_TGClosure_derivative_flag) and bm_TGClosure_derivative_flag);
end;

function in_marshal(var a : TGClosure) : Tguint;
begin
  in_marshal:=(a.flag0 and bm_TGClosure_in_marshal) shr bp_TGClosure_in_marshal;
end;

procedure set_in_marshal(var a : TGClosure; __in_marshal : Tguint);
begin
  a.flag0:=a.flag0 or ((__in_marshal shl bp_TGClosure_in_marshal) and bm_TGClosure_in_marshal);
end;

function is_invalid(var a : TGClosure) : Tguint;
begin
  is_invalid:=(a.flag0 and bm_TGClosure_is_invalid) shr bp_TGClosure_is_invalid;
end;

procedure set_is_invalid(var a : TGClosure; __is_invalid : Tguint);
begin
  a.flag0:=a.flag0 or ((__is_invalid shl bp_TGClosure_is_invalid) and bm_TGClosure_is_invalid);
end;


end.
