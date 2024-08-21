/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

const
  G_FILE_ATTRIBUTE_STANDARD_TYPE = 'standard::type';
  G_FILE_ATTRIBUTE_STANDARD_IS_HIDDEN = 'standard::is-hidden';
  G_FILE_ATTRIBUTE_STANDARD_IS_BACKUP = 'standard::is-backup';
  G_FILE_ATTRIBUTE_STANDARD_IS_SYMLINK = 'standard::is-symlink';
  G_FILE_ATTRIBUTE_STANDARD_IS_VIRTUAL = 'standard::is-virtual';
  G_FILE_ATTRIBUTE_STANDARD_IS_VOLATILE = 'standard::is-volatile';
  G_FILE_ATTRIBUTE_STANDARD_NAME = 'standard::name';
  G_FILE_ATTRIBUTE_STANDARD_DISPLAY_NAME = 'standard::display-name';
  G_FILE_ATTRIBUTE_STANDARD_EDIT_NAME = 'standard::edit-name';
  G_FILE_ATTRIBUTE_STANDARD_COPY_NAME = 'standard::copy-name';
  G_FILE_ATTRIBUTE_STANDARD_DESCRIPTION = 'standard::description';
  G_FILE_ATTRIBUTE_STANDARD_ICON = 'standard::icon';
  G_FILE_ATTRIBUTE_STANDARD_SYMBOLIC_ICON = 'standard::symbolic-icon';
  G_FILE_ATTRIBUTE_STANDARD_CONTENT_TYPE = 'standard::content-type';
  G_FILE_ATTRIBUTE_STANDARD_FAST_CONTENT_TYPE = 'standard::fast-content-type';
  G_FILE_ATTRIBUTE_STANDARD_SIZE = 'standard::size';
  G_FILE_ATTRIBUTE_STANDARD_ALLOCATED_SIZE = 'standard::allocated-size';
  G_FILE_ATTRIBUTE_STANDARD_SYMLINK_TARGET = 'standard::symlink-target';
  G_FILE_ATTRIBUTE_STANDARD_TARGET_URI = 'standard::target-uri';
  G_FILE_ATTRIBUTE_STANDARD_SORT_ORDER = 'standard::sort-order';
  G_FILE_ATTRIBUTE_ETAG_VALUE = 'etag::value';
  G_FILE_ATTRIBUTE_ID_FILE = 'id::file';
  G_FILE_ATTRIBUTE_ID_FILESYSTEM = 'id::filesystem';
  G_FILE_ATTRIBUTE_ACCESS_CAN_READ = 'access::can-read';
  G_FILE_ATTRIBUTE_ACCESS_CAN_WRITE = 'access::can-write';
  G_FILE_ATTRIBUTE_ACCESS_CAN_EXECUTE = 'access::can-execute';
  G_FILE_ATTRIBUTE_ACCESS_CAN_DELETE = 'access::can-delete';
  G_FILE_ATTRIBUTE_ACCESS_CAN_TRASH = 'access::can-trash';
  G_FILE_ATTRIBUTE_ACCESS_CAN_RENAME = 'access::can-rename';
  G_FILE_ATTRIBUTE_MOUNTABLE_CAN_MOUNT = 'mountable::can-mount';
  G_FILE_ATTRIBUTE_MOUNTABLE_CAN_UNMOUNT = 'mountable::can-unmount';
  G_FILE_ATTRIBUTE_MOUNTABLE_CAN_EJECT = 'mountable::can-eject';
  G_FILE_ATTRIBUTE_MOUNTABLE_UNIX_DEVICE = 'mountable::unix-device';
  G_FILE_ATTRIBUTE_MOUNTABLE_UNIX_DEVICE_FILE = 'mountable::unix-device-file';
  G_FILE_ATTRIBUTE_MOUNTABLE_HAL_UDI = 'mountable::hal-udi';
  G_FILE_ATTRIBUTE_MOUNTABLE_CAN_START = 'mountable::can-start';
  G_FILE_ATTRIBUTE_MOUNTABLE_CAN_START_DEGRADED = 'mountable::can-start-degraded';
  G_FILE_ATTRIBUTE_MOUNTABLE_CAN_STOP = 'mountable::can-stop';
  G_FILE_ATTRIBUTE_MOUNTABLE_START_STOP_TYPE = 'mountable::start-stop-type';
  G_FILE_ATTRIBUTE_MOUNTABLE_CAN_POLL = 'mountable::can-poll';
  G_FILE_ATTRIBUTE_MOUNTABLE_IS_MEDIA_CHECK_AUTOMATIC = 'mountable::is-media-check-automatic';
  G_FILE_ATTRIBUTE_TIME_MODIFIED = 'time::modified';
  G_FILE_ATTRIBUTE_TIME_MODIFIED_USEC = 'time::modified-usec';
  G_FILE_ATTRIBUTE_TIME_MODIFIED_NSEC = 'time::modified-nsec';
  G_FILE_ATTRIBUTE_TIME_ACCESS = 'time::access';
  G_FILE_ATTRIBUTE_TIME_ACCESS_USEC = 'time::access-usec';
  G_FILE_ATTRIBUTE_TIME_ACCESS_NSEC = 'time::access-nsec';
  G_FILE_ATTRIBUTE_TIME_CHANGED = 'time::changed';
  G_FILE_ATTRIBUTE_TIME_CHANGED_USEC = 'time::changed-usec';
  G_FILE_ATTRIBUTE_TIME_CHANGED_NSEC = 'time::changed-nsec';
  G_FILE_ATTRIBUTE_TIME_CREATED = 'time::created';
  G_FILE_ATTRIBUTE_TIME_CREATED_USEC = 'time::created-usec';
  G_FILE_ATTRIBUTE_TIME_CREATED_NSEC = 'time::created-nsec';
  G_FILE_ATTRIBUTE_UNIX_DEVICE = 'unix::device';
  G_FILE_ATTRIBUTE_UNIX_INODE = 'unix::inode';
  G_FILE_ATTRIBUTE_UNIX_MODE = 'unix::mode';
  G_FILE_ATTRIBUTE_UNIX_NLINK = 'unix::nlink';
  G_FILE_ATTRIBUTE_UNIX_UID = 'unix::uid';
  G_FILE_ATTRIBUTE_UNIX_GID = 'unix::gid';
  G_FILE_ATTRIBUTE_UNIX_RDEV = 'unix::rdev';
  G_FILE_ATTRIBUTE_UNIX_BLOCK_SIZE = 'unix::block-size';
  G_FILE_ATTRIBUTE_UNIX_BLOCKS = 'unix::blocks';
  G_FILE_ATTRIBUTE_UNIX_IS_MOUNTPOINT = 'unix::is-mountpoint';
  G_FILE_ATTRIBUTE_DOS_IS_ARCHIVE = 'dos::is-archive';
  G_FILE_ATTRIBUTE_DOS_IS_SYSTEM = 'dos::is-system';
  G_FILE_ATTRIBUTE_DOS_IS_MOUNTPOINT = 'dos::is-mountpoint';
  G_FILE_ATTRIBUTE_DOS_REPARSE_POINT_TAG = 'dos::reparse-point-tag';
  G_FILE_ATTRIBUTE_OWNER_USER = 'owner::user';
  G_FILE_ATTRIBUTE_OWNER_USER_REAL = 'owner::user-real';
  G_FILE_ATTRIBUTE_OWNER_GROUP = 'owner::group';
  G_FILE_ATTRIBUTE_THUMBNAIL_PATH = 'thumbnail::path';
  G_FILE_ATTRIBUTE_THUMBNAILING_FAILED = 'thumbnail::failed';
  G_FILE_ATTRIBUTE_THUMBNAIL_IS_VALID = 'thumbnail::is-valid';
  G_FILE_ATTRIBUTE_THUMBNAIL_PATH_NORMAL = 'thumbnail::path-normal';
  G_FILE_ATTRIBUTE_THUMBNAILING_FAILED_NORMAL = 'thumbnail::failed-normal';
  G_FILE_ATTRIBUTE_THUMBNAIL_IS_VALID_NORMAL = 'thumbnail::is-valid-normal';
  G_FILE_ATTRIBUTE_THUMBNAIL_PATH_LARGE = 'thumbnail::path-large';
  G_FILE_ATTRIBUTE_THUMBNAILING_FAILED_LARGE = 'thumbnail::failed-large';
  G_FILE_ATTRIBUTE_THUMBNAIL_IS_VALID_LARGE = 'thumbnail::is-valid-large';
  G_FILE_ATTRIBUTE_THUMBNAIL_PATH_XLARGE = 'thumbnail::path-xlarge';
  G_FILE_ATTRIBUTE_THUMBNAILING_FAILED_XLARGE = 'thumbnail::failed-xlarge';
  G_FILE_ATTRIBUTE_THUMBNAIL_IS_VALID_XLARGE = 'thumbnail::is-valid-xlarge';
  G_FILE_ATTRIBUTE_THUMBNAIL_PATH_XXLARGE = 'thumbnail::path-xxlarge';
  G_FILE_ATTRIBUTE_THUMBNAILING_FAILED_XXLARGE = 'thumbnail::failed-xxlarge';
  G_FILE_ATTRIBUTE_THUMBNAIL_IS_VALID_XXLARGE = 'thumbnail::is-valid-xxlarge';
  G_FILE_ATTRIBUTE_PREVIEW_ICON = 'preview::icon';
  G_FILE_ATTRIBUTE_FILESYSTEM_SIZE = 'filesystem::size';
  G_FILE_ATTRIBUTE_FILESYSTEM_FREE = 'filesystem::free';
  G_FILE_ATTRIBUTE_FILESYSTEM_USED = 'filesystem::used';
  G_FILE_ATTRIBUTE_FILESYSTEM_TYPE = 'filesystem::type';
  G_FILE_ATTRIBUTE_FILESYSTEM_READONLY = 'filesystem::readonly';
  G_FILE_ATTRIBUTE_FILESYSTEM_USE_PREVIEW = 'filesystem::use-preview';
  G_FILE_ATTRIBUTE_FILESYSTEM_REMOTE = 'filesystem::remote';
  G_FILE_ATTRIBUTE_GVFS_BACKEND = 'gvfs::backend';
  G_FILE_ATTRIBUTE_SELINUX_CONTEXT = 'selinux::context';
  G_FILE_ATTRIBUTE_TRASH_ITEM_COUNT = 'trash::item-count';
  G_FILE_ATTRIBUTE_TRASH_ORIG_PATH = 'trash::orig-path';
  G_FILE_ATTRIBUTE_TRASH_DELETION_DATE = 'trash::deletion-date';
  G_FILE_ATTRIBUTE_RECENT_MODIFIED = 'recent::modified';

