/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGDBusInterfaceSkeletonPrivate = record
  end;
  PGDBusInterfaceSkeletonPrivate = ^TGDBusInterfaceSkeletonPrivate;

  TGDBusInterfaceSkeleton = record
    parent_instance: TGObject;
    priv: PGDBusInterfaceSkeletonPrivate;
  end;
  PGDBusInterfaceSkeleton = ^TGDBusInterfaceSkeleton;

  TGDBusInterfaceSkeletonClass = record
    parent_class: TGObjectClass;
    get_info: function(interface_: PGDBusInterfaceSkeleton): PGDBusInterfaceInfo; cdecl;
    get_vtable: function(interface_: PGDBusInterfaceSkeleton): PGDBusInterfaceVTable; cdecl;
    get_properties: function(interface_: PGDBusInterfaceSkeleton): PGVariant; cdecl;
    flush: procedure(interface_: PGDBusInterfaceSkeleton); cdecl;
    vfunc_padding: array[0..7] of Tgpointer;
    g_authorize_method: function(interface_: PGDBusInterfaceSkeleton; invocation: PGDBusMethodInvocation): Tgboolean; cdecl;
    signal_padding: array[0..7] of Tgpointer;
  end;
  PGDBusInterfaceSkeletonClass = ^TGDBusInterfaceSkeletonClass;


function g_dbus_interface_skeleton_get_type: TGType; cdecl; external libgio2;
function g_dbus_interface_skeleton_get_flags(interface_: PGDBusInterfaceSkeleton): TGDBusInterfaceSkeletonFlags; cdecl; external libgio2;
procedure g_dbus_interface_skeleton_set_flags(interface_: PGDBusInterfaceSkeleton; flags: TGDBusInterfaceSkeletonFlags); cdecl; external libgio2;
function g_dbus_interface_skeleton_get_info(interface_: PGDBusInterfaceSkeleton): PGDBusInterfaceInfo; cdecl; external libgio2;
function g_dbus_interface_skeleton_get_vtable(interface_: PGDBusInterfaceSkeleton): PGDBusInterfaceVTable; cdecl; external libgio2;
function g_dbus_interface_skeleton_get_properties(interface_: PGDBusInterfaceSkeleton): PGVariant; cdecl; external libgio2;
procedure g_dbus_interface_skeleton_flush(interface_: PGDBusInterfaceSkeleton); cdecl; external libgio2;
function g_dbus_interface_skeleton_export(interface_: PGDBusInterfaceSkeleton; connection: PGDBusConnection; object_path: Pgchar; error: PPGError): Tgboolean; cdecl; external libgio2;
procedure g_dbus_interface_skeleton_unexport(interface_: PGDBusInterfaceSkeleton); cdecl; external libgio2;
procedure g_dbus_interface_skeleton_unexport_from_connection(interface_: PGDBusInterfaceSkeleton; connection: PGDBusConnection); cdecl; external libgio2;
function g_dbus_interface_skeleton_get_connection(interface_: PGDBusInterfaceSkeleton): PGDBusConnection; cdecl; external libgio2;
function g_dbus_interface_skeleton_get_connections(interface_: PGDBusInterfaceSkeleton): PGList; cdecl; external libgio2;
function g_dbus_interface_skeleton_has_connection(interface_: PGDBusInterfaceSkeleton; connection: PGDBusConnection): Tgboolean; cdecl; external libgio2;
function g_dbus_interface_skeleton_get_object_path(interface_: PGDBusInterfaceSkeleton): Pgchar; cdecl; external libgio2;

// === Konventiert am: 20-8-24 17:46:15 ===

function G_TYPE_DBUS_INTERFACE_SKELETON: TGType;
function G_DBUS_INTERFACE_SKELETON(obj: Pointer): PGDBusInterfaceSkeleton;
function G_DBUS_INTERFACE_SKELETON_CLASS(klass: Pointer): PGDBusInterfaceSkeletonClass;
function G_IS_DBUS_INTERFACE_SKELETON(obj: Pointer): Tgboolean;
function G_IS_DBUS_INTERFACE_SKELETON_CLASS(klass: Pointer): Tgboolean;
function G_DBUS_INTERFACE_SKELETON_GET_CLASS(obj: Pointer): PGDBusInterfaceSkeletonClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_TYPE_DBUS_INTERFACE_SKELETON: TGType;
begin
  G_TYPE_DBUS_INTERFACE_SKELETON := g_dbus_interface_skeleton_get_type;
end;

function G_DBUS_INTERFACE_SKELETON(obj: Pointer): PGDBusInterfaceSkeleton;
begin
  Result := PGDBusInterfaceSkeleton(g_type_check_instance_cast(obj, G_TYPE_DBUS_INTERFACE_SKELETON));
end;

function G_DBUS_INTERFACE_SKELETON_CLASS(klass: Pointer): PGDBusInterfaceSkeletonClass;
begin
  Result := PGDBusInterfaceSkeletonClass(g_type_check_class_cast(klass, G_TYPE_DBUS_INTERFACE_SKELETON));
end;

function G_IS_DBUS_INTERFACE_SKELETON(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_DBUS_INTERFACE_SKELETON);
end;

function G_IS_DBUS_INTERFACE_SKELETON_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_DBUS_INTERFACE_SKELETON);
end;

function G_DBUS_INTERFACE_SKELETON_GET_CLASS(obj: Pointer): PGDBusInterfaceSkeletonClass;
begin
  Result := PGDBusInterfaceSkeletonClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
