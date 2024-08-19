unit gbufferedoutputstream;

interface

uses
  common_GLIB, gtypes, gtype, giotypes, gobject, gioenums, gfilteroutputstream, goutputstream;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGBufferedOutputStreamPrivate = record
  end;
  PGBufferedOutputStreamPrivate = ^TGBufferedOutputStreamPrivate;

  PGBufferedOutputStream = ^TGBufferedOutputStream;

  TGBufferedOutputStream = record
    parent_instance: TGFilterOutputStream;
    priv: PGBufferedOutputStreamPrivate;
  end;

  PGBufferedOutputStreamClass = ^TGBufferedOutputStreamClass;

  TGBufferedOutputStreamClass = record
    parent_class: TGFilterOutputStreamClass;
    _g_reserved1: procedure; cdecl;
    _g_reserved2: procedure; cdecl;
  end;


function g_buffered_output_stream_get_type: TGType; cdecl; external libgio2;
function g_buffered_output_stream_new(base_stream: PGOutputStream): PGOutputStream; cdecl; external libgio2;
function g_buffered_output_stream_new_sized(base_stream: PGOutputStream; size: Tgsize): PGOutputStream; cdecl; external libgio2;
function g_buffered_output_stream_get_buffer_size(stream: PGBufferedOutputStream): Tgsize; cdecl; external libgio2;
procedure g_buffered_output_stream_set_buffer_size(stream: PGBufferedOutputStream; size: Tgsize); cdecl; external libgio2;
function g_buffered_output_stream_get_auto_grow(stream: PGBufferedOutputStream): Tgboolean; cdecl; external libgio2;
procedure g_buffered_output_stream_set_auto_grow(stream: PGBufferedOutputStream; auto_grow: Tgboolean); cdecl; external libgio2;

// === Konventiert am: 19-8-24 19:43:15 ===

function G_TYPE_BUFFERED_OUTPUT_STREAM: TGType;
function G_BUFFERED_OUTPUT_STREAM(obj: Pointer): PGBufferedOutputStream;
function G_BUFFERED_OUTPUT_STREAM_CLASS(klass: Pointer): PGBufferedOutputStreamClass;
function G_IS_BUFFERED_OUTPUT_STREAM(obj: Pointer): Tgboolean;
function G_IS_BUFFERED_OUTPUT_STREAM_CLASS(klass: Pointer): Tgboolean;
function G_BUFFERED_OUTPUT_STREAM_GET_CLASS(obj: Pointer): PGBufferedOutputStreamClass;

implementation

function G_TYPE_BUFFERED_OUTPUT_STREAM: TGType;
begin
  G_TYPE_BUFFERED_OUTPUT_STREAM := g_buffered_output_stream_get_type;
end;

function G_BUFFERED_OUTPUT_STREAM(obj: Pointer): PGBufferedOutputStream;
begin
  Result := PGBufferedOutputStream(g_type_check_instance_cast(obj, G_TYPE_BUFFERED_OUTPUT_STREAM));
end;

function G_BUFFERED_OUTPUT_STREAM_CLASS(klass: Pointer): PGBufferedOutputStreamClass;
begin
  Result := PGBufferedOutputStreamClass(g_type_check_class_cast(klass, G_TYPE_BUFFERED_OUTPUT_STREAM));
end;

function G_IS_BUFFERED_OUTPUT_STREAM(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_BUFFERED_OUTPUT_STREAM);
end;

function G_IS_BUFFERED_OUTPUT_STREAM_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_BUFFERED_OUTPUT_STREAM);
end;

function G_BUFFERED_OUTPUT_STREAM_GET_CLASS(obj: Pointer): PGBufferedOutputStreamClass;
begin
  Result := PGBufferedOutputStreamClass(PGTypeInstance(obj)^.g_class);
end;



end.
