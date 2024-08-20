unit gsimpleasyncresult;

interface

uses
  common_GLIB, gtypes, gquark, gerror, gtype, giotypes, gobject, gioenums;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGSimpleAsyncResultClass = record
  end;
  PGSimpleAsyncResultClass = ^TGSimpleAsyncResultClass;

function g_simple_async_result_get_type: TGType; cdecl; external libgio2;
function g_simple_async_result_new(source_object: PGObject; callback: TGAsyncReadyCallback; user_data: Tgpointer; source_tag: Tgpointer): PGSimpleAsyncResult; cdecl; external libgio2;
function g_simple_async_result_new_error(source_object: PGObject; callback: TGAsyncReadyCallback; user_data: Tgpointer; domain: TGQuark; code: Tgint;
  format: PChar; args: array of const): PGSimpleAsyncResult; cdecl; external libgio2;
function g_simple_async_result_new_error(source_object: PGObject; callback: TGAsyncReadyCallback; user_data: Tgpointer; domain: TGQuark; code: Tgint;
  format: PChar): PGSimpleAsyncResult; cdecl; external libgio2;
function g_simple_async_result_new_from_error(source_object: PGObject; callback: TGAsyncReadyCallback; user_data: Tgpointer; error: PGError): PGSimpleAsyncResult; cdecl; external libgio2;
function g_simple_async_result_new_take_error(source_object: PGObject; callback: TGAsyncReadyCallback; user_data: Tgpointer; error: PGError): PGSimpleAsyncResult; cdecl; external libgio2;
procedure g_simple_async_result_set_op_res_gpointer(simple: PGSimpleAsyncResult; op_res: Tgpointer; destroy_op_res: TGDestroyNotify); cdecl; external libgio2;
function g_simple_async_result_get_op_res_gpointer(simple: PGSimpleAsyncResult): Tgpointer; cdecl; external libgio2;
procedure g_simple_async_result_set_op_res_gssize(simple: PGSimpleAsyncResult; op_res: Tgssize); cdecl; external libgio2;
function g_simple_async_result_get_op_res_gssize(simple: PGSimpleAsyncResult): Tgssize; cdecl; external libgio2;
procedure g_simple_async_result_set_op_res_gboolean(simple: PGSimpleAsyncResult; op_res: Tgboolean); cdecl; external libgio2;
function g_simple_async_result_get_op_res_gboolean(simple: PGSimpleAsyncResult): Tgboolean; cdecl; external libgio2;
procedure g_simple_async_result_set_check_cancellable(simple: PGSimpleAsyncResult; check_cancellable: PGCancellable); cdecl; external libgio2;
function g_simple_async_result_get_source_tag(simple: PGSimpleAsyncResult): Tgpointer; cdecl; external libgio2;
procedure g_simple_async_result_set_handle_cancellation(simple: PGSimpleAsyncResult; handle_cancellation: Tgboolean); cdecl; external libgio2;
procedure g_simple_async_result_complete(simple: PGSimpleAsyncResult); cdecl; external libgio2;
procedure g_simple_async_result_complete_in_idle(simple: PGSimpleAsyncResult); cdecl; external libgio2;
procedure g_simple_async_result_run_in_thread(simple: PGSimpleAsyncResult; func: TGSimpleAsyncThreadFunc; io_priority: longint; cancellable: PGCancellable); cdecl; external libgio2;
procedure g_simple_async_result_set_from_error(simple: PGSimpleAsyncResult; error: PGError); cdecl; external libgio2;
procedure g_simple_async_result_take_error(simple: PGSimpleAsyncResult; error: PGError); cdecl; external libgio2;
function g_simple_async_result_propagate_error(simple: PGSimpleAsyncResult; dest: PPGError): Tgboolean; cdecl; external libgio2;
procedure g_simple_async_result_set_error(simple: PGSimpleAsyncResult; domain: TGQuark; code: Tgint; format: PChar; args: array of const); cdecl; external libgio2;
procedure g_simple_async_result_set_error(simple: PGSimpleAsyncResult; domain: TGQuark; code: Tgint; format: PChar); cdecl; external libgio2;
procedure g_simple_async_result_set_error_va(simple: PGSimpleAsyncResult; domain: TGQuark; code: Tgint; format: PChar; args: Tva_list); cdecl; external libgio2;
function g_simple_async_result_is_valid(Result: PGAsyncResult; Source: PGObject; source_tag: Tgpointer): Tgboolean; cdecl; external libgio2;
procedure g_simple_async_report_error_in_idle(obj: PGObject; callback: TGAsyncReadyCallback; user_data: Tgpointer; domain: TGQuark; code: Tgint;
  format: PChar); varargs; cdecl; external libgio2;
procedure g_simple_async_report_gerror_in_idle(obj: PGObject; callback: TGAsyncReadyCallback; user_data: Tgpointer; error: PGError); cdecl; external libgio2;
procedure g_simple_async_report_take_gerror_in_idle(obj: PGObject; callback: TGAsyncReadyCallback; user_data: Tgpointer; error: PGError); cdecl; external libgio2;

// === Konventiert am: 20-8-24 15:33:59 ===

function G_TYPE_SIMPLE_ASYNC_RESULT: TGType;
function G_SIMPLE_ASYNC_RESULT(obj: Pointer): PGSimpleAsyncResult;
function G_SIMPLE_ASYNC_RESULT_CLASS(klass: Pointer): PGSimpleAsyncResultClass;
function G_IS_SIMPLE_ASYNC_RESULT(obj: Pointer): Tgboolean;
function G_IS_SIMPLE_ASYNC_RESULT_CLASS(klass: Pointer): Tgboolean;
function G_SIMPLE_ASYNC_RESULT_GET_CLASS(obj: Pointer): PGSimpleAsyncResultClass;

implementation

function G_TYPE_SIMPLE_ASYNC_RESULT: TGType;
begin
  G_TYPE_SIMPLE_ASYNC_RESULT := g_simple_async_result_get_type;
end;

function G_SIMPLE_ASYNC_RESULT(obj: Pointer): PGSimpleAsyncResult;
begin
  Result := PGSimpleAsyncResult(g_type_check_instance_cast(obj, G_TYPE_SIMPLE_ASYNC_RESULT));
end;

function G_SIMPLE_ASYNC_RESULT_CLASS(klass: Pointer): PGSimpleAsyncResultClass;
begin
  Result := PGSimpleAsyncResultClass(g_type_check_class_cast(klass, G_TYPE_SIMPLE_ASYNC_RESULT));
end;

function G_IS_SIMPLE_ASYNC_RESULT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_SIMPLE_ASYNC_RESULT);
end;

function G_IS_SIMPLE_ASYNC_RESULT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_SIMPLE_ASYNC_RESULT);
end;

function G_SIMPLE_ASYNC_RESULT_GET_CLASS(obj: Pointer): PGSimpleAsyncResultClass;
begin
  Result := PGSimpleAsyncResultClass(PGTypeInstance(obj)^.g_class);
end;



end.
