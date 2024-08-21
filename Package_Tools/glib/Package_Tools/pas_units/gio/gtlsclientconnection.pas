unit gtlsclientconnection;

interface

uses
  common_GLIB, gtypes, gtype, glist, gerror, giotypes, gobject, gioenums, giostream;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGTlsClientConnection = record
  end;
  PGTlsClientConnection = ^TGTlsClientConnection;

  TGTlsClientConnectionInterface = record
    g_iface: TGTypeInterface;
    copy_session_state: procedure(conn: PGTlsClientConnection; Source: PGTlsClientConnection); cdecl;
  end;
  PGTlsClientConnectionInterface = ^TGTlsClientConnectionInterface;


function g_tls_client_connection_get_type: TGType; cdecl; external libgio2;
function g_tls_client_connection_new(base_io_stream: PGIOStream; server_identity: PGSocketConnectable; error: PPGError): PGIOStream; cdecl; external libgio2;
function g_tls_client_connection_get_validation_flags(conn: PGTlsClientConnection): TGTlsCertificateFlags; cdecl; external libgio2;
procedure g_tls_client_connection_set_validation_flags(conn: PGTlsClientConnection; flags: TGTlsCertificateFlags); cdecl; external libgio2;
function g_tls_client_connection_get_server_identity(conn: PGTlsClientConnection): PGSocketConnectable; cdecl; external libgio2;
procedure g_tls_client_connection_set_server_identity(conn: PGTlsClientConnection; identity: PGSocketConnectable); cdecl; external libgio2;
function g_tls_client_connection_get_use_ssl3(conn: PGTlsClientConnection): Tgboolean; cdecl; external libgio2;
procedure g_tls_client_connection_set_use_ssl3(conn: PGTlsClientConnection; use_ssl3: Tgboolean); cdecl; external libgio2;
function g_tls_client_connection_get_accepted_cas(conn: PGTlsClientConnection): PGList; cdecl; external libgio2;
procedure g_tls_client_connection_copy_session_state(conn: PGTlsClientConnection; Source: PGTlsClientConnection); cdecl; external libgio2;

// === Konventiert am: 21-8-24 13:31:14 ===

function G_TYPE_TLS_CLIENT_CONNECTION: TGType;
function G_TLS_CLIENT_CONNECTION(obj: Pointer): PGTlsClientConnection;
function G_IS_TLS_CLIENT_CONNECTION(obj: Pointer): Tgboolean;
function G_TLS_CLIENT_CONNECTION_GET_INTERFACE(obj: Pointer): PGTlsClientConnectionInterface;

implementation

function G_TYPE_TLS_CLIENT_CONNECTION: TGType;
begin
  G_TYPE_TLS_CLIENT_CONNECTION := g_tls_client_connection_get_type;
end;

function G_TLS_CLIENT_CONNECTION(obj: Pointer): PGTlsClientConnection;
begin
  Result := PGTlsClientConnection(g_type_check_instance_cast(obj, G_TYPE_TLS_CLIENT_CONNECTION));
end;

function G_IS_TLS_CLIENT_CONNECTION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_TLS_CLIENT_CONNECTION);
end;

function G_TLS_CLIENT_CONNECTION_GET_INTERFACE(obj: Pointer): PGTlsClientConnectionInterface;
begin
  Result := g_type_interface_peek(obj, G_TYPE_TLS_CLIENT_CONNECTION);
end;



end.