type
  TGFileInfoClass = record
  end;
  PGFileInfoClass = ^TGFileInfoClass;


function g_file_info_get_type: TGType; cdecl; external libgio2;
function g_file_info_new: PGFileInfo; cdecl; external libgio2;
function g_file_info_dup(other: PGFileInfo): PGFileInfo; cdecl; external libgio2;
procedure g_file_info_copy_into(src_info: PGFileInfo; dest_info: PGFileInfo); cdecl; external libgio2;
function g_file_info_has_attribute(info: PGFileInfo; attribute: PChar): Tgboolean; cdecl; external libgio2;
function g_file_info_has_namespace(info: PGFileInfo; name_space: PChar): Tgboolean; cdecl; external libgio2;
function g_file_info_list_attributes(info: PGFileInfo; name_space: PChar): PPChar; cdecl; external libgio2;
function g_file_info_get_attribute_data(info: PGFileInfo; attribute: PChar; _type: PGFileAttributeType; value_pp: Pgpointer; status: PGFileAttributeStatus): Tgboolean; cdecl; external libgio2;
function g_file_info_get_attribute_type(info: PGFileInfo; attribute: PChar): TGFileAttributeType; cdecl; external libgio2;
procedure g_file_info_remove_attribute(info: PGFileInfo; attribute: PChar); cdecl; external libgio2;
function g_file_info_get_attribute_status(info: PGFileInfo; attribute: PChar): TGFileAttributeStatus; cdecl; external libgio2;
function g_file_info_set_attribute_status(info: PGFileInfo; attribute: PChar; status: TGFileAttributeStatus): Tgboolean; cdecl; external libgio2;
function g_file_info_get_attribute_as_string(info: PGFileInfo; attribute: PChar): PChar; cdecl; external libgio2;
function g_file_info_get_attribute_string(info: PGFileInfo; attribute: PChar): PChar; cdecl; external libgio2;
function g_file_info_get_attribute_byte_string(info: PGFileInfo; attribute: PChar): PChar; cdecl; external libgio2;
function g_file_info_get_attribute_boolean(info: PGFileInfo; attribute: PChar): Tgboolean; cdecl; external libgio2;
function g_file_info_get_attribute_uint32(info: PGFileInfo; attribute: PChar): Tguint32; cdecl; external libgio2;
function g_file_info_get_attribute_int32(info: PGFileInfo; attribute: PChar): Tgint32; cdecl; external libgio2;
function g_file_info_get_attribute_uint64(info: PGFileInfo; attribute: PChar): Tguint64; cdecl; external libgio2;
function g_file_info_get_attribute_int64(info: PGFileInfo; attribute: PChar): Tgint64; cdecl; external libgio2;
function g_file_info_get_attribute_object(info: PGFileInfo; attribute: PChar): PGObject; cdecl; external libgio2;
function g_file_info_get_attribute_stringv(info: PGFileInfo; attribute: PChar): PPChar; cdecl; external libgio2;
function g_file_info_get_attribute_file_path(info: PGFileInfo; attribute: PChar): PChar; cdecl; external libgio2;
procedure g_file_info_set_attribute(info: PGFileInfo; attribute: PChar; _type: TGFileAttributeType; value_p: Tgpointer); cdecl; external libgio2;
procedure g_file_info_set_attribute_string(info: PGFileInfo; attribute: PChar; attr_value: PChar); cdecl; external libgio2;
procedure g_file_info_set_attribute_byte_string(info: PGFileInfo; attribute: PChar; attr_value: PChar); cdecl; external libgio2;
procedure g_file_info_set_attribute_boolean(info: PGFileInfo; attribute: PChar; attr_value: Tgboolean); cdecl; external libgio2;
procedure g_file_info_set_attribute_uint32(info: PGFileInfo; attribute: PChar; attr_value: Tguint32); cdecl; external libgio2;
procedure g_file_info_set_attribute_int32(info: PGFileInfo; attribute: PChar; attr_value: Tgint32); cdecl; external libgio2;
procedure g_file_info_set_attribute_uint64(info: PGFileInfo; attribute: PChar; attr_value: Tguint64); cdecl; external libgio2;
procedure g_file_info_set_attribute_int64(info: PGFileInfo; attribute: PChar; attr_value: Tgint64); cdecl; external libgio2;
procedure g_file_info_set_attribute_object(info: PGFileInfo; attribute: PChar; attr_value: PGObject); cdecl; external libgio2;
procedure g_file_info_set_attribute_stringv(info: PGFileInfo; attribute: PChar; attr_value: PPchar); cdecl; external libgio2;
procedure g_file_info_set_attribute_file_path(info: PGFileInfo; attribute: PChar; attr_value: PChar); cdecl; external libgio2;
procedure g_file_info_clear_status(info: PGFileInfo); cdecl; external libgio2;
function g_file_info_get_deletion_date(info: PGFileInfo): PGDateTime; cdecl; external libgio2;
function g_file_info_get_file_type(info: PGFileInfo): TGFileType; cdecl; external libgio2;
function g_file_info_get_is_hidden(info: PGFileInfo): Tgboolean; cdecl; external libgio2;
function g_file_info_get_is_backup(info: PGFileInfo): Tgboolean; cdecl; external libgio2;
function g_file_info_get_is_symlink(info: PGFileInfo): Tgboolean; cdecl; external libgio2;
function g_file_info_get_name(info: PGFileInfo): PChar; cdecl; external libgio2;
function g_file_info_get_display_name(info: PGFileInfo): PChar; cdecl; external libgio2;
function g_file_info_get_edit_name(info: PGFileInfo): PChar; cdecl; external libgio2;
function g_file_info_get_icon(info: PGFileInfo): PGIcon; cdecl; external libgio2;
function g_file_info_get_symbolic_icon(info: PGFileInfo): PGIcon; cdecl; external libgio2;
function g_file_info_get_content_type(info: PGFileInfo): PChar; cdecl; external libgio2;
function g_file_info_get_size(info: PGFileInfo): Tgoffset; cdecl; external libgio2;
procedure g_file_info_get_modification_time(info: PGFileInfo; Result: PGTimeVal); cdecl; external libgio2;
function g_file_info_get_modification_date_time(info: PGFileInfo): PGDateTime; cdecl; external libgio2;
function g_file_info_get_access_date_time(info: PGFileInfo): PGDateTime; cdecl; external libgio2;
function g_file_info_get_creation_date_time(info: PGFileInfo): PGDateTime; cdecl; external libgio2;
function g_file_info_get_symlink_target(info: PGFileInfo): PChar; cdecl; external libgio2;
function g_file_info_get_etag(info: PGFileInfo): PChar; cdecl; external libgio2;
function g_file_info_get_sort_order(info: PGFileInfo): Tgint32; cdecl; external libgio2;
procedure g_file_info_set_attribute_mask(info: PGFileInfo; mask: PGFileAttributeMatcher); cdecl; external libgio2;
procedure g_file_info_unset_attribute_mask(info: PGFileInfo); cdecl; external libgio2;
procedure g_file_info_set_file_type(info: PGFileInfo; _type: TGFileType); cdecl; external libgio2;
procedure g_file_info_set_is_hidden(info: PGFileInfo; is_hidden: Tgboolean); cdecl; external libgio2;
procedure g_file_info_set_is_symlink(info: PGFileInfo; is_symlink: Tgboolean); cdecl; external libgio2;
procedure g_file_info_set_name(info: PGFileInfo; Name: PChar); cdecl; external libgio2;
procedure g_file_info_set_display_name(info: PGFileInfo; display_name: PChar); cdecl; external libgio2;
procedure g_file_info_set_edit_name(info: PGFileInfo; edit_name: PChar); cdecl; external libgio2;
procedure g_file_info_set_icon(info: PGFileInfo; icon: PGIcon); cdecl; external libgio2;
procedure g_file_info_set_symbolic_icon(info: PGFileInfo; icon: PGIcon); cdecl; external libgio2;
procedure g_file_info_set_content_type(info: PGFileInfo; content_type: PChar); cdecl; external libgio2;
procedure g_file_info_set_size(info: PGFileInfo; size: Tgoffset); cdecl; external libgio2;
procedure g_file_info_set_modification_time(info: PGFileInfo; mtime: PGTimeVal); cdecl; external libgio2;
procedure g_file_info_set_modification_date_time(info: PGFileInfo; mtime: PGDateTime); cdecl; external libgio2;
procedure g_file_info_set_access_date_time(info: PGFileInfo; atime: PGDateTime); cdecl; external libgio2;
procedure g_file_info_set_creation_date_time(info: PGFileInfo; creation_time: PGDateTime); cdecl; external libgio2;
procedure g_file_info_set_symlink_target(info: PGFileInfo; symlink_target: PChar); cdecl; external libgio2;
procedure g_file_info_set_sort_order(info: PGFileInfo; sort_order: Tgint32); cdecl; external libgio2;

