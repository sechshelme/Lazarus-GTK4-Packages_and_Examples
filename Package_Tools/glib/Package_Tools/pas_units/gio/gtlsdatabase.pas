unit gtlsdatabase;

interface

uses
  common_GLIB, gtypes, gtype, gerror, glist, garray, giotypes, gobject, gioenums, gtlscertificate;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

const
  G_TLS_DATABASE_PURPOSE_AUTHENTICATE_SERVER = '1.3.6.1.5.5.7.3.1';
  G_TLS_DATABASE_PURPOSE_AUTHENTICATE_CLIENT = '1.3.6.1.5.5.7.3.2';

type
  PGTlsDatabaseClass = ^TGTlsDatabaseClass;

  TGTlsDatabaseClass = record
    parent_class: TGObjectClass;
    verify_chain: function(self: PGTlsDatabase; chain: PGTlsCertificate; purpose: Pgchar; identity: PGSocketConnectable; interaction: PGTlsInteraction;
      flags: TGTlsDatabaseVerifyFlags; cancellable: PGCancellable; error: PPGError): TGTlsCertificateFlags; cdecl;
    verify_chain_async: procedure(self: PGTlsDatabase; chain: PGTlsCertificate; purpose: Pgchar; identity: PGSocketConnectable; interaction: PGTlsInteraction;
      flags: TGTlsDatabaseVerifyFlags; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl;
    verify_chain_finish: function(self: PGTlsDatabase; Result: PGAsyncResult; error: PPGError): TGTlsCertificateFlags; cdecl;
    create_certificate_handle: function(self: PGTlsDatabase; certificate: PGTlsCertificate): Pgchar; cdecl;
    lookup_certificate_for_handle: function(self: PGTlsDatabase; handle: Pgchar; interaction: PGTlsInteraction; flags: TGTlsDatabaseLookupFlags; cancellable: PGCancellable;
      error: PPGError): PGTlsCertificate; cdecl;
    lookup_certificate_for_handle_async: procedure(self: PGTlsDatabase; handle: Pgchar; interaction: PGTlsInteraction; flags: TGTlsDatabaseLookupFlags; cancellable: PGCancellable;
      callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl;
    lookup_certificate_for_handle_finish: function(self: PGTlsDatabase; Result: PGAsyncResult; error: PPGError): PGTlsCertificate; cdecl;
    lookup_certificate_issuer: function(self: PGTlsDatabase; certificate: PGTlsCertificate; interaction: PGTlsInteraction; flags: TGTlsDatabaseLookupFlags; cancellable: PGCancellable;
      error: PPGError): PGTlsCertificate; cdecl;
    lookup_certificate_issuer_async: procedure(self: PGTlsDatabase; certificate: PGTlsCertificate; interaction: PGTlsInteraction; flags: TGTlsDatabaseLookupFlags; cancellable: PGCancellable;
      callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl;
    lookup_certificate_issuer_finish: function(self: PGTlsDatabase; Result: PGAsyncResult; error: PPGError): PGTlsCertificate; cdecl;
    lookup_certificates_issued_by: function(self: PGTlsDatabase; issuer_raw_dn: PGByteArray; interaction: PGTlsInteraction; flags: TGTlsDatabaseLookupFlags; cancellable: PGCancellable;
      error: PPGError): PGList; cdecl;
    lookup_certificates_issued_by_async: procedure(self: PGTlsDatabase; issuer_raw_dn: PGByteArray; interaction: PGTlsInteraction; flags: TGTlsDatabaseLookupFlags; cancellable: PGCancellable;
      callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl;
    lookup_certificates_issued_by_finish: function(self: PGTlsDatabase; Result: PGAsyncResult; error: PPGError): PGList; cdecl;
    padding: array[0..15] of Tgpointer;
  end;


function g_tls_database_get_type: TGType; cdecl; external libgio2;
function g_tls_database_verify_chain(self: PGTlsDatabase; chain: PGTlsCertificate; purpose: Pgchar; identity: PGSocketConnectable; interaction: PGTlsInteraction;
  flags: TGTlsDatabaseVerifyFlags; cancellable: PGCancellable; error: PPGError): TGTlsCertificateFlags; cdecl; external libgio2;
procedure g_tls_database_verify_chain_async(self: PGTlsDatabase; chain: PGTlsCertificate; purpose: Pgchar; identity: PGSocketConnectable; interaction: PGTlsInteraction;
  flags: TGTlsDatabaseVerifyFlags; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_tls_database_verify_chain_finish(self: PGTlsDatabase; Result: PGAsyncResult; error: PPGError): TGTlsCertificateFlags; cdecl; external libgio2;
function g_tls_database_create_certificate_handle(self: PGTlsDatabase; certificate: PGTlsCertificate): Pgchar; cdecl; external libgio2;
function g_tls_database_lookup_certificate_for_handle(self: PGTlsDatabase; handle: Pgchar; interaction: PGTlsInteraction; flags: TGTlsDatabaseLookupFlags; cancellable: PGCancellable;
  error: PPGError): PGTlsCertificate; cdecl; external libgio2;
procedure g_tls_database_lookup_certificate_for_handle_async(self: PGTlsDatabase; handle: Pgchar; interaction: PGTlsInteraction; flags: TGTlsDatabaseLookupFlags; cancellable: PGCancellable;
  callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_tls_database_lookup_certificate_for_handle_finish(self: PGTlsDatabase; Result: PGAsyncResult; error: PPGError): PGTlsCertificate; cdecl; external libgio2;
function g_tls_database_lookup_certificate_issuer(self: PGTlsDatabase; certificate: PGTlsCertificate; interaction: PGTlsInteraction; flags: TGTlsDatabaseLookupFlags; cancellable: PGCancellable;
  error: PPGError): PGTlsCertificate; cdecl; external libgio2;
procedure g_tls_database_lookup_certificate_issuer_async(self: PGTlsDatabase; certificate: PGTlsCertificate; interaction: PGTlsInteraction; flags: TGTlsDatabaseLookupFlags; cancellable: PGCancellable;
  callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_tls_database_lookup_certificate_issuer_finish(self: PGTlsDatabase; Result: PGAsyncResult; error: PPGError): PGTlsCertificate; cdecl; external libgio2;
function g_tls_database_lookup_certificates_issued_by(self: PGTlsDatabase; issuer_raw_dn: PGByteArray; interaction: PGTlsInteraction; flags: TGTlsDatabaseLookupFlags; cancellable: PGCancellable;
  error: PPGError): PGList; cdecl; external libgio2;
procedure g_tls_database_lookup_certificates_issued_by_async(self: PGTlsDatabase; issuer_raw_dn: PGByteArray; interaction: PGTlsInteraction; flags: TGTlsDatabaseLookupFlags; cancellable: PGCancellable;
  callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_tls_database_lookup_certificates_issued_by_finish(self: PGTlsDatabase; Result: PGAsyncResult; error: PPGError): PGList; cdecl; external libgio2;

// === Konventiert am: 18-8-24 17:41:23 ===

function G_TYPE_TLS_DATABASE: TGType;
function G_TLS_DATABASE(obj: Pointer): PGTlsDatabase;
function G_TLS_DATABASE_CLASS(klass: Pointer): PGTlsDatabaseClass;
function G_IS_TLS_DATABASE(obj: Pointer): Tgboolean;
function G_IS_TLS_DATABASE_CLASS(klass: Pointer): Tgboolean;
function G_TLS_DATABASE_GET_CLASS(obj: Pointer): PGTlsDatabaseClass;

implementation

function G_TYPE_TLS_DATABASE: TGType;
begin
  G_TYPE_TLS_DATABASE := g_tls_database_get_type;
end;

function G_TLS_DATABASE(obj: Pointer): PGTlsDatabase;
begin
  Result := PGTlsDatabase(g_type_check_instance_cast(obj, G_TYPE_TLS_DATABASE));
end;

function G_TLS_DATABASE_CLASS(klass: Pointer): PGTlsDatabaseClass;
begin
  Result := PGTlsDatabaseClass(g_type_check_class_cast(klass, G_TYPE_TLS_DATABASE));
end;

function G_IS_TLS_DATABASE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_TLS_DATABASE);
end;

function G_IS_TLS_DATABASE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_TLS_DATABASE);
end;

function G_TLS_DATABASE_GET_CLASS(obj: Pointer): PGTlsDatabaseClass;
begin
  Result := PGTlsDatabaseClass(PGTypeInstance(obj)^.g_class);
end;



end.
