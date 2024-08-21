/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGIOStreamPrivate = record
  end;
  PGIOStreamPrivate = ^TGIOStreamPrivate;

  TGIOStream = record
    parent_instance: TGObject;
    priv: PGIOStreamPrivate;
  end;
  PGIOStream = ^TGIOStream;

  TGIOStreamClass = record
    parent_class: TGObjectClass;
    get_input_stream: function(stream: PGIOStream): PGInputStream; cdecl;
    get_output_stream: function(stream: PGIOStream): PGOutputStream; cdecl;
    close_fn: function(stream: PGIOStream; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl;
    close_async: procedure(stream: PGIOStream; io_priority: longint; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl;
    close_finish: function(stream: PGIOStream; Result: PGAsyncResult; error: PPGError): Tgboolean; cdecl;
    _g_reserved1: procedure; cdecl;
    _g_reserved2: procedure; cdecl;
    _g_reserved3: procedure; cdecl;
    _g_reserved4: procedure; cdecl;
    _g_reserved5: procedure; cdecl;
    _g_reserved6: procedure; cdecl;
    _g_reserved7: procedure; cdecl;
    _g_reserved8: procedure; cdecl;
    _g_reserved9: procedure; cdecl;
    _g_reserved10: procedure; cdecl;
  end;
  PGIOStreamClass = ^TGIOStreamClass;


function g_io_stream_get_type: TGType; cdecl; external libgio2;
function g_io_stream_get_input_stream(stream: PGIOStream): PGInputStream; cdecl; external libgio2;
function g_io_stream_get_output_stream(stream: PGIOStream): PGOutputStream; cdecl; external libgio2;
procedure g_io_stream_splice_async(stream1: PGIOStream; stream2: PGIOStream; flags: TGIOStreamSpliceFlags; io_priority: longint; cancellable: PGCancellable;
  callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_io_stream_splice_finish(Result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_io_stream_close(stream: PGIOStream; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libgio2;
procedure g_io_stream_close_async(stream: PGIOStream; io_priority: longint; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_io_stream_close_finish(stream: PGIOStream; Result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_io_stream_is_closed(stream: PGIOStream): Tgboolean; cdecl; external libgio2;
function g_io_stream_has_pending(stream: PGIOStream): Tgboolean; cdecl; external libgio2;
function g_io_stream_set_pending(stream: PGIOStream; error: PPGError): Tgboolean; cdecl; external libgio2;
procedure g_io_stream_clear_pending(stream: PGIOStream); cdecl; external libgio2;

// === Konventiert am: 18-8-24 15:50:21 ===

function G_TYPE_IO_STREAM: TGType;
function G_IO_STREAM(obj: Pointer): PGIOStream;
function G_IO_STREAM_CLASS(klass: Pointer): PGIOStreamClass;
function G_IS_IO_STREAM(obj: Pointer): Tgboolean;
function G_IS_IO_STREAM_CLASS(klass: Pointer): Tgboolean;
function G_IO_STREAM_GET_CLASS(obj: Pointer): PGIOStreamClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_TYPE_IO_STREAM: TGType;
begin
  G_TYPE_IO_STREAM := g_io_stream_get_type;
end;

function G_IO_STREAM(obj: Pointer): PGIOStream;
begin
  Result := PGIOStream(g_type_check_instance_cast(obj, G_TYPE_IO_STREAM));
end;

function G_IO_STREAM_CLASS(klass: Pointer): PGIOStreamClass;
begin
  Result := PGIOStreamClass(g_type_check_class_cast(klass, G_TYPE_IO_STREAM));
end;

function G_IS_IO_STREAM(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_IO_STREAM);
end;

function G_IS_IO_STREAM_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_IO_STREAM);
end;

function G_IO_STREAM_GET_CLASS(obj: Pointer): PGIOStreamClass;
begin
  Result := PGIOStreamClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
