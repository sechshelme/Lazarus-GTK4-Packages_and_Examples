/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGBusNameAppearedCallback = procedure(connection: PGDBusConnection; Name: Pgchar; name_owner: Pgchar; user_data: Tgpointer); cdecl;
  TGBusNameVanishedCallback = procedure(connection: PGDBusConnection; Name: Pgchar; user_data: Tgpointer); cdecl;

function g_bus_watch_name(bus_type: TGBusType; Name: Pgchar; flags: TGBusNameWatcherFlags; name_appeared_handler: TGBusNameAppearedCallback; name_vanished_handler: TGBusNameVanishedCallback;
  user_data: Tgpointer; user_data_free_func: TGDestroyNotify): Tguint; cdecl; external libgio2;
function g_bus_watch_name_on_connection(connection: PGDBusConnection; Name: Pgchar; flags: TGBusNameWatcherFlags; name_appeared_handler: TGBusNameAppearedCallback; name_vanished_handler: TGBusNameVanishedCallback;
  user_data: Tgpointer; user_data_free_func: TGDestroyNotify): Tguint; cdecl; external libgio2;
function g_bus_watch_name_with_closures(bus_type: TGBusType; Name: Pgchar; flags: TGBusNameWatcherFlags; name_appeared_closure: PGClosure; name_vanished_closure: PGClosure): Tguint; cdecl; external libgio2;
function g_bus_watch_name_on_connection_with_closures(connection: PGDBusConnection; Name: Pgchar; flags: TGBusNameWatcherFlags; name_appeared_closure: PGClosure; name_vanished_closure: PGClosure): Tguint; cdecl; external libgio2;
procedure g_bus_unwatch_name(watcher_id: Tguint); cdecl; external libgio2;

// === Konventiert am: 20-8-24 17:50:21 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
