unit gfileenumerator;

interface

uses
  common_GLIB, gtypes, gerror, gtype, glist, gobject, giotypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGFileEnumeratorPrivate = record
  end;
  PGFileEnumeratorPrivate = ^TGFileEnumeratorPrivate;

  TGFileEnumerator = record
    parent_instance: TGObject;
    priv: PGFileEnumeratorPrivate;
  end;
  PGFileEnumerator = ^TGFileEnumerator;


  TGFileEnumeratorClass = record
    parent_class: TGObjectClass;
    next_file: function(enumerator: PGFileEnumerator; cancellable: PGCancellable; error: PPGError): PGFileInfo; cdecl;
    close_fn: function(enumerator: PGFileEnumerator; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl;
    next_files_async: procedure(enumerator: PGFileEnumerator; num_files: longint; io_priority: longint; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
      user_data: Tgpointer); cdecl;
    next_files_finish: function(enumerator: PGFileEnumerator; Result: PGAsyncResult; error: PPGError): PGList; cdecl;
    close_async: procedure(enumerator: PGFileEnumerator; io_priority: longint; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl;
    close_finish: function(enumerator: PGFileEnumerator; Result: PGAsyncResult; error: PPGError): Tgboolean; cdecl;
    _g_reserved1: procedure; cdecl;
    _g_reserved2: procedure; cdecl;
    _g_reserved3: procedure; cdecl;
    _g_reserved4: procedure; cdecl;
    _g_reserved5: procedure; cdecl;
    _g_reserved6: procedure; cdecl;
    _g_reserved7: procedure; cdecl;
  end;
  PGFileEnumeratorClass = ^TGFileEnumeratorClass;


function g_file_enumerator_get_type: TGType; cdecl; external libgio2;
function g_file_enumerator_next_file(enumerator: PGFileEnumerator; cancellable: PGCancellable; error: PPGError): PGFileInfo; cdecl; external libgio2;
function g_file_enumerator_close(enumerator: PGFileEnumerator; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libgio2;
procedure g_file_enumerator_next_files_async(enumerator: PGFileEnumerator; num_files: longint; io_priority: longint; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
  user_data: Tgpointer); cdecl; external libgio2;
function g_file_enumerator_next_files_finish(enumerator: PGFileEnumerator; Result: PGAsyncResult; error: PPGError): PGList; cdecl; external libgio2;
procedure g_file_enumerator_close_async(enumerator: PGFileEnumerator; io_priority: longint; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_file_enumerator_close_finish(enumerator: PGFileEnumerator; Result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_file_enumerator_is_closed(enumerator: PGFileEnumerator): Tgboolean; cdecl; external libgio2;
function g_file_enumerator_has_pending(enumerator: PGFileEnumerator): Tgboolean; cdecl; external libgio2;
procedure g_file_enumerator_set_pending(enumerator: PGFileEnumerator; pending: Tgboolean); cdecl; external libgio2;
function g_file_enumerator_get_container(enumerator: PGFileEnumerator): PGFile; cdecl; external libgio2;
function g_file_enumerator_get_child(enumerator: PGFileEnumerator; info: PGFileInfo): PGFile; cdecl; external libgio2;
function g_file_enumerator_iterate(direnum: PGFileEnumerator; out_info: PPGFileInfo; out_child: PPGFile; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libgio2;

// === Konventiert am: 18-8-24 15:09:37 ===

function G_TYPE_FILE_ENUMERATOR: TGType;
function G_FILE_ENUMERATOR(obj: Pointer): PGFileEnumerator;
function G_FILE_ENUMERATOR_CLASS(klass: Pointer): PGFileEnumeratorClass;
function G_IS_FILE_ENUMERATOR(obj: Pointer): Tgboolean;
function G_IS_FILE_ENUMERATOR_CLASS(klass: Pointer): Tgboolean;
function G_FILE_ENUMERATOR_GET_CLASS(obj: Pointer): PGFileEnumeratorClass;

implementation

function G_TYPE_FILE_ENUMERATOR: TGType;
begin
  G_TYPE_FILE_ENUMERATOR := g_file_enumerator_get_type;
end;

function G_FILE_ENUMERATOR(obj: Pointer): PGFileEnumerator;
begin
  Result := PGFileEnumerator(g_type_check_instance_cast(obj, G_TYPE_FILE_ENUMERATOR));
end;

function G_FILE_ENUMERATOR_CLASS(klass: Pointer): PGFileEnumeratorClass;
begin
  Result := PGFileEnumeratorClass(g_type_check_class_cast(klass, G_TYPE_FILE_ENUMERATOR));
end;

function G_IS_FILE_ENUMERATOR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_FILE_ENUMERATOR);
end;

function G_IS_FILE_ENUMERATOR_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_FILE_ENUMERATOR);
end;

function G_FILE_ENUMERATOR_GET_CLASS(obj: Pointer): PGFileEnumeratorClass;
begin
  Result := PGFileEnumeratorClass(PGTypeInstance(obj)^.g_class);
end;



end.
