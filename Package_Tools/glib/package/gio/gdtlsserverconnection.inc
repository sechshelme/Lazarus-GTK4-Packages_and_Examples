/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGDtlsServerConnection = record
  end;
  PGDtlsServerConnection = ^TGDtlsServerConnection;

  TGDtlsServerConnectionInterface = record
    g_iface: TGTypeInterface;
  end;
  PGDtlsServerConnectionInterface = ^TGDtlsServerConnectionInterface;

function g_dtls_server_connection_get_type: TGType; cdecl; external libgio2;
function g_dtls_server_connection_new(base_socket: PGDatagramBased; certificate: PGTlsCertificate; error: PPGError): PGDatagramBased; cdecl; external libgio2;

// === Konventiert am: 21-8-24 15:52:07 ===

function G_TYPE_DTLS_SERVER_CONNECTION: TGType;
function G_DTLS_SERVER_CONNECTION(obj: Pointer): PGDtlsServerConnection;
function G_IS_DTLS_SERVER_CONNECTION(obj: Pointer): Tgboolean;
function G_DTLS_SERVER_CONNECTION_GET_INTERFACE(obj: Pointer): PGDtlsServerConnectionInterface;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_TYPE_DTLS_SERVER_CONNECTION: TGType;
begin
  G_TYPE_DTLS_SERVER_CONNECTION := g_dtls_server_connection_get_type;
end;

function G_DTLS_SERVER_CONNECTION(obj: Pointer): PGDtlsServerConnection;
begin
  Result := PGDtlsServerConnection(g_type_check_instance_cast(obj, G_TYPE_DTLS_SERVER_CONNECTION));
end;

function G_IS_DTLS_SERVER_CONNECTION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_DTLS_SERVER_CONNECTION);
end;

function G_DTLS_SERVER_CONNECTION_GET_INTERFACE(obj: Pointer): PGDtlsServerConnectionInterface;
begin
  Result := g_type_interface_peek(obj, G_TYPE_DTLS_SERVER_CONNECTION);
end;



{$ENDIF read_implementation}
