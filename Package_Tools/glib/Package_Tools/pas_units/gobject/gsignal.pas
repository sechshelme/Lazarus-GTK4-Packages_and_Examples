unit gsignal;

interface

uses
  common_GLIB, gtypes, gquark, gtype, gclosure;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PGSignalCMarshaller = ^TGSignalCMarshaller;
  TGSignalCMarshaller = TGClosureMarshal;

  PGSignalCVaMarshaller = ^TGSignalCVaMarshaller;
  TGSignalCVaMarshaller = TGVaClosureMarshal;

type
  PGSignalFlags = ^TGSignalFlags;
  TGSignalFlags = longint;

const
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
  G_SIGNAL_FLAGS_MASK = $1ff;

type
  PGSignalInvocationHint = ^TGSignalInvocationHint;

  TGSignalInvocationHint = record
    signal_id: Tguint;
    detail: TGQuark;
    run_type: TGSignalFlags;
  end;
  TGSignalEmissionHook = function(ihint: PGSignalInvocationHint; n_param_values: Tguint; param_values: PGValue; Data: Tgpointer): Tgboolean; cdecl;
  TGSignalAccumulator = function(ihint: PGSignalInvocationHint; return_accu: PGValue; handler_return: PGValue; Data: Tgpointer): Tgboolean; cdecl;

  PGConnectFlags = ^TGConnectFlags;
  TGConnectFlags = longint;

const
  G_CONNECT_DEFAULT = 0;
  G_CONNECT_AFTER = 1 shl 0;
  G_CONNECT_SWAPPED = 1 shl 1;

type
  PGSignalMatchType = ^TGSignalMatchType;
  TGSignalMatchType = longint;

const
  G_SIGNAL_MATCH_ID = 1 shl 0;
  G_SIGNAL_MATCH_DETAIL = 1 shl 1;
  G_SIGNAL_MATCH_CLOSURE = 1 shl 2;
  G_SIGNAL_MATCH_FUNC = 1 shl 3;
  G_SIGNAL_MATCH_DATA = 1 shl 4;
  G_SIGNAL_MATCH_UNBLOCKED = 1 shl 5;
  G_SIGNAL_MATCH_MASK = $3f;

  G_SIGNAL_TYPE_STATIC_SCOPE = G_TYPE_FLAG_RESERVED_ID_BIT;

type
  PGSignalQuery = ^TGSignalQuery;

  TGSignalQuery = record
    signal_id: Tguint;
    signal_name: Pgchar;
    itype: TGType;
    signal_flags: TGSignalFlags;
    return_type: TGType;
    n_params: Tguint;
    param_types: PGType;
  end;

function g_signal_newv(signal_name: Pgchar; itype: TGType; signal_flags: TGSignalFlags; class_closure: PGClosure; accumulator: TGSignalAccumulator;
  accu_data: Tgpointer; c_marshaller: TGSignalCMarshaller; return_type: TGType; n_params: Tguint; param_types: PGType): Tguint; cdecl; external libgobject2_0;
function g_signal_new_valist(signal_name: Pgchar; itype: TGType; signal_flags: TGSignalFlags; class_closure: PGClosure; accumulator: TGSignalAccumulator;
  accu_data: Tgpointer; c_marshaller: TGSignalCMarshaller; return_type: TGType; n_params: Tguint; args: Tva_list): Tguint; cdecl; external libgobject2_0;
function g_signal_new(signal_name: Pgchar; itype: TGType; signal_flags: TGSignalFlags; class_offset: Tguint; accumulator: TGSignalAccumulator;
  accu_data: Tgpointer; c_marshaller: TGSignalCMarshaller; return_type: TGType; n_params: Tguint; args: array of const): Tguint; cdecl; external libgobject2_0;
function g_signal_new(signal_name: Pgchar; itype: TGType; signal_flags: TGSignalFlags; class_offset: Tguint; accumulator: TGSignalAccumulator;
  accu_data: Tgpointer; c_marshaller: TGSignalCMarshaller; return_type: TGType; n_params: Tguint): Tguint; cdecl; external libgobject2_0;
function g_signal_new_class_handler(signal_name: Pgchar; itype: TGType; signal_flags: TGSignalFlags; class_handler: TGCallback; accumulator: TGSignalAccumulator;
  accu_data: Tgpointer; c_marshaller: TGSignalCMarshaller; return_type: TGType; n_params: Tguint; args: array of const): Tguint; cdecl; external libgobject2_0;
function g_signal_new_class_handler(signal_name: Pgchar; itype: TGType; signal_flags: TGSignalFlags; class_handler: TGCallback; accumulator: TGSignalAccumulator;
  accu_data: Tgpointer; c_marshaller: TGSignalCMarshaller; return_type: TGType; n_params: Tguint): Tguint; cdecl; external libgobject2_0;
