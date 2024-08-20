unit gcharsetconverter;

interface

uses
  common_GLIB, gtypes, gerror, gtype, giotypes, gobject, gioenums;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGCharsetConverter = record
  end;
  PGCharsetConverter = ^TGCharsetConverter;

  TGCharsetConverterClass = record
    parent_class: TGObjectClass;
  end;
  PGCharsetConverterClass = ^TGCharsetConverterClass;


function g_charset_converter_get_type: TGType; cdecl; external libgio2;
function g_charset_converter_new(to_charset: Pgchar; from_charset: Pgchar; error: PPGError): PGCharsetConverter; cdecl; external libgio2;
procedure g_charset_converter_set_use_fallback(converter: PGCharsetConverter; use_fallback: Tgboolean); cdecl; external libgio2;
function g_charset_converter_get_use_fallback(converter: PGCharsetConverter): Tgboolean; cdecl; external libgio2;
function g_charset_converter_get_num_fallbacks(converter: PGCharsetConverter): Tguint; cdecl; external libgio2;

// === Konventiert am: 20-8-24 19:49:35 ===

function G_TYPE_CHARSET_CONVERTER: TGType;
function G_CHARSET_CONVERTER(obj: Pointer): PGCharsetConverter;
function G_CHARSET_CONVERTER_CLASS(klass: Pointer): PGCharsetConverterClass;
function G_IS_CHARSET_CONVERTER(obj: Pointer): Tgboolean;
function G_IS_CHARSET_CONVERTER_CLASS(klass: Pointer): Tgboolean;
function G_CHARSET_CONVERTER_GET_CLASS(obj: Pointer): PGCharsetConverterClass;

implementation

function G_TYPE_CHARSET_CONVERTER: TGType;
begin
  G_TYPE_CHARSET_CONVERTER := g_charset_converter_get_type;
end;

function G_CHARSET_CONVERTER(obj: Pointer): PGCharsetConverter;
begin
  Result := PGCharsetConverter(g_type_check_instance_cast(obj, G_TYPE_CHARSET_CONVERTER));
end;

function G_CHARSET_CONVERTER_CLASS(klass: Pointer): PGCharsetConverterClass;
begin
  Result := PGCharsetConverterClass(g_type_check_class_cast(klass, G_TYPE_CHARSET_CONVERTER));
end;

function G_IS_CHARSET_CONVERTER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_CHARSET_CONVERTER);
end;

function G_IS_CHARSET_CONVERTER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_CHARSET_CONVERTER);
end;

function G_CHARSET_CONVERTER_GET_CLASS(obj: Pointer): PGCharsetConverterClass;
begin
  Result := PGCharsetConverterClass(PGTypeInstance(obj)^.g_class);
end;



end.
