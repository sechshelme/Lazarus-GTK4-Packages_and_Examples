unit gdbusutils;

interface

uses
  common_GLIB, gtypes, gerror, gvariant, gvarianttype, gtype, giotypes, gobject, gioenums;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

function g_dbus_is_guid(_string: Pgchar): Tgboolean; cdecl; external libgio2;
function g_dbus_generate_guid: Pgchar; cdecl; external libgio2;
function g_dbus_is_name(_string: Pgchar): Tgboolean; cdecl; external libgio2;
function g_dbus_is_unique_name(_string: Pgchar): Tgboolean; cdecl; external libgio2;
function g_dbus_is_member_name(_string: Pgchar): Tgboolean; cdecl; external libgio2;
function g_dbus_is_interface_name(_string: Pgchar): Tgboolean; cdecl; external libgio2;
function g_dbus_is_error_name(_string: Pgchar): Tgboolean; cdecl; external libgio2;
procedure g_dbus_gvariant_to_gvalue(Value: PGVariant; out_gvalue: PGValue); cdecl; external libgio2;
function g_dbus_gvalue_to_gvariant(gvalue: PGValue; _type: PGVariantType): PGVariant; cdecl; external libgio2;
function g_dbus_escape_object_path_bytestring(bytes: Pguint8): Pgchar; cdecl; external libgio2;
function g_dbus_escape_object_path(s: Pgchar): Pgchar; cdecl; external libgio2;
function g_dbus_unescape_object_path(s: Pgchar): Pguint8; cdecl; external libgio2;

// === Konventiert am: 21-8-24 16:28:36 ===


implementation



end.
