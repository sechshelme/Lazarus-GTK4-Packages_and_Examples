/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGConverterOutputStreamPrivate = record
  end;
  PGConverterOutputStreamPrivate = ^TGConverterOutputStreamPrivate;

  TGConverterOutputStream = record
    parent_instance: TGFilterOutputStream;
    priv: PGConverterOutputStreamPrivate;
  end;
  PGConverterOutputStream = ^TGConverterOutputStream;

  TGConverterOutputStreamClass = record
    parent_class: TGFilterOutputStreamClass;
    _g_reserved1: procedure; cdecl;
    _g_reserved2: procedure; cdecl;
    _g_reserved3: procedure; cdecl;
    _g_reserved4: procedure; cdecl;
    _g_reserved5: procedure; cdecl;
  end;
  PGConverterOutputStreamClass = ^TGConverterOutputStreamClass;


function g_converter_output_stream_get_type: TGType; cdecl; external libgio2;
function g_converter_output_stream_new(base_stream: PGOutputStream; converter: PGConverter): PGOutputStream; cdecl; external libgio2;
function g_converter_output_stream_get_converter(converter_stream: PGConverterOutputStream): PGConverter; cdecl; external libgio2;

// === Konventiert am: 20-8-24 19:50:13 ===

function G_TYPE_CONVERTER_OUTPUT_STREAM: TGType;
function G_CONVERTER_OUTPUT_STREAM(obj: Pointer): PGConverterOutputStream;
function G_CONVERTER_OUTPUT_STREAM_CLASS(klass: Pointer): PGConverterOutputStreamClass;
function G_IS_CONVERTER_OUTPUT_STREAM(obj: Pointer): Tgboolean;
function G_IS_CONVERTER_OUTPUT_STREAM_CLASS(klass: Pointer): Tgboolean;
function G_CONVERTER_OUTPUT_STREAM_GET_CLASS(obj: Pointer): PGConverterOutputStreamClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_TYPE_CONVERTER_OUTPUT_STREAM: TGType;
begin
  G_TYPE_CONVERTER_OUTPUT_STREAM := g_converter_output_stream_get_type;
end;

function G_CONVERTER_OUTPUT_STREAM(obj: Pointer): PGConverterOutputStream;
begin
  Result := PGConverterOutputStream(g_type_check_instance_cast(obj, G_TYPE_CONVERTER_OUTPUT_STREAM));
end;

function G_CONVERTER_OUTPUT_STREAM_CLASS(klass: Pointer): PGConverterOutputStreamClass;
begin
  Result := PGConverterOutputStreamClass(g_type_check_class_cast(klass, G_TYPE_CONVERTER_OUTPUT_STREAM));
end;

function G_IS_CONVERTER_OUTPUT_STREAM(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_CONVERTER_OUTPUT_STREAM);
end;

function G_IS_CONVERTER_OUTPUT_STREAM_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_CONVERTER_OUTPUT_STREAM);
end;

function G_CONVERTER_OUTPUT_STREAM_GET_CLASS(obj: Pointer): PGConverterOutputStreamClass;
begin
  Result := PGConverterOutputStreamClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
