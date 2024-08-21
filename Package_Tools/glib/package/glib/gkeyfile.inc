/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  PGKeyFileError = ^TGKeyFileError;
  TGKeyFileError = longint;

const
  G_KEY_FILE_ERROR_UNKNOWN_ENCODING = 0;
  G_KEY_FILE_ERROR_PARSE = 1;
  G_KEY_FILE_ERROR_NOT_FOUND = 2;
  G_KEY_FILE_ERROR_KEY_NOT_FOUND = 3;
  G_KEY_FILE_ERROR_GROUP_NOT_FOUND = 4;
  G_KEY_FILE_ERROR_INVALID_VALUE = 5;

function g_key_file_error_quark: TGQuark; cdecl; external libglib2;

type
  PGKeyFileFlags = ^TGKeyFileFlags;
  TGKeyFileFlags = longint;

const
  G_KEY_FILE_NONE = 0;
  G_KEY_FILE_KEEP_COMMENTS = 1 shl 0;
  G_KEY_FILE_KEEP_TRANSLATIONS = 1 shl 1;

type
  TGKeyFile = record
  end;
  PGKeyFile = ^TGKeyFile;

function g_key_file_new: PGKeyFile; cdecl; external libglib2;
function g_key_file_ref(key_file: PGKeyFile): PGKeyFile; cdecl; external libglib2;
procedure g_key_file_unref(key_file: PGKeyFile); cdecl; external libglib2;
procedure g_key_file_free(key_file: PGKeyFile); cdecl; external libglib2;
procedure g_key_file_set_list_separator(key_file: PGKeyFile; separator: Tgchar); cdecl; external libglib2;
function g_key_file_load_from_file(key_file: PGKeyFile; _file: Pgchar; flags: TGKeyFileFlags; error: PPGError): Tgboolean; cdecl; external libglib2;
function g_key_file_load_from_data(key_file: PGKeyFile; Data: Pgchar; length: Tgsize; flags: TGKeyFileFlags; error: PPGError): Tgboolean; cdecl; external libglib2;
function g_key_file_load_from_bytes(key_file: PGKeyFile; bytes: PGBytes; flags: TGKeyFileFlags; error: PPGError): Tgboolean; cdecl; external libglib2;
function g_key_file_load_from_dirs(key_file: PGKeyFile; _file: Pgchar; search_dirs: PPgchar; full_path: PPgchar; flags: TGKeyFileFlags;
  error: PPGError): Tgboolean; cdecl; external libglib2;
