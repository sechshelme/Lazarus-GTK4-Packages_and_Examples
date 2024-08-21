/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGPollableOutputStream = record
  end;
  PGPollableOutputStream = ^TGPollableOutputStream;

  TGPollableOutputStreamInterface = record
    g_iface: TGTypeInterface;
    can_poll: function(stream: PGPollableOutputStream): Tgboolean; cdecl;
    is_writable: function(stream: PGPollableOutputStream): Tgboolean; cdecl;
    create_source: function(stream: PGPollableOutputStream; cancellable: PGCancellable): PGSource; cdecl;
    write_nonblocking: function(stream: PGPollableOutputStream; buffer: pointer; Count: Tgsize; error: PPGError): Tgssize; cdecl;
    writev_nonblocking: function(stream: PGPollableOutputStream; vectors: PGOutputVector; n_vectors: Tgsize; bytes_written: Pgsize; error: PPGError): TGPollableReturn; cdecl;
  end;
  PGPollableOutputStreamInterface = ^TGPollableOutputStreamInterface;

function g_pollable_output_stream_get_type: TGType; cdecl; external libgio2;
function g_pollable_output_stream_can_poll(stream: PGPollableOutputStream): Tgboolean; cdecl; external libgio2;
function g_pollable_output_stream_is_writable(stream: PGPollableOutputStream): Tgboolean; cdecl; external libgio2;
function g_pollable_output_stream_create_source(stream: PGPollableOutputStream; cancellable: PGCancellable): PGSource; cdecl; external libgio2;
function g_pollable_output_stream_write_nonblocking(stream: PGPollableOutputStream; buffer: pointer; Count: Tgsize; cancellable: PGCancellable; error: PPGError): Tgssize; cdecl; external libgio2;
function g_pollable_output_stream_writev_nonblocking(stream: PGPollableOutputStream; vectors: PGOutputVector; n_vectors: Tgsize; bytes_written: Pgsize; cancellable: PGCancellable;
  error: PPGError): TGPollableReturn; cdecl; external libgio2;

// === Konventiert am: 20-8-24 17:50:36 ===

function G_TYPE_POLLABLE_OUTPUT_STREAM: TGType;
function G_POLLABLE_OUTPUT_STREAM(obj: Pointer): PGPollableOutputStream;
function G_IS_POLLABLE_OUTPUT_STREAM(obj: Pointer): Tgboolean;
function G_POLLABLE_OUTPUT_STREAM_GET_INTERFACE(obj: Pointer): PGPollableOutputStreamInterface;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_TYPE_POLLABLE_OUTPUT_STREAM: TGType;
begin
  G_TYPE_POLLABLE_OUTPUT_STREAM := g_pollable_output_stream_get_type;
end;

function G_POLLABLE_OUTPUT_STREAM(obj: Pointer): PGPollableOutputStream;
begin
  Result := PGPollableOutputStream(g_type_check_instance_cast(obj, G_TYPE_POLLABLE_OUTPUT_STREAM));
end;

function G_IS_POLLABLE_OUTPUT_STREAM(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_POLLABLE_OUTPUT_STREAM);
end;

function G_POLLABLE_OUTPUT_STREAM_GET_INTERFACE(obj: Pointer): PGPollableOutputStreamInterface;
begin
  Result := g_type_interface_peek(obj, G_TYPE_POLLABLE_OUTPUT_STREAM);
end;



{$ENDIF read_implementation}
