/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGBusAcquiredCallback = procedure(connection: PGDBusConnection; Name: Pgchar; user_data: Tgpointer); cdecl;
  TGBusNameAcquiredCallback = procedure(connection: PGDBusConnection; Name: Pgchar; user_data: Tgpointer); cdecl;
  TGBusNameLostCallback = procedure(connection: PGDBusConnection; Name: Pgchar; user_data: Tgpointer); cdecl;

function g_bus_own_name(bus_type: TGBusType; Name: Pgchar; flags: TGBusNameOwnerFlags; bus_acquired_handler: TGBusAcquiredCallback; name_acquired_handler: TGBusNameAcquiredCallback;
  name_lost_handler: TGBusNameLostCallback; user_data: Tgpointer; user_data_free_func: TGDestroyNotify): Tguint; cdecl; external libgio2;
function g_bus_own_name_on_connection(connection: PGDBusConnection; Name: Pgchar; flags: TGBusNameOwnerFlags; name_acquired_handler: TGBusNameAcquiredCallback; name_lost_handler: TGBusNameLostCallback;
  user_data: Tgpointer; user_data_free_func: TGDestroyNotify): Tguint; cdecl; external libgio2;
function g_bus_own_name_with_closures(bus_type: TGBusType; Name: Pgchar; flags: TGBusNameOwnerFlags; bus_acquired_closure: PGClosure; name_acquired_closure: PGClosure;
  name_lost_closure: PGClosure): Tguint; cdecl; external libgio2;
function g_bus_own_name_on_connection_with_closures(connection: PGDBusConnection; Name: Pgchar; flags: TGBusNameOwnerFlags; name_acquired_closure: PGClosure; name_lost_closure: PGClosure): Tguint; cdecl; external libgio2;
procedure g_bus_unown_name(owner_id: Tguint); cdecl; external libgio2;

// === Konventiert am: 20-8-24 17:27:09 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
