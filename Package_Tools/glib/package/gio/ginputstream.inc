/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGInputStreamPrivate = record
  end;
  PGInputStreamPrivate = ^TGInputStreamPrivate;

  TGInputStream = record
    parent_instance: TGObject;
    priv: PGInputStreamPrivate;
  end;
  PGInputStream = ^TGInputStream;

  TGInputStreamClass = record
    parent_class: TGObjectClass;
    read_fn: function(stream: PGInputStream; buffer: pointer; Count: Tgsize; cancellable: PGCancellable; error: PPGError): Tgssize; cdecl;
    skip: function(stream: PGInputStream; Count: Tgsize; cancellable: PGCancellable; error: PPGError): Tgssize; cdecl;
    close_fn: function(stream: PGInputStream; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl;
    read_async: procedure(stream: PGInputStream; buffer: pointer; Count: Tgsize; io_priority: longint; cancellable: PGCancellable;
      callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl;
    read_finish: function(stream: PGInputStream; Result: PGAsyncResult; error: PPGError): Tgssize; cdecl;
    skip_async: procedure(stream: PGInputStream; Count: Tgsize; io_priority: longint; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
      user_data: Tgpointer); cdecl;
    skip_finish: function(stream: PGInputStream; Result: PGAsyncResult; error: PPGError): Tgssize; cdecl;
    close_async: procedure(stream: PGInputStream; io_priority: longint; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl;
    close_finish: function(stream: PGInputStream; Result: PGAsyncResult; error: PPGError): Tgboolean; cdecl;
    _g_reserved1: procedure; cdecl;
    _g_reserved2: procedure; cdecl;
    _g_reserved3: procedure; cdecl;
    _g_reserved4: procedure; cdecl;
    _g_reserved5: procedure; cdecl;
  end;
  PGInputStreamClass = ^TGInputStreamClass;


function g_input_stream_get_type: TGType; cdecl; external libgio2;
function g_input_stream_read(stream: PGInputStream; buffer: pointer; Count: Tgsize; cancellable: PGCancellable; error: PPGError): Tgssize; cdecl; external libgio2;
function g_input_stream_read_all(stream: PGInputStream; buffer: pointer; Count: Tgsize; bytes_read: Pgsize; cancellable: PGCancellable;
  error: PPGError): Tgboolean; cdecl; external libgio2;
function g_input_stream_read_bytes(stream: PGInputStream; Count: Tgsize; cancellable: PGCancellable; error: PPGError): PGBytes; cdecl; external libgio2;
function g_input_stream_skip(stream: PGInputStream; Count: Tgsize; cancellable: PGCancellable; error: PPGError): Tgssize; cdecl; external libgio2;
function g_input_stream_close(stream: PGInputStream; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libgio2;
procedure g_input_stream_read_async(stream: PGInputStream; buffer: pointer; Count: Tgsize; io_priority: longint; cancellable: PGCancellable;
  callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_input_stream_read_finish(stream: PGInputStream; Result: PGAsyncResult; error: PPGError): Tgssize; cdecl; external libgio2;
procedure g_input_stream_read_all_async(stream: PGInputStream; buffer: pointer; Count: Tgsize; io_priority: longint; cancellable: PGCancellable;
  callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_input_stream_read_all_finish(stream: PGInputStream; Result: PGAsyncResult; bytes_read: Pgsize; error: PPGError): Tgboolean; cdecl; external libgio2;
procedure g_input_stream_read_bytes_async(stream: PGInputStream; Count: Tgsize; io_priority: longint; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
  user_data: Tgpointer); cdecl; external libgio2;
function g_input_stream_read_bytes_finish(stream: PGInputStream; Result: PGAsyncResult; error: PPGError): PGBytes; cdecl; external libgio2;
procedure g_input_stream_skip_async(stream: PGInputStream; Count: Tgsize; io_priority: longint; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
  user_data: Tgpointer); cdecl; external libgio2;
function g_input_stream_skip_finish(stream: PGInputStream; Result: PGAsyncResult; error: PPGError): Tgssize; cdecl; external libgio2;
procedure g_input_stream_close_async(stream: PGInputStream; io_priority: longint; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_input_stream_close_finish(stream: PGInputStream; Result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_input_stream_is_closed(stream: PGInputStream): Tgboolean; cdecl; external libgio2;
function g_input_stream_has_pending(stream: PGInputStream): Tgboolean; cdecl; external libgio2;
function g_input_stream_set_pending(stream: PGInputStream; error: PPGError): Tgboolean; cdecl; external libgio2;
procedure g_input_stream_clear_pending(stream: PGInputStream); cdecl; external libgio2;

// === Konventiert am: 18-8-24 15:22:21 ===

function G_TYPE_INPUT_STREAM: TGType;
function G_INPUT_STREAM(obj: Pointer): PGInputStream;
function G_INPUT_STREAM_CLASS(klass: Pointer): PGInputStreamClass;
function G_IS_INPUT_STREAM(obj: Pointer): Tgboolean;
function G_IS_INPUT_STREAM_CLASS(klass: Pointer): Tgboolean;
function G_INPUT_STREAM_GET_CLASS(obj: Pointer): PGInputStreamClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_TYPE_INPUT_STREAM: TGType;
begin
  G_TYPE_INPUT_STREAM := g_input_stream_get_type;
end;

function G_INPUT_STREAM(obj: Pointer): PGInputStream;
begin
  Result := PGInputStream(g_type_check_instance_cast(obj, G_TYPE_INPUT_STREAM));
end;

function G_INPUT_STREAM_CLASS(klass: Pointer): PGInputStreamClass;
begin
  Result := PGInputStreamClass(g_type_check_class_cast(klass, G_TYPE_INPUT_STREAM));
end;

function G_IS_INPUT_STREAM(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_INPUT_STREAM);
end;

function G_IS_INPUT_STREAM_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_INPUT_STREAM);
end;

function G_INPUT_STREAM_GET_CLASS(obj: Pointer): PGInputStreamClass;
begin
  Result := PGInputStreamClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
