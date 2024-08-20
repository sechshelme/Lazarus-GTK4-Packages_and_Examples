unit gconverterinputstream;

interface

uses
  common_GLIB, gtypes, gtype, giotypes, gconverter, gobject, gioenums, gfilterinputstream, ginputstream;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGConverterInputStreamPrivate = record
  end;
  PGConverterInputStreamPrivate = ^TGConverterInputStreamPrivate;

  TGConverterInputStream = record
    parent_instance: TGFilterInputStream;
    priv: PGConverterInputStreamPrivate;
  end;
  PGConverterInputStream = ^TGConverterInputStream;

  TGConverterInputStreamClass = record
    parent_class: TGFilterInputStreamClass;
    _g_reserved1: procedure; cdecl;
    _g_reserved2: procedure; cdecl;
    _g_reserved3: procedure; cdecl;
    _g_reserved4: procedure; cdecl;
    _g_reserved5: procedure; cdecl;
  end;
  PGConverterInputStreamClass = ^TGConverterInputStreamClass;


function g_converter_input_stream_get_type: TGType; cdecl; external libgio2;
function g_converter_input_stream_new(base_stream: PGInputStream; converter: PGConverter): PGInputStream; cdecl; external libgio2;
function g_converter_input_stream_get_converter(converter_stream: PGConverterInputStream): PGConverter; cdecl; external libgio2;

// === Konventiert am: 20-8-24 19:50:08 ===

function G_TYPE_CONVERTER_INPUT_STREAM: TGType;
function G_CONVERTER_INPUT_STREAM(obj: Pointer): PGConverterInputStream;
function G_CONVERTER_INPUT_STREAM_CLASS(klass: Pointer): PGConverterInputStreamClass;
function G_IS_CONVERTER_INPUT_STREAM(obj: Pointer): Tgboolean;
function G_IS_CONVERTER_INPUT_STREAM_CLASS(klass: Pointer): Tgboolean;
function G_CONVERTER_INPUT_STREAM_GET_CLASS(obj: Pointer): PGConverterInputStreamClass;

implementation

function G_TYPE_CONVERTER_INPUT_STREAM: TGType;
begin
  G_TYPE_CONVERTER_INPUT_STREAM := g_converter_input_stream_get_type;
end;

function G_CONVERTER_INPUT_STREAM(obj: Pointer): PGConverterInputStream;
begin
  Result := PGConverterInputStream(g_type_check_instance_cast(obj, G_TYPE_CONVERTER_INPUT_STREAM));
end;

function G_CONVERTER_INPUT_STREAM_CLASS(klass: Pointer): PGConverterInputStreamClass;
begin
  Result := PGConverterInputStreamClass(g_type_check_class_cast(klass, G_TYPE_CONVERTER_INPUT_STREAM));
end;

function G_IS_CONVERTER_INPUT_STREAM(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_CONVERTER_INPUT_STREAM);
end;

function G_IS_CONVERTER_INPUT_STREAM_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_CONVERTER_INPUT_STREAM);
end;

function G_CONVERTER_INPUT_STREAM_GET_CLASS(obj: Pointer): PGConverterInputStreamClass;
begin
  Result := PGConverterInputStreamClass(PGTypeInstance(obj)^.g_class);
end;



end.
