
unit gconvert;
interface

{
  Automatically converted by H2Pas 1.0.0 from gconvert.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gconvert.h
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
PGConvertError  = ^GConvertError;
PGError  = ^GError;
PGIConv  = ^GIConv;
Pgsize  = ^gsize;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GLIB - Library of useful routines for C programming
 * Copyright (C) 1995-1997  Peter Mattis, Spencer Kimball and Josh MacDonald
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
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  }
{
 * Modified by the GLib Team and others 1997-2000.  See the AUTHORS
 * file for a list of people on the GLib Team.  See the ChangeLog
 * files for a list of changes.  These files are distributed with
 * GLib at ftp://ftp.gtk.org/pub/gtk/.
  }
{$ifndef __G_CONVERT_H__}
{$define __G_CONVERT_H__}
{$if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)}
{$error "Only <glib.h> can be included directly."}
{$endif}
{$include <glib/gerror.h>}
{*
 * GConvertError:
 * @G_CONVERT_ERROR_NO_CONVERSION: Conversion between the requested character
 *     sets is not supported.
 * @G_CONVERT_ERROR_ILLEGAL_SEQUENCE: Invalid byte sequence in conversion input;
 *    or the character sequence could not be represented in the target
 *    character set.
 * @G_CONVERT_ERROR_FAILED: Conversion failed for some reason.
 * @G_CONVERT_ERROR_PARTIAL_INPUT: Partial character sequence at end of input.
 * @G_CONVERT_ERROR_BAD_URI: URI is invalid.
 * @G_CONVERT_ERROR_NOT_ABSOLUTE_PATH: Pathname is not an absolute path.
 * @G_CONVERT_ERROR_NO_MEMORY: No memory available. Since: 2.40
 * @G_CONVERT_ERROR_EMBEDDED_NUL: An embedded NUL character is present in
 *     conversion output where a NUL-terminated string is expected.
 *     Since: 2.56
 *
 * Error codes returned by character set conversion routines.
  }
type
  PGConvertError = ^TGConvertError;
  TGConvertError =  Longint;
  Const
    G_CONVERT_ERROR_NO_CONVERSION = 0;
    G_CONVERT_ERROR_ILLEGAL_SEQUENCE = 1;
    G_CONVERT_ERROR_FAILED = 2;
    G_CONVERT_ERROR_PARTIAL_INPUT = 3;
    G_CONVERT_ERROR_BAD_URI = 4;
    G_CONVERT_ERROR_NOT_ABSOLUTE_PATH = 5;
    G_CONVERT_ERROR_NO_MEMORY = 6;
    G_CONVERT_ERROR_EMBEDDED_NUL = 7;
;
{*
 * G_CONVERT_ERROR:
 *
 * Error domain for character set conversions. Errors in this domain will
 * be from the #GConvertError enumeration. See #GError for information on
 * error domains.
  }

{ was #define dname def_expr }
function G_CONVERT_ERROR : longint; { return type might be wrong }

function g_convert_error_quark:TGQuark;cdecl;external;
{*
 * GIConv: (skip)
 *
 * The GIConv struct wraps an iconv() conversion descriptor. It contains
 * private data and should only be accessed using the following functions.
  }
type
  PGIConv = ^TGIConv;
  TGIConv = PGIConv;
(* Const before type ignored *)
(* Const before type ignored *)

function g_iconv_open(to_codeset:Pgchar; from_codeset:Pgchar):TGIConv;cdecl;external;
function g_iconv(converter:TGIConv; inbuf:PPgchar; inbytes_left:Pgsize; outbuf:PPgchar; outbytes_left:Pgsize):Tgsize;cdecl;external;
function g_iconv_close(converter:TGIConv):Tgint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function g_convert(str:Pgchar; len:Tgssize; to_codeset:Pgchar; from_codeset:Pgchar; bytes_read:Pgsize; 
           bytes_written:Pgsize; error:PPGError):Pgchar;cdecl;external;
(* Const before type ignored *)
function g_convert_with_iconv(str:Pgchar; len:Tgssize; converter:TGIConv; bytes_read:Pgsize; bytes_written:Pgsize; 
           error:PPGError):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function g_convert_with_fallback(str:Pgchar; len:Tgssize; to_codeset:Pgchar; from_codeset:Pgchar; fallback:Pgchar; 
           bytes_read:Pgsize; bytes_written:Pgsize; error:PPGError):Pgchar;cdecl;external;
{ Convert between libc's idea of strings and UTF-8.
  }
(* Const before type ignored *)
function g_locale_to_utf8(opsysstring:Pgchar; len:Tgssize; bytes_read:Pgsize; bytes_written:Pgsize; error:PPGError):Pgchar;cdecl;external;
(* Const before type ignored *)
function g_locale_from_utf8(utf8string:Pgchar; len:Tgssize; bytes_read:Pgsize; bytes_written:Pgsize; error:PPGError):Pgchar;cdecl;external;
{ Convert between the operating system (or C runtime)
 * representation of file names and UTF-8.
  }
(* Const before type ignored *)
function g_filename_to_utf8(opsysstring:Pgchar; len:Tgssize; bytes_read:Pgsize; bytes_written:Pgsize; error:PPGError):Pgchar;cdecl;external;
(* Const before type ignored *)
function g_filename_from_utf8(utf8string:Pgchar; len:Tgssize; bytes_read:Pgsize; bytes_written:Pgsize; error:PPGError):Pgchar;cdecl;external;
(* Const before type ignored *)
function g_filename_from_uri(uri:Pgchar; hostname:PPgchar; error:PPGError):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_filename_to_uri(filename:Pgchar; hostname:Pgchar; error:PPGError):Pgchar;cdecl;external;
(* Const before type ignored *)
function g_filename_display_name(filename:Pgchar):Pgchar;cdecl;external;
(* Const before type ignored *)
function g_get_filename_charsets(filename_charsets:PPPgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_filename_display_basename(filename:Pgchar):Pgchar;cdecl;external;
(* Const before type ignored *)
function g_uri_list_extract_uris(uri_list:Pgchar):^Pgchar;cdecl;external;
{$endif}
{ __G_CONVERT_H__  }

implementation

{ was #define dname def_expr }
function G_CONVERT_ERROR : longint; { return type might be wrong }
  begin
    G_CONVERT_ERROR:=g_convert_error_quark;
  end;


end.
