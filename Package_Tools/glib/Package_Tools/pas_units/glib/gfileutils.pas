unit gfileutils;

interface

uses
  common_GLIB, gtypes, gquark, gerror;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PGFileError = ^TGFileError;
  TGFileError = longint;

const
  G_FILE_ERROR_EXIST = 0;
  G_FILE_ERROR_ISDIR = 1;
  G_FILE_ERROR_ACCES = 2;
  G_FILE_ERROR_NAMETOOLONG = 3;
  G_FILE_ERROR_NOENT = 4;
  G_FILE_ERROR_NOTDIR = 5;
  G_FILE_ERROR_NXIO = 6;
  G_FILE_ERROR_NODEV = 7;
  G_FILE_ERROR_ROFS = 8;
  G_FILE_ERROR_TXTBSY = 9;
  G_FILE_ERROR_FAULT = 10;
  G_FILE_ERROR_LOOP = 11;
  G_FILE_ERROR_NOSPC = 12;
  G_FILE_ERROR_NOMEM = 13;
  G_FILE_ERROR_MFILE = 14;
  G_FILE_ERROR_NFILE = 15;
  G_FILE_ERROR_BADF = 16;
  G_FILE_ERROR_INVAL = 17;
  G_FILE_ERROR_PIPE = 18;
  G_FILE_ERROR_AGAIN = 19;
  G_FILE_ERROR_INTR = 20;
  G_FILE_ERROR_IO = 21;
  G_FILE_ERROR_PERM = 22;
  G_FILE_ERROR_NOSYS = 23;
  G_FILE_ERROR_FAILED = 24;

type
  PGFileTest = ^TGFileTest;
  TGFileTest = longint;

const
  G_FILE_TEST_IS_REGULAR = 1 shl 0;
  G_FILE_TEST_IS_SYMLINK = 1 shl 1;
  G_FILE_TEST_IS_DIR = 1 shl 2;
  G_FILE_TEST_IS_EXECUTABLE = 1 shl 3;
  G_FILE_TEST_EXISTS = 1 shl 4;

type
  PGFileSetContentsFlags = ^TGFileSetContentsFlags;
  TGFileSetContentsFlags = longint;

const
  G_FILE_SET_CONTENTS_NONE = 0;
  G_FILE_SET_CONTENTS_CONSISTENT = 1 shl 0;
  G_FILE_SET_CONTENTS_DURABLE = 1 shl 1;
  G_FILE_SET_CONTENTS_ONLY_EXISTING = 1 shl 2;

function g_file_error_quark: TGQuark; cdecl; external libglib2;
function g_file_error_from_errno(err_no: Tgint): TGFileError; cdecl; external libglib2;
function g_file_test(filename: Pgchar; test: TGFileTest): Tgboolean; cdecl; external libglib2;
function g_file_get_contents(filename: Pgchar; contents: PPgchar; length: Pgsize; error: PPGError): Tgboolean; cdecl; external libglib2;
function g_file_set_contents(filename: Pgchar; contents: Pgchar; length: Tgssize; error: PPGError): Tgboolean; cdecl; external libglib2;
function g_file_set_contents_full(filename: Pgchar; contents: Pgchar; length: Tgssize; flags: TGFileSetContentsFlags; mode: longint;
  error: PPGError): Tgboolean; cdecl; external libglib2;
function g_file_read_link(filename: Pgchar; error: PPGError): Pgchar; cdecl; external libglib2;
function g_mkdtemp(tmpl: Pgchar): Pgchar; cdecl; external libglib2;
function g_mkdtemp_full(tmpl: Pgchar; mode: Tgint): Pgchar; cdecl; external libglib2;
function g_mkstemp(tmpl: Pgchar): Tgint; cdecl; external libglib2;
function g_mkstemp_full(tmpl: Pgchar; flags: Tgint; mode: Tgint): Tgint; cdecl; external libglib2;
function g_file_open_tmp(tmpl: Pgchar; name_used: PPgchar; error: PPGError): Tgint; cdecl; external libglib2;
function g_dir_make_tmp(tmpl: Pgchar; error: PPGError): Pgchar; cdecl; external libglib2;
function g_build_path(separator: Pgchar; first_element: Pgchar; args: array of const): Pgchar; cdecl; external libglib2;
function g_build_path(separator: Pgchar; first_element: Pgchar): Pgchar; cdecl; external libglib2;
function g_build_pathv(separator: Pgchar; args: PPgchar): Pgchar; cdecl; external libglib2;
function g_build_filename(first_element: Pgchar; args: array of const): Pgchar; cdecl; external libglib2;
function g_build_filename(first_element: Pgchar): Pgchar; cdecl; external libglib2;
function g_build_filenamev(args: PPgchar): Pgchar; cdecl; external libglib2;
function g_build_filename_valist(first_element: Pgchar; args: Pva_list): Pgchar; cdecl; external libglib2;
function g_mkdir_with_parents(pathname: Pgchar; mode: Tgint): Tgint; cdecl; external libglib2;

function g_path_is_absolute(file_name: Pgchar): Tgboolean; cdecl; external libglib2;
function g_path_skip_root(file_name: Pgchar): Pgchar; cdecl; external libglib2;
function g_basename(file_name: Pgchar): Pgchar; cdecl; external libglib2;

//const
//g_dirname = g_path_get_dirname;

function g_get_current_dir: Pgchar; cdecl; external libglib2;
function g_path_get_basename(file_name: Pgchar): Pgchar; cdecl; external libglib2;
function g_path_get_dirname(file_name: Pgchar): Pgchar; cdecl; external libglib2;
function g_dirname(file_name: Pgchar): Pgchar; cdecl; external libglib2 Name 'g_path_get_dirname';
function g_canonicalize_filename(filename: Pgchar; relative_to: Pgchar): Pgchar; cdecl; external libglib2;

function G_IS_DIR_SEPARATOR(c: Pgchar): Tgboolean;
function G_FILE_ERROR: TGQuark;

// === Konventiert am: 10-8-24 17:06:00 ===


implementation


function G_FILE_ERROR: TGQuark;
begin
  G_FILE_ERROR := g_file_error_quark;
end;

function G_IS_DIR_SEPARATOR(c: Pgchar): Tgboolean;
begin
  {$ifdef WIN32}
  G_IS_DIR_SEPARATOR := (c = G_DIR_SEPARATOR) or (c = '/');
  {$else}
  G_IS_DIR_SEPARATOR := c = G_DIR_SEPARATOR;
  {$endif}
end;


end.
