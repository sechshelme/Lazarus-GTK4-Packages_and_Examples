/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGSimpleIOStream = record
  end;
  PGSimpleIOStream = ^TGSimpleIOStream;

function g_simple_io_stream_get_type: TGType; cdecl; external libgio2;
function g_simple_io_stream_new(input_stream: PGInputStream; output_stream: PGOutputStream): PGIOStream; cdecl; external libgio2;

// === Konventiert am: 21-8-24 16:34:10 ===

function G_TYPE_SIMPLE_IO_STREAM: TGType;
function G_SIMPLE_IO_STREAM(obj: Pointer): PGSimpleIOStream;
function G_IS_SIMPLE_IO_STREAM(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_TYPE_SIMPLE_IO_STREAM: TGType;
begin
  G_TYPE_SIMPLE_IO_STREAM := g_simple_io_stream_get_type;
end;

function G_SIMPLE_IO_STREAM(obj: Pointer): PGSimpleIOStream;
begin
  Result := PGSimpleIOStream(g_type_check_instance_cast(obj, G_TYPE_SIMPLE_IO_STREAM));
end;

function G_IS_SIMPLE_IO_STREAM(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_SIMPLE_IO_STREAM);
end;



{$ENDIF read_implementation}