procedure g_signal_set_va_marshaller(signal_id: Tguint; instance_type: TGType; va_marshaller: TGSignalCVaMarshaller); cdecl; external libgobject2_0;
procedure g_signal_emitv(instance_and_params: PGValue; signal_id: Tguint; detail: TGQuark; return_value: PGValue); cdecl; external libgobject2_0;
procedure g_signal_emit_valist(instance: Tgpointer; signal_id: Tguint; detail: TGQuark; var_args: Tva_list); cdecl; external libgobject2_0;
procedure g_signal_emit(instance: Tgpointer; signal_id: Tguint; detail: TGQuark; args: array of const); cdecl; external libgobject2_0;
procedure g_signal_emit(instance: Tgpointer; signal_id: Tguint; detail: TGQuark); cdecl; external libgobject2_0;
procedure g_signal_emit_by_name(instance: Tgpointer; detailed_signal: Pgchar; args: array of const); cdecl; external libgobject2_0;
procedure g_signal_emit_by_name(instance: Tgpointer; detailed_signal: Pgchar); cdecl; external libgobject2_0;
function g_signal_lookup(Name: Pgchar; itype: TGType): Tguint; cdecl; external libgobject2_0;
function g_signal_name(signal_id: Tguint): Pgchar; cdecl; external libgobject2_0;
procedure g_signal_query(signal_id: Tguint; query: PGSignalQuery); cdecl; external libgobject2_0;
function g_signal_list_ids(itype: TGType; n_ids: Pguint): Pguint; cdecl; external libgobject2_0;
function g_signal_is_valid_name(Name: Pgchar): Tgboolean; cdecl; external libgobject2_0;
function g_signal_parse_name(detailed_signal: Pgchar; itype: TGType; signal_id_p: Pguint; detail_p: PGQuark; force_detail_quark: Tgboolean): Tgboolean; cdecl; external libgobject2_0;
function g_signal_get_invocation_hint(instance: Tgpointer): PGSignalInvocationHint; cdecl; external libgobject2_0;
procedure g_signal_stop_emission(instance: Tgpointer; signal_id: Tguint; detail: TGQuark); cdecl; external libgobject2_0;
procedure g_signal_stop_emission_by_name(instance: Tgpointer; detailed_signal: Pgchar); cdecl; external libgobject2_0;
function g_signal_add_emission_hook(signal_id: Tguint; detail: TGQuark; hook_func: TGSignalEmissionHook; hook_data: Tgpointer; data_destroy: TGDestroyNotify): Tgulong; cdecl; external libgobject2_0;
procedure g_signal_remove_emission_hook(signal_id: Tguint; hook_id: Tgulong); cdecl; external libgobject2_0;
function g_signal_has_handler_pending(instance: Tgpointer; signal_id: Tguint; detail: TGQuark; may_be_blocked: Tgboolean): Tgboolean; cdecl; external libgobject2_0;
function g_signal_connect_closure_by_id(instance: Tgpointer; signal_id: Tguint; detail: TGQuark; closure: PGClosure; after: Tgboolean): Tgulong; cdecl; external libgobject2_0;
function g_signal_connect_closure(instance: Tgpointer; detailed_signal: Pgchar; closure: PGClosure; after: Tgboolean): Tgulong; cdecl; external libgobject2_0;
function g_signal_connect_data(instance: Tgpointer; detailed_signal: Pgchar; c_handler: TGCallback; Data: Tgpointer; destroy_data: TGClosureNotify;
  connect_flags: TGConnectFlags): Tgulong; cdecl; external libgobject2_0;
procedure g_signal_handler_block(instance: Tgpointer; handler_id: Tgulong); cdecl; external libgobject2_0;
procedure g_signal_handler_unblock(instance: Tgpointer; handler_id: Tgulong); cdecl; external libgobject2_0;
procedure g_signal_handler_disconnect(instance: Tgpointer; handler_id: Tgulong); cdecl; external libgobject2_0;
function g_signal_handler_is_connected(instance: Tgpointer; handler_id: Tgulong): Tgboolean; cdecl; external libgobject2_0;
function g_signal_handler_find(instance: Tgpointer; mask: TGSignalMatchType; signal_id: Tguint; detail: TGQuark; closure: PGClosure;
  func: Tgpointer; Data: Tgpointer): Tgulong; cdecl; external libgobject2_0;
function g_signal_handlers_block_matched(instance: Tgpointer; mask: TGSignalMatchType; signal_id: Tguint; detail: TGQuark; closure: PGClosure;
  func: Tgpointer; Data: Tgpointer): Tguint; cdecl; external libgobject2_0;
function g_signal_handlers_unblock_matched(instance: Tgpointer; mask: TGSignalMatchType; signal_id: Tguint; detail: TGQuark; closure: PGClosure;
  func: Tgpointer; Data: Tgpointer): Tguint; cdecl; external libgobject2_0;
