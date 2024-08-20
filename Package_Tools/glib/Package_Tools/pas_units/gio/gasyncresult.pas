unit gasyncresult;

interface

uses
  common_GLIB, gtypes, gerror, gtype, giotypes, gobject, gioenums;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGAsyncResultIface = ^TGAsyncResultIface;

  TGAsyncResultIface = record
    g_iface: TGTypeInterface;
    get_user_data: function(res: PGAsyncResult): Tgpointer; cdecl;
    get_source_object: function(res: PGAsyncResult): PGObject; cdecl;
    is_tagged: function(res: PGAsyncResult; source_tag: Tgpointer): Tgboolean; cdecl;
  end;


function g_async_result_get_type: TGType; cdecl; external libgio2;
function g_async_result_get_user_data(res: PGAsyncResult): Tgpointer; cdecl; external libgio2;
function g_async_result_get_source_object(res: PGAsyncResult): PGObject; cdecl; external libgio2;
function g_async_result_legacy_propagate_error(res: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_async_result_is_tagged(res: PGAsyncResult; source_tag: Tgpointer): Tgboolean; cdecl; external libgio2;

// === Konventiert am: 20-8-24 15:50:21 ===

function G_TYPE_ASYNC_RESULT: TGType;
function G_ASYNC_RESULT(obj: Pointer): PGAsyncResult;
function G_IS_ASYNC_RESULT(obj: Pointer): Tgboolean;
function G_ASYNC_RESULT_GET_IFACE(obj: Pointer): PGAsyncResultIface;

implementation

function G_TYPE_ASYNC_RESULT: TGType;
begin
  G_TYPE_ASYNC_RESULT := g_async_result_get_type;
end;

function G_ASYNC_RESULT(obj: Pointer): PGAsyncResult;
begin
  Result := PGAsyncResult(g_type_check_instance_cast(obj, G_TYPE_ASYNC_RESULT));
end;

function G_IS_ASYNC_RESULT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_ASYNC_RESULT);
end;

function G_ASYNC_RESULT_GET_IFACE(obj: Pointer): PGAsyncResultIface;
begin
  Result := g_type_interface_peek(obj, G_TYPE_ASYNC_RESULT);
end;



end.
