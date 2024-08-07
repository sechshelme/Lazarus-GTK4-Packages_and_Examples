unit gbookmarkfile;

interface

uses
  common_GLIB, gtypes, gquark, gerror, gdatetime;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PGBookmarkFileError = ^TGBookmarkFileError;
  TGBookmarkFileError = longint;

const
  G_BOOKMARK_FILE_ERROR_INVALID_URI = 0;
  G_BOOKMARK_FILE_ERROR_INVALID_VALUE = 1;
  G_BOOKMARK_FILE_ERROR_APP_NOT_REGISTERED = 2;
  G_BOOKMARK_FILE_ERROR_URI_NOT_FOUND = 3;
  G_BOOKMARK_FILE_ERROR_READ = 4;
  G_BOOKMARK_FILE_ERROR_UNKNOWN_ENCODING = 5;
  G_BOOKMARK_FILE_ERROR_WRITE = 6;
  G_BOOKMARK_FILE_ERROR_FILE_NOT_FOUND = 7;

function g_bookmark_file_error_quark: TGQuark; cdecl; external libglib2;

type
  TGBookmarkFile = record
  end;
  PGBookmarkFile = ^TGBookmarkFile;

function g_bookmark_file_new: PGBookmarkFile; cdecl; external libglib2;
procedure g_bookmark_file_free(bookmark: PGBookmarkFile); cdecl; external libglib2;
function g_bookmark_file_copy(bookmark: PGBookmarkFile): PGBookmarkFile; cdecl; external libglib2;
function g_bookmark_file_load_from_file(bookmark: PGBookmarkFile; filename: Pgchar; error: PPGError): Tgboolean; cdecl; external libglib2;
function g_bookmark_file_load_from_data(bookmark: PGBookmarkFile; Data: Pgchar; length: Tgsize; error: PPGError): Tgboolean; cdecl; external libglib2;
function g_bookmark_file_load_from_data_dirs(bookmark: PGBookmarkFile; _file: Pgchar; full_path: PPgchar; error: PPGError): Tgboolean; cdecl; external libglib2;
function g_bookmark_file_to_data(bookmark: PGBookmarkFile; length: Pgsize; error: PPGError): Pgchar; cdecl; external libglib2;
function g_bookmark_file_to_file(bookmark: PGBookmarkFile; filename: Pgchar; error: PPGError): Tgboolean; cdecl; external libglib2;
procedure g_bookmark_file_set_title(bookmark: PGBookmarkFile; uri: Pgchar; title: Pgchar); cdecl; external libglib2;
function g_bookmark_file_get_title(bookmark: PGBookmarkFile; uri: Pgchar; error: PPGError): Pgchar; cdecl; external libglib2;
procedure g_bookmark_file_set_description(bookmark: PGBookmarkFile; uri: Pgchar; description: Pgchar); cdecl; external libglib2;
function g_bookmark_file_get_description(bookmark: PGBookmarkFile; uri: Pgchar; error: PPGError): Pgchar; cdecl; external libglib2;
procedure g_bookmark_file_set_mime_type(bookmark: PGBookmarkFile; uri: Pgchar; mime_type: Pgchar); cdecl; external libglib2;
function g_bookmark_file_get_mime_type(bookmark: PGBookmarkFile; uri: Pgchar; error: PPGError): Pgchar; cdecl; external libglib2;
procedure g_bookmark_file_set_groups(bookmark: PGBookmarkFile; uri: Pgchar; groups: PPgchar; length: Tgsize); cdecl; external libglib2;
procedure g_bookmark_file_add_group(bookmark: PGBookmarkFile; uri: Pgchar; group: Pgchar); cdecl; external libglib2;
function g_bookmark_file_has_group(bookmark: PGBookmarkFile; uri: Pgchar; group: Pgchar; error: PPGError): Tgboolean; cdecl; external libglib2;
function g_bookmark_file_get_groups(bookmark: PGBookmarkFile; uri: Pgchar; length: Pgsize; error: PPGError): PPgchar; cdecl; external libglib2;
procedure g_bookmark_file_add_application(bookmark: PGBookmarkFile; uri: Pgchar; Name: Pgchar; exec: Pgchar); cdecl; external libglib2;
function g_bookmark_file_has_application(bookmark: PGBookmarkFile; uri: Pgchar; Name: Pgchar; error: PPGError): Tgboolean; cdecl; external libglib2;
function g_bookmark_file_get_applications(bookmark: PGBookmarkFile; uri: Pgchar; length: Pgsize; error: PPGError): PPgchar; cdecl; external libglib2;
function g_bookmark_file_set_app_info(bookmark: PGBookmarkFile; uri: Pgchar; Name: Pgchar; exec: Pgchar; Count: Tgint;
  stamp: Ttime_t; error: PPGError): Tgboolean; cdecl; external libglib2;
