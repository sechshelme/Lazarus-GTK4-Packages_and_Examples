unit gcredentials;

interface

uses
  common_GLIB, gtypes, gerror, gtype, giotypes, gobject, gioenums;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TGCredentialsClass = record
  end;
  PGCredentialsClass = ^TGCredentialsClass;

function g_credentials_get_type: TGType; cdecl; external libgio2;
function g_credentials_new: PGCredentials; cdecl; external libgio2;
function g_credentials_to_string(credentials: PGCredentials): Pgchar; cdecl; external libgio2;
function g_credentials_get_native(credentials: PGCredentials; native_type: TGCredentialsType): Tgpointer; cdecl; external libgio2;
procedure g_credentials_set_native(credentials: PGCredentials; native_type: TGCredentialsType; native: Tgpointer); cdecl; external libgio2;
function g_credentials_is_same_user(credentials: PGCredentials; other_credentials: PGCredentials; error: PPGError): Tgboolean; cdecl; external libgio2;
{$ifdef Linux}
function g_credentials_get_unix_pid(credentials: PGCredentials; error: PPGError): Tpid_t; cdecl; external libgio2;
function g_credentials_get_unix_user(credentials: PGCredentials; error: PPGError): Tuid_t; cdecl; external libgio2;
function g_credentials_set_unix_user(credentials: PGCredentials; uid: Tuid_t; error: PPGError): Tgboolean; cdecl; external libgio2;
{$endif}

// === Konventiert am: 21-8-24 13:42:39 ===

function G_TYPE_CREDENTIALS: TGType;
function G_CREDENTIALS(obj: Pointer): PGCredentials;
function G_CREDENTIALS_CLASS(klass: Pointer): PGCredentialsClass;
function G_IS_CREDENTIALS(obj: Pointer): Tgboolean;
function G_IS_CREDENTIALS_CLASS(klass: Pointer): Tgboolean;
function G_CREDENTIALS_GET_CLASS(obj: Pointer): PGCredentialsClass;

implementation

function G_TYPE_CREDENTIALS: TGType;
begin
  G_TYPE_CREDENTIALS := g_credentials_get_type;
end;

function G_CREDENTIALS(obj: Pointer): PGCredentials;
begin
  Result := PGCredentials(g_type_check_instance_cast(obj, G_TYPE_CREDENTIALS));
end;

function G_CREDENTIALS_CLASS(klass: Pointer): PGCredentialsClass;
begin
  Result := PGCredentialsClass(g_type_check_class_cast(klass, G_TYPE_CREDENTIALS));
end;

function G_IS_CREDENTIALS(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_CREDENTIALS);
end;

function G_IS_CREDENTIALS_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_CREDENTIALS);
end;

function G_CREDENTIALS_GET_CLASS(obj: Pointer): PGCredentialsClass;
begin
  Result := PGCredentialsClass(PGTypeInstance(obj)^.g_class);
end;



end.
