unit gfileicon;

interface

uses
  common_GLIB, gtypes, gerror, gtype, giotypes, gobject, gioenums;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGFileIcon = record
  end;
  PGFileIcon = ^TGFileIcon;

  TGFileIconClass = record
  end;
  PGFileIconClass = ^TGFileIconClass;

function g_file_icon_get_type: TGType; cdecl; external libgio2;
function g_file_icon_new(file_: PGFile): PGIcon; cdecl; external libgio2;
function g_file_icon_get_file(icon: PGFileIcon): PGFile; cdecl; external libgio2;

// === Konventiert am: 21-8-24 16:28:44 ===

function G_TYPE_FILE_ICON: TGType;
function G_FILE_ICON(obj: Pointer): PGFileIcon;
function G_FILE_ICON_CLASS(klass: Pointer): PGFileIconClass;
function G_IS_FILE_ICON(obj: Pointer): Tgboolean;
function G_IS_FILE_ICON_CLASS(klass: Pointer): Tgboolean;
function G_FILE_ICON_GET_CLASS(obj: Pointer): PGFileIconClass;

implementation

function G_TYPE_FILE_ICON: TGType;
begin
  G_TYPE_FILE_ICON := g_file_icon_get_type;
end;

function G_FILE_ICON(obj: Pointer): PGFileIcon;
begin
  Result := PGFileIcon(g_type_check_instance_cast(obj, G_TYPE_FILE_ICON));
end;

function G_FILE_ICON_CLASS(klass: Pointer): PGFileIconClass;
begin
  Result := PGFileIconClass(g_type_check_class_cast(klass, G_TYPE_FILE_ICON));
end;

function G_IS_FILE_ICON(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_FILE_ICON);
end;

function G_IS_FILE_ICON_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_FILE_ICON);
end;

function G_FILE_ICON_GET_CLASS(obj: Pointer): PGFileIconClass;
begin
  Result := PGFileIconClass(PGTypeInstance(obj)^.g_class);
end;



end.