function g_bookmark_file_set_application_info(bookmark: PGBookmarkFile; uri: PChar; Name: PChar; exec: PChar; Count: longint;
  stamp: PGDateTime; error: PPGError): Tgboolean; cdecl; external libglib2;
function g_bookmark_file_get_app_info(bookmark: PGBookmarkFile; uri: Pgchar; Name: Pgchar; exec: PPgchar; Count: Pguint;
  stamp: Ptime_t; error: PPGError): Tgboolean; cdecl; external libglib2;
function g_bookmark_file_get_application_info(bookmark: PGBookmarkFile; uri: PChar; Name: PChar; exec: PPchar; Count: Pdword;
  stamp: PPGDateTime; error: PPGError): Tgboolean; cdecl; external libglib2;
procedure g_bookmark_file_set_is_private(bookmark: PGBookmarkFile; uri: Pgchar; is_private: Tgboolean); cdecl; external libglib2;
function g_bookmark_file_get_is_private(bookmark: PGBookmarkFile; uri: Pgchar; error: PPGError): Tgboolean; cdecl; external libglib2;
procedure g_bookmark_file_set_icon(bookmark: PGBookmarkFile; uri: Pgchar; href: Pgchar; mime_type: Pgchar); cdecl; external libglib2;
function g_bookmark_file_get_icon(bookmark: PGBookmarkFile; uri: Pgchar; href: PPgchar; mime_type: PPgchar; error: PPGError): Tgboolean; cdecl; external libglib2;
procedure g_bookmark_file_set_added(bookmark: PGBookmarkFile; uri: Pgchar; added: Ttime_t); cdecl; external libglib2;
procedure g_bookmark_file_set_added_date_time(bookmark: PGBookmarkFile; uri: PChar; added: PGDateTime); cdecl; external libglib2;
function g_bookmark_file_get_added(bookmark: PGBookmarkFile; uri: Pgchar; error: PPGError): Ttime_t; cdecl; external libglib2;
function g_bookmark_file_get_added_date_time(bookmark: PGBookmarkFile; uri: PChar; error: PPGError): PGDateTime; cdecl; external libglib2;
procedure g_bookmark_file_set_modified(bookmark: PGBookmarkFile; uri: Pgchar; modified: Ttime_t); cdecl; external libglib2;
procedure g_bookmark_file_set_modified_date_time(bookmark: PGBookmarkFile; uri: PChar; modified: PGDateTime); cdecl; external libglib2;
function g_bookmark_file_get_modified(bookmark: PGBookmarkFile; uri: Pgchar; error: PPGError): Ttime_t; cdecl; external libglib2;
function g_bookmark_file_get_modified_date_time(bookmark: PGBookmarkFile; uri: PChar; error: PPGError): PGDateTime; cdecl; external libglib2;
procedure g_bookmark_file_set_visited(bookmark: PGBookmarkFile; uri: Pgchar; visited: Ttime_t); cdecl; external libglib2;
procedure g_bookmark_file_set_visited_date_time(bookmark: PGBookmarkFile; uri: PChar; visited: PGDateTime); cdecl; external libglib2;
function g_bookmark_file_get_visited(bookmark: PGBookmarkFile; uri: Pgchar; error: PPGError): Ttime_t; cdecl; external libglib2;
function g_bookmark_file_get_visited_date_time(bookmark: PGBookmarkFile; uri: PChar; error: PPGError): PGDateTime; cdecl; external libglib2;
function g_bookmark_file_has_item(bookmark: PGBookmarkFile; uri: Pgchar): Tgboolean; cdecl; external libglib2;
function g_bookmark_file_get_size(bookmark: PGBookmarkFile): Tgint; cdecl; external libglib2;
function g_bookmark_file_get_uris(bookmark: PGBookmarkFile; length: Pgsize): PPgchar; cdecl; external libglib2;
function g_bookmark_file_remove_group(bookmark: PGBookmarkFile; uri: Pgchar; group: Pgchar; error: PPGError): Tgboolean; cdecl; external libglib2;
function g_bookmark_file_remove_application(bookmark: PGBookmarkFile; uri: Pgchar; Name: Pgchar; error: PPGError): Tgboolean; cdecl; external libglib2;
function g_bookmark_file_remove_item(bookmark: PGBookmarkFile; uri: Pgchar; error: PPGError): Tgboolean; cdecl; external libglib2;
function g_bookmark_file_move_item(bookmark: PGBookmarkFile; old_uri: Pgchar; new_uri: Pgchar; error: PPGError): Tgboolean; cdecl; external libglib2;

function G_BOOKMARK_FILE_ERROR: TGQuark;

// === Konventiert am: 7-8-24 15:44:44 ===


implementation

function G_BOOKMARK_FILE_ERROR: TGQuark;
begin
  G_BOOKMARK_FILE_ERROR := g_bookmark_file_error_quark;
end;


end.
