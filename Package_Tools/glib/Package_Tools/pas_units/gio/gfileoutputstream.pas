unit gfileoutputstream;

interface

uses
  common_GLIB, gtypes, gerror, giochannel, gtype, giotypes, goutputstream;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGFileOutputStreamPrivate = record
  end;
  PGFileOutputStreamPrivate = ^TGFileOutputStreamPrivate;

  TGFileOutputStream = record
    parent_instance: TGOutputStream;
    priv: PGFileOutputStreamPrivate;
  end;
  PGFileOutputStream = ^TGFileOutputStream;

  TGFileOutputStreamClass = record
    parent_class: TGOutputStreamClass;
    tell: function(stream: PGFileOutputStream): Tgoffset; cdecl;
    can_seek: function(stream: PGFileOutputStream): Tgboolean; cdecl;
    seek: function(stream: PGFileOutputStream; offset: Tgoffset; _type: TGSeekType; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl;
    can_truncate: function(stream: PGFileOutputStream): Tgboolean; cdecl;
    truncate_fn: function(stream: PGFileOutputStream; size: Tgoffset; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl;
    query_info: function(stream: PGFileOutputStream; attributes: PChar; cancellable: PGCancellable; error: PPGError): PGFileInfo; cdecl;
    query_info_async: procedure(stream: PGFileOutputStream; attributes: PChar; io_priority: longint; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
      user_data: Tgpointer); cdecl;
    query_info_finish: function(stream: PGFileOutputStream; Result: PGAsyncResult; error: PPGError): PGFileInfo; cdecl;
    get_etag: function(stream: PGFileOutputStream): PChar; cdecl;
    _g_reserved1: procedure; cdecl;
    _g_reserved2: procedure; cdecl;
    _g_reserved3: procedure; cdecl;
    _g_reserved4: procedure; cdecl;
    _g_reserved5: procedure; cdecl;
  end;
  PGFileOutputStreamClass = ^TGFileOutputStreamClass;


function g_file_output_stream_get_type: TGType; cdecl; external libgio2;
function g_file_output_stream_query_info(stream: PGFileOutputStream; attributes: PChar; cancellable: PGCancellable; error: PPGError): PGFileInfo; cdecl; external libgio2;
procedure g_file_output_stream_query_info_async(stream: PGFileOutputStream; attributes: PChar; io_priority: longint; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
  user_data: Tgpointer); cdecl; external libgio2;
function g_file_output_stream_query_info_finish(stream: PGFileOutputStream; Result: PGAsyncResult; error: PPGError): PGFileInfo; cdecl; external libgio2;
function g_file_output_stream_get_etag(stream: PGFileOutputStream): PChar; cdecl; external libgio2;

// === Konventiert am: 18-8-24 15:19:43 ===

function G_TYPE_FILE_OUTPUT_STREAM: TGType;
function G_FILE_OUTPUT_STREAM(obj: Pointer): PGFileOutputStream;
function G_FILE_OUTPUT_STREAM_CLASS(klass: Pointer): PGFileOutputStreamClass;
function G_IS_FILE_OUTPUT_STREAM(obj: Pointer): Tgboolean;
function G_IS_FILE_OUTPUT_STREAM_CLASS(klass: Pointer): Tgboolean;
function G_FILE_OUTPUT_STREAM_GET_CLASS(obj: Pointer): PGFileOutputStreamClass;

implementation

function G_TYPE_FILE_OUTPUT_STREAM: TGType;
begin
  G_TYPE_FILE_OUTPUT_STREAM := g_file_output_stream_get_type;
end;

function G_FILE_OUTPUT_STREAM(obj: Pointer): PGFileOutputStream;
begin
  Result := PGFileOutputStream(g_type_check_instance_cast(obj, G_TYPE_FILE_OUTPUT_STREAM));
end;

function G_FILE_OUTPUT_STREAM_CLASS(klass: Pointer): PGFileOutputStreamClass;
begin
  Result := PGFileOutputStreamClass(g_type_check_class_cast(klass, G_TYPE_FILE_OUTPUT_STREAM));
end;

function G_IS_FILE_OUTPUT_STREAM(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_FILE_OUTPUT_STREAM);
end;

function G_IS_FILE_OUTPUT_STREAM_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_FILE_OUTPUT_STREAM);
end;

function G_FILE_OUTPUT_STREAM_GET_CLASS(obj: Pointer): PGFileOutputStreamClass;
begin
  Result := PGFileOutputStreamClass(PGTypeInstance(obj)^.g_class);
end;



end.
