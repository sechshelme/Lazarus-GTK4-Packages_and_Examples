/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}


function g_get_user_name: Pgchar; cdecl; external libglib2;
function g_get_real_name: Pgchar; cdecl; external libglib2;
function g_get_home_dir: Pgchar; cdecl; external libglib2;
function g_get_tmp_dir: Pgchar; cdecl; external libglib2;
function g_get_host_name: Pgchar; cdecl; external libglib2;
function g_get_prgname: Pgchar; cdecl; external libglib2;
procedure g_set_prgname(prgname: Pgchar); cdecl; external libglib2;
function g_get_application_name: Pgchar; cdecl; external libglib2;
procedure g_set_application_name(application_name: Pgchar); cdecl; external libglib2;
function g_get_os_info(key_name: Pgchar): Pgchar; cdecl; external libglib2;

const
  G_OS_INFO_KEY_NAME = 'NAME';
  G_OS_INFO_KEY_PRETTY_NAME = 'PRETTY_NAME';
  G_OS_INFO_KEY_VERSION = 'VERSION';
  G_OS_INFO_KEY_VERSION_CODENAME = 'VERSION_CODENAME';
  G_OS_INFO_KEY_VERSION_ID = 'VERSION_ID';
  G_OS_INFO_KEY_ID = 'ID';
  G_OS_INFO_KEY_HOME_URL = 'HOME_URL';
  G_OS_INFO_KEY_DOCUMENTATION_URL = 'DOCUMENTATION_URL';
  G_OS_INFO_KEY_SUPPORT_URL = 'SUPPORT_URL';
  G_OS_INFO_KEY_BUG_REPORT_URL = 'BUG_REPORT_URL';
  G_OS_INFO_KEY_PRIVACY_POLICY_URL = 'PRIVACY_POLICY_URL';

procedure g_reload_user_special_dirs_cache; cdecl; external libglib2;
function g_get_user_data_dir: Pgchar; cdecl; external libglib2;
function g_get_user_config_dir: Pgchar; cdecl; external libglib2;
function g_get_user_cache_dir: Pgchar; cdecl; external libglib2;
function g_get_user_state_dir: Pgchar; cdecl; external libglib2;
function g_get_system_data_dirs: PPgchar; cdecl; external libglib2;
function g_get_system_config_dirs: PPgchar; cdecl; external libglib2;
function g_get_user_runtime_dir: Pgchar; cdecl; external libglib2;

type
  PGUserDirectory = ^TGUserDirectory;
  TGUserDirectory = longint;

const
  G_USER_DIRECTORY_DESKTOP = 0;
  G_USER_DIRECTORY_DOCUMENTS = 1;
  G_USER_DIRECTORY_DOWNLOAD = 2;
  G_USER_DIRECTORY_MUSIC = 3;
  G_USER_DIRECTORY_PICTURES = 4;
  G_USER_DIRECTORY_PUBLIC_SHARE = 5;
  G_USER_DIRECTORY_TEMPLATES = 6;
  G_USER_DIRECTORY_VIDEOS = 7;
  G_USER_N_DIRECTORIES = 8;

function g_get_user_special_dir(directory: TGUserDirectory): Pgchar; cdecl; external libglib2;

type
  TGDebugKey = record
    key: Pgchar;
    Value: Tguint;
  end;
  PGDebugKey = ^TGDebugKey;

function g_parse_debug_string(_string: Pgchar; keys: PGDebugKey; nkeys: Tguint): Tguint; cdecl; external libglib2;
function g_snprintf(_string: Pgchar; n: Tgulong; format: Pgchar; args: array of const): Tgint; cdecl; external libglib2;
function g_snprintf(_string: Pgchar; n: Tgulong; format: Pgchar): Tgint; cdecl; external libglib2;
function g_vsnprintf(_string: Pgchar; n: Tgulong; format: Pgchar; args: Tva_list): Tgint; cdecl; external libglib2;
procedure g_nullify_pointer(nullify_location: Pgpointer); cdecl; external libglib2;

type
  PGFormatSizeFlags = ^TGFormatSizeFlags;
  TGFormatSizeFlags = longint;

const
  G_FORMAT_SIZE_DEFAULT = 0;
  G_FORMAT_SIZE_LONG_FORMAT = 1 shl 0;
  G_FORMAT_SIZE_IEC_UNITS = 1 shl 1;
  G_FORMAT_SIZE_BITS = 1 shl 2;
  G_FORMAT_SIZE_ONLY_VALUE = 1 shl 3;
  G_FORMAT_SIZE_ONLY_UNIT = 1 shl 4;

type
  TGVoidFunc = procedure(); cdecl;

function g_format_size_full(size: Tguint64; flags: TGFormatSizeFlags): Pgchar; cdecl; external libglib2;
function g_format_size(size: Tguint64): Pgchar; cdecl; external libglib2;
function g_format_size_for_display(size: Tgoffset): Pgchar; cdecl; external libglib2;
procedure g_atexit(func: TGVoidFunc); cdecl; external libglib2;
function g_find_program_in_path(program_: Pgchar): Pgchar; cdecl; external libglib2;
function g_bit_nth_lsf(mask: Tgulong; nth_bit: Tgint): Tgint; cdecl; external libglib2;
function g_bit_nth_msf(mask: Tgulong; nth_bit: Tgint): Tgint; cdecl; external libglib2;
function g_bit_storage(number: Tgulong): Tguint; cdecl; external libglib2;

procedure g_abort; cdecl; external libglib2;

// === Konventiert am: 8-8-24 19:19:09 ===

{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
