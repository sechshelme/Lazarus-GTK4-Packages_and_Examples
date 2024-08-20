unit gdbusobjectskeleton;

interface

uses
  common_GLIB, gtypes, gtype, giotypes, gobject, gioenums, gdbusinterfaceskeleton;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGDBusObjectSkeletonPrivate = record
  end;
  PGDBusObjectSkeletonPrivate = ^TGDBusObjectSkeletonPrivate;

  TGDBusObjectSkeleton = record
    parent_instance: TGObject;
    priv: PGDBusObjectSkeletonPrivate;
  end;
  PGDBusObjectSkeleton = ^TGDBusObjectSkeleton;

  TGDBusObjectSkeletonClass = record
    parent_class: TGObjectClass;
    authorize_method: function(obj: PGDBusObjectSkeleton; interface_: PGDBusInterfaceSkeleton; invocation: PGDBusMethodInvocation): Tgboolean; cdecl;
    padding: array[0..7] of Tgpointer;
  end;
  PGDBusObjectSkeletonClass = ^TGDBusObjectSkeletonClass;


function g_dbus_object_skeleton_get_type: TGType; cdecl; external libgio2;
function g_dbus_object_skeleton_new(object_path: Pgchar): PGDBusObjectSkeleton; cdecl; external libgio2;
procedure g_dbus_object_skeleton_flush(obj: PGDBusObjectSkeleton); cdecl; external libgio2;
procedure g_dbus_object_skeleton_add_interface(obj: PGDBusObjectSkeleton; interface_: PGDBusInterfaceSkeleton); cdecl; external libgio2;
procedure g_dbus_object_skeleton_remove_interface(obj: PGDBusObjectSkeleton; interface_: PGDBusInterfaceSkeleton); cdecl; external libgio2;
procedure g_dbus_object_skeleton_remove_interface_by_name(obj: PGDBusObjectSkeleton; interface_name: Pgchar); cdecl; external libgio2;
procedure g_dbus_object_skeleton_set_object_path(obj: PGDBusObjectSkeleton; object_path: Pgchar); cdecl; external libgio2;

// === Konventiert am: 20-8-24 18:28:29 ===

function G_TYPE_DBUS_OBJECT_SKELETON: TGType;
function G_DBUS_OBJECT_SKELETON(obj: Pointer): PGDBusObjectSkeleton;
function G_DBUS_OBJECT_SKELETON_CLASS(klass: Pointer): PGDBusObjectSkeletonClass;
function G_IS_DBUS_OBJECT_SKELETON(obj: Pointer): Tgboolean;
function G_IS_DBUS_OBJECT_SKELETON_CLASS(klass: Pointer): Tgboolean;
function G_DBUS_OBJECT_SKELETON_GET_CLASS(obj: Pointer): PGDBusObjectSkeletonClass;

implementation

function G_TYPE_DBUS_OBJECT_SKELETON: TGType;
begin
  G_TYPE_DBUS_OBJECT_SKELETON := g_dbus_object_skeleton_get_type;
end;

function G_DBUS_OBJECT_SKELETON(obj: Pointer): PGDBusObjectSkeleton;
begin
  Result := PGDBusObjectSkeleton(g_type_check_instance_cast(obj, G_TYPE_DBUS_OBJECT_SKELETON));
end;

function G_DBUS_OBJECT_SKELETON_CLASS(klass: Pointer): PGDBusObjectSkeletonClass;
begin
  Result := PGDBusObjectSkeletonClass(g_type_check_class_cast(klass, G_TYPE_DBUS_OBJECT_SKELETON));
end;

function G_IS_DBUS_OBJECT_SKELETON(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_DBUS_OBJECT_SKELETON);
end;

function G_IS_DBUS_OBJECT_SKELETON_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_DBUS_OBJECT_SKELETON);
end;

function G_DBUS_OBJECT_SKELETON_GET_CLASS(obj: Pointer): PGDBusObjectSkeletonClass;
begin
  Result := PGDBusObjectSkeletonClass(PGTypeInstance(obj)^.g_class);
end;



end.
