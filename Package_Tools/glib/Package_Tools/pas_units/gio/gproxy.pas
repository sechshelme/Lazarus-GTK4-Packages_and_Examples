unit gproxy;

interface

uses
  common_GLIB, gtypes, gerror, gtype, giotypes, gobject, gioenums, giostream, gproxyaddress;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  G_PROXY_EXTENSION_POINT_NAME = 'gio-proxy';

type
  TGProxy = record
  end;
  PGProxy = ^TGProxy;

  TGProxyInterface = record
    g_iface: TGTypeInterface;
    connect: function(proxy: PGProxy; connection: PGIOStream; proxy_address: PGProxyAddress; cancellable: PGCancellable; error: PPGError): PGIOStream; cdecl;
    connect_async: procedure(proxy: PGProxy; connection: PGIOStream; proxy_address: PGProxyAddress; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
      user_data: Tgpointer); cdecl;
    connect_finish: function(proxy: PGProxy; Result: PGAsyncResult; error: PPGError): PGIOStream; cdecl;
    supports_hostname: function(proxy: PGProxy): Tgboolean; cdecl;
  end;
  PGProxyInterface = ^TGProxyInterface;


function g_proxy_get_type: TGType; cdecl; external libgio2;
function g_proxy_get_default_for_protocol(protocol: Pgchar): PGProxy; cdecl; external libgio2;
function g_proxy_connect(proxy: PGProxy; connection: PGIOStream; proxy_address: PGProxyAddress; cancellable: PGCancellable; error: PPGError): PGIOStream; cdecl; external libgio2;
procedure g_proxy_connect_async(proxy: PGProxy; connection: PGIOStream; proxy_address: PGProxyAddress; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
  user_data: Tgpointer); cdecl; external libgio2;
function g_proxy_connect_finish(proxy: PGProxy; Result: PGAsyncResult; error: PPGError): PGIOStream; cdecl; external libgio2;
function g_proxy_supports_hostname(proxy: PGProxy): Tgboolean; cdecl; external libgio2;

// === Konventiert am: 20-8-24 18:13:17 ===

function G_TYPE_PROXY: TGType;
function G_PROXY(obj: Pointer): PGProxy;
function G_IS_PROXY(obj: Pointer): Tgboolean;
function G_PROXY_GET_IFACE(obj: Pointer): PGProxyInterface;

implementation

function G_TYPE_PROXY: TGType;
begin
  G_TYPE_PROXY := g_proxy_get_type;
end;

function G_PROXY(obj: Pointer): PGProxy;
begin
  Result := PGProxy(g_type_check_instance_cast(obj, G_TYPE_PROXY));
end;

function G_IS_PROXY(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_PROXY);
end;

function G_PROXY_GET_IFACE(obj: Pointer): PGProxyInterface;
begin
  Result := g_type_interface_peek(obj, G_TYPE_PROXY);
end;



end.
