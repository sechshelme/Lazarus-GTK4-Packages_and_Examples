unit gproxyresolver;

interface

uses
  common_GLIB, gtypes, gerror, gtype, giotypes, gobject, gioenums;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

const
  G_PROXY_RESOLVER_EXTENSION_POINT_NAME = 'gio-proxy-resolver';

type
  TGProxyResolverInterface = record
    g_iface: TGTypeInterface;
    is_supported: function(resolver: PGProxyResolver): Tgboolean; cdecl;
    lookup: function(resolver: PGProxyResolver; uri: Pgchar; cancellable: PGCancellable; error: PPGError): PPgchar; cdecl;
    lookup_async: procedure(resolver: PGProxyResolver; uri: Pgchar; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl;
    lookup_finish: function(resolver: PGProxyResolver; Result: PGAsyncResult; error: PPGError): PPgchar; cdecl;
  end;
  PGProxyResolverInterface = ^TGProxyResolverInterface;

function g_proxy_resolver_get_type: TGType; cdecl; external libgio2;
function g_proxy_resolver_get_default: PGProxyResolver; cdecl; external libgio2;
function g_proxy_resolver_is_supported(resolver: PGProxyResolver): Tgboolean; cdecl; external libgio2;
function g_proxy_resolver_lookup(resolver: PGProxyResolver; uri: Pgchar; cancellable: PGCancellable; error: PPGError): PPgchar; cdecl; external libgio2;
procedure g_proxy_resolver_lookup_async(resolver: PGProxyResolver; uri: Pgchar; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_proxy_resolver_lookup_finish(resolver: PGProxyResolver; Result: PGAsyncResult; error: PPGError): PPgchar; cdecl; external libgio2;

// === Konventiert am: 21-8-24 13:42:55 ===

function G_TYPE_PROXY_RESOLVER: TGType;
function G_PROXY_RESOLVER(obj: Pointer): PGProxyResolver;
function G_IS_PROXY_RESOLVER(obj: Pointer): Tgboolean;
function G_PROXY_RESOLVER_GET_IFACE(obj: Pointer): PGProxyResolverInterface;

implementation

function G_TYPE_PROXY_RESOLVER: TGType;
begin
  G_TYPE_PROXY_RESOLVER := g_proxy_resolver_get_type;
end;

function G_PROXY_RESOLVER(obj: Pointer): PGProxyResolver;
begin
  Result := PGProxyResolver(g_type_check_instance_cast(obj, G_TYPE_PROXY_RESOLVER));
end;

function G_IS_PROXY_RESOLVER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_PROXY_RESOLVER);
end;

function G_PROXY_RESOLVER_GET_IFACE(obj: Pointer): PGProxyResolverInterface;
begin
  Result := g_type_interface_peek(obj, G_TYPE_PROXY_RESOLVER);
end;



end.
