unit gsimpleproxyresolver;

interface

uses
  common_GLIB, gtypes, gtype, giotypes, gobject, gioenums;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGSimpleProxyResolverPrivate = record
  end;
  PGSimpleProxyResolverPrivate = ^TGSimpleProxyResolverPrivate;

  TGSimpleProxyResolver = record
    parent_instance: TGObject;
    priv: PGSimpleProxyResolverPrivate;
  end;
  PGSimpleProxyResolver = ^TGSimpleProxyResolver;

  TGSimpleProxyResolverClass = record
    parent_class: TGObjectClass;
    _g_reserved1: procedure; cdecl;
    _g_reserved2: procedure; cdecl;
    _g_reserved3: procedure; cdecl;
    _g_reserved4: procedure; cdecl;
    _g_reserved5: procedure; cdecl;
  end;
  PGSimpleProxyResolverClass = ^TGSimpleProxyResolverClass;


function g_simple_proxy_resolver_get_type: TGType; cdecl; external libgio2;
function g_simple_proxy_resolver_new(default_proxy: Pgchar; ignore_hosts: PPgchar): PGProxyResolver; cdecl; external libgio2;
procedure g_simple_proxy_resolver_set_default_proxy(resolver: PGSimpleProxyResolver; default_proxy: Pgchar); cdecl; external libgio2;
procedure g_simple_proxy_resolver_set_ignore_hosts(resolver: PGSimpleProxyResolver; ignore_hosts: PPgchar); cdecl; external libgio2;
procedure g_simple_proxy_resolver_set_uri_proxy(resolver: PGSimpleProxyResolver; uri_scheme: Pgchar; proxy: Pgchar); cdecl; external libgio2;

// === Konventiert am: 21-8-24 13:31:04 ===

function G_TYPE_SIMPLE_PROXY_RESOLVER: TGType;
function G_SIMPLE_PROXY_RESOLVER(obj: Pointer): PGSimpleProxyResolver;
function G_SIMPLE_PROXY_RESOLVER_CLASS(klass: Pointer): PGSimpleProxyResolverClass;
function G_IS_SIMPLE_PROXY_RESOLVER(obj: Pointer): Tgboolean;
function G_IS_SIMPLE_PROXY_RESOLVER_CLASS(klass: Pointer): Tgboolean;
function G_SIMPLE_PROXY_RESOLVER_GET_CLASS(obj: Pointer): PGSimpleProxyResolverClass;

implementation

function G_TYPE_SIMPLE_PROXY_RESOLVER: TGType;
begin
  G_TYPE_SIMPLE_PROXY_RESOLVER := g_simple_proxy_resolver_get_type;
end;

function G_SIMPLE_PROXY_RESOLVER(obj: Pointer): PGSimpleProxyResolver;
begin
  Result := PGSimpleProxyResolver(g_type_check_instance_cast(obj, G_TYPE_SIMPLE_PROXY_RESOLVER));
end;

function G_SIMPLE_PROXY_RESOLVER_CLASS(klass: Pointer): PGSimpleProxyResolverClass;
begin
  Result := PGSimpleProxyResolverClass(g_type_check_class_cast(klass, G_TYPE_SIMPLE_PROXY_RESOLVER));
end;

function G_IS_SIMPLE_PROXY_RESOLVER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_SIMPLE_PROXY_RESOLVER);
end;

function G_IS_SIMPLE_PROXY_RESOLVER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_SIMPLE_PROXY_RESOLVER);
end;

function G_SIMPLE_PROXY_RESOLVER_GET_CLASS(obj: Pointer): PGSimpleProxyResolverClass;
begin
  Result := PGSimpleProxyResolverClass(PGTypeInstance(obj)^.g_class);
end;



end.
