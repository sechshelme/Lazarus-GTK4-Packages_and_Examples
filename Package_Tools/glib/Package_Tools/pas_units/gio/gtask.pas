unit gtask;

interface

uses
  common_GLIB, gtypes, gquark, gerror, gmain, gtype, giotypes, gobject, gioenums;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGTask = record
  end;
  PGTask = ^TGTask;

  TGTaskClass = record
  end;
  PGTaskClass = ^TGTaskClass;

function g_task_get_type: TGType; cdecl; external libgio2;
function g_task_new(source_object: Tgpointer; cancellable: PGCancellable; callback: TGAsyncReadyCallback; callback_data: Tgpointer): PGTask; cdecl; external libgio2;
procedure g_task_report_error(source_object: Tgpointer; callback: TGAsyncReadyCallback; callback_data: Tgpointer; source_tag: Tgpointer; error: PGError); cdecl; external libgio2;
procedure g_task_report_new_error(source_object: Tgpointer; callback: TGAsyncReadyCallback; callback_data: Tgpointer; source_tag: Tgpointer; domain: TGQuark;
  code: Tgint; format: PChar; args: array of const); cdecl; external libgio2;
procedure g_task_report_new_error(source_object: Tgpointer; callback: TGAsyncReadyCallback; callback_data: Tgpointer; source_tag: Tgpointer; domain: TGQuark;
  code: Tgint; format: PChar); cdecl; external libgio2;
procedure g_task_set_task_data(task: PGTask; task_data: Tgpointer; task_data_destroy: TGDestroyNotify); cdecl; external libgio2;
procedure g_task_set_priority(task: PGTask; priority: Tgint); cdecl; external libgio2;
procedure g_task_set_check_cancellable(task: PGTask; check_cancellable: Tgboolean); cdecl; external libgio2;
procedure g_task_set_source_tag(task: PGTask; source_tag: Tgpointer); cdecl; external libgio2;
procedure g_task_set_name(task: PGTask; Name: Pgchar); cdecl; external libgio2;
procedure g_task_set_static_name(task: PGTask; Name: Pgchar); cdecl; external libgio2;
function g_task_get_source_object(task: PGTask): Tgpointer; cdecl; external libgio2;
function g_task_get_task_data(task: PGTask): Tgpointer; cdecl; external libgio2;
function g_task_get_priority(task: PGTask): Tgint; cdecl; external libgio2;
function g_task_get_context(task: PGTask): PGMainContext; cdecl; external libgio2;
function g_task_get_cancellable(task: PGTask): PGCancellable; cdecl; external libgio2;
function g_task_get_check_cancellable(task: PGTask): Tgboolean; cdecl; external libgio2;
function g_task_get_source_tag(task: PGTask): Tgpointer; cdecl; external libgio2;
function g_task_get_name(task: PGTask): Pgchar; cdecl; external libgio2;
function g_task_is_valid(Result: Tgpointer; source_object: Tgpointer): Tgboolean; cdecl; external libgio2;

type
  TGTaskThreadFunc = procedure(task: PGTask; source_object: Tgpointer; task_data: Tgpointer; cancellable: PGCancellable); cdecl;

procedure g_task_run_in_thread(task: PGTask; task_func: TGTaskThreadFunc); cdecl; external libgio2;
procedure g_task_run_in_thread_sync(task: PGTask; task_func: TGTaskThreadFunc); cdecl; external libgio2;
function g_task_set_return_on_cancel(task: PGTask; return_on_cancel: Tgboolean): Tgboolean; cdecl; external libgio2;
function g_task_get_return_on_cancel(task: PGTask): Tgboolean; cdecl; external libgio2;
procedure g_task_attach_source(task: PGTask; Source: PGSource; callback: TGSourceFunc); cdecl; external libgio2;
procedure g_task_return_pointer(task: PGTask; Result: Tgpointer; result_destroy: TGDestroyNotify); cdecl; external libgio2;
procedure g_task_return_boolean(task: PGTask; Result: Tgboolean); cdecl; external libgio2;
procedure g_task_return_int(task: PGTask; Result: Tgssize); cdecl; external libgio2;
procedure g_task_return_error(task: PGTask; error: PGError); cdecl; external libgio2;
procedure g_task_return_prefixed_error(task: PGTask; error: PGError; format: PChar; args: array of const); cdecl; external;
procedure g_task_return_prefixed_error(task: PGTask; error: PGError; format: PChar); cdecl; external;
procedure g_task_return_new_error(task: PGTask; domain: TGQuark; code: Tgint; format: PChar);varargs cdecl; external libgio2;
procedure g_task_return_new_error_literal(task: PGTask; domain: TGQuark; code: Tgint; message: PChar); cdecl; external libgio2;
procedure g_task_return_value(task: PGTask; Result: PGValue); cdecl; external libgio2;
function g_task_return_error_if_cancelled(task: PGTask): Tgboolean; cdecl; external libgio2;
function g_task_propagate_pointer(task: PGTask; error: PPGError): Tgpointer; cdecl; external libgio2;
function g_task_propagate_boolean(task: PGTask; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_task_propagate_int(task: PGTask; error: PPGError): Tgssize; cdecl; external libgio2;
function g_task_propagate_value(task: PGTask; Value: PGValue; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_task_had_error(task: PGTask): Tgboolean; cdecl; external libgio2;
function g_task_get_completed(task: PGTask): Tgboolean; cdecl; external libgio2;

procedure g_task_print_alive_tasks; cdecl; external libgio2;

// === Konventiert am: 19-8-24 19:35:38 ===

function G_TYPE_TASK: TGType;
function G_TASK(obj: Pointer): PGTask;
function G_TASK_CLASS(klass: Pointer): PGTaskClass;
function G_IS_TASK(obj: Pointer): Tgboolean;
function G_IS_TASK_CLASS(klass: Pointer): Tgboolean;
function G_TASK_GET_CLASS(obj: Pointer): PGTaskClass;

implementation

function G_TYPE_TASK: TGType;
begin
  G_TYPE_TASK := g_task_get_type;
end;

function G_TASK(obj: Pointer): PGTask;
begin
  Result := PGTask(g_type_check_instance_cast(obj, G_TYPE_TASK));
end;

function G_TASK_CLASS(klass: Pointer): PGTaskClass;
begin
  Result := PGTaskClass(g_type_check_class_cast(klass, G_TYPE_TASK));
end;

function G_IS_TASK(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_TASK);
end;

function G_IS_TASK_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_TASK);
end;

function G_TASK_GET_CLASS(obj: Pointer): PGTaskClass;
begin
  Result := PGTaskClass(PGTypeInstance(obj)^.g_class);
end;



end.
