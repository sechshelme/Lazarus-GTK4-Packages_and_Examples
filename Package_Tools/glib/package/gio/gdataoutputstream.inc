/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}


type
  TGDataOutputStreamPrivate = record
  end;
  PGDataOutputStreamPrivate = ^TGDataOutputStreamPrivate;

  TGDataOutputStream = record
    parent_instance: TGFilterOutputStream;
    priv: PGDataOutputStreamPrivate;
  end;
  PGDataOutputStream = ^TGDataOutputStream;

  TGDataOutputStreamClass = record
    parent_class: TGFilterOutputStreamClass;
    _g_reserved1: procedure; cdecl;
    _g_reserved2: procedure; cdecl;
    _g_reserved3: procedure; cdecl;
    _g_reserved4: procedure; cdecl;
    _g_reserved5: procedure; cdecl;
  end;
  PGDataOutputStreamClass = ^TGDataOutputStreamClass;


function g_data_output_stream_get_type: TGType; cdecl; external libgio2;
function g_data_output_stream_new(base_stream: PGOutputStream): PGDataOutputStream; cdecl; external libgio2;
procedure g_data_output_stream_set_byte_order(stream: PGDataOutputStream; order: TGDataStreamByteOrder); cdecl; external libgio2;
function g_data_output_stream_get_byte_order(stream: PGDataOutputStream): TGDataStreamByteOrder; cdecl; external libgio2;
function g_data_output_stream_put_byte(stream: PGDataOutputStream; Data: Tguchar; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_data_output_stream_put_int16(stream: PGDataOutputStream; Data: Tgint16; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_data_output_stream_put_uint16(stream: PGDataOutputStream; Data: Tguint16; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_data_output_stream_put_int32(stream: PGDataOutputStream; Data: Tgint32; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_data_output_stream_put_uint32(stream: PGDataOutputStream; Data: Tguint32; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_data_output_stream_put_int64(stream: PGDataOutputStream; Data: Tgint64; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_data_output_stream_put_uint64(stream: PGDataOutputStream; Data: Tguint64; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_data_output_stream_put_string(stream: PGDataOutputStream; str: PChar; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libgio2;

// === Konventiert am: 20-8-24 17:50:09 ===

function G_TYPE_DATA_OUTPUT_STREAM: TGType;
function G_DATA_OUTPUT_STREAM(obj: Pointer): PGDataOutputStream;
function G_DATA_OUTPUT_STREAM_CLASS(klass: Pointer): PGDataOutputStreamClass;
function G_IS_DATA_OUTPUT_STREAM(obj: Pointer): Tgboolean;
function G_IS_DATA_OUTPUT_STREAM_CLASS(klass: Pointer): Tgboolean;
function G_DATA_OUTPUT_STREAM_GET_CLASS(obj: Pointer): PGDataOutputStreamClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_TYPE_DATA_OUTPUT_STREAM: TGType;
begin
  G_TYPE_DATA_OUTPUT_STREAM := g_data_output_stream_get_type;
end;

function G_DATA_OUTPUT_STREAM(obj: Pointer): PGDataOutputStream;
begin
  Result := PGDataOutputStream(g_type_check_instance_cast(obj, G_TYPE_DATA_OUTPUT_STREAM));
end;

function G_DATA_OUTPUT_STREAM_CLASS(klass: Pointer): PGDataOutputStreamClass;
begin
  Result := PGDataOutputStreamClass(g_type_check_class_cast(klass, G_TYPE_DATA_OUTPUT_STREAM));
end;

function G_IS_DATA_OUTPUT_STREAM(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_DATA_OUTPUT_STREAM);
end;

function G_IS_DATA_OUTPUT_STREAM_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_DATA_OUTPUT_STREAM);
end;

function G_DATA_OUTPUT_STREAM_GET_CLASS(obj: Pointer): PGDataOutputStreamClass;
begin
  Result := PGDataOutputStreamClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
