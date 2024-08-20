unit gvfs;

interface

uses
  common_GLIB, gtypes, gerror, gvariant, gtype, giotypes, gobject, gioenums, gfileattribute;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  G_VFS_EXTENSION_POINT_NAME = 'gio-vfs';

type
  TGVfs = record
    parent_instance: TGObject;
  end;
  PGVfs = ^TGVfs;

  TGVfsClass = record
    parent_class: TGObjectClass;
    is_active: function(vfs: PGVfs): Tgboolean; cdecl;
    get_file_for_path: function(vfs: PGVfs; path: PChar): PGFile; cdecl;
    get_file_for_uri: function(vfs: PGVfs; uri: PChar): PGFile; cdecl;
    get_supported_uri_schemes: function(vfs: PGVfs): PPgchar; cdecl;
    parse_name: function(vfs: PGVfs; parse_name: PChar): PGFile; cdecl;
    local_file_add_info: procedure(vfs: PGVfs; filename: PChar; device: Tguint64; attribute_matcher: PGFileAttributeMatcher; info: PGFileInfo;
      cancellable: PGCancellable; extra_data: Pgpointer; free_extra_data: PGDestroyNotify); cdecl;
    add_writable_namespaces: procedure(vfs: PGVfs; list: PGFileAttributeInfoList); cdecl;
    local_file_set_attributes: function(vfs: PGVfs; filename: PChar; info: PGFileInfo; flags: TGFileQueryInfoFlags; cancellable: PGCancellable;
      error: PPGError): Tgboolean; cdecl;
    local_file_removed: procedure(vfs: PGVfs; filename: PChar); cdecl;
    local_file_moved: procedure(vfs: PGVfs; Source: PChar; dest: PChar); cdecl;
    deserialize_icon: function(vfs: PGVfs; Value: PGVariant): PGIcon; cdecl;
    _g_reserved1: procedure; cdecl;
    _g_reserved2: procedure; cdecl;
    _g_reserved3: procedure; cdecl;
    _g_reserved4: procedure; cdecl;
    _g_reserved5: procedure; cdecl;
    _g_reserved6: procedure; cdecl;
  end;
  PGVfsClass = ^TGVfsClass;

type
  PGVfsFileLookupFunc = ^TGVfsFileLookupFunc;
  TGVfsFileLookupFunc = function(vfs: PGVfs; identifier: PChar; user_data: Tgpointer): PGFile; cdecl;


function g_vfs_get_type: TGType; cdecl; external libgio2;
function g_vfs_is_active(vfs: PGVfs): Tgboolean; cdecl; external libgio2;
function g_vfs_get_file_for_path(vfs: PGVfs; path: PChar): PGFile; cdecl; external libgio2;
function g_vfs_get_file_for_uri(vfs: PGVfs; uri: PChar): PGFile; cdecl; external libgio2;
function g_vfs_get_supported_uri_schemes(vfs: PGVfs): PPgchar; cdecl; external libgio2;
function g_vfs_parse_name(vfs: PGVfs; parse_name: PChar): PGFile; cdecl; external libgio2;
function g_vfs_get_default: PGVfs; cdecl; external libgio2;
function g_vfs_get_local: PGVfs; cdecl; external libgio2;
function g_vfs_register_uri_scheme(vfs: PGVfs; scheme: PChar; uri_func: TGVfsFileLookupFunc; uri_data: Tgpointer; uri_destroy: TGDestroyNotify;
  parse_name_func: TGVfsFileLookupFunc; parse_name_data: Tgpointer; parse_name_destroy: TGDestroyNotify): Tgboolean; cdecl; external libgio2;
function g_vfs_unregister_uri_scheme(vfs: PGVfs; scheme: PChar): Tgboolean; cdecl; external libgio2;

// === Konventiert am: 20-8-24 16:19:56 ===

function G_TYPE_VFS: TGType;
function G_VFS(obj: Pointer): PGVfs;
function G_VFS_CLASS(klass: Pointer): PGVfsClass;
function G_IS_VFS(obj: Pointer): Tgboolean;
function G_IS_VFS_CLASS(klass: Pointer): Tgboolean;
function G_VFS_GET_CLASS(obj: Pointer): PGVfsClass;

implementation

function G_TYPE_VFS: TGType;
begin
  G_TYPE_VFS := g_vfs_get_type;
end;

function G_VFS(obj: Pointer): PGVfs;
begin
  Result := PGVfs(g_type_check_instance_cast(obj, G_TYPE_VFS));
end;

function G_VFS_CLASS(klass: Pointer): PGVfsClass;
begin
  Result := PGVfsClass(g_type_check_class_cast(klass, G_TYPE_VFS));
end;

function G_IS_VFS(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_VFS);
end;

function G_IS_VFS_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_VFS);
end;

function G_VFS_GET_CLASS(obj: Pointer): PGVfsClass;
begin
  Result := PGVfsClass(PGTypeInstance(obj)^.g_class);
end;



end.
