unit gtlsinteraction;

interface

uses
  common_GLIB, gtypes, gerror, gtype, giotypes, gobject, gioenums, gtlsconnection, gtlspassword;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGTlsInteractionClass = record
    parent_class: TGObjectClass;
    ask_password: function(interaction: PGTlsInteraction; password: PGTlsPassword; cancellable: PGCancellable; error: PPGError): TGTlsInteractionResult; cdecl;
    ask_password_async: procedure(interaction: PGTlsInteraction; password: PGTlsPassword; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl;
    ask_password_finish: function(interaction: PGTlsInteraction; Result: PGAsyncResult; error: PPGError): TGTlsInteractionResult; cdecl;
    request_certificate: function(interaction: PGTlsInteraction; connection: PGTlsConnection; flags: TGTlsCertificateRequestFlags; cancellable: PGCancellable; error: PPGError): TGTlsInteractionResult; cdecl;
    request_certificate_async: procedure(interaction: PGTlsInteraction; connection: PGTlsConnection; flags: TGTlsCertificateRequestFlags; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
      user_data: Tgpointer); cdecl;
    request_certificate_finish: function(interaction: PGTlsInteraction; Result: PGAsyncResult; error: PPGError): TGTlsInteractionResult; cdecl;
    padding: array[0..20] of Tgpointer;
  end;
  PGTlsInteractionClass = ^TGTlsInteractionClass;


function g_tls_interaction_get_type: TGType; cdecl; external libgio2;
function g_tls_interaction_invoke_ask_password(interaction: PGTlsInteraction; password: PGTlsPassword; cancellable: PGCancellable; error: PPGError): TGTlsInteractionResult; cdecl; external libgio2;
function g_tls_interaction_ask_password(interaction: PGTlsInteraction; password: PGTlsPassword; cancellable: PGCancellable; error: PPGError): TGTlsInteractionResult; cdecl; external libgio2;
procedure g_tls_interaction_ask_password_async(interaction: PGTlsInteraction; password: PGTlsPassword; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_tls_interaction_ask_password_finish(interaction: PGTlsInteraction; Result: PGAsyncResult; error: PPGError): TGTlsInteractionResult; cdecl; external libgio2;
function g_tls_interaction_invoke_request_certificate(interaction: PGTlsInteraction; connection: PGTlsConnection; flags: TGTlsCertificateRequestFlags; cancellable: PGCancellable; error: PPGError): TGTlsInteractionResult; cdecl; external libgio2;
function g_tls_interaction_request_certificate(interaction: PGTlsInteraction; connection: PGTlsConnection; flags: TGTlsCertificateRequestFlags; cancellable: PGCancellable; error: PPGError): TGTlsInteractionResult; cdecl; external libgio2;
procedure g_tls_interaction_request_certificate_async(interaction: PGTlsInteraction; connection: PGTlsConnection; flags: TGTlsCertificateRequestFlags; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
  user_data: Tgpointer); cdecl; external libgio2;
function g_tls_interaction_request_certificate_finish(interaction: PGTlsInteraction; Result: PGAsyncResult; error: PPGError): TGTlsInteractionResult; cdecl; external libgio2;

// === Konventiert am: 18-8-24 17:50:04 ===

function G_TYPE_TLS_INTERACTION: TGType;
function G_TLS_INTERACTION(obj: Pointer): PGTlsInteraction;
function G_TLS_INTERACTION_CLASS(klass: Pointer): PGTlsInteractionClass;
function G_IS_TLS_INTERACTION(obj: Pointer): Tgboolean;
function G_IS_TLS_INTERACTION_CLASS(klass: Pointer): Tgboolean;
function G_TLS_INTERACTION_GET_CLASS(obj: Pointer): PGTlsInteractionClass;

implementation

function G_TYPE_TLS_INTERACTION: TGType;
begin
  G_TYPE_TLS_INTERACTION := g_tls_interaction_get_type;
end;

function G_TLS_INTERACTION(obj: Pointer): PGTlsInteraction;
begin
  Result := PGTlsInteraction(g_type_check_instance_cast(obj, G_TYPE_TLS_INTERACTION));
end;

function G_TLS_INTERACTION_CLASS(klass: Pointer): PGTlsInteractionClass;
begin
  Result := PGTlsInteractionClass(g_type_check_class_cast(klass, G_TYPE_TLS_INTERACTION));
end;

function G_IS_TLS_INTERACTION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_TLS_INTERACTION);
end;

function G_IS_TLS_INTERACTION_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_TLS_INTERACTION);
end;

function G_TLS_INTERACTION_GET_CLASS(obj: Pointer): PGTlsInteractionClass;
begin
  Result := PGTlsInteractionClass(PGTypeInstance(obj)^.g_class);
end;



end.
