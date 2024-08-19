unit gbufferedinputstream;

interface

uses
  common_GLIB, gtypes, gerror, gtype, giotypes, gobject, gioenums, gfilterinputstream, ginputstream;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGBufferedInputStreamPrivate = record
  end;
  PGBufferedInputStreamPrivate = ^TGBufferedInputStreamPrivate;

  TGBufferedInputStream = record
    parent_instance: TGFilterInputStream;
    priv: PGBufferedInputStreamPrivate;
  end;
  PGBufferedInputStream = ^TGBufferedInputStream;

  TGBufferedInputStreamClass = record
    parent_class: TGFilterInputStreamClass;
    fill: function(stream: PGBufferedInputStream; Count: Tgssize; cancellable: PGCancellable; error: PPGError): Tgssize; cdecl;
    fill_async: procedure(stream: PGBufferedInputStream; Count: Tgssize; io_priority: longint; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
      user_data: Tgpointer); cdecl;
    fill_finish: function(stream: PGBufferedInputStream; Result: PGAsyncResult; error: PPGError): Tgssize; cdecl;
    _g_reserved1: procedure; cdecl;
    _g_reserved2: procedure; cdecl;
    _g_reserved3: procedure; cdecl;
    _g_reserved4: procedure; cdecl;
    _g_reserved5: procedure; cdecl;
  end;
  PGBufferedInputStreamClass = ^TGBufferedInputStreamClass;


function g_buffered_input_stream_get_type: TGType; cdecl; external libgio2;
function g_buffered_input_stream_new(base_stream: PGInputStream): PGInputStream; cdecl; external libgio2;
function g_buffered_input_stream_new_sized(base_stream: PGInputStream; size: Tgsize): PGInputStream; cdecl; external libgio2;
function g_buffered_input_stream_get_buffer_size(stream: PGBufferedInputStream): Tgsize; cdecl; external libgio2;
procedure g_buffered_input_stream_set_buffer_size(stream: PGBufferedInputStream; size: Tgsize); cdecl; external libgio2;
function g_buffered_input_stream_get_available(stream: PGBufferedInputStream): Tgsize; cdecl; external libgio2;
function g_buffered_input_stream_peek(stream: PGBufferedInputStream; buffer: pointer; offset: Tgsize; Count: Tgsize): Tgsize; cdecl; external libgio2;
function g_buffered_input_stream_peek_buffer(stream: PGBufferedInputStream; Count: Pgsize): pointer; cdecl; external libgio2;
function g_buffered_input_stream_fill(stream: PGBufferedInputStream; Count: Tgssize; cancellable: PGCancellable; error: PPGError): Tgssize; cdecl; external libgio2;
procedure g_buffered_input_stream_fill_async(stream: PGBufferedInputStream; Count: Tgssize; io_priority: longint; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
  user_data: Tgpointer); cdecl; external libgio2;
function g_buffered_input_stream_fill_finish(stream: PGBufferedInputStream; Result: PGAsyncResult; error: PPGError): Tgssize; cdecl; external libgio2;
function g_buffered_input_stream_read_byte(stream: PGBufferedInputStream; cancellable: PGCancellable; error: PPGError): longint; cdecl; external libgio2;

// === Konventiert am: 19-8-24 19:43:09 ===

function G_TYPE_BUFFERED_INPUT_STREAM: TGType;
function G_BUFFERED_INPUT_STREAM(obj: Pointer): PGBufferedInputStream;
function G_BUFFERED_INPUT_STREAM_CLASS(klass: Pointer): PGBufferedInputStreamClass;
function G_IS_BUFFERED_INPUT_STREAM(obj: Pointer): Tgboolean;
function G_IS_BUFFERED_INPUT_STREAM_CLASS(klass: Pointer): Tgboolean;
function G_BUFFERED_INPUT_STREAM_GET_CLASS(obj: Pointer): PGBufferedInputStreamClass;

implementation

function G_TYPE_BUFFERED_INPUT_STREAM: TGType;
begin
  G_TYPE_BUFFERED_INPUT_STREAM := g_buffered_input_stream_get_type;
end;

function G_BUFFERED_INPUT_STREAM(obj: Pointer): PGBufferedInputStream;
begin
  Result := PGBufferedInputStream(g_type_check_instance_cast(obj, G_TYPE_BUFFERED_INPUT_STREAM));
end;

function G_BUFFERED_INPUT_STREAM_CLASS(klass: Pointer): PGBufferedInputStreamClass;
begin
  Result := PGBufferedInputStreamClass(g_type_check_class_cast(klass, G_TYPE_BUFFERED_INPUT_STREAM));
end;

function G_IS_BUFFERED_INPUT_STREAM(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_BUFFERED_INPUT_STREAM);
end;

function G_IS_BUFFERED_INPUT_STREAM_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_BUFFERED_INPUT_STREAM);
end;

function G_BUFFERED_INPUT_STREAM_GET_CLASS(obj: Pointer): PGBufferedInputStreamClass;
begin
  Result := PGBufferedInputStreamClass(PGTypeInstance(obj)^.g_class);
end;



end.
