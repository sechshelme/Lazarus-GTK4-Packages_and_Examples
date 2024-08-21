/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGTlsConnectionPrivate = record
  end;
  PGTlsConnectionPrivate = ^TGTlsConnectionPrivate;

  TGTlsConnection = record
    parent_instance: TGIOStream;
    priv: PGTlsConnectionPrivate;
  end;
  PGTlsConnection = ^TGTlsConnection;

  TGTlsConnectionClass = record
    parent_class: TGIOStreamClass;
    accept_certificate: function(connection: PGTlsConnection; peer_cert: PGTlsCertificate; errors: TGTlsCertificateFlags): Tgboolean; cdecl;
    handshake: function(conn: PGTlsConnection; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl;
    handshake_async: procedure(conn: PGTlsConnection; io_priority: longint; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl;
    handshake_finish: function(conn: PGTlsConnection; Result: PGAsyncResult; error: PPGError): Tgboolean; cdecl;
    get_binding_data: function(conn: PGTlsConnection; _type: TGTlsChannelBindingType; Data: PGByteArray; error: PPGError): Tgboolean; cdecl;
    get_negotiated_protocol: function(conn: PGTlsConnection): Pgchar; cdecl;
    padding: array[0..5] of Tgpointer;
  end;
  PGTlsConnectionClass = ^TGTlsConnectionClass;


function g_tls_connection_get_type: TGType; cdecl; external libgio2;
procedure g_tls_connection_set_use_system_certdb(conn: PGTlsConnection; use_system_certdb: Tgboolean); cdecl; external libgio2;
function g_tls_connection_get_use_system_certdb(conn: PGTlsConnection): Tgboolean; cdecl; external libgio2;
procedure g_tls_connection_set_database(conn: PGTlsConnection; database: PGTlsDatabase); cdecl; external libgio2;
function g_tls_connection_get_database(conn: PGTlsConnection): PGTlsDatabase; cdecl; external libgio2;
procedure g_tls_connection_set_certificate(conn: PGTlsConnection; certificate: PGTlsCertificate); cdecl; external libgio2;
function g_tls_connection_get_certificate(conn: PGTlsConnection): PGTlsCertificate; cdecl; external libgio2;
procedure g_tls_connection_set_interaction(conn: PGTlsConnection; interaction: PGTlsInteraction); cdecl; external libgio2;
function g_tls_connection_get_interaction(conn: PGTlsConnection): PGTlsInteraction; cdecl; external libgio2;
function g_tls_connection_get_peer_certificate(conn: PGTlsConnection): PGTlsCertificate; cdecl; external libgio2;
function g_tls_connection_get_peer_certificate_errors(conn: PGTlsConnection): TGTlsCertificateFlags; cdecl; external libgio2;
procedure g_tls_connection_set_require_close_notify(conn: PGTlsConnection; require_close_notify: Tgboolean); cdecl; external libgio2;
function g_tls_connection_get_require_close_notify(conn: PGTlsConnection): Tgboolean; cdecl; external libgio2;
procedure g_tls_connection_set_rehandshake_mode(conn: PGTlsConnection; mode: TGTlsRehandshakeMode); cdecl; external libgio2;
function g_tls_connection_get_rehandshake_mode(conn: PGTlsConnection): TGTlsRehandshakeMode; cdecl; external libgio2;
procedure g_tls_connection_set_advertised_protocols(conn: PGTlsConnection; protocols: PPgchar); cdecl; external libgio2;
function g_tls_connection_get_negotiated_protocol(conn: PGTlsConnection): Pgchar; cdecl; external libgio2;
function g_tls_connection_get_channel_binding_data(conn: PGTlsConnection; _type: TGTlsChannelBindingType; Data: PGByteArray; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_tls_connection_handshake(conn: PGTlsConnection; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libgio2;
procedure g_tls_connection_handshake_async(conn: PGTlsConnection; io_priority: longint; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_tls_connection_handshake_finish(conn: PGTlsConnection; Result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_tls_connection_get_protocol_version(conn: PGTlsConnection): TGTlsProtocolVersion; cdecl; external libgio2;
function g_tls_connection_get_ciphersuite_name(conn: PGTlsConnection): Pgchar; cdecl; external libgio2;

function g_tls_error_quark: TGQuark; cdecl; external libgio2;


function g_tls_channel_binding_error_quark: TGQuark; cdecl; external libgio2;
function g_tls_connection_emit_accept_certificate(conn: PGTlsConnection; peer_cert: PGTlsCertificate; errors: TGTlsCertificateFlags): Tgboolean; cdecl; external libgio2;

function G_TLS_ERROR: TGQuark;
function G_TLS_CHANNEL_BINDING_ERROR: TGQuark;

// === Konventiert am: 18-8-24 17:56:29 ===

function G_TYPE_TLS_CONNECTION: TGType;
function G_TLS_CONNECTION(obj: Pointer): PGTlsConnection;
function G_TLS_CONNECTION_CLASS(klass: Pointer): PGTlsConnectionClass;
function G_IS_TLS_CONNECTION(obj: Pointer): Tgboolean;
function G_IS_TLS_CONNECTION_CLASS(klass: Pointer): Tgboolean;
function G_TLS_CONNECTION_GET_CLASS(obj: Pointer): PGTlsConnectionClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_TYPE_TLS_CONNECTION: TGType;
begin
  G_TYPE_TLS_CONNECTION := g_tls_connection_get_type;
end;

function G_TLS_CONNECTION(obj: Pointer): PGTlsConnection;
begin
  Result := PGTlsConnection(g_type_check_instance_cast(obj, G_TYPE_TLS_CONNECTION));
end;

function G_TLS_CONNECTION_CLASS(klass: Pointer): PGTlsConnectionClass;
begin
  Result := PGTlsConnectionClass(g_type_check_class_cast(klass, G_TYPE_TLS_CONNECTION));
end;

function G_IS_TLS_CONNECTION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_TLS_CONNECTION);
end;

function G_IS_TLS_CONNECTION_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_TLS_CONNECTION);
end;

function G_TLS_CONNECTION_GET_CLASS(obj: Pointer): PGTlsConnectionClass;
begin
  Result := PGTlsConnectionClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function G_TLS_ERROR: TGQuark;
begin
  G_TLS_ERROR := g_tls_error_quark;
end;

function G_TLS_CHANNEL_BINDING_ERROR: TGQuark;
begin
  G_TLS_CHANNEL_BINDING_ERROR := g_tls_channel_binding_error_quark;
end;


{$ENDIF read_implementation}
