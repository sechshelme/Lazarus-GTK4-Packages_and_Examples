/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGDataInputStreamPrivate = record
  end;
  PGDataInputStreamPrivate = ^TGDataInputStreamPrivate;

  TGDataInputStream = record
    parent_instance: TGBufferedInputStream;
    priv: PGDataInputStreamPrivate;
  end;
  PGDataInputStream = ^TGDataInputStream;

  TGDataInputStreamClass = record
    parent_class: TGBufferedInputStreamClass;
    _g_reserved1: procedure; cdecl;
    _g_reserved2: procedure; cdecl;
    _g_reserved3: procedure; cdecl;
    _g_reserved4: procedure; cdecl;
    _g_reserved5: procedure; cdecl;
  end;
  PGDataInputStreamClass = ^TGDataInputStreamClass;

function g_data_input_stream_get_type: TGType; cdecl; external libgio2;
function g_data_input_stream_new(base_stream: PGInputStream): PGDataInputStream; cdecl; external libgio2;
procedure g_data_input_stream_set_byte_order(stream: PGDataInputStream; order: TGDataStreamByteOrder); cdecl; external libgio2;
function g_data_input_stream_get_byte_order(stream: PGDataInputStream): TGDataStreamByteOrder; cdecl; external libgio2;
procedure g_data_input_stream_set_newline_type(stream: PGDataInputStream; _type: TGDataStreamNewlineType); cdecl; external libgio2;
function g_data_input_stream_get_newline_type(stream: PGDataInputStream): TGDataStreamNewlineType; cdecl; external libgio2;
function g_data_input_stream_read_byte(stream: PGDataInputStream; cancellable: PGCancellable; error: PPGError): Tguchar; cdecl; external libgio2;
function g_data_input_stream_read_int16(stream: PGDataInputStream; cancellable: PGCancellable; error: PPGError): Tgint16; cdecl; external libgio2;
function g_data_input_stream_read_uint16(stream: PGDataInputStream; cancellable: PGCancellable; error: PPGError): Tguint16; cdecl; external libgio2;
function g_data_input_stream_read_int32(stream: PGDataInputStream; cancellable: PGCancellable; error: PPGError): Tgint32; cdecl; external libgio2;
function g_data_input_stream_read_uint32(stream: PGDataInputStream; cancellable: PGCancellable; error: PPGError): Tguint32; cdecl; external libgio2;
function g_data_input_stream_read_int64(stream: PGDataInputStream; cancellable: PGCancellable; error: PPGError): Tgint64; cdecl; external libgio2;
function g_data_input_stream_read_uint64(stream: PGDataInputStream; cancellable: PGCancellable; error: PPGError): Tguint64; cdecl; external libgio2;
function g_data_input_stream_read_line(stream: PGDataInputStream; length: Pgsize; cancellable: PGCancellable; error: PPGError): PChar; cdecl; external libgio2;
function g_data_input_stream_read_line_utf8(stream: PGDataInputStream; length: Pgsize; cancellable: PGCancellable; error: PPGError): PChar; cdecl; external libgio2;
procedure g_data_input_stream_read_line_async(stream: PGDataInputStream; io_priority: Tgint; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_data_input_stream_read_line_finish(stream: PGDataInputStream; Result: PGAsyncResult; length: Pgsize; error: PPGError): PChar; cdecl; external libgio2;
function g_data_input_stream_read_line_finish_utf8(stream: PGDataInputStream; Result: PGAsyncResult; length: Pgsize; error: PPGError): PChar; cdecl; external libgio2;
function g_data_input_stream_read_until(stream: PGDataInputStream; stop_chars: Pgchar; length: Pgsize; cancellable: PGCancellable; error: PPGError): PChar; cdecl; external libgio2;
procedure g_data_input_stream_read_until_async(stream: PGDataInputStream; stop_chars: Pgchar; io_priority: Tgint; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
  user_data: Tgpointer); cdecl; external libgio2;
function g_data_input_stream_read_until_finish(stream: PGDataInputStream; Result: PGAsyncResult; length: Pgsize; error: PPGError): PChar; cdecl; external libgio2;
function g_data_input_stream_read_upto(stream: PGDataInputStream; stop_chars: Pgchar; stop_chars_len: Tgssize; length: Pgsize; cancellable: PGCancellable;
  error: PPGError): PChar; cdecl; external libgio2;
procedure g_data_input_stream_read_upto_async(stream: PGDataInputStream; stop_chars: Pgchar; stop_chars_len: Tgssize; io_priority: Tgint; cancellable: PGCancellable;
  callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_data_input_stream_read_upto_finish(stream: PGDataInputStream; Result: PGAsyncResult; length: Pgsize; error: PPGError): PChar; cdecl; external libgio2;

// === Konventiert am: 19-8-24 19:35:20 ===

function G_TYPE_DATA_INPUT_STREAM: TGType;
function G_DATA_INPUT_STREAM(obj: Pointer): PGDataInputStream;
function G_DATA_INPUT_STREAM_CLASS(klass: Pointer): PGDataInputStreamClass;
function G_IS_DATA_INPUT_STREAM(obj: Pointer): Tgboolean;
function G_IS_DATA_INPUT_STREAM_CLASS(klass: Pointer): Tgboolean;
function G_DATA_INPUT_STREAM_GET_CLASS(obj: Pointer): PGDataInputStreamClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_TYPE_DATA_INPUT_STREAM: TGType;
begin
  G_TYPE_DATA_INPUT_STREAM := g_data_input_stream_get_type;
end;

function G_DATA_INPUT_STREAM(obj: Pointer): PGDataInputStream;
begin
  Result := PGDataInputStream(g_type_check_instance_cast(obj, G_TYPE_DATA_INPUT_STREAM));
end;

function G_DATA_INPUT_STREAM_CLASS(klass: Pointer): PGDataInputStreamClass;
begin
  Result := PGDataInputStreamClass(g_type_check_class_cast(klass, G_TYPE_DATA_INPUT_STREAM));
end;

function G_IS_DATA_INPUT_STREAM(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_DATA_INPUT_STREAM);
end;

function G_IS_DATA_INPUT_STREAM_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_DATA_INPUT_STREAM);
end;

function G_DATA_INPUT_STREAM_GET_CLASS(obj: Pointer): PGDataInputStreamClass;
begin
  Result := PGDataInputStreamClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
