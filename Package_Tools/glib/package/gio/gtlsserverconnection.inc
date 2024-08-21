/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGTlsServerConnection = record
  end;
  PGTlsServerConnection = ^TGTlsServerConnection;

  TGTlsServerConnectionInterface = record
    g_iface: TGTypeInterface;
  end;
  PGTlsServerConnectionInterface = ^TGTlsServerConnectionInterface;

function g_tls_server_connection_get_type: TGType; cdecl; external libgio2;
function g_tls_server_connection_new(base_io_stream: PGIOStream; certificate: PGTlsCertificate; error: PPGError): PGIOStream; cdecl; external libgio2;

// === Konventiert am: 21-8-24 16:00:36 ===

function G_TYPE_TLS_SERVER_CONNECTION: TGType;
function G_TLS_SERVER_CONNECTION(obj: Pointer): PGTlsServerConnection;
function G_IS_TLS_SERVER_CONNECTION(obj: Pointer): Tgboolean;
function G_TLS_SERVER_CONNECTION_GET_INTERFACE(obj: Pointer): PGTlsServerConnectionInterface;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_TYPE_TLS_SERVER_CONNECTION: TGType;
begin
  G_TYPE_TLS_SERVER_CONNECTION := g_tls_server_connection_get_type;
end;

function G_TLS_SERVER_CONNECTION(obj: Pointer): PGTlsServerConnection;
begin
  Result := PGTlsServerConnection(g_type_check_instance_cast(obj, G_TYPE_TLS_SERVER_CONNECTION));
end;

function G_IS_TLS_SERVER_CONNECTION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_TLS_SERVER_CONNECTION);
end;

function G_TLS_SERVER_CONNECTION_GET_INTERFACE(obj: Pointer): PGTlsServerConnectionInterface;
begin
  Result := g_type_interface_peek(obj, G_TYPE_TLS_SERVER_CONNECTION);
end;



{$ENDIF read_implementation}
