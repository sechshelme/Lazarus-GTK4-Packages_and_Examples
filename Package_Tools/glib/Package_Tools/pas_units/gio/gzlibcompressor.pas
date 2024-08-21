unit gzlibcompressor;

interface

uses
  common_GLIB, gtypes, gerror, gtype, giotypes, gobject, gioenums;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGZlibCompressor = record
  end;
  PGZlibCompressor = ^TGZlibCompressor;

  TGZlibCompressorClass = record
    parent_class: TGObjectClass;
  end;
  PGZlibCompressorClass = ^TGZlibCompressorClass;

function g_zlib_compressor_get_type: TGType; cdecl; external libgio2;
function g_zlib_compressor_new(format: TGZlibCompressorFormat; level: longint): PGZlibCompressor; cdecl; external libgio2;
function g_zlib_compressor_get_file_info(compressor: PGZlibCompressor): PGFileInfo; cdecl; external libgio2;
procedure g_zlib_compressor_set_file_info(compressor: PGZlibCompressor; file_info: PGFileInfo); cdecl; external libgio2;

// === Konventiert am: 21-8-24 16:00:44 ===

function G_TYPE_ZLIB_COMPRESSOR: TGType;
function G_ZLIB_COMPRESSOR(obj: Pointer): PGZlibCompressor;
function G_ZLIB_COMPRESSOR_CLASS(klass: Pointer): PGZlibCompressorClass;
function G_IS_ZLIB_COMPRESSOR(obj: Pointer): Tgboolean;
function G_IS_ZLIB_COMPRESSOR_CLASS(klass: Pointer): Tgboolean;
function G_ZLIB_COMPRESSOR_GET_CLASS(obj: Pointer): PGZlibCompressorClass;

implementation

function G_TYPE_ZLIB_COMPRESSOR: TGType;
begin
  G_TYPE_ZLIB_COMPRESSOR := g_zlib_compressor_get_type;
end;

function G_ZLIB_COMPRESSOR(obj: Pointer): PGZlibCompressor;
begin
  Result := PGZlibCompressor(g_type_check_instance_cast(obj, G_TYPE_ZLIB_COMPRESSOR));
end;

function G_ZLIB_COMPRESSOR_CLASS(klass: Pointer): PGZlibCompressorClass;
begin
  Result := PGZlibCompressorClass(g_type_check_class_cast(klass, G_TYPE_ZLIB_COMPRESSOR));
end;

function G_IS_ZLIB_COMPRESSOR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_ZLIB_COMPRESSOR);
end;

function G_IS_ZLIB_COMPRESSOR_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_ZLIB_COMPRESSOR);
end;

function G_ZLIB_COMPRESSOR_GET_CLASS(obj: Pointer): PGZlibCompressorClass;
begin
  Result := PGZlibCompressorClass(PGTypeInstance(obj)^.g_class);
end;



end.
