/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGOutputStreamPrivate = record
  end;
  PGOutputStreamPrivate = ^TGOutputStreamPrivate;

  TGOutputStream = record
    parent_instance: TGObject;
    priv: PGOutputStreamPrivate;
  end;
  PGOutputStream = ^TGOutputStream;

  TGOutputStreamClass = record
    parent_class: TGObjectClass;
    write_fn: function(stream: PGOutputStream; buffer: pointer; Count: Tgsize; cancellable: PGCancellable; error: PPGError): Tgssize; cdecl;
    splice: function(stream: PGOutputStream; Source: PGInputStream; flags: TGOutputStreamSpliceFlags; cancellable: PGCancellable; error: PPGError): Tgssize; cdecl;
    flush: function(stream: PGOutputStream; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl;
    close_fn: function(stream: PGOutputStream; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl;
    write_async: procedure(stream: PGOutputStream; buffer: pointer; Count: Tgsize; io_priority: longint; cancellable: PGCancellable;
      callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl;
    write_finish: function(stream: PGOutputStream; Result: PGAsyncResult; error: PPGError): Tgssize; cdecl;
    splice_async: procedure(stream: PGOutputStream; Source: PGInputStream; flags: TGOutputStreamSpliceFlags; io_priority: longint; cancellable: PGCancellable;
      callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl;
    splice_finish: function(stream: PGOutputStream; Result: PGAsyncResult; error: PPGError): Tgssize; cdecl;
    flush_async: procedure(stream: PGOutputStream; io_priority: longint; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl;
    flush_finish: function(stream: PGOutputStream; Result: PGAsyncResult; error: PPGError): Tgboolean; cdecl;
    close_async: procedure(stream: PGOutputStream; io_priority: longint; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl;
    close_finish: function(stream: PGOutputStream; Result: PGAsyncResult; error: PPGError): Tgboolean; cdecl;
    writev_fn: function(stream: PGOutputStream; vectors: PGOutputVector; n_vectors: Tgsize; bytes_written: Pgsize; cancellable: PGCancellable;
      error: PPGError): Tgboolean; cdecl;
    writev_async: procedure(stream: PGOutputStream; vectors: PGOutputVector; n_vectors: Tgsize; io_priority: longint; cancellable: PGCancellable;
      callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl;
    writev_finish: function(stream: PGOutputStream; Result: PGAsyncResult; bytes_written: Pgsize; error: PPGError): Tgboolean; cdecl;
    _g_reserved4: procedure; cdecl;
    _g_reserved5: procedure; cdecl;
    _g_reserved6: procedure; cdecl;
    _g_reserved7: procedure; cdecl;
    _g_reserved8: procedure; cdecl;
  end;
  PGOutputStreamClass = ^TGOutputStreamClass;


function g_output_stream_get_type: TGType; cdecl; external libgio2;
function g_output_stream_write(stream: PGOutputStream; buffer: pointer; Count: Tgsize; cancellable: PGCancellable; error: PPGError): Tgssize; cdecl; external libgio2;
function g_output_stream_write_all(stream: PGOutputStream; buffer: pointer; Count: Tgsize; bytes_written: Pgsize; cancellable: PGCancellable;
  error: PPGError): Tgboolean; cdecl; external libgio2;
function g_output_stream_writev(stream: PGOutputStream; vectors: PGOutputVector; n_vectors: Tgsize; bytes_written: Pgsize; cancellable: PGCancellable;
  error: PPGError): Tgboolean; cdecl; external libgio2;
function g_output_stream_writev_all(stream: PGOutputStream; vectors: PGOutputVector; n_vectors: Tgsize; bytes_written: Pgsize; cancellable: PGCancellable;
  error: PPGError): Tgboolean; cdecl; external libgio2;
function g_output_stream_printf(stream: PGOutputStream; bytes_written: Pgsize; cancellable: PGCancellable; error: PPGError; format: Pgchar;
  args: array of const): Tgboolean; cdecl; external libgio2;
function g_output_stream_printf(stream: PGOutputStream; bytes_written: Pgsize; cancellable: PGCancellable; error: PPGError; format: Pgchar): Tgboolean; cdecl; external libgio2;
function g_output_stream_vprintf(stream: PGOutputStream; bytes_written: Pgsize; cancellable: PGCancellable; error: PPGError; format: Pgchar;
  args: Tva_list): Tgboolean; cdecl; external libgio2;
function g_output_stream_write_bytes(stream: PGOutputStream; bytes: PGBytes; cancellable: PGCancellable; error: PPGError): Tgssize; cdecl; external libgio2;
function g_output_stream_splice(stream: PGOutputStream; Source: PGInputStream; flags: TGOutputStreamSpliceFlags; cancellable: PGCancellable; error: PPGError): Tgssize; cdecl; external libgio2;
function g_output_stream_flush(stream: PGOutputStream; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_output_stream_close(stream: PGOutputStream; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libgio2;
procedure g_output_stream_write_async(stream: PGOutputStream; buffer: pointer; Count: Tgsize; io_priority: longint; cancellable: PGCancellable;
  callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_output_stream_write_finish(stream: PGOutputStream; Result: PGAsyncResult; error: PPGError): Tgssize; cdecl; external libgio2;
procedure g_output_stream_write_all_async(stream: PGOutputStream; buffer: pointer; Count: Tgsize; io_priority: longint; cancellable: PGCancellable;
  callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_output_stream_write_all_finish(stream: PGOutputStream; Result: PGAsyncResult; bytes_written: Pgsize; error: PPGError): Tgboolean; cdecl; external libgio2;
procedure g_output_stream_writev_async(stream: PGOutputStream; vectors: PGOutputVector; n_vectors: Tgsize; io_priority: longint; cancellable: PGCancellable;
  callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_output_stream_writev_finish(stream: PGOutputStream; Result: PGAsyncResult; bytes_written: Pgsize; error: PPGError): Tgboolean; cdecl; external libgio2;
procedure g_output_stream_writev_all_async(stream: PGOutputStream; vectors: PGOutputVector; n_vectors: Tgsize; io_priority: longint; cancellable: PGCancellable;
  callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_output_stream_writev_all_finish(stream: PGOutputStream; Result: PGAsyncResult; bytes_written: Pgsize; error: PPGError): Tgboolean; cdecl; external libgio2;
procedure g_output_stream_write_bytes_async(stream: PGOutputStream; bytes: PGBytes; io_priority: longint; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
  user_data: Tgpointer); cdecl; external libgio2;
function g_output_stream_write_bytes_finish(stream: PGOutputStream; Result: PGAsyncResult; error: PPGError): Tgssize; cdecl; external libgio2;
procedure g_output_stream_splice_async(stream: PGOutputStream; Source: PGInputStream; flags: TGOutputStreamSpliceFlags; io_priority: longint; cancellable: PGCancellable;
  callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_output_stream_splice_finish(stream: PGOutputStream; Result: PGAsyncResult; error: PPGError): Tgssize; cdecl; external libgio2;
procedure g_output_stream_flush_async(stream: PGOutputStream; io_priority: longint; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_output_stream_flush_finish(stream: PGOutputStream; Result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libgio2;
procedure g_output_stream_close_async(stream: PGOutputStream; io_priority: longint; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_output_stream_close_finish(stream: PGOutputStream; Result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_output_stream_is_closed(stream: PGOutputStream): Tgboolean; cdecl; external libgio2;
function g_output_stream_is_closing(stream: PGOutputStream): Tgboolean; cdecl; external libgio2;
function g_output_stream_has_pending(stream: PGOutputStream): Tgboolean; cdecl; external libgio2;
function g_output_stream_set_pending(stream: PGOutputStream; error: PPGError): Tgboolean; cdecl; external libgio2;
procedure g_output_stream_clear_pending(stream: PGOutputStream); cdecl; external libgio2;

// === Konventiert am: 18-8-24 15:34:44 ===

function G_TYPE_OUTPUT_STREAM: TGType;
function G_OUTPUT_STREAM(obj: Pointer): PGOutputStream;
function G_OUTPUT_STREAM_CLASS(klass: Pointer): PGOutputStreamClass;
function G_IS_OUTPUT_STREAM(obj: Pointer): Tgboolean;
function G_IS_OUTPUT_STREAM_CLASS(klass: Pointer): Tgboolean;
function G_OUTPUT_STREAM_GET_CLASS(obj: Pointer): PGOutputStreamClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_TYPE_OUTPUT_STREAM: TGType;
begin
  G_TYPE_OUTPUT_STREAM := g_output_stream_get_type;
end;

function G_OUTPUT_STREAM(obj: Pointer): PGOutputStream;
begin
  Result := PGOutputStream(g_type_check_instance_cast(obj, G_TYPE_OUTPUT_STREAM));
end;

function G_OUTPUT_STREAM_CLASS(klass: Pointer): PGOutputStreamClass;
begin
  Result := PGOutputStreamClass(g_type_check_class_cast(klass, G_TYPE_OUTPUT_STREAM));
end;

function G_IS_OUTPUT_STREAM(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_OUTPUT_STREAM);
end;

function G_IS_OUTPUT_STREAM_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_OUTPUT_STREAM);
end;

function G_OUTPUT_STREAM_GET_CLASS(obj: Pointer): PGOutputStreamClass;
begin
  Result := PGOutputStreamClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
