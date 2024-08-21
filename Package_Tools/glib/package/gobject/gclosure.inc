/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  PGClosure = ^TGClosure;
  TGClosureNotify = procedure(Data: Tgpointer; closure: PGClosure); cdecl;

  PGClosureNotifyData = ^TGClosureNotifyData;

  TGClosureNotifyData = record
    Data: Tgpointer;
    notify: TGClosureNotify;
  end;

(*
struct _GClosure
{
  /*< private >*/
  guint ref_count : 15;  /* (atomic) */
  /* meta_marshal is not used anymore but must be zero for historical reasons
     as it was exposed in the G_CLOSURE_N_NOTIFIERS macro */
  guint meta_marshal_nouse : 1;  /* (atomic) */
  guint n_guards : 1;  /* (atomic) */
  guint n_fnotifiers : 2;  /* finalization notifiers (atomic) */
  guint n_inotifiers : 8;  /* invalidation notifiers (atomic) */
  guint in_inotify : 1;  /* (atomic) */
  guint floating : 1;  /* (atomic) */
  /*< protected >*/
  guint derivative_flag : 1;  /* (atomic) */
  /*< public >*/
  guint in_marshal : 1;  /* (atomic) */
  guint is_invalid : 1;  /* (atomic) */
  ...
*)

  TGClosure = record
    //      flag0 : longint;   // ???
    ref_count: 0..32767;
    meta_marshal_nouse: 0..1;
    n_guards: 0..1;
    n_fnotifiers: 0..3;
    n_inotifiers: 0..255;
    in_inotify: 0..1;
    floating: 0..1;

    derivative_flag: 0..1;

    in_marshal: 0..1;
    is_invalid: 0..1;

    marshal: procedure(closure: PGClosure; return_value: PGValue; n_param_values: Tguint; param_values: PGValue; invocation_hint: Tgpointer;
      marshal_data: Tgpointer); cdecl;
    Data: Tgpointer;
    notifiers: PGClosureNotifyData;
  end;

  TGCallback = procedure(para1: pointer); cdecl;
  TGClosureMarshal = procedure(closure: PGClosure; return_value: PGValue; n_param_values: Tguint; param_values: PGValue; invocation_hint: Tgpointer;
    marshal_data: Tgpointer); cdecl;
  TGVaClosureMarshal = procedure(closure: PGClosure; return_value: PGValue; instance: Tgpointer; args: Tva_list; marshal_data: Tgpointer;
    n_params: longint; param_types: PGType); cdecl;

type
  PGCClosure = ^TGCClosure;

  TGCClosure = record
    closure: TGClosure;
    callback: Tgpointer;
  end;

function g_cclosure_new(callback_func: TGCallback; user_data: Tgpointer; destroy_data: TGClosureNotify): PGClosure; cdecl; external libgobject2_0;
function g_cclosure_new_swap(callback_func: TGCallback; user_data: Tgpointer; destroy_data: TGClosureNotify): PGClosure; cdecl; external libgobject2_0;
function g_signal_type_cclosure_new(itype: TGType; struct_offset: Tguint): PGClosure; cdecl; external libgobject2_0;
function g_closure_ref(closure: PGClosure): PGClosure; cdecl; external libgobject2_0;
procedure g_closure_sink(closure: PGClosure); cdecl; external libgobject2_0;
procedure g_closure_unref(closure: PGClosure); cdecl; external libgobject2_0;
function g_closure_new_simple(sizeof_closure: Tguint; Data: Tgpointer): PGClosure; cdecl; external libgobject2_0;
procedure g_closure_add_finalize_notifier(closure: PGClosure; notify_data: Tgpointer; notify_func: TGClosureNotify); cdecl; external libgobject2_0;
procedure g_closure_remove_finalize_notifier(closure: PGClosure; notify_data: Tgpointer; notify_func: TGClosureNotify); cdecl; external libgobject2_0;
procedure g_closure_add_invalidate_notifier(closure: PGClosure; notify_data: Tgpointer; notify_func: TGClosureNotify); cdecl; external libgobject2_0;
procedure g_closure_remove_invalidate_notifier(closure: PGClosure; notify_data: Tgpointer; notify_func: TGClosureNotify); cdecl; external libgobject2_0;
procedure g_closure_add_marshal_guards(closure: PGClosure; pre_marshal_data: Tgpointer; pre_marshal_notify: TGClosureNotify; post_marshal_data: Tgpointer; post_marshal_notify: TGClosureNotify); cdecl; external libgobject2_0;
procedure g_closure_set_marshal(closure: PGClosure; marshal: TGClosureMarshal); cdecl; external libgobject2_0;
procedure g_closure_set_meta_marshal(closure: PGClosure; marshal_data: Tgpointer; meta_marshal: TGClosureMarshal); cdecl; external libgobject2_0;
procedure g_closure_invalidate(closure: PGClosure); cdecl; external libgobject2_0;
procedure g_closure_invoke(closure: PGClosure; return_value: PGValue; n_param_values: Tguint; param_values: PGValue; invocation_hint: Tgpointer); cdecl; external libgobject2_0;
procedure g_cclosure_marshal_generic(closure: PGClosure; return_gvalue: PGValue; n_param_values: Tguint; param_values: PGValue; invocation_hint: Tgpointer;
  marshal_data: Tgpointer); cdecl; external libgobject2_0;
procedure g_cclosure_marshal_generic_va(closure: PGClosure; return_value: PGValue; instance: Tgpointer; args_list: Tva_list; marshal_data: Tgpointer;
  n_params: longint; param_types: PGType); cdecl; external libgobject2_0;

function G_CLOSURE_NEEDS_MARSHAL(closure: PGClosure): Tgboolean;
function G_CLOSURE_N_NOTIFIERS(cl: PGClosure): longint;
function G_CCLOSURE_SWAP_DATA(cclosure: PGClosure): byte;
function G_CALLBACK(f: Pointer): TGCallback;


// === Konventiert am: 13-8-24 15:17:00 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function G_CLOSURE_NEEDS_MARSHAL(closure: PGClosure): Tgboolean;
begin
  G_CLOSURE_NEEDS_MARSHAL := closure^.marshal = nil;
end;

function G_CLOSURE_N_NOTIFIERS(cl: PGClosure): longint;
begin
  G_CLOSURE_N_NOTIFIERS := (((cl^.n_guards) shl 1) + cl^.n_fnotifiers) + cl^.n_inotifiers;
end;

function G_CCLOSURE_SWAP_DATA(cclosure: PGClosure): byte;
begin
  G_CCLOSURE_SWAP_DATA := cclosure^.derivative_flag;
end;

function G_CALLBACK(f: Pointer): TGCallback;
begin
  G_CALLBACK := TGCallback(f);
end;


{$ENDIF read_implementation}
