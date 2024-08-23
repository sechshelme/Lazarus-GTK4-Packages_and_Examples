unit gtkmountoperation;

interface

uses
  glib2, common_GTK, GDK4, gtkwindow;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGtkMountOperationPrivate = record // _GtkMountOperationPrivate
  end;
  PGtkMountOperationPrivate = ^TGtkMountOperationPrivate;

  TGtkMountOperation = record
    parent_instance: TGMountOperation;
    priv: PGtkMountOperationPrivate;
  end;
  PGtkMountOperation = ^TGtkMountOperation;

  TGtkMountOperationClass = record
    parent_class: TGMountOperationClass;
    _gtk_reserved1: procedure; cdecl;
    _gtk_reserved2: procedure; cdecl;
    _gtk_reserved3: procedure; cdecl;
    _gtk_reserved4: procedure; cdecl;
  end;
  PGtkMountOperationClass = ^TGtkMountOperationClass;


function gtk_mount_operation_get_type: TGType; cdecl; external libgtk4;
function gtk_mount_operation_new(parent: PGtkWindow): PGMountOperation; cdecl; external libgtk4;
function gtk_mount_operation_is_showing(op: PGtkMountOperation): Tgboolean; cdecl; external libgtk4;
procedure gtk_mount_operation_set_parent(op: PGtkMountOperation; parent: PGtkWindow); cdecl; external libgtk4;
function gtk_mount_operation_get_parent(op: PGtkMountOperation): PGtkWindow; cdecl; external libgtk4;
procedure gtk_mount_operation_set_display(op: PGtkMountOperation; display: PGdkDisplay); cdecl; external libgtk4;
function gtk_mount_operation_get_display(op: PGtkMountOperation): PGdkDisplay; cdecl; external libgtk4;

// === Konventiert am: 28-7-24 13:37:24 ===

function GTK_TYPE_MOUNT_OPERATION: TGType;
function GTK_MOUNT_OPERATION(obj: Pointer): PGtkMountOperation;
function GTK_MOUNT_OPERATION_CLASS(klass: Pointer): PGtkMountOperationClass;
function GTK_IS_MOUNT_OPERATION(obj: Pointer): Tgboolean;
function GTK_IS_MOUNT_OPERATION_CLASS(klass: Pointer): Tgboolean;
function GTK_MOUNT_OPERATION_GET_CLASS(obj: Pointer): PGtkMountOperationClass;

implementation

function GTK_TYPE_MOUNT_OPERATION: TGType;
begin
  GTK_TYPE_MOUNT_OPERATION := gtk_mount_operation_get_type;
end;

function GTK_MOUNT_OPERATION(obj: Pointer): PGtkMountOperation;
begin
  Result := PGtkMountOperation(g_type_check_instance_cast(obj, GTK_TYPE_MOUNT_OPERATION));
end;

function GTK_MOUNT_OPERATION_CLASS(klass: Pointer): PGtkMountOperationClass;
begin
  Result := PGtkMountOperationClass(g_type_check_class_cast(klass, GTK_TYPE_MOUNT_OPERATION));
end;

function GTK_IS_MOUNT_OPERATION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_MOUNT_OPERATION);
end;

function GTK_IS_MOUNT_OPERATION_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_MOUNT_OPERATION);
end;

function GTK_MOUNT_OPERATION_GET_CLASS(obj: Pointer): PGtkMountOperationClass;
begin
  Result := PGtkMountOperationClass(PGTypeInstance(obj)^.g_class);
end;



end.