function g_file_attribute_matcher_get_type: TGType; cdecl; external libgio2;
function g_file_attribute_matcher_new(attributes: PChar): PGFileAttributeMatcher; cdecl; external libgio2;
function g_file_attribute_matcher_ref(matcher: PGFileAttributeMatcher): PGFileAttributeMatcher; cdecl; external libgio2;
procedure g_file_attribute_matcher_unref(matcher: PGFileAttributeMatcher); cdecl; external libgio2;
function g_file_attribute_matcher_subtract(matcher: PGFileAttributeMatcher; subtract: PGFileAttributeMatcher): PGFileAttributeMatcher; cdecl; external libgio2;
function g_file_attribute_matcher_matches(matcher: PGFileAttributeMatcher; attribute: PChar): Tgboolean; cdecl; external libgio2;
function g_file_attribute_matcher_matches_only(matcher: PGFileAttributeMatcher; attribute: PChar): Tgboolean; cdecl; external libgio2;
function g_file_attribute_matcher_enumerate_namespace(matcher: PGFileAttributeMatcher; ns: PChar): Tgboolean; cdecl; external libgio2;
function g_file_attribute_matcher_enumerate_next(matcher: PGFileAttributeMatcher): PChar; cdecl; external libgio2;
function g_file_attribute_matcher_to_string(matcher: PGFileAttributeMatcher): PChar; cdecl; external libgio2;

