/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGTestDBus = record
  end;
  PGTestDBus = ^TGTestDBus;

function g_test_dbus_get_type: TGType; cdecl; external libgio2;
function g_test_dbus_new(flags: TGTestDBusFlags): PGTestDBus; cdecl; external libgio2;
function g_test_dbus_get_flags(self: PGTestDBus): TGTestDBusFlags; cdecl; external libgio2;
function g_test_dbus_get_bus_address(self: PGTestDBus): Pgchar; cdecl; external libgio2;
procedure g_test_dbus_add_service_dir(self: PGTestDBus; path: Pgchar); cdecl; external libgio2;
procedure g_test_dbus_up(self: PGTestDBus); cdecl; external libgio2;
procedure g_test_dbus_stop(self: PGTestDBus); cdecl; external libgio2;
procedure g_test_dbus_down(self: PGTestDBus); cdecl; external libgio2;
procedure g_test_dbus_unset; cdecl; external libgio2;

// === Konventiert am: 21-8-24 15:43:21 ===

function G_TYPE_TEST_DBUS: TGType;
function G_TEST_DBUS(obj: Pointer): PGTestDBus;
function G_IS_TEST_DBUS(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_TYPE_TEST_DBUS: TGType;
begin
  G_TYPE_TEST_DBUS := g_test_dbus_get_type;
end;

function G_TEST_DBUS(obj: Pointer): PGTestDBus;
begin
  Result := PGTestDBus(g_type_check_instance_cast(obj, G_TYPE_TEST_DBUS));
end;

function G_IS_TEST_DBUS(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_TEST_DBUS);
end;



{$ENDIF read_implementation}
