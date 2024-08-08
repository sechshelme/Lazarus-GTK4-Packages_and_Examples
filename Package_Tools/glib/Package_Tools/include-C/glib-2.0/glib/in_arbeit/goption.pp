
unit goption;
interface

{
  Automatically converted by H2Pas 1.0.0 from goption.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    goption.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pgchar  = ^gchar;
PGError  = ^GError;
Pgint  = ^gint;
PGOptionArg  = ^GOptionArg;
PGOptionContext  = ^GOptionContext;
PGOptionEntry  = ^GOptionEntry;
PGOptionError  = ^GOptionError;
PGOptionFlags  = ^GOptionFlags;
PGOptionGroup  = ^GOptionGroup;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ goption.h - Option parser
 *
 *  Copyright (C) 2004  Anders Carlsson <andersca@gnome.org>
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library; if not, see <http://www.gnu.org/licenses/>.
  }
{$ifndef __G_OPTION_H__}
{$define __G_OPTION_H__}
{$if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)}
{$error "Only <glib.h> can be included directly."}
{$endif}
{$include <glib/gerror.h>}
{$include <glib/gquark.h>}
{*
 * GOptionContext:
 * 
 * A `GOptionContext` struct defines which options
 * are accepted by the commandline option parser. The struct has only private 
 * fields and should not be directly accessed.
  }
type
{*
 * GOptionGroup:
 *
 * A `GOptionGroup` struct defines the options in a single
 * group. The struct has only private fields and should not be directly accessed.
 *
 * All options in a group share the same translation function. Libraries which
 * need to parse commandline options are expected to provide a function for
 * getting a `GOptionGroup` holding their options, which
 * the application can then add to its #GOptionContext.
  }
{*
 * GOptionFlags:
 * @G_OPTION_FLAG_NONE: No flags. Since: 2.42.
 * @G_OPTION_FLAG_HIDDEN: The option doesn't appear in `--help` output.
 * @G_OPTION_FLAG_IN_MAIN: The option appears in the main section of the
 *     `--help` output, even if it is defined in a group.
 * @G_OPTION_FLAG_REVERSE: For options of the %G_OPTION_ARG_NONE kind, this
 *     flag indicates that the sense of the option is reversed. i.e. %FALSE will
 *     be stored into the argument rather than %TRUE.
 * @G_OPTION_FLAG_NO_ARG: For options of the %G_OPTION_ARG_CALLBACK kind,
 *     this flag indicates that the callback does not take any argument
 *     (like a %G_OPTION_ARG_NONE option). Since 2.8
 * @G_OPTION_FLAG_FILENAME: For options of the %G_OPTION_ARG_CALLBACK
 *     kind, this flag indicates that the argument should be passed to the
 *     callback in the GLib filename encoding rather than UTF-8. Since 2.8
 * @G_OPTION_FLAG_OPTIONAL_ARG: For options of the %G_OPTION_ARG_CALLBACK 
 *     kind, this flag indicates that the argument supply is optional.
 *     If no argument is given then data of %GOptionParseFunc will be
 *     set to NULL. Since 2.8
 * @G_OPTION_FLAG_NOALIAS: This flag turns off the automatic conflict
 *     resolution which prefixes long option names with `groupname-` if 
 *     there is a conflict. This option should only be used in situations
 *     where aliasing is necessary to model some legacy commandline interface.
 *     It is not safe to use this option, unless all option groups are under
 *     your direct control. Since 2.8.
 *
 * Flags which modify individual options.
  }

  PGOptionFlags = ^TGOptionFlags;
  TGOptionFlags =  Longint;
  Const
    G_OPTION_FLAG_NONE = 0;
    G_OPTION_FLAG_HIDDEN = 1 shl 0;
    G_OPTION_FLAG_IN_MAIN = 1 shl 1;
    G_OPTION_FLAG_REVERSE = 1 shl 2;
    G_OPTION_FLAG_NO_ARG = 1 shl 3;
    G_OPTION_FLAG_FILENAME = 1 shl 4;
    G_OPTION_FLAG_OPTIONAL_ARG = 1 shl 5;
    G_OPTION_FLAG_NOALIAS = 1 shl 6;
