unit gproxyaddress;

interface

uses
  common_GLIB, gtypes, gtype, giotypes, gobject, gioenums, ginetsocketaddress, ginetaddress;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGProxyAddressPrivate = record
  end;
  PGProxyAddressPrivate = ^TGProxyAddressPrivate;

  TGProxyAddress = record
    parent_instance: TGInetSocketAddress;
    priv: PGProxyAddressPrivate;
  end;
  PGProxyAddress = ^TGProxyAddress;

  TGProxyAddressClass = record
    parent_class: TGInetSocketAddressClass;
  end;
  PGProxyAddressClass = ^TGProxyAddressClass;


function g_proxy_address_get_type: TGType; cdecl; external libgio2;
function g_proxy_address_new(inetaddr: PGInetAddress; port: Tguint16; protocol: Pgchar; dest_hostname: Pgchar; dest_port: Tguint16;
  username: Pgchar; password: Pgchar): PGSocketAddress; cdecl; external libgio2;
function g_proxy_address_get_protocol(proxy: PGProxyAddress): Pgchar; cdecl; external libgio2;
function g_proxy_address_get_destination_protocol(proxy: PGProxyAddress): Pgchar; cdecl; external libgio2;
function g_proxy_address_get_destination_hostname(proxy: PGProxyAddress): Pgchar; cdecl; external libgio2;
function g_proxy_address_get_destination_port(proxy: PGProxyAddress): Tguint16; cdecl; external libgio2;
function g_proxy_address_get_username(proxy: PGProxyAddress): Pgchar; cdecl; external libgio2;
function g_proxy_address_get_password(proxy: PGProxyAddress): Pgchar; cdecl; external libgio2;
function g_proxy_address_get_uri(proxy: PGProxyAddress): Pgchar; cdecl; external libgio2;

// === Konventiert am: 20-8-24 18:17:01 ===

function G_TYPE_PROXY_ADDRESS: TGType;
function G_PROXY_ADDRESS(obj: Pointer): PGProxyAddress;
function G_PROXY_ADDRESS_CLASS(klass: Pointer): PGProxyAddressClass;
function G_IS_PROXY_ADDRESS(obj: Pointer): Tgboolean;
function G_IS_PROXY_ADDRESS_CLASS(klass: Pointer): Tgboolean;
function G_PROXY_ADDRESS_GET_CLASS(obj: Pointer): PGProxyAddressClass;

implementation

function G_TYPE_PROXY_ADDRESS: TGType;
begin
  G_TYPE_PROXY_ADDRESS := g_proxy_address_get_type;
end;

function G_PROXY_ADDRESS(obj: Pointer): PGProxyAddress;
begin
  Result := PGProxyAddress(g_type_check_instance_cast(obj, G_TYPE_PROXY_ADDRESS));
end;

function G_PROXY_ADDRESS_CLASS(klass: Pointer): PGProxyAddressClass;
begin
  Result := PGProxyAddressClass(g_type_check_class_cast(klass, G_TYPE_PROXY_ADDRESS));
end;

function G_IS_PROXY_ADDRESS(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_PROXY_ADDRESS);
end;

function G_IS_PROXY_ADDRESS_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_PROXY_ADDRESS);
end;

function G_PROXY_ADDRESS_GET_CLASS(obj: Pointer): PGProxyAddressClass;
begin
  Result := PGProxyAddressClass(PGTypeInstance(obj)^.g_class);
end;



end.