function g_key_file_load_from_data_dirs(key_file: PGKeyFile; _file: Pgchar; full_path: PPgchar; flags: TGKeyFileFlags; error: PPGError): Tgboolean; cdecl; external libglib2;
function g_key_file_to_data(key_file: PGKeyFile; length: Pgsize; error: PPGError): Pgchar; cdecl; external libglib2;
function g_key_file_save_to_file(key_file: PGKeyFile; filename: Pgchar; error: PPGError): Tgboolean; cdecl; external libglib2;
function g_key_file_get_start_group(key_file: PGKeyFile): Pgchar; cdecl; external libglib2;
function g_key_file_get_groups(key_file: PGKeyFile; length: Pgsize): PPgchar; cdecl; external libglib2;
function g_key_file_get_keys(key_file: PGKeyFile; group_name: Pgchar; length: Pgsize; error: PPGError): PPgchar; cdecl; external libglib2;
function g_key_file_has_group(key_file: PGKeyFile; group_name: Pgchar): Tgboolean; cdecl; external libglib2;
function g_key_file_has_key(key_file: PGKeyFile; group_name: Pgchar; key: Pgchar; error: PPGError): Tgboolean; cdecl; external libglib2;
function g_key_file_get_value(key_file: PGKeyFile; group_name: Pgchar; key: Pgchar; error: PPGError): Pgchar; cdecl; external libglib2;
procedure g_key_file_set_value(key_file: PGKeyFile; group_name: Pgchar; key: Pgchar; Value: Pgchar); cdecl; external libglib2;
function g_key_file_get_string(key_file: PGKeyFile; group_name: Pgchar; key: Pgchar; error: PPGError): Pgchar; cdecl; external libglib2;
procedure g_key_file_set_string(key_file: PGKeyFile; group_name: Pgchar; key: Pgchar; _string: Pgchar); cdecl; external libglib2;
function g_key_file_get_locale_string(key_file: PGKeyFile; group_name: Pgchar; key: Pgchar; locale: Pgchar; error: PPGError): Pgchar; cdecl; external libglib2;
function g_key_file_get_locale_for_key(key_file: PGKeyFile; group_name: Pgchar; key: Pgchar; locale: Pgchar): Pgchar; cdecl; external libglib2;
procedure g_key_file_set_locale_string(key_file: PGKeyFile; group_name: Pgchar; key: Pgchar; locale: Pgchar; _string: Pgchar); cdecl; external libglib2;
function g_key_file_get_boolean(key_file: PGKeyFile; group_name: Pgchar; key: Pgchar; error: PPGError): Tgboolean; cdecl; external libglib2;
procedure g_key_file_set_boolean(key_file: PGKeyFile; group_name: Pgchar; key: Pgchar; Value: Tgboolean); cdecl; external libglib2;
function g_key_file_get_integer(key_file: PGKeyFile; group_name: Pgchar; key: Pgchar; error: PPGError): Tgint; cdecl; external libglib2;
procedure g_key_file_set_integer(key_file: PGKeyFile; group_name: Pgchar; key: Pgchar; Value: Tgint); cdecl; external libglib2;
function g_key_file_get_int64(key_file: PGKeyFile; group_name: Pgchar; key: Pgchar; error: PPGError): Tgint64; cdecl; external libglib2;
procedure g_key_file_set_int64(key_file: PGKeyFile; group_name: Pgchar; key: Pgchar; Value: Tgint64); cdecl; external libglib2;
function g_key_file_get_uint64(key_file: PGKeyFile; group_name: Pgchar; key: Pgchar; error: PPGError): Tguint64; cdecl; external libglib2;
procedure g_key_file_set_uint64(key_file: PGKeyFile; group_name: Pgchar; key: Pgchar; Value: Tguint64); cdecl; external libglib2;
function g_key_file_get_double(key_file: PGKeyFile; group_name: Pgchar; key: Pgchar; error: PPGError): Tgdouble; cdecl; external libglib2;
procedure g_key_file_set_double(key_file: PGKeyFile; group_name: Pgchar; key: Pgchar; Value: Tgdouble); cdecl; external libglib2;
function g_key_file_get_string_list(key_file: PGKeyFile; group_name: Pgchar; key: Pgchar; length: Pgsize; error: PPGError): PPgchar; cdecl; external libglib2;
procedure g_key_file_set_string_list(key_file: PGKeyFile; group_name: Pgchar; key: Pgchar; list: PPgchar; length: Tgsize); cdecl; external libglib2;
function g_key_file_get_locale_string_list(key_file: PGKeyFile; group_name: Pgchar; key: Pgchar; locale: Pgchar; length: Pgsize;
  error: PPGError): PPgchar; cdecl; external libglib2;
procedure g_key_file_set_locale_string_list(key_file: PGKeyFile; group_name: Pgchar; key: Pgchar; locale: Pgchar; list: PPgchar;
  length: Tgsize); cdecl; external libglib2;
