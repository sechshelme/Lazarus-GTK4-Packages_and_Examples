unit gdbuserror;

interface

uses
  common_GLIB, gtypes, gerror, gquark, gtype, giotypes, gobject, gioenums;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function g_dbus_error_quark: TGQuark; cdecl; external libgio2;
function g_dbus_error_is_remote_error(error: PGError): Tgboolean; cdecl; external libgio2;
function g_dbus_error_get_remote_error(error: PGError): Pgchar; cdecl; external libgio2;
function g_dbus_error_strip_remote_error(error: PGError): Tgboolean; cdecl; external libgio2;

type
  TGDBusErrorEntry = record
    error_code: Tgint;
    dbus_error_name: Pgchar;
  end;
  PGDBusErrorEntry = ^TGDBusErrorEntry;


function g_dbus_error_register_error(error_domain: TGQuark; error_code: Tgint; dbus_error_name: Pgchar): Tgboolean; cdecl; external libgio2;
function g_dbus_error_unregister_error(error_domain: TGQuark; error_code: Tgint; dbus_error_name: Pgchar): Tgboolean; cdecl; external libgio2;
procedure g_dbus_error_register_error_domain(error_domain_quark_name: Pgchar; quark_volatile: Pgsize; entries: PGDBusErrorEntry; num_entries: Tguint); cdecl; external libgio2;
function g_dbus_error_new_for_dbus_error(dbus_error_name: Pgchar; dbus_error_message: Pgchar): PGError; cdecl; external libgio2;
procedure g_dbus_error_set_dbus_error(error: PPGError; dbus_error_name: Pgchar; dbus_error_message: Pgchar; format: Pgchar; args: array of const); cdecl; external libgio2;
procedure g_dbus_error_set_dbus_error(error: PPGError; dbus_error_name: Pgchar; dbus_error_message: Pgchar; format: Pgchar); cdecl; external libgio2;
procedure g_dbus_error_set_dbus_error_valist(error: PPGError; dbus_error_name: Pgchar; dbus_error_message: Pgchar; format: Pgchar; var_args: Tva_list); cdecl; external libgio2;
function g_dbus_error_encode_gerror(error: PGError): Pgchar; cdecl; external libgio2;

function G_DBUS_ERROR: TGQuark;


// === Konventiert am: 20-8-24 18:12:22 ===


implementation


function G_DBUS_ERROR: TGQuark;
begin
  G_DBUS_ERROR := g_dbus_error_quark;
end;


end.