function G_TYPE_FILE_ATTRIBUTE_MATCHER: TGType;

// === Konventiert am: 18-8-24 16:49:03 ===

function G_TYPE_FILE_INFO: TGType;
function G_FILE_INFO(obj: Pointer): PGFileInfo;
function G_FILE_INFO_CLASS(klass: Pointer): PGFileInfoClass;
function G_IS_FILE_INFO(obj: Pointer): Tgboolean;
function G_IS_FILE_INFO_CLASS(klass: Pointer): Tgboolean;
function G_FILE_INFO_GET_CLASS(obj: Pointer): PGFileInfoClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_TYPE_FILE_INFO: TGType;
begin
  G_TYPE_FILE_INFO := g_file_info_get_type;
end;

function G_FILE_INFO(obj: Pointer): PGFileInfo;
begin
  Result := PGFileInfo(g_type_check_instance_cast(obj, G_TYPE_FILE_INFO));
end;

function G_FILE_INFO_CLASS(klass: Pointer): PGFileInfoClass;
begin
  Result := PGFileInfoClass(g_type_check_class_cast(klass, G_TYPE_FILE_INFO));
end;

function G_IS_FILE_INFO(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_FILE_INFO);
end;

function G_IS_FILE_INFO_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_FILE_INFO);
end;

function G_FILE_INFO_GET_CLASS(obj: Pointer): PGFileInfoClass;
begin
  Result := PGFileInfoClass(PGTypeInstance(obj)^.g_class);
end;


{ was #define dname def_expr }
function G_TYPE_FILE_ATTRIBUTE_MATCHER: TGType; { return type might be wrong }
begin
  G_TYPE_FILE_ATTRIBUTE_MATCHER := g_file_attribute_matcher_get_type;
end;


{$ENDIF read_implementation}
