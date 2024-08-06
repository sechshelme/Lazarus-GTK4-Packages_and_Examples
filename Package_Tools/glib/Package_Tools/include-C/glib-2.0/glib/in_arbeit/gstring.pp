
unit gstring;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstring.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstring.h
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
PGBytes  = ^GBytes;
Pgchar  = ^gchar;
PGString  = ^GString;
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
{$ifndef __G_STRING_H__}
{$define __G_STRING_H__}
{$if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)}
{$error "Only <glib.h> can be included directly."}
{$endif}
{$include <glib/gtypes.h>}
{$include <glib/gunicode.h>}
{$include <glib/gbytes.h>}
{$include <glib/gstrfuncs.h>}
{$include <glib/gutils.h>  /* for G_CAN_INLINE */}
{$include <string.h>}
type
  PGString = ^TGString;
  TGString = record
      str : Pgchar;
      len : Tgsize;
      allocated_len : Tgsize;
    end;

(* Const before type ignored *)

function g_string_new(init:Pgchar):PGString;cdecl;external;
function g_string_new_take(init:Pgchar):PGString;cdecl;external;
(* Const before type ignored *)
function g_string_new_len(init:Pgchar; len:Tgssize):PGString;cdecl;external;
function g_string_sized_new(dfl_size:Tgsize):PGString;cdecl;external;
function g_string_free(_string:PGString; free_segment:Tgboolean):Pgchar;cdecl;external;
function g_string_free_and_steal(_string:PGString):Pgchar;cdecl;external;
{
#if G_GNUC_CHECK_VERSION (2, 0) && (GLIB_VERSION_MIN_REQUIRED >= GLIB_VERSION_2_76)

#define g_string_free(str, free_segment)        \
  (__builtin_constant_p (free_segment) ?        \
    ((free_segment) ?                           \
      (g_string_free) ((str), (free_segment)) : \
      g_string_free_and_steal (str))            \
    :                                           \
    (g_string_free) ((str), (free_segment)))

#endif 
 }
