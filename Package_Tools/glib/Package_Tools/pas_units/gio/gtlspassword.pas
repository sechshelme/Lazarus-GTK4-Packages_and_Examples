unit gtlspassword;

interface

uses
  common_GLIB, gtypes, gtype, gobject, gioenums;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGTlsPasswordPrivate = record
  end;
  PGTlsPasswordPrivate = ^TGTlsPasswordPrivate;

  TGTlsPassword = record
    parent_instance: TGObject;
    priv: PGTlsPasswordPrivate;
  end;
  PGTlsPassword = ^TGTlsPassword;

  TGTlsPasswordClass = record
    parent_class: TGObjectClass;
    get_value: function(password: PGTlsPassword; length: Pgsize): Pguchar; cdecl;
    set_value: procedure(password: PGTlsPassword; Value: Pguchar; length: Tgssize; Destroy: TGDestroyNotify); cdecl;
    get_default_warning: function(password: PGTlsPassword): Pgchar; cdecl;
    padding: array[0..3] of Tgpointer;
  end;
  PGTlsPasswordClass = ^TGTlsPasswordClass;


function g_tls_password_get_type: TGType; cdecl; external libgio2;
function g_tls_password_new(flags: TGTlsPasswordFlags; description: Pgchar): PGTlsPassword; cdecl; external libgio2;
function g_tls_password_get_value(password: PGTlsPassword; length: Pgsize): Pguchar; cdecl; external libgio2;
procedure g_tls_password_set_value(password: PGTlsPassword; Value: Pguchar; length: Tgssize); cdecl; external libgio2;
procedure g_tls_password_set_value_full(password: PGTlsPassword; Value: Pguchar; length: Tgssize; Destroy: TGDestroyNotify); cdecl; external libgio2;
function g_tls_password_get_flags(password: PGTlsPassword): TGTlsPasswordFlags; cdecl; external libgio2;
procedure g_tls_password_set_flags(password: PGTlsPassword; flags: TGTlsPasswordFlags); cdecl; external libgio2;
function g_tls_password_get_description(password: PGTlsPassword): Pgchar; cdecl; external libgio2;
procedure g_tls_password_set_description(password: PGTlsPassword; description: Pgchar); cdecl; external libgio2;
function g_tls_password_get_warning(password: PGTlsPassword): Pgchar; cdecl; external libgio2;
procedure g_tls_password_set_warning(password: PGTlsPassword; warning: Pgchar); cdecl; external libgio2;

// === Konventiert am: 18-8-24 17:52:08 ===

function G_TYPE_TLS_PASSWORD: TGType;
function G_TLS_PASSWORD(obj: Pointer): PGTlsPassword;
function G_TLS_PASSWORD_CLASS(klass: Pointer): PGTlsPasswordClass;
function G_IS_TLS_PASSWORD(obj: Pointer): Tgboolean;
function G_IS_TLS_PASSWORD_CLASS(klass: Pointer): Tgboolean;
function G_TLS_PASSWORD_GET_CLASS(obj: Pointer): PGTlsPasswordClass;

implementation

function G_TYPE_TLS_PASSWORD: TGType;
begin
  G_TYPE_TLS_PASSWORD := g_tls_password_get_type;
end;

function G_TLS_PASSWORD(obj: Pointer): PGTlsPassword;
begin
  Result := PGTlsPassword(g_type_check_instance_cast(obj, G_TYPE_TLS_PASSWORD));
end;

function G_TLS_PASSWORD_CLASS(klass: Pointer): PGTlsPasswordClass;
begin
  Result := PGTlsPasswordClass(g_type_check_class_cast(klass, G_TYPE_TLS_PASSWORD));
end;

function G_IS_TLS_PASSWORD(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_TLS_PASSWORD);
end;

function G_IS_TLS_PASSWORD_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_TLS_PASSWORD);
end;

function G_TLS_PASSWORD_GET_CLASS(obj: Pointer): PGTlsPasswordClass;
begin
  Result := PGTlsPasswordClass(PGTypeInstance(obj)^.g_class);
end;



end.
