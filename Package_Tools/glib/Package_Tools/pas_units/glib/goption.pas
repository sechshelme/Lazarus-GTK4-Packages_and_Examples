unit goption;

interface

uses
  common_GLIB, gtypes, gquark, gerror;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PGOptionFlags = ^TGOptionFlags;
  TGOptionFlags = longint;

const
  G_OPTION_FLAG_NONE = 0;
  G_OPTION_FLAG_HIDDEN = 1 shl 0;
  G_OPTION_FLAG_IN_MAIN = 1 shl 1;
  G_OPTION_FLAG_REVERSE = 1 shl 2;
  G_OPTION_FLAG_NO_ARG = 1 shl 3;
  G_OPTION_FLAG_FILENAME = 1 shl 4;
  G_OPTION_FLAG_OPTIONAL_ARG = 1 shl 5;
  G_OPTION_FLAG_NOALIAS = 1 shl 6;

type
  PGOptionArg = ^TGOptionArg;
  TGOptionArg = longint;

const
  G_OPTION_ARG_NONE = 0;
  G_OPTION_ARG_STRING = 1;
  G_OPTION_ARG_INT = 2;
  G_OPTION_ARG_CALLBACK = 3;
  G_OPTION_ARG_FILENAME = 4;
  G_OPTION_ARG_STRING_ARRAY = 5;
  G_OPTION_ARG_FILENAME_ARRAY = 6;
  G_OPTION_ARG_DOUBLE = 7;
  G_OPTION_ARG_INT64 = 8;

type
  TGOptionContext = record
  end;
  PGOptionContext = ^TGOptionContext;

  TGOptionGroup = record
  end;
  PGOptionGroup = ^TGOptionGroup;

  TGOptionArgFunc = function(option_name: Pgchar; Value: Pgchar; Data: Tgpointer; error: PPGError): Tgboolean; cdecl;
  TGOptionParseFunc = function(context: PGOptionContext; group: PGOptionGroup; Data: Tgpointer; error: PPGError): Tgboolean; cdecl;
  TGOptionErrorFunc = procedure(context: PGOptionContext; group: PGOptionGroup; Data: Tgpointer; error: PPGError); cdecl;

type
  PGOptionError = ^TGOptionError;
  TGOptionError = longint;

const
  G_OPTION_ERROR_UNKNOWN_OPTION = 0;
  G_OPTION_ERROR_BAD_VALUE = 1;
  G_OPTION_ERROR_FAILED = 2;

function g_option_error_quark: TGQuark; cdecl; external libglib2;

type
  PGOptionEntry = ^TGOptionEntry;

  TGOptionEntry = record
    long_name: Pgchar;
    short_name: Tgchar;
    flags: Tgint;
    arg: TGOptionArg;
    arg_data: Tgpointer;
    description: Pgchar;
    arg_description: Pgchar;
  end;

const
  G_OPTION_REMAINING = '';

function g_option_context_new(parameter_string: Pgchar): PGOptionContext; cdecl; external libglib2;
procedure g_option_context_set_summary(context: PGOptionContext; summary: Pgchar); cdecl; external libglib2;
function g_option_context_get_summary(context: PGOptionContext): Pgchar; cdecl; external libglib2;
procedure g_option_context_set_description(context: PGOptionContext; description: Pgchar); cdecl; external libglib2;
function g_option_context_get_description(context: PGOptionContext): Pgchar; cdecl; external libglib2;
procedure g_option_context_free(context: PGOptionContext); cdecl; external libglib2;
procedure g_option_context_set_help_enabled(context: PGOptionContext; help_enabled: Tgboolean); cdecl; external libglib2;
function g_option_context_get_help_enabled(context: PGOptionContext): Tgboolean; cdecl; external libglib2;
procedure g_option_context_set_ignore_unknown_options(context: PGOptionContext; ignore_unknown: Tgboolean); cdecl; external libglib2;
function g_option_context_get_ignore_unknown_options(context: PGOptionContext): Tgboolean; cdecl; external libglib2;
procedure g_option_context_set_strict_posix(context: PGOptionContext; strict_posix: Tgboolean); cdecl; external libglib2;
function g_option_context_get_strict_posix(context: PGOptionContext): Tgboolean; cdecl; external libglib2;
procedure g_option_context_add_main_entries(context: PGOptionContext; entries: PGOptionEntry; translation_domain: Pgchar); cdecl; external libglib2;
function g_option_context_parse(context: PGOptionContext; argc: Pgint; argv: PPPgchar; error: PPGError): Tgboolean; cdecl; external libglib2;
function g_option_context_parse_strv(context: PGOptionContext; arguments: PPPgchar; error: PPGError): Tgboolean; cdecl; external libglib2;
procedure g_option_context_set_translate_func(context: PGOptionContext; func: TGTranslateFunc; Data: Tgpointer; destroy_notify: TGDestroyNotify); cdecl; external libglib2;
procedure g_option_context_set_translation_domain(context: PGOptionContext; domain: Pgchar); cdecl; external libglib2;
procedure g_option_context_add_group(context: PGOptionContext; group: PGOptionGroup); cdecl; external libglib2;
procedure g_option_context_set_main_group(context: PGOptionContext; group: PGOptionGroup); cdecl; external libglib2;
function g_option_context_get_main_group(context: PGOptionContext): PGOptionGroup; cdecl; external libglib2;
function g_option_context_get_help(context: PGOptionContext; main_help: Tgboolean; group: PGOptionGroup): Pgchar; cdecl; external libglib2;
function g_option_group_new(Name: Pgchar; description: Pgchar; help_description: Pgchar; user_data: Tgpointer; Destroy: TGDestroyNotify): PGOptionGroup; cdecl; external libglib2;
procedure g_option_group_set_parse_hooks(group: PGOptionGroup; pre_parse_func: TGOptionParseFunc; post_parse_func: TGOptionParseFunc); cdecl; external libglib2;
procedure g_option_group_set_error_hook(group: PGOptionGroup; error_func: TGOptionErrorFunc); cdecl; external libglib2;
procedure g_option_group_free(group: PGOptionGroup); cdecl; external libglib2;
function g_option_group_ref(group: PGOptionGroup): PGOptionGroup; cdecl; external libglib2;
procedure g_option_group_unref(group: PGOptionGroup); cdecl; external libglib2;
procedure g_option_group_add_entries(group: PGOptionGroup; entries: PGOptionEntry); cdecl; external libglib2;
procedure g_option_group_set_translate_func(group: PGOptionGroup; func: TGTranslateFunc; Data: Tgpointer; destroy_notify: TGDestroyNotify); cdecl; external libglib2;
procedure g_option_group_set_translation_domain(group: PGOptionGroup; domain: Pgchar); cdecl; external libglib2;

function G_OPTION_ERROR: TGQuark;

// === Konventiert am: 8-8-24 15:39:06 ===

implementation

function G_OPTION_ERROR: TGQuark;
begin
  G_OPTION_ERROR := g_option_error_quark;
end;


end.