function g_string_free_to_bytes(_string:PGString):PGBytes;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_string_equal(v:PGString; v2:PGString):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_string_hash(str:PGString):Tguint;cdecl;external;
(* Const before type ignored *)
function g_string_assign(_string:PGString; rval:Pgchar):PGString;cdecl;external;
function g_string_truncate(_string:PGString; len:Tgsize):PGString;cdecl;external;
function g_string_set_size(_string:PGString; len:Tgsize):PGString;cdecl;external;
(* Const before type ignored *)
function g_string_insert_len(_string:PGString; pos:Tgssize; val:Pgchar; len:Tgssize):PGString;cdecl;external;
(* Const before type ignored *)
function g_string_append(_string:PGString; val:Pgchar):PGString;cdecl;external;
(* Const before type ignored *)
function g_string_append_len(_string:PGString; val:Pgchar; len:Tgssize):PGString;cdecl;external;
function g_string_append_c(_string:PGString; c:Tgchar):PGString;cdecl;external;
function g_string_append_unichar(_string:PGString; wc:Tgunichar):PGString;cdecl;external;
(* Const before type ignored *)
function g_string_prepend(_string:PGString; val:Pgchar):PGString;cdecl;external;
function g_string_prepend_c(_string:PGString; c:Tgchar):PGString;cdecl;external;
function g_string_prepend_unichar(_string:PGString; wc:Tgunichar):PGString;cdecl;external;
(* Const before type ignored *)
function g_string_prepend_len(_string:PGString; val:Pgchar; len:Tgssize):PGString;cdecl;external;
(* Const before type ignored *)
function g_string_insert(_string:PGString; pos:Tgssize; val:Pgchar):PGString;cdecl;external;
function g_string_insert_c(_string:PGString; pos:Tgssize; c:Tgchar):PGString;cdecl;external;
function g_string_insert_unichar(_string:PGString; pos:Tgssize; wc:Tgunichar):PGString;cdecl;external;
(* Const before type ignored *)
function g_string_overwrite(_string:PGString; pos:Tgsize; val:Pgchar):PGString;cdecl;external;
(* Const before type ignored *)
function g_string_overwrite_len(_string:PGString; pos:Tgsize; val:Pgchar; len:Tgssize):PGString;cdecl;external;
function g_string_erase(_string:PGString; pos:Tgssize; len:Tgssize):PGString;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_string_replace(_string:PGString; find:Pgchar; replace:Pgchar; limit:Tguint):Tguint;cdecl;external;
function g_string_ascii_down(_string:PGString):PGString;cdecl;external;
function g_string_ascii_up(_string:PGString):PGString;cdecl;external;
(* Const before type ignored *)
procedure g_string_vprintf(_string:PGString; format:Pgchar; args:Tva_list);cdecl;external;
(* Const before type ignored *)
procedure g_string_printf(_string:PGString; format:Pgchar; args:array of const);cdecl;external;
procedure g_string_printf(_string:PGString; format:Pgchar);cdecl;external;
(* Const before type ignored *)
procedure g_string_append_vprintf(_string:PGString; format:Pgchar; args:Tva_list);cdecl;external;
(* Const before type ignored *)
procedure g_string_append_printf(_string:PGString; format:Pgchar; args:array of const);cdecl;external;
procedure g_string_append_printf(_string:PGString; format:Pgchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_string_append_uri_escaped(_string:PGString; unescaped:Pgchar; reserved_chars_allowed:Pgchar; allow_utf8:Tgboolean):PGString;cdecl;external;
{$ifdef G_CAN_INLINE}
{$if defined (_MSC_VER) && !defined (__clang__)}
(** unsupported pragma#pragma warning (push)*)
(** unsupported pragma#pragma warning (disable : 4141) /* silence "warning C4141: 'inline' used more than once" */*)
{$endif}
{$ifndef __GTK_DOC_IGNORE__}
{
G_ALWAYS_INLINE
static inline GString*
g_string_append_c_inline (GString *gstring,
                          gchar    c)

  if (G_LIKELY (gstring != NULL &&
                gstring->len + 1 < gstring->allocated_len))
    
      gstring->str[gstring->len++] = c;
      gstring->str[gstring->len] = 0;
    
  else
    g_string_insert_c (gstring, -1, c);
  return gstring;


#define g_string_append_c(gstr,c) \
  g_string_append_c_inline (gstr, c)

G_ALWAYS_INLINE
static inline GString *
g_string_append_len_inline (GString    *gstring,
                            const char *val,
                            gssize      len)

  gsize len_unsigned;

  if G_UNLIKELY (gstring == NULL)
    return g_string_append_len (gstring, val, len);

  if G_UNLIKELY (val == NULL)
    return (len != 0) ? g_string_append_len (gstring, val, len) : gstring;

  if (len < 0)
    len_unsigned = strlen (val);
  else
    len_unsigned = (gsize) len;

  if (G_LIKELY (gstring->len + len_unsigned < gstring->allocated_len))
    
      char *end = gstring->str + gstring->len;
      if (G_LIKELY (val + len_unsigned <= end || val > end + len_unsigned))
        memcpy (end, val, len_unsigned);
      else
        memmove (end, val, len_unsigned);
      gstring->len += len_unsigned;
      gstring->str[gstring->len] = 0;
      return gstring;
    
  else
    return g_string_insert_len (gstring, -1, val, len);

 }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function g_string_append_len(gstr,val,len : longint) : longint;

{
G_ALWAYS_INLINE
static inline GString *
g_string_truncate_inline (GString *gstring,
                          gsize    len)

  gstring->len = MIN (len, gstring->len);
  gstring->str[gstring->len] = '\0';
  return gstring;

 }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_string_truncate(gstr,len : longint) : longint;

{
#if G_GNUC_CHECK_VERSION (2, 0)

#define g_string_append(gstr, val)                  \
  (__builtin_constant_p (val) ?                     \
    G_GNUC_EXTENSION (                             \
      const char * const __val = (val);             \
      g_string_append_len (gstr, __val,             \
        G_LIKELY (__val != NULL) ?                  \
          (gssize) strlen (_G_STR_NONNULL (__val))  \
        : (gssize) -1);                             \
    )                                              \
    :                                               \
    g_string_append_len (gstr, val, (gssize) -1))

#endif

#endif 
 }
{$if defined (_MSC_VER) && !defined (__clang__)}
(** unsupported pragma#pragma warning (pop) /* #pragma warning (disable : 4141) */*)
{$endif}
{$endif}
{ G_CAN_INLINE  }

function g_string_down(_string:PGString):PGString;cdecl;external;
function g_string_up(_string:PGString):PGString;cdecl;external;
{#define  g_string_sprintf  g_string_printf _MACRO_IN_2_26_FOR(g_string_printf) }
{#define  g_string_sprintfa g_string_append_printf _MACRO_IN_2_26_FOR(g_string_append_printf) }
{$endif}
{ __G_STRING_H__  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_string_append_len(gstr,val,len : longint) : longint;
begin
  g_string_append_len:=g_string_append_len_inline(gstr,val,len);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_string_truncate(gstr,len : longint) : longint;
begin
  g_string_truncate:=g_string_truncate_inline(gstr,len);
end;


end.
