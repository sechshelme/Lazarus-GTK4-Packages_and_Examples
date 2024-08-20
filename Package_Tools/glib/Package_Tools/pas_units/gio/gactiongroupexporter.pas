unit gactiongroupexporter;

interface

uses
  common_GLIB, gtypes, gerror, gtype, giotypes, gobject, gioenums, gactiongroup;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

function g_dbus_connection_export_action_group(connection: PGDBusConnection; object_path: Pgchar; action_group: PGActionGroup; error: PPGError): Tguint; cdecl; external libgio2;
procedure g_dbus_connection_unexport_action_group(connection: PGDBusConnection; export_id: Tguint); cdecl; external libgio2;

// === Konventiert am: 20-8-24 15:49:14 ===


implementation



end.
