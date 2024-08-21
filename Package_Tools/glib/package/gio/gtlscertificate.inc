/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGTlsCertificatePrivate = record
  end;
  PGTlsCertificatePrivate = ^TGTlsCertificatePrivate;

  TGTlsCertificate = record
    parent_instance: TGObject;
    priv: PGTlsCertificatePrivate;
  end;
  PGTlsCertificate = ^TGTlsCertificate;

  TGTlsCertificateClass = record
    parent_class: TGObjectClass;
    verify: function(cert: PGTlsCertificate; identity: PGSocketConnectable; trusted_ca: PGTlsCertificate): TGTlsCertificateFlags; cdecl;
    padding: array[0..7] of Tgpointer;
  end;
  PGTlsCertificateClass = ^TGTlsCertificateClass;


function g_tls_certificate_get_type: TGType; cdecl; external libgio2;
function g_tls_certificate_new_from_pem(Data: Pgchar; length: Tgssize; error: PPGError): PGTlsCertificate; cdecl; external libgio2;
function g_tls_certificate_new_from_pkcs12(Data: Pguint8; length: Tgsize; password: Pgchar; error: PPGError): PGTlsCertificate; cdecl; external libgio2;
function g_tls_certificate_new_from_file_with_password(_file: Pgchar; password: Pgchar; error: PPGError): PGTlsCertificate; cdecl; external libgio2;
function g_tls_certificate_new_from_file(_file: Pgchar; error: PPGError): PGTlsCertificate; cdecl; external libgio2;
function g_tls_certificate_new_from_files(cert_file: Pgchar; key_file: Pgchar; error: PPGError): PGTlsCertificate; cdecl; external libgio2;
function g_tls_certificate_new_from_pkcs11_uris(pkcs11_uri: Pgchar; private_key_pkcs11_uri: Pgchar; error: PPGError): PGTlsCertificate; cdecl; external libgio2;
function g_tls_certificate_list_new_from_file(_file: Pgchar; error: PPGError): PGList; cdecl; external libgio2;
function g_tls_certificate_get_issuer(cert: PGTlsCertificate): PGTlsCertificate; cdecl; external libgio2;
function g_tls_certificate_verify(cert: PGTlsCertificate; identity: PGSocketConnectable; trusted_ca: PGTlsCertificate): TGTlsCertificateFlags; cdecl; external libgio2;
function g_tls_certificate_is_same(cert_one: PGTlsCertificate; cert_two: PGTlsCertificate): Tgboolean; cdecl; external libgio2;
function g_tls_certificate_get_not_valid_before(cert: PGTlsCertificate): PGDateTime; cdecl; external libgio2;
function g_tls_certificate_get_not_valid_after(cert: PGTlsCertificate): PGDateTime; cdecl; external libgio2;
function g_tls_certificate_get_subject_name(cert: PGTlsCertificate): Pgchar; cdecl; external libgio2;
function g_tls_certificate_get_issuer_name(cert: PGTlsCertificate): Pgchar; cdecl; external libgio2;
function g_tls_certificate_get_dns_names(cert: PGTlsCertificate): PGPtrArray; cdecl; external libgio2;
function g_tls_certificate_get_ip_addresses(cert: PGTlsCertificate): PGPtrArray; cdecl; external libgio2;

// === Konventiert am: 18-8-24 17:43:54 ===

function G_TYPE_TLS_CERTIFICATE: TGType;
function G_TLS_CERTIFICATE(obj: Pointer): PGTlsCertificate;
function G_TLS_CERTIFICATE_CLASS(klass: Pointer): PGTlsCertificateClass;
function G_IS_TLS_CERTIFICATE(obj: Pointer): Tgboolean;
function G_IS_TLS_CERTIFICATE_CLASS(klass: Pointer): Tgboolean;
function G_TLS_CERTIFICATE_GET_CLASS(obj: Pointer): PGTlsCertificateClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_TYPE_TLS_CERTIFICATE: TGType;
begin
  G_TYPE_TLS_CERTIFICATE := g_tls_certificate_get_type;
end;

function G_TLS_CERTIFICATE(obj: Pointer): PGTlsCertificate;
begin
  Result := PGTlsCertificate(g_type_check_instance_cast(obj, G_TYPE_TLS_CERTIFICATE));
end;

function G_TLS_CERTIFICATE_CLASS(klass: Pointer): PGTlsCertificateClass;
begin
  Result := PGTlsCertificateClass(g_type_check_class_cast(klass, G_TYPE_TLS_CERTIFICATE));
end;

function G_IS_TLS_CERTIFICATE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_TLS_CERTIFICATE);
end;

function G_IS_TLS_CERTIFICATE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_TLS_CERTIFICATE);
end;

function G_TLS_CERTIFICATE_GET_CLASS(obj: Pointer): PGTlsCertificateClass;
begin
  Result := PGTlsCertificateClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