function g_key_file_get_boolean_list(key_file: PGKeyFile; group_name: Pgchar; key: Pgchar; length: Pgsize; error: PPGError): Pgboolean; cdecl; external libglib2;
procedure g_key_file_set_boolean_list(key_file: PGKeyFile; group_name: Pgchar; key: Pgchar; list: Pgboolean; length: Tgsize); cdecl; external libglib2;
function g_key_file_get_integer_list(key_file: PGKeyFile; group_name: Pgchar; key: Pgchar; length: Pgsize; error: PPGError): Pgint; cdecl; external libglib2;
procedure g_key_file_set_double_list(key_file: PGKeyFile; group_name: Pgchar; key: Pgchar; list: Pgdouble; length: Tgsize); cdecl; external libglib2;
function g_key_file_get_double_list(key_file: PGKeyFile; group_name: Pgchar; key: Pgchar; length: Pgsize; error: PPGError): Pgdouble; cdecl; external libglib2;
procedure g_key_file_set_integer_list(key_file: PGKeyFile; group_name: Pgchar; key: Pgchar; list: Pgint; length: Tgsize); cdecl; external libglib2;
function g_key_file_set_comment(key_file: PGKeyFile; group_name: Pgchar; key: Pgchar; comment: Pgchar; error: PPGError): Tgboolean; cdecl; external libglib2;
function g_key_file_get_comment(key_file: PGKeyFile; group_name: Pgchar; key: Pgchar; error: PPGError): Pgchar; cdecl; external libglib2;
function g_key_file_remove_comment(key_file: PGKeyFile; group_name: Pgchar; key: Pgchar; error: PPGError): Tgboolean; cdecl; external libglib2;
function g_key_file_remove_key(key_file: PGKeyFile; group_name: Pgchar; key: Pgchar; error: PPGError): Tgboolean; cdecl; external libglib2;
function g_key_file_remove_group(key_file: PGKeyFile; group_name: Pgchar; error: PPGError): Tgboolean; cdecl; external libglib2;

const
  G_KEY_FILE_DESKTOP_GROUP = 'Desktop Entry';
  G_KEY_FILE_DESKTOP_KEY_TYPE = 'Type';
  G_KEY_FILE_DESKTOP_KEY_VERSION = 'Version';
  G_KEY_FILE_DESKTOP_KEY_NAME = 'Name';
  G_KEY_FILE_DESKTOP_KEY_GENERIC_NAME = 'GenericName';
  G_KEY_FILE_DESKTOP_KEY_NO_DISPLAY = 'NoDisplay';
  G_KEY_FILE_DESKTOP_KEY_COMMENT = 'Comment';
  G_KEY_FILE_DESKTOP_KEY_ICON = 'Icon';
  G_KEY_FILE_DESKTOP_KEY_HIDDEN = 'Hidden';
  G_KEY_FILE_DESKTOP_KEY_ONLY_SHOW_IN = 'OnlyShowIn';
  G_KEY_FILE_DESKTOP_KEY_NOT_SHOW_IN = 'NotShowIn';
  G_KEY_FILE_DESKTOP_KEY_TRY_EXEC = 'TryExec';
  G_KEY_FILE_DESKTOP_KEY_EXEC = 'Exec';
  G_KEY_FILE_DESKTOP_KEY_PATH = 'Path';
  G_KEY_FILE_DESKTOP_KEY_TERMINAL = 'Terminal';
  G_KEY_FILE_DESKTOP_KEY_MIME_TYPE = 'MimeType';
  G_KEY_FILE_DESKTOP_KEY_CATEGORIES = 'Categories';
  G_KEY_FILE_DESKTOP_KEY_STARTUP_NOTIFY = 'StartupNotify';
  G_KEY_FILE_DESKTOP_KEY_STARTUP_WM_CLASS = 'StartupWMClass';
  G_KEY_FILE_DESKTOP_KEY_URL = 'URL';
  G_KEY_FILE_DESKTOP_KEY_DBUS_ACTIVATABLE = 'DBusActivatable';
  G_KEY_FILE_DESKTOP_KEY_ACTIONS = 'Actions';
  G_KEY_FILE_DESKTOP_TYPE_APPLICATION = 'Application';
  G_KEY_FILE_DESKTOP_TYPE_LINK = 'Link';
  G_KEY_FILE_DESKTOP_TYPE_DIRECTORY = 'Directory';

function G_KEY_FILE_ERROR: TGQuark;

// === Konventiert am: 8-8-24 19:07:41 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function G_KEY_FILE_ERROR: TGQuark;
begin
  G_KEY_FILE_ERROR := g_key_file_error_quark;
end;


{$ENDIF read_implementation}
