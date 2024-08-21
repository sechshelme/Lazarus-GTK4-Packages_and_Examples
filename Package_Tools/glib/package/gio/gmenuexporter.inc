/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}



const
  G_MENU_EXPORTER_MAX_SECTION_SIZE = 1000;

function g_dbus_connection_export_menu_model(connection: PGDBusConnection; object_path: Pgchar; menu: PGMenuModel; error: PPGError): Tguint; cdecl; external libgio2;
procedure g_dbus_connection_unexport_menu_model(connection: PGDBusConnection; export_id: Tguint); cdecl; external libgio2;

// === Konventiert am: 21-8-24 16:23:13 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