;
{*
 * GOptionArg:
 * @G_OPTION_ARG_NONE: No extra argument. This is useful for simple flags or booleans.
 * @G_OPTION_ARG_STRING: The option takes a UTF-8 string argument.
 * @G_OPTION_ARG_INT: The option takes an integer argument.
 * @G_OPTION_ARG_CALLBACK: The option provides a callback (of type
 *     #GOptionArgFunc) to parse the extra argument.
 * @G_OPTION_ARG_FILENAME: The option takes a filename as argument, which will
       be in the GLib filename encoding rather than UTF-8.
 * @G_OPTION_ARG_STRING_ARRAY: The option takes a string argument, multiple
 *     uses of the option are collected into an array of strings.
 * @G_OPTION_ARG_FILENAME_ARRAY: The option takes a filename as argument, 
 *     multiple uses of the option are collected into an array of strings.
 * @G_OPTION_ARG_DOUBLE: The option takes a double argument. The argument
 *     can be formatted either for the user's locale or for the "C" locale.
 *     Since 2.12
 * @G_OPTION_ARG_INT64: The option takes a 64-bit integer. Like
 *     %G_OPTION_ARG_INT but for larger numbers. The number can be in
 *     decimal base, or in hexadecimal (when prefixed with `0x`, for
 *     example, `0xffffffff`). Since 2.12
 * 
 * The #GOptionArg enum values determine which type of extra argument the
 * options expect to find. If an option expects an extra argument, it can
 * be specified in several ways; with a short option: `-x arg`, with a long
 * option: `--name arg` or combined in a single argument: `--name=arg`.
  }
type
  PGOptionArg = ^TGOptionArg;
  TGOptionArg =  Longint;
  Const
    G_OPTION_ARG_NONE = 0;
    G_OPTION_ARG_STRING = 1;
    G_OPTION_ARG_INT = 2;
    G_OPTION_ARG_CALLBACK = 3;
    G_OPTION_ARG_FILENAME = 4;
    G_OPTION_ARG_STRING_ARRAY = 5;
    G_OPTION_ARG_FILENAME_ARRAY = 6;
    G_OPTION_ARG_DOUBLE = 7;
    G_OPTION_ARG_INT64 = 8;
;
{*
 * GOptionArgFunc:
 * @option_name: The name of the option being parsed. This will be either a 
 *  single dash followed by a single letter (for a short name) or two dashes
 *  followed by a long option name.
 * @value: The value to be parsed.
 * @data: User data added to the #GOptionGroup containing the option when it
 *  was created with g_option_group_new()
 * @error: A return location for errors. The error code %G_OPTION_ERROR_FAILED
 *  is intended to be used for errors in #GOptionArgFunc callbacks.
 * 
 * The type of function to be passed as callback for %G_OPTION_ARG_CALLBACK
 * options.
 * 
 * Returns: %TRUE if the option was successfully parsed, %FALSE if an error 
 *  occurred, in which case @error should be set with g_set_error()
  }
(* Const before type ignored *)
(* Const before type ignored *)
type

  TGOptionArgFunc = function (option_name:Pgchar; value:Pgchar; data:Tgpointer; error:PPGError):Tgboolean;cdecl;
{*
 * GOptionParseFunc:
 * @context: The active #GOptionContext
 * @group: The group to which the function belongs
 * @data: User data added to the #GOptionGroup containing the option when it
 *  was created with g_option_group_new()
 * @error: A return location for error details
 * 
 * The type of function that can be called before and after parsing. 
 * 
 * Returns: %TRUE if the function completed successfully, %FALSE if an error 
 *  occurred, in which case @error should be set with g_set_error()
  }

  TGOptionParseFunc = function (context:PGOptionContext; group:PGOptionGroup; data:Tgpointer; error:PPGError):Tgboolean;cdecl;
{*
 * GOptionErrorFunc:
 * @context: The active #GOptionContext
 * @group: The group to which the function belongs
 * @data: User data added to the #GOptionGroup containing the option when it
 *  was created with g_option_group_new()
 * @error: The #GError containing details about the parse error
 * 
 * The type of function to be used as callback when a parse error occurs.
  }

  TGOptionErrorFunc = procedure (context:PGOptionContext; group:PGOptionGroup; data:Tgpointer; error:PPGError);cdecl;
{*
 * G_OPTION_ERROR:
 * 
 * Error domain for option parsing. Errors in this domain will
 * be from the #GOptionError enumeration. See #GError for information on 
 * error domains.
  }

{ was #define dname def_expr }
function G_OPTION_ERROR : longint; { return type might be wrong }

{*
 * GOptionError:
 * @G_OPTION_ERROR_UNKNOWN_OPTION: An option was not known to the parser.
 *  This error will only be reported, if the parser hasn't been instructed
 *  to ignore unknown options, see g_option_context_set_ignore_unknown_options().
 * @G_OPTION_ERROR_BAD_VALUE: A value couldn't be parsed.
 * @G_OPTION_ERROR_FAILED: A #GOptionArgFunc callback failed.
 * 
 * Error codes returned by option parsing.
  }
type
  PGOptionError = ^TGOptionError;
  TGOptionError =  Longint;
  Const
    G_OPTION_ERROR_UNKNOWN_OPTION = 0;
    G_OPTION_ERROR_BAD_VALUE = 1;
    G_OPTION_ERROR_FAILED = 2;
;

function g_option_error_quark:TGQuark;cdecl;external;
{*
 * GOptionEntry:
 * @long_name: The long name of an option can be used to specify it
 *     in a commandline as `--long_name`. Every option must have a
 *     long name. To resolve conflicts if multiple option groups contain
 *     the same long name, it is also possible to specify the option as 
 *     `--groupname-long_name`.
 * @short_name: If an option has a short name, it can be specified
 *     `-short_name` in a commandline. @short_name must be  a printable
 *     ASCII character different from '-', or zero if the option has no
 *     short name.
 * @flags: Flags from #GOptionFlags
 * @arg: The type of the option, as a #GOptionArg
 * @arg_data: If the @arg type is %G_OPTION_ARG_CALLBACK, then @arg_data
 *     must point to a #GOptionArgFunc callback function, which will be
 *     called to handle the extra argument. Otherwise, @arg_data is a
 *     pointer to a location to store the value, the required type of
 *     the location depends on the @arg type:
 *      - %G_OPTION_ARG_NONE: %gboolean
 *      - %G_OPTION_ARG_STRING: %gchar*
 *      - %G_OPTION_ARG_INT: %gint
 *      - %G_OPTION_ARG_FILENAME: %gchar*
 *      - %G_OPTION_ARG_STRING_ARRAY: %gchar**
 *      - %G_OPTION_ARG_FILENAME_ARRAY: %gchar**
 *      - %G_OPTION_ARG_DOUBLE: %gdouble
 *     If @arg type is %G_OPTION_ARG_STRING or %G_OPTION_ARG_FILENAME,
 *     the location will contain a newly allocated string if the option
 *     was given. That string needs to be freed by the callee using g_free().
 *     Likewise if @arg type is %G_OPTION_ARG_STRING_ARRAY or
 *     %G_OPTION_ARG_FILENAME_ARRAY, the data should be freed using g_strfreev().
 * @description: the description for the option in `--help`
 *     output. The @description is translated using the @translate_func
 *     of the group, see g_option_group_set_translation_domain().
 * @arg_description: The placeholder to use for the extra argument parsed
 *     by the option in `--help` output. The @arg_description is translated
 *     using the @translate_func of the group, see
 *     g_option_group_set_translation_domain().
 * 
 * A GOptionEntry struct defines a single option. To have an effect, they
 * must be added to a #GOptionGroup with g_option_context_add_main_entries()
 * or g_option_group_add_entries().
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
type
  PGOptionEntry = ^TGOptionEntry;
  TGOptionEntry = record
      long_name : Pgchar;
      short_name : Tgchar;
      flags : Tgint;
      arg : TGOptionArg;
      arg_data : Tgpointer;
      description : Pgchar;
      arg_description : Pgchar;
    end;

{*
 * G_OPTION_REMAINING:
 * 
 * If a long option in the main group has this name, it is not treated as a 
 * regular option. Instead it collects all non-option arguments which would
 * otherwise be left in `argv`. The option must be of type
 * %G_OPTION_ARG_CALLBACK, %G_OPTION_ARG_STRING_ARRAY
 * or %G_OPTION_ARG_FILENAME_ARRAY.
 * 
 * 
 * Using %G_OPTION_REMAINING instead of simply scanning `argv`
 * for leftover arguments has the advantage that GOption takes care of 
 * necessary encoding conversions for strings or filenames.
 * 
 * Since: 2.6
  }

const
  G_OPTION_REMAINING = '';  
{*
 * G_OPTION_ENTRY_NULL:
 *
 * A #GOptionEntry array requires a %NULL terminator, this macro can
 * be used as terminator instead of an explicit ` 0 ` but it cannot
 * be assigned to a variable.
 *
 * |[
 *   GOptionEntry option[] =  G_OPTION_ENTRY_NULL ;
 * ]|
 *
 * Since: 2.70
  }
{//#define G_OPTION_ENTRY_NULL    \ }
{  GLIB_AVAILABLE_MACRO_IN_2_70 \ }
{   NULL, 0, 0, 0, NULL, NULL, NULL  }
(* Const before type ignored *)

function g_option_context_new(parameter_string:Pgchar):PGOptionContext;cdecl;external;
(* Const before type ignored *)
procedure g_option_context_set_summary(context:PGOptionContext; summary:Pgchar);cdecl;external;
(* Const before type ignored *)
function g_option_context_get_summary(context:PGOptionContext):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure g_option_context_set_description(context:PGOptionContext; description:Pgchar);cdecl;external;
(* Const before type ignored *)
function g_option_context_get_description(context:PGOptionContext):Pgchar;cdecl;external;
procedure g_option_context_free(context:PGOptionContext);cdecl;external;
procedure g_option_context_set_help_enabled(context:PGOptionContext; help_enabled:Tgboolean);cdecl;external;
function g_option_context_get_help_enabled(context:PGOptionContext):Tgboolean;cdecl;external;
procedure g_option_context_set_ignore_unknown_options(context:PGOptionContext; ignore_unknown:Tgboolean);cdecl;external;
function g_option_context_get_ignore_unknown_options(context:PGOptionContext):Tgboolean;cdecl;external;
procedure g_option_context_set_strict_posix(context:PGOptionContext; strict_posix:Tgboolean);cdecl;external;
function g_option_context_get_strict_posix(context:PGOptionContext):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure g_option_context_add_main_entries(context:PGOptionContext; entries:PGOptionEntry; translation_domain:Pgchar);cdecl;external;
function g_option_context_parse(context:PGOptionContext; argc:Pgint; argv:PPPgchar; error:PPGError):Tgboolean;cdecl;external;
function g_option_context_parse_strv(context:PGOptionContext; arguments:PPPgchar; error:PPGError):Tgboolean;cdecl;external;
procedure g_option_context_set_translate_func(context:PGOptionContext; func:TGTranslateFunc; data:Tgpointer; destroy_notify:TGDestroyNotify);cdecl;external;
(* Const before type ignored *)
procedure g_option_context_set_translation_domain(context:PGOptionContext; domain:Pgchar);cdecl;external;
procedure g_option_context_add_group(context:PGOptionContext; group:PGOptionGroup);cdecl;external;
procedure g_option_context_set_main_group(context:PGOptionContext; group:PGOptionGroup);cdecl;external;
function g_option_context_get_main_group(context:PGOptionContext):PGOptionGroup;cdecl;external;
function g_option_context_get_help(context:PGOptionContext; main_help:Tgboolean; group:PGOptionGroup):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function g_option_group_new(name:Pgchar; description:Pgchar; help_description:Pgchar; user_data:Tgpointer; destroy:TGDestroyNotify):PGOptionGroup;cdecl;external;
procedure g_option_group_set_parse_hooks(group:PGOptionGroup; pre_parse_func:TGOptionParseFunc; post_parse_func:TGOptionParseFunc);cdecl;external;
procedure g_option_group_set_error_hook(group:PGOptionGroup; error_func:TGOptionErrorFunc);cdecl;external;
procedure g_option_group_free(group:PGOptionGroup);cdecl;external;
function g_option_group_ref(group:PGOptionGroup):PGOptionGroup;cdecl;external;
procedure g_option_group_unref(group:PGOptionGroup);cdecl;external;
(* Const before type ignored *)
procedure g_option_group_add_entries(group:PGOptionGroup; entries:PGOptionEntry);cdecl;external;
procedure g_option_group_set_translate_func(group:PGOptionGroup; func:TGTranslateFunc; data:Tgpointer; destroy_notify:TGDestroyNotify);cdecl;external;
(* Const before type ignored *)
procedure g_option_group_set_translation_domain(group:PGOptionGroup; domain:Pgchar);cdecl;external;
{$endif}
{ __G_OPTION_H__  }

implementation

{ was #define dname def_expr }
function G_OPTION_ERROR : longint; { return type might be wrong }
  begin
    G_OPTION_ERROR:=g_option_error_quark;
  end;


end.