unit gmemoryoutputstream;

interface

uses
  common_GLIB, gtypes, gtype, garray, giotypes, gobject, gioenums, goutputstream;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGMemoryOutputStreamPrivate = record
  end;
  PGMemoryOutputStreamPrivate = ^TGMemoryOutputStreamPrivate;

  TGMemoryOutputStream = record
    parent_instance: TGOutputStream;
    priv: PGMemoryOutputStreamPrivate;
  end;
  PGMemoryOutputStream = ^TGMemoryOutputStream;

  TGMemoryOutputStreamClass = record
    parent_class: TGOutputStreamClass;
    _g_reserved1: procedure; cdecl;
    _g_reserved2: procedure; cdecl;
    _g_reserved3: procedure; cdecl;
    _g_reserved4: procedure; cdecl;
    _g_reserved5: procedure; cdecl;
  end;
  PGMemoryOutputStreamClass = ^TGMemoryOutputStreamClass;

  TGReallocFunc = function(Data: Tgpointer; size: Tgsize): Tgpointer; cdecl;

function g_memory_output_stream_get_type: TGType; cdecl; external libgio2;
function g_memory_output_stream_new(Data: Tgpointer; size: Tgsize; realloc_function: TGReallocFunc; destroy_function: TGDestroyNotify): PGOutputStream; cdecl; external libgio2;
function g_memory_output_stream_new_resizable: PGOutputStream; cdecl; external libgio2;
function g_memory_output_stream_get_data(ostream: PGMemoryOutputStream): Tgpointer; cdecl; external libgio2;
function g_memory_output_stream_get_size(ostream: PGMemoryOutputStream): Tgsize; cdecl; external libgio2;
function g_memory_output_stream_get_data_size(ostream: PGMemoryOutputStream): Tgsize; cdecl; external libgio2;
function g_memory_output_stream_steal_data(ostream: PGMemoryOutputStream): Tgpointer; cdecl; external libgio2;
function g_memory_output_stream_steal_as_bytes(ostream: PGMemoryOutputStream): PGBytes; cdecl; external libgio2;

// === Konventiert am: 20-8-24 19:32:15 ===

function G_TYPE_MEMORY_OUTPUT_STREAM: TGType;
function G_MEMORY_OUTPUT_STREAM(obj: Pointer): PGMemoryOutputStream;
function G_MEMORY_OUTPUT_STREAM_CLASS(klass: Pointer): PGMemoryOutputStreamClass;
function G_IS_MEMORY_OUTPUT_STREAM(obj: Pointer): Tgboolean;
function G_IS_MEMORY_OUTPUT_STREAM_CLASS(klass: Pointer): Tgboolean;
function G_MEMORY_OUTPUT_STREAM_GET_CLASS(obj: Pointer): PGMemoryOutputStreamClass;

implementation

function G_TYPE_MEMORY_OUTPUT_STREAM: TGType;
begin
  G_TYPE_MEMORY_OUTPUT_STREAM := g_memory_output_stream_get_type;
end;

function G_MEMORY_OUTPUT_STREAM(obj: Pointer): PGMemoryOutputStream;
begin
  Result := PGMemoryOutputStream(g_type_check_instance_cast(obj, G_TYPE_MEMORY_OUTPUT_STREAM));
end;

function G_MEMORY_OUTPUT_STREAM_CLASS(klass: Pointer): PGMemoryOutputStreamClass;
begin
  Result := PGMemoryOutputStreamClass(g_type_check_class_cast(klass, G_TYPE_MEMORY_OUTPUT_STREAM));
end;

function G_IS_MEMORY_OUTPUT_STREAM(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_MEMORY_OUTPUT_STREAM);
end;

function G_IS_MEMORY_OUTPUT_STREAM_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_MEMORY_OUTPUT_STREAM);
end;

function G_MEMORY_OUTPUT_STREAM_GET_CLASS(obj: Pointer): PGMemoryOutputStreamClass;
begin
  Result := PGMemoryOutputStreamClass(PGTypeInstance(obj)^.g_class);
end;



end.
