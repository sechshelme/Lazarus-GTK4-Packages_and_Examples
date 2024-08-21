/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

//   komplizierte Makros entfernt

function g_printf_string_upper_bound(format: Pgchar; args: Tva_list): Tgsize; cdecl; external libglib2;

const
  G_LOG_LEVEL_USER_SHIFT = 8;

type
  PGLogLevelFlags = ^TGLogLevelFlags;
  TGLogLevelFlags = longint;

const
  G_LOG_FLAG_RECURSION = 1 shl 0;
  G_LOG_FLAG_FATAL = 1 shl 1;
  G_LOG_LEVEL_ERROR = 1 shl 2;
  G_LOG_LEVEL_CRITICAL = 1 shl 3;
  G_LOG_LEVEL_WARNING = 1 shl 4;
  G_LOG_LEVEL_MESSAGE = 1 shl 5;
  G_LOG_LEVEL_INFO = 1 shl 6;
  G_LOG_LEVEL_DEBUG = 1 shl 7;
  G_LOG_LEVEL_MASK = not (G_LOG_FLAG_RECURSION or G_LOG_FLAG_FATAL);
  G_LOG_FATAL_MASK = G_LOG_FLAG_RECURSION or G_LOG_LEVEL_ERROR;

type
  TGLogFunc = procedure(log_domain: Pgchar; log_level: TGLogLevelFlags; message: Pgchar; user_data: Tgpointer); cdecl;

function g_log_set_handler(log_domain: Pgchar; log_levels: TGLogLevelFlags; log_func: TGLogFunc; user_data: Tgpointer): Tguint; cdecl; external libglib2;
function g_log_set_handler_full(log_domain: Pgchar; log_levels: TGLogLevelFlags; log_func: TGLogFunc; user_data: Tgpointer; Destroy: TGDestroyNotify): Tguint; cdecl; external libglib2;
procedure g_log_remove_handler(log_domain: Pgchar; handler_id: Tguint); cdecl; external libglib2;
procedure g_log_default_handler(log_domain: Pgchar; log_level: TGLogLevelFlags; message: Pgchar; unused_data: Tgpointer); cdecl; external libglib2;
function g_log_set_default_handler(log_func: TGLogFunc; user_data: Tgpointer): TGLogFunc; cdecl; external libglib2;
procedure g_log(log_domain: Pgchar; log_level: TGLogLevelFlags; format: Pgchar; args: array of const); cdecl; external libglib2;
procedure g_log(log_domain: Pgchar; log_level: TGLogLevelFlags; format: Pgchar); cdecl; external libglib2;
procedure g_logv(log_domain: Pgchar; log_level: TGLogLevelFlags; format: Pgchar; args: Tva_list); cdecl; external libglib2;
function g_log_set_fatal_mask(log_domain: Pgchar; fatal_mask: TGLogLevelFlags): TGLogLevelFlags; cdecl; external libglib2;
function g_log_set_always_fatal(fatal_mask: TGLogLevelFlags): TGLogLevelFlags; cdecl; external libglib2;

type
  PGLogWriterOutput = ^TGLogWriterOutput;
  TGLogWriterOutput = longint;

const
  G_LOG_WRITER_HANDLED = 1;
  G_LOG_WRITER_UNHANDLED = 0;

type
  PGLogField = ^TGLogField;

  TGLogField = record
    key: Pgchar;
    Value: Tgconstpointer;
    length: Tgssize;
  end;

  TGLogWriterFunc = function(log_level: TGLogLevelFlags; fields: PGLogField; n_fields: Tgsize; user_data: Tgpointer): TGLogWriterOutput; cdecl;

procedure g_log_structured(log_domain: Pgchar; log_level: TGLogLevelFlags; args: array of const); cdecl; external libglib2;
procedure g_log_structured(log_domain: Pgchar; log_level: TGLogLevelFlags); cdecl; external libglib2;
procedure g_log_structured_array(log_level: TGLogLevelFlags; fields: PGLogField; n_fields: Tgsize); cdecl; external libglib2;
procedure g_log_variant(log_domain: Pgchar; log_level: TGLogLevelFlags; fields: PGVariant); cdecl; external libglib2;
procedure g_log_set_writer_func(func: TGLogWriterFunc; user_data: Tgpointer; user_data_free: TGDestroyNotify); cdecl; external libglib2;
function g_log_writer_supports_color(output_fd: Tgint): Tgboolean; cdecl; external libglib2;
function g_log_writer_is_journald(output_fd: Tgint): Tgboolean; cdecl; external libglib2;
function g_log_writer_format_fields(log_level: TGLogLevelFlags; fields: PGLogField; n_fields: Tgsize; use_color: Tgboolean): Pgchar; cdecl; external libglib2;
function g_log_writer_syslog(log_level: TGLogLevelFlags; fields: PGLogField; n_fields: Tgsize; user_data: Tgpointer): TGLogWriterOutput; cdecl; external libglib2;
function g_log_writer_journald(log_level: TGLogLevelFlags; fields: PGLogField; n_fields: Tgsize; user_data: Tgpointer): TGLogWriterOutput; cdecl; external libglib2;
function g_log_writer_standard_streams(log_level: TGLogLevelFlags; fields: PGLogField; n_fields: Tgsize; user_data: Tgpointer): TGLogWriterOutput; cdecl; external libglib2;
function g_log_writer_default(log_level: TGLogLevelFlags; fields: PGLogField; n_fields: Tgsize; user_data: Tgpointer): TGLogWriterOutput; cdecl; external libglib2;
procedure g_log_writer_default_set_use_stderr(use_stderr: Tgboolean); cdecl; external libglib2;
function g_log_writer_default_would_drop(log_level: TGLogLevelFlags; log_domain: PChar): Tgboolean; cdecl; external libglib2;
function g_log_get_debug_enabled: Tgboolean; cdecl; external libglib2;
procedure g_log_set_debug_enabled(Enabled: Tgboolean); cdecl; external libglib2;
procedure _g_log_fallback_handler(log_domain: Pgchar; log_level: TGLogLevelFlags; message: Pgchar; unused_data: Tgpointer); cdecl; external libglib2;
procedure g_return_if_fail_warning(log_domain: PChar; pretty_function: PChar; expression: PChar); cdecl; external libglib2;
procedure g_warn_message(domain: PChar; _file: PChar; line: longint; func: PChar; warnexpr: PChar); cdecl; external libglib2;
procedure g_assert_warning(log_domain: PChar; _file: PChar; line: longint; pretty_function: PChar; expression: PChar); cdecl; external libglib2;
procedure g_log_structured_standard(log_domain: Pgchar; log_level: TGLogLevelFlags; _file: Pgchar; line: Pgchar; func: Pgchar;
  message_format: Pgchar); varargs cdecl; external libglib2;
procedure g_error(format: Pgchar; args: array of const); cdecl; external libglib2;
procedure g_error(format: Pgchar); cdecl; external libglib2;
procedure g_critical(format: Pgchar; args: array of const); cdecl; external libglib2;
procedure g_critical(format: Pgchar); cdecl; external libglib2;

type
  TGPrintFunc = procedure(_string: Pgchar); cdecl;

procedure g_print(format: Pgchar); varargs cdecl; external libglib2;
function g_set_print_handler(func: TGPrintFunc): TGPrintFunc; cdecl; external libglib2;
procedure g_printerr(format: Pgchar); varargs cdecl; external libglib2;
function g_set_printerr_handler(func: TGPrintFunc): TGPrintFunc; cdecl; external libglib2;

// === Konventiert am: 8-8-24 14:35:36 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
