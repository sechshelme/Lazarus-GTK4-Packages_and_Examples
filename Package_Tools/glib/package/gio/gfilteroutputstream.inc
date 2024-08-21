/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGFilterOutputStream = record
    parent_instance: TGOutputStream;
    base_stream: PGOutputStream;
  end;
  PGFilterOutputStream = ^TGFilterOutputStream;

  TGFilterOutputStreamClass = record
    parent_class: TGOutputStreamClass;
    _g_reserved1: procedure; cdecl;
    _g_reserved2: procedure; cdecl;
    _g_reserved3: procedure; cdecl;
  end;
  PGFilterOutputStreamClass = ^TGFilterOutputStreamClass;

function g_filter_output_stream_get_type: TGType; cdecl; external libgio2;
function g_filter_output_stream_get_base_stream(stream: PGFilterOutputStream): PGOutputStream; cdecl; external libgio2;
function g_filter_output_stream_get_close_base_stream(stream: PGFilterOutputStream): Tgboolean; cdecl; external libgio2;
procedure g_filter_output_stream_set_close_base_stream(stream: PGFilterOutputStream; close_base: Tgboolean); cdecl; external libgio2;

// === Konventiert am: 19-8-24 19:45:15 ===

function G_TYPE_FILTER_OUTPUT_STREAM: TGType;
function G_FILTER_OUTPUT_STREAM(obj: Pointer): PGFilterOutputStream;
function G_FILTER_OUTPUT_STREAM_CLASS(klass: Pointer): PGFilterOutputStreamClass;
function G_IS_FILTER_OUTPUT_STREAM(obj: Pointer): Tgboolean;
function G_IS_FILTER_OUTPUT_STREAM_CLASS(klass: Pointer): Tgboolean;
function G_FILTER_OUTPUT_STREAM_GET_CLASS(obj: Pointer): PGFilterOutputStreamClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_TYPE_FILTER_OUTPUT_STREAM: TGType;
begin
  G_TYPE_FILTER_OUTPUT_STREAM := g_filter_output_stream_get_type;
end;

function G_FILTER_OUTPUT_STREAM(obj: Pointer): PGFilterOutputStream;
begin
  Result := PGFilterOutputStream(g_type_check_instance_cast(obj, G_TYPE_FILTER_OUTPUT_STREAM));
end;

function G_FILTER_OUTPUT_STREAM_CLASS(klass: Pointer): PGFilterOutputStreamClass;
begin
  Result := PGFilterOutputStreamClass(g_type_check_class_cast(klass, G_TYPE_FILTER_OUTPUT_STREAM));
end;

function G_IS_FILTER_OUTPUT_STREAM(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_FILTER_OUTPUT_STREAM);
end;

function G_IS_FILTER_OUTPUT_STREAM_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_FILTER_OUTPUT_STREAM);
end;

function G_FILTER_OUTPUT_STREAM_GET_CLASS(obj: Pointer): PGFilterOutputStreamClass;
begin
  Result := PGFilterOutputStreamClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
