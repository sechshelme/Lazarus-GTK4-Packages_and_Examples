unit gdbusaddress;

interface

uses
  common_GLIB, gtypes, gerror, gtype, giotypes, gobject, gioenums, giostream;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

function g_dbus_address_escape_value(_string: Pgchar): Pgchar; cdecl; external libgio2;
function g_dbus_is_address(_string: Pgchar): Tgboolean; cdecl; external libgio2;
function g_dbus_is_supported_address(_string: Pgchar; error: PPGError): Tgboolean; cdecl; external libgio2;
procedure g_dbus_address_get_stream(address: Pgchar; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_dbus_address_get_stream_finish(res: PGAsyncResult; out_guid: PPgchar; error: PPGError): PGIOStream; cdecl; external libgio2;
function g_dbus_address_get_stream_sync(address: Pgchar; out_guid: PPgchar; cancellable: PGCancellable; error: PPGError): PGIOStream; cdecl; external libgio2;
function g_dbus_address_get_for_bus_sync(bus_type: TGBusType; cancellable: PGCancellable; error: PPGError): Pgchar; cdecl; external libgio2;

// === Konventiert am: 21-8-24 15:27:38 ===


implementation



end.
