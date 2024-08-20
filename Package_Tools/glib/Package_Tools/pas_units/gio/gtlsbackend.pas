unit gtlsbackend;

interface

uses
  common_GLIB, gtypes, gtype, giotypes, gobject, gioenums;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

const
  G_TLS_BACKEND_EXTENSION_POINT_NAME = 'gio-tls-backend';

type
  TGTlsBackend = record
  end;
  PGTlsBackend = ^TGTlsBackend;

  TGTlsBackendInterface = record
    g_iface: TGTypeInterface;
    supports_tls: function(backend: PGTlsBackend): Tgboolean; cdecl;
    get_certificate_type: function: TGType; cdecl;
    get_client_connection_type: function: TGType; cdecl;
    get_server_connection_type: function: TGType; cdecl;
    get_file_database_type: function: TGType; cdecl;
    get_default_database: function(backend: PGTlsBackend): PGTlsDatabase; cdecl;
    supports_dtls: function(backend: PGTlsBackend): Tgboolean; cdecl;
    get_dtls_client_connection_type: function: TGType; cdecl;
    get_dtls_server_connection_type: function: TGType; cdecl;
  end;
  PGTlsBackendInterface = ^TGTlsBackendInterface;

function g_tls_backend_get_type: TGType; cdecl; external libgio2;
function g_tls_backend_get_default: PGTlsBackend; cdecl; external libgio2;
function g_tls_backend_get_default_database(backend: PGTlsBackend): PGTlsDatabase; cdecl; external libgio2;
procedure g_tls_backend_set_default_database(backend: PGTlsBackend; database: PGTlsDatabase); cdecl; external libgio2;
function g_tls_backend_supports_tls(backend: PGTlsBackend): Tgboolean; cdecl; external libgio2;
function g_tls_backend_supports_dtls(backend: PGTlsBackend): Tgboolean; cdecl; external libgio2;
function g_tls_backend_get_certificate_type(backend: PGTlsBackend): TGType; cdecl; external libgio2;
function g_tls_backend_get_client_connection_type(backend: PGTlsBackend): TGType; cdecl; external libgio2;
function g_tls_backend_get_server_connection_type(backend: PGTlsBackend): TGType; cdecl; external libgio2;
function g_tls_backend_get_file_database_type(backend: PGTlsBackend): TGType; cdecl; external libgio2;
function g_tls_backend_get_dtls_client_connection_type(backend: PGTlsBackend): TGType; cdecl; external libgio2;
function g_tls_backend_get_dtls_server_connection_type(backend: PGTlsBackend): TGType; cdecl; external libgio2;

// === Konventiert am: 20-8-24 18:02:43 ===

function G_TYPE_TLS_BACKEND: TGType;
function G_TLS_BACKEND(obj: Pointer): PGTlsBackend;
function G_IS_TLS_BACKEND(obj: Pointer): Tgboolean;
function G_TLS_BACKEND_GET_INTERFACE(obj: Pointer): PGTlsBackendInterface;

implementation

function G_TYPE_TLS_BACKEND: TGType;
begin
  G_TYPE_TLS_BACKEND := g_tls_backend_get_type;
end;

function G_TLS_BACKEND(obj: Pointer): PGTlsBackend;
begin
  Result := PGTlsBackend(g_type_check_instance_cast(obj, G_TYPE_TLS_BACKEND));
end;

function G_IS_TLS_BACKEND(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_TLS_BACKEND);
end;

function G_TLS_BACKEND_GET_INTERFACE(obj: Pointer): PGTlsBackendInterface;
begin
  Result := g_type_interface_peek(obj, G_TYPE_TLS_BACKEND);
end;



end.
