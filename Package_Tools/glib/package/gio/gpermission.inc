/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGPermissionPrivate = record
  end;
  PGPermissionPrivate = ^TGPermissionPrivate;

  PGPermission = ^TGPermission;

  TGPermission = record
    parent_instance: TGObject;
    priv: PGPermissionPrivate;
  end;

  PGPermissionClass = ^TGPermissionClass;

  TGPermissionClass = record
    parent_class: TGObjectClass;
    acquire: function(permission: PGPermission; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl;
    acquire_async: procedure(permission: PGPermission; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl;
    acquire_finish: function(permission: PGPermission; Result: PGAsyncResult; error: PPGError): Tgboolean; cdecl;
    Release: function(permission: PGPermission; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl;
    release_async: procedure(permission: PGPermission; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl;
    release_finish: function(permission: PGPermission; Result: PGAsyncResult; error: PPGError): Tgboolean; cdecl;
    reserved: array[0..15] of Tgpointer;
  end;


function g_permission_get_type: TGType; cdecl; external libgio2;
function g_permission_acquire(permission: PGPermission; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libgio2;
procedure g_permission_acquire_async(permission: PGPermission; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_permission_acquire_finish(permission: PGPermission; Result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_permission_release(permission: PGPermission; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libgio2;
procedure g_permission_release_async(permission: PGPermission; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_permission_release_finish(permission: PGPermission; Result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_permission_get_allowed(permission: PGPermission): Tgboolean; cdecl; external libgio2;
function g_permission_get_can_acquire(permission: PGPermission): Tgboolean; cdecl; external libgio2;
function g_permission_get_can_release(permission: PGPermission): Tgboolean; cdecl; external libgio2;
procedure g_permission_impl_update(permission: PGPermission; allowed: Tgboolean; can_acquire: Tgboolean; can_release: Tgboolean); cdecl; external libgio2;

// === Konventiert am: 20-8-24 15:39:33 ===

function G_TYPE_PERMISSION: TGType;
function G_PERMISSION(obj: Pointer): PGPermission;
function G_PERMISSION_CLASS(klass: Pointer): PGPermissionClass;
function G_IS_PERMISSION(obj: Pointer): Tgboolean;
function G_IS_PERMISSION_CLASS(klass: Pointer): Tgboolean;
function G_PERMISSION_GET_CLASS(obj: Pointer): PGPermissionClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_TYPE_PERMISSION: TGType;
begin
  G_TYPE_PERMISSION := g_permission_get_type;
end;

function G_PERMISSION(obj: Pointer): PGPermission;
begin
  Result := PGPermission(g_type_check_instance_cast(obj, G_TYPE_PERMISSION));
end;

function G_PERMISSION_CLASS(klass: Pointer): PGPermissionClass;
begin
  Result := PGPermissionClass(g_type_check_class_cast(klass, G_TYPE_PERMISSION));
end;

function G_IS_PERMISSION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_PERMISSION);
end;

function G_IS_PERMISSION_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_PERMISSION);
end;

function G_PERMISSION_GET_CLASS(obj: Pointer): PGPermissionClass;
begin
  Result := PGPermissionClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
