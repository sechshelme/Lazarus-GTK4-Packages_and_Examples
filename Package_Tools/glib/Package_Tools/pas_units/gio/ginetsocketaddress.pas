unit ginetsocketaddress;

interface

uses
  common_GLIB, gtypes, gtype, giotypes, gobject, gioenums, ginetaddress, gsocketaddress;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGInetSocketAddressPrivate = record
  end;
  PGInetSocketAddressPrivate = ^TGInetSocketAddressPrivate;

  TGInetSocketAddress = record
    parent_instance: TGSocketAddress;
    priv: PGInetSocketAddressPrivate;
  end;
  PGInetSocketAddress = ^TGInetSocketAddress;

  TGInetSocketAddressClass = record
    parent_class: TGSocketAddressClass;
  end;
  PGInetSocketAddressClass = ^TGInetSocketAddressClass;


function g_inet_socket_address_get_type: TGType; cdecl; external libgio2;
function g_inet_socket_address_new(address: PGInetAddress; port: Tguint16): PGSocketAddress; cdecl; external libgio2;
function g_inet_socket_address_new_from_string(address: PChar; port: Tguint): PGSocketAddress; cdecl; external libgio2;
function g_inet_socket_address_get_address(address: PGInetSocketAddress): PGInetAddress; cdecl; external libgio2;
function g_inet_socket_address_get_port(address: PGInetSocketAddress): Tguint16; cdecl; external libgio2;
function g_inet_socket_address_get_flowinfo(address: PGInetSocketAddress): Tguint32; cdecl; external libgio2;
function g_inet_socket_address_get_scope_id(address: PGInetSocketAddress): Tguint32; cdecl; external libgio2;

// === Konventiert am: 20-8-24 18:21:18 ===

function G_TYPE_INET_SOCKET_ADDRESS: TGType;
function G_INET_SOCKET_ADDRESS(obj: Pointer): PGInetSocketAddress;
function G_INET_SOCKET_ADDRESS_CLASS(klass: Pointer): PGInetSocketAddressClass;
function G_IS_INET_SOCKET_ADDRESS(obj: Pointer): Tgboolean;
function G_IS_INET_SOCKET_ADDRESS_CLASS(klass: Pointer): Tgboolean;
function G_INET_SOCKET_ADDRESS_GET_CLASS(obj: Pointer): PGInetSocketAddressClass;

implementation

function G_TYPE_INET_SOCKET_ADDRESS: TGType;
begin
  G_TYPE_INET_SOCKET_ADDRESS := g_inet_socket_address_get_type;
end;

function G_INET_SOCKET_ADDRESS(obj: Pointer): PGInetSocketAddress;
begin
  Result := PGInetSocketAddress(g_type_check_instance_cast(obj, G_TYPE_INET_SOCKET_ADDRESS));
end;

function G_INET_SOCKET_ADDRESS_CLASS(klass: Pointer): PGInetSocketAddressClass;
begin
  Result := PGInetSocketAddressClass(g_type_check_class_cast(klass, G_TYPE_INET_SOCKET_ADDRESS));
end;

function G_IS_INET_SOCKET_ADDRESS(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_INET_SOCKET_ADDRESS);
end;

function G_IS_INET_SOCKET_ADDRESS_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_INET_SOCKET_ADDRESS);
end;

function G_INET_SOCKET_ADDRESS_GET_CLASS(obj: Pointer): PGInetSocketAddressClass;
begin
  Result := PGInetSocketAddressClass(PGTypeInstance(obj)^.g_class);
end;



end.
