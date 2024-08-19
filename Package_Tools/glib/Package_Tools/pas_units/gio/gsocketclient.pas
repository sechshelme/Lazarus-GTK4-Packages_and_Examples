unit gsocketclient;

interface

uses
  common_GLIB, gtypes, gtype, gerror, giotypes, gobject, gioenums, giostream, gsocketconnection;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGSocketClientPrivate = record
  end;
  PGSocketClientPrivate = ^TGSocketClientPrivate;

  TGSocketClient = record
    parent_instance: TGObject;
    priv: PGSocketClientPrivate;
  end;
  PGSocketClient = ^TGSocketClient;

  TGSocketClientClass = record
    parent_class: TGObjectClass;
    event: procedure(client: PGSocketClient; event: TGSocketClientEvent; connectable: PGSocketConnectable; connection: PGIOStream); cdecl;
    _g_reserved1: procedure; cdecl;
    _g_reserved2: procedure; cdecl;
    _g_reserved3: procedure; cdecl;
    _g_reserved4: procedure; cdecl;
  end;
  PGSocketClientClass = ^TGSocketClientClass;


function g_socket_client_get_type: TGType; cdecl; external libgio2;
function g_socket_client_new: PGSocketClient; cdecl; external libgio2;
function g_socket_client_get_family(client: PGSocketClient): TGSocketFamily; cdecl; external libgio2;
procedure g_socket_client_set_family(client: PGSocketClient; family: TGSocketFamily); cdecl; external libgio2;
function g_socket_client_get_socket_type(client: PGSocketClient): TGSocketType; cdecl; external libgio2;
procedure g_socket_client_set_socket_type(client: PGSocketClient; _type: TGSocketType); cdecl; external libgio2;
function g_socket_client_get_protocol(client: PGSocketClient): TGSocketProtocol; cdecl; external libgio2;
procedure g_socket_client_set_protocol(client: PGSocketClient; protocol: TGSocketProtocol); cdecl; external libgio2;
function g_socket_client_get_local_address(client: PGSocketClient): PGSocketAddress; cdecl; external libgio2;
procedure g_socket_client_set_local_address(client: PGSocketClient; address: PGSocketAddress); cdecl; external libgio2;
function g_socket_client_get_timeout(client: PGSocketClient): Tguint; cdecl; external libgio2;
procedure g_socket_client_set_timeout(client: PGSocketClient; timeout: Tguint); cdecl; external libgio2;
function g_socket_client_get_enable_proxy(client: PGSocketClient): Tgboolean; cdecl; external libgio2;
procedure g_socket_client_set_enable_proxy(client: PGSocketClient; enable: Tgboolean); cdecl; external libgio2;
function g_socket_client_get_tls(client: PGSocketClient): Tgboolean; cdecl; external libgio2;
procedure g_socket_client_set_tls(client: PGSocketClient; tls: Tgboolean); cdecl; external libgio2;
function g_socket_client_get_tls_validation_flags(client: PGSocketClient): TGTlsCertificateFlags; cdecl; external libgio2;
procedure g_socket_client_set_tls_validation_flags(client: PGSocketClient; flags: TGTlsCertificateFlags); cdecl; external libgio2;
function g_socket_client_get_proxy_resolver(client: PGSocketClient): PGProxyResolver; cdecl; external libgio2;
procedure g_socket_client_set_proxy_resolver(client: PGSocketClient; proxy_resolver: PGProxyResolver); cdecl; external libgio2;
function g_socket_client_connect(client: PGSocketClient; connectable: PGSocketConnectable; cancellable: PGCancellable; error: PPGError): PGSocketConnection; cdecl; external libgio2;
function g_socket_client_connect_to_host(client: PGSocketClient; host_and_port: Pgchar; default_port: Tguint16; cancellable: PGCancellable; error: PPGError): PGSocketConnection; cdecl; external libgio2;
function g_socket_client_connect_to_service(client: PGSocketClient; domain: Pgchar; service: Pgchar; cancellable: PGCancellable; error: PPGError): PGSocketConnection; cdecl; external libgio2;
function g_socket_client_connect_to_uri(client: PGSocketClient; uri: Pgchar; default_port: Tguint16; cancellable: PGCancellable; error: PPGError): PGSocketConnection; cdecl; external libgio2;
procedure g_socket_client_connect_async(client: PGSocketClient; connectable: PGSocketConnectable; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_socket_client_connect_finish(client: PGSocketClient; Result: PGAsyncResult; error: PPGError): PGSocketConnection; cdecl; external libgio2;
procedure g_socket_client_connect_to_host_async(client: PGSocketClient; host_and_port: Pgchar; default_port: Tguint16; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
  user_data: Tgpointer); cdecl; external libgio2;
function g_socket_client_connect_to_host_finish(client: PGSocketClient; Result: PGAsyncResult; error: PPGError): PGSocketConnection; cdecl; external libgio2;
procedure g_socket_client_connect_to_service_async(client: PGSocketClient; domain: Pgchar; service: Pgchar; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
  user_data: Tgpointer); cdecl; external libgio2;
function g_socket_client_connect_to_service_finish(client: PGSocketClient; Result: PGAsyncResult; error: PPGError): PGSocketConnection; cdecl; external libgio2;
procedure g_socket_client_connect_to_uri_async(client: PGSocketClient; uri: Pgchar; default_port: Tguint16; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
  user_data: Tgpointer); cdecl; external libgio2;
function g_socket_client_connect_to_uri_finish(client: PGSocketClient; Result: PGAsyncResult; error: PPGError): PGSocketConnection; cdecl; external libgio2;
procedure g_socket_client_add_application_proxy(client: PGSocketClient; protocol: Pgchar); cdecl; external libgio2;

// === Konventiert am: 19-8-24 19:19:20 ===

function G_TYPE_SOCKET_CLIENT: TGType;
function G_SOCKET_CLIENT(obj: Pointer): PGSocketClient;
function G_SOCKET_CLIENT_CLASS(klass: Pointer): PGSocketClientClass;
function G_IS_SOCKET_CLIENT(obj: Pointer): Tgboolean;
function G_IS_SOCKET_CLIENT_CLASS(klass: Pointer): Tgboolean;
function G_SOCKET_CLIENT_GET_CLASS(obj: Pointer): PGSocketClientClass;

implementation

function G_TYPE_SOCKET_CLIENT: TGType;
begin
  G_TYPE_SOCKET_CLIENT := g_socket_client_get_type;
end;

function G_SOCKET_CLIENT(obj: Pointer): PGSocketClient;
begin
  Result := PGSocketClient(g_type_check_instance_cast(obj, G_TYPE_SOCKET_CLIENT));
end;

function G_SOCKET_CLIENT_CLASS(klass: Pointer): PGSocketClientClass;
begin
  Result := PGSocketClientClass(g_type_check_class_cast(klass, G_TYPE_SOCKET_CLIENT));
end;

function G_IS_SOCKET_CLIENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_SOCKET_CLIENT);
end;

function G_IS_SOCKET_CLIENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_SOCKET_CLIENT);
end;

function G_SOCKET_CLIENT_GET_CLASS(obj: Pointer): PGSocketClientClass;
begin
  Result := PGSocketClientClass(PGTypeInstance(obj)^.g_class);
end;



end.
