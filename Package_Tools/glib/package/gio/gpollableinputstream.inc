/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGPollableInputStream = record
  end;
  PGPollableInputStream = ^TGPollableInputStream;

  TGPollableInputStreamInterface = record
    g_iface: TGTypeInterface;
    can_poll: function(stream: PGPollableInputStream): Tgboolean; cdecl;
    is_readable: function(stream: PGPollableInputStream): Tgboolean; cdecl;
    create_source: function(stream: PGPollableInputStream; cancellable: PGCancellable): PGSource; cdecl;
    read_nonblocking: function(stream: PGPollableInputStream; buffer: pointer; Count: Tgsize; error: PPGError): Tgssize; cdecl;
  end;
  PGPollableInputStreamInterface = ^TGPollableInputStreamInterface;


function g_pollable_input_stream_get_type: TGType; cdecl; external libgio2;
function g_pollable_input_stream_can_poll(stream: PGPollableInputStream): Tgboolean; cdecl; external libgio2;
function g_pollable_input_stream_is_readable(stream: PGPollableInputStream): Tgboolean; cdecl; external libgio2;
function g_pollable_input_stream_create_source(stream: PGPollableInputStream; cancellable: PGCancellable): PGSource; cdecl; external libgio2;
function g_pollable_input_stream_read_nonblocking(stream: PGPollableInputStream; buffer: pointer; Count: Tgsize; cancellable: PGCancellable; error: PPGError): Tgssize; cdecl; external libgio2;

// === Konventiert am: 21-8-24 13:30:56 ===

function G_TYPE_POLLABLE_INPUT_STREAM: TGType;
function G_POLLABLE_INPUT_STREAM(obj: Pointer): PGPollableInputStream;
function G_IS_POLLABLE_INPUT_STREAM(obj: Pointer): Tgboolean;
function G_POLLABLE_INPUT_STREAM_GET_INTERFACE(obj: Pointer): PGPollableInputStreamInterface;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_TYPE_POLLABLE_INPUT_STREAM: TGType;
begin
  G_TYPE_POLLABLE_INPUT_STREAM := g_pollable_input_stream_get_type;
end;

function G_POLLABLE_INPUT_STREAM(obj: Pointer): PGPollableInputStream;
begin
  Result := PGPollableInputStream(g_type_check_instance_cast(obj, G_TYPE_POLLABLE_INPUT_STREAM));
end;

function G_IS_POLLABLE_INPUT_STREAM(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_POLLABLE_INPUT_STREAM);
end;

function G_POLLABLE_INPUT_STREAM_GET_INTERFACE(obj: Pointer): PGPollableInputStreamInterface;
begin
  Result := g_type_interface_peek(obj, G_TYPE_POLLABLE_INPUT_STREAM);
end;



{$ENDIF read_implementation}