function g_signal_handlers_disconnect_matched(instance: Tgpointer; mask: TGSignalMatchType; signal_id: Tguint; detail: TGQuark; closure: PGClosure;
  func: Tgpointer; Data: Tgpointer): Tguint; cdecl; external libgobject2_0;
procedure g_clear_signal_handler(handler_id_ptr: Pgulong; instance: Tgpointer); cdecl; external libgobject2_0;
procedure g_signal_override_class_closure(signal_id: Tguint; instance_type: TGType; class_closure: PGClosure); cdecl; external libgobject2_0;
procedure g_signal_override_class_handler(signal_name: Pgchar; instance_type: TGType; class_handler: TGCallback); cdecl; external libgobject2_0;
procedure g_signal_chain_from_overridden(instance_and_params: PGValue; return_value: PGValue); cdecl; external libgobject2_0;
procedure g_signal_chain_from_overridden_handler(instance: Tgpointer; args: array of const); cdecl; external libgobject2_0;
procedure g_signal_chain_from_overridden_handler(instance: Tgpointer); cdecl; external libgobject2_0;

function g_signal_accumulator_true_handled(ihint: PGSignalInvocationHint; return_accu: PGValue; handler_return: PGValue; dummy: Tgpointer): Tgboolean; cdecl; external libgobject2_0;
function g_signal_accumulator_first_wins(ihint: PGSignalInvocationHint; return_accu: PGValue; handler_return: PGValue; dummy: Tgpointer): Tgboolean; cdecl; external libgobject2_0;
procedure g_signal_handlers_destroy(instance: Tgpointer); cdecl; external libgobject2_0;
procedure _g_signals_destroy(itype: TGType); cdecl; external libgobject2_0;

function g_signal_connect(instance: Tgpointer; detailed_signal: Pgchar; c_handler: TGCallback; Data: Tgpointer): Tgulong;
function g_signal_connect_after(instance: Tgpointer; detailed_signal: Pgchar; c_handler: TGCallback; Data: Tgpointer): Tgulong;
function g_signal_connect_swapped(instance: Tgpointer; detailed_signal: Pgchar; c_handler: TGCallback; Data: Tgpointer): Tguint;
function g_signal_handlers_disconnect_by_func(instance, func, Data: Tgpointer): Tguint;
function g_signal_handlers_disconnect_by_data(instance, Data: Tgpointer): Tguint;
function g_signal_handlers_block_by_func(instance: Tgpointer; func, Data: Tgpointer): Tguint;
function g_signal_handlers_unblock_by_func(instance: Tgpointer; func, Data: Tgpointer): Tguint;

// === Konventiert am: 13-8-24 15:40:53 ===


implementation

function g_signal_connect(instance: Tgpointer; detailed_signal: Pgchar;    c_handler: TGCallback; Data: Tgpointer): Tgulong;
begin
  g_signal_connect := g_signal_connect_data(instance, detailed_signal, c_handler, Data, nil, TGConnectFlags(0));
end;

function g_signal_connect_after(instance: Tgpointer; detailed_signal: Pgchar;  c_handler: TGCallback; Data: Tgpointer): Tgulong;
begin
  g_signal_connect_after := g_signal_connect_data(instance, detailed_signal, c_handler, Data, nil, G_CONNECT_AFTER);
end;

function g_signal_connect_swapped(instance: Tgpointer; detailed_signal: Pgchar;  c_handler: TGCallback; Data: Tgpointer): Tguint;
begin
  g_signal_connect_swapped := g_signal_connect_data(instance, detailed_signal, c_handler, Data, nil, G_CONNECT_SWAPPED);
end;

function g_signal_handlers_disconnect_by_func(instance, func, Data: Tgpointer): Tguint;
begin
  g_signal_handlers_disconnect_by_func := g_signal_handlers_disconnect_matched(instance, TGSignalMatchType(G_SIGNAL_MATCH_FUNC or G_SIGNAL_MATCH_DATA), 0, 0, nil, func, Data);
end;

function g_signal_handlers_disconnect_by_data(instance, Data: Tgpointer): Tguint;
begin
  g_signal_handlers_disconnect_by_data := g_signal_handlers_disconnect_matched(instance, G_SIGNAL_MATCH_DATA, 0, 0, nil, nil, Data);
end;

function g_signal_handlers_block_by_func(instance: Tgpointer; func,   Data: Tgpointer): Tguint;
begin
  g_signal_handlers_block_by_func := g_signal_handlers_block_matched(instance, TGSignalMatchType(G_SIGNAL_MATCH_FUNC or G_SIGNAL_MATCH_DATA), 0, 0, nil, func, Data);
end;

function g_signal_handlers_unblock_by_func(instance: Tgpointer; func,     Data: Tgpointer): Tguint;
begin
  g_signal_handlers_unblock_by_func := g_signal_handlers_unblock_matched(instance, TGSignalMatchType(G_SIGNAL_MATCH_FUNC or G_SIGNAL_MATCH_DATA), 0, 0, nil, func, Data);
end;


end.
