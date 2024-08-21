/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}


  {G_DECLARE_DERIVABLE_TYPE (GDebugControllerDBus, g_debug_controller_dbus, G, DEBUG_CONTROLLER_DBUS, GObject) }
type
  TGDebugControllerDBus = record
    parent_instance: TGObject
  end;
  PGDebugControllerDBus = ^TGDebugControllerDBus;

  TGDebugControllerDBusClass = record
    parent_class: TGObjectClass;
    authorize: function(controller: PGDebugControllerDBus; invocation: PGDBusMethodInvocation): Tgboolean; cdecl;
    padding: array[0..11] of Tgpointer;
  end;
  PGDebugControllerDBusClass = ^TGDebugControllerDBusClass;

function g_debug_controller_dbus_get_type: TGType; cdecl; external libgtk4;
function g_debug_controller_dbus_new(connection: PGDBusConnection; cancellable: PGCancellable; error: PPGError): PGDebugControllerDBus; cdecl; external libgio2;
procedure g_debug_controller_dbus_stop(self: PGDebugControllerDBus); cdecl; external libgio2;

// === Konventiert am: 21-8-24 16:22:29 ===

function G_TYPE_DEBUG_CONTROLLER_DBUS: TGType;
function G_DEBUG_CONTROLLER_DBUS(obj: Pointer): PGDebugControllerDBus;
function G_IS_DEBUG_CONTROLLER_DBUS(obj: Pointer): Tgboolean;
function G_DEBUG_CONTROLLER_DBUS_CLASS(klass: Pointer): PGDebugControllerDBusClass;
function G_IS_DEBUG_CONTROLLER_DBUS_CLASS(klass: Pointer): Tgboolean;
function G_DEBUG_CONTROLLER_DBUS_GET_CLASS(obj: Pointer): PGDebugControllerDBusClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_TYPE_DEBUG_CONTROLLER_DBUS: TGType;
begin
  Result := g_debug_controller_dbus_get_type;
end;

function G_DEBUG_CONTROLLER_DBUS(obj: Pointer): PGDebugControllerDBus;
begin
  Result := PGDebugControllerDBus(g_type_check_instance_cast(obj, G_TYPE_DEBUG_CONTROLLER_DBUS));
end;

function G_IS_DEBUG_CONTROLLER_DBUS(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_DEBUG_CONTROLLER_DBUS);
end;

function G_DEBUG_CONTROLLER_DBUS_CLASS(klass: Pointer): PGDebugControllerDBusClass;
begin
  Result := PGDebugControllerDBusClass(g_type_check_class_cast(klass, G_TYPE_DEBUG_CONTROLLER_DBUS));
end;

function G_IS_DEBUG_CONTROLLER_DBUS_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_DEBUG_CONTROLLER_DBUS);
end;

function G_DEBUG_CONTROLLER_DBUS_GET_CLASS(obj: Pointer): PGDebugControllerDBusClass;
begin
  Result := PGDebugControllerDBusClass(PGTypeInstance(obj)^.g_class);
end;




{$ENDIF read_implementation}
