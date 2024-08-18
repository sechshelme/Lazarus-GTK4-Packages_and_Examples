unit gfilterinputstream;

interface

uses
  common_GLIB, gtypes, gtype, ginputstream;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGFilterInputStream = record
    parent_instance: TGInputStream;
    base_stream: PGInputStream;
  end;
  PGFilterInputStream = ^TGFilterInputStream;

  TGFilterInputStreamClass = record
    parent_class: TGInputStreamClass;
    _g_reserved1: procedure; cdecl;
    _g_reserved2: procedure; cdecl;
    _g_reserved3: procedure; cdecl;
  end;
  PGFilterInputStreamClass = ^TGFilterInputStreamClass;


function g_filter_input_stream_get_type: TGType; cdecl; external libgio2;
function g_filter_input_stream_get_base_stream(stream: PGFilterInputStream): PGInputStream; cdecl; external libgio2;
function g_filter_input_stream_get_close_base_stream(stream: PGFilterInputStream): Tgboolean; cdecl; external libgio2;
procedure g_filter_input_stream_set_close_base_stream(stream: PGFilterInputStream; close_base: Tgboolean); cdecl; external libgio2;

// === Konventiert am: 18-8-24 15:19:51 ===

function G_TYPE_FILTER_INPUT_STREAM: TGType;
function G_FILTER_INPUT_STREAM(obj: Pointer): PGFilterInputStream;
function G_FILTER_INPUT_STREAM_CLASS(klass: Pointer): PGFilterInputStreamClass;
function G_IS_FILTER_INPUT_STREAM(obj: Pointer): Tgboolean;
function G_IS_FILTER_INPUT_STREAM_CLASS(klass: Pointer): Tgboolean;
function G_FILTER_INPUT_STREAM_GET_CLASS(obj: Pointer): PGFilterInputStreamClass;

implementation

function G_TYPE_FILTER_INPUT_STREAM: TGType;
begin
  G_TYPE_FILTER_INPUT_STREAM := g_filter_input_stream_get_type;
end;

function G_FILTER_INPUT_STREAM(obj: Pointer): PGFilterInputStream;
begin
  Result := PGFilterInputStream(g_type_check_instance_cast(obj, G_TYPE_FILTER_INPUT_STREAM));
end;

function G_FILTER_INPUT_STREAM_CLASS(klass: Pointer): PGFilterInputStreamClass;
begin
  Result := PGFilterInputStreamClass(g_type_check_class_cast(klass, G_TYPE_FILTER_INPUT_STREAM));
end;

function G_IS_FILTER_INPUT_STREAM(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_FILTER_INPUT_STREAM);
end;

function G_IS_FILTER_INPUT_STREAM_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_FILTER_INPUT_STREAM);
end;

function G_FILTER_INPUT_STREAM_GET_CLASS(obj: Pointer): PGFilterInputStreamClass;
begin
  Result := PGFilterInputStreamClass(PGTypeInstance(obj)^.g_class);
end;



end.
