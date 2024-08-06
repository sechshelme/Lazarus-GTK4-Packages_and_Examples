
unit gtypes;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtypes.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtypes.h
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
Pgatomicrefcount  = ^gatomicrefcount;
Pgboolean  = ^gboolean;
Pgchar  = ^gchar;
Pgconstpointer  = ^gconstpointer;
Pgdouble  = ^gdouble;
PGDoubleIEEE754  = ^GDoubleIEEE754;
Pgfloat  = ^gfloat;
PGFloatIEEE754  = ^GFloatIEEE754;
Pgint  = ^gint;
Pglong  = ^glong;
Pgpointer  = ^gpointer;
Pgrefcount  = ^grefcount;
Pgshort  = ^gshort;
PGTimeVal  = ^GTimeVal;
PGTranslateFunc  = ^GTranslateFunc;
Pguchar  = ^guchar;
Pguint  = ^guint;
Pgulong  = ^gulong;
Pgushort  = ^gushort;
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
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the GNU
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
{$ifndef __G_TYPES_H__}
{$define __G_TYPES_H__}
{$if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)}
{$error "Only <glib.h> can be included directly."}
{$endif}
{$include <glibconfig.h>}
{$include <glib/gmacros.h>}
{$include <glib/gversionmacros.h>}
{ Must be included after the 3 headers above  }
{$include <glib/glib-visibility.h>}
{$include <time.h>}
{ Provide type definitions for commonly used types.
 *  These are useful because a "gint8" can be adjusted
 *  to be 1 byte (8 bits) on all platforms. Similarly and
 *  more importantly, "gint32" can be adjusted to be
 *  4 bytes (32 bits) on all platforms.
  }
type
  Pgchar = ^Tgchar;
  Tgchar = char;

  Pgshort = ^Tgshort;
  Tgshort = smallint;

  Pglong = ^Tglong;
  Tglong = longint;

  Pgint = ^Tgint;
  Tgint = longint;

  Pgboolean = ^Tgboolean;
  Tgboolean = Tgint;

  Pguchar = ^Tguchar;
  Tguchar = byte;

  Pgushort = ^Tgushort;
  Tgushort = word;

  Pgulong = ^Tgulong;
  Tgulong = dword;

  Pguint = ^Tguint;
  Tguint = dword;

  Pgfloat = ^Tgfloat;
  Tgfloat = single;

  Pgdouble = ^Tgdouble;
  Tgdouble = Tdouble;
{ Define min and max constants for the fixed size numerical types  }
{*
 * G_MININT8: (value -128)
 *
 * The minimum value which can be held in a #gint8.
 *
 * Since: 2.4
  }

{ was #define dname def_expr }
function G_MININT8 : Tgint8;  

{ was #define dname def_expr }
function G_MAXINT8 : Tgint8;  

{ was #define dname def_expr }
function G_MAXUINT8 : Tguint8;  

{*
 * G_MININT16: (value -32768)
 *
 * The minimum value which can be held in a #gint16.
 *
 * Since: 2.4
  }
{ was #define dname def_expr }
function G_MININT16 : Tgint16;  

{ was #define dname def_expr }
function G_MAXINT16 : Tgint16;  

{ was #define dname def_expr }
function G_MAXUINT16 : Tguint16;  

{*
 * G_MININT32: (value -2147483648)
 *
 * The minimum value which can be held in a #gint32.
 *
 * Since: 2.4
  }
{ was #define dname def_expr }
function G_MININT32 : Tgint32;  

{ was #define dname def_expr }
function G_MAXINT32 : Tgint32;  

{ was #define dname def_expr }
function G_MAXUINT32 : Tguint32;  

{*
 * G_MININT64: (value -9223372036854775808)
 *
 * The minimum value which can be held in a #gint64.
  }
{ was #define dname def_expr }
function G_MININT64 : Tgint64;  

{ was #define dname def_expr }
function G_MAXINT64 : longint; { return type might be wrong }

{ was #define dname def_expr }
function G_MAXUINT64 : longint; { return type might be wrong }

type
  Pgpointer = ^Tgpointer;
  Tgpointer = pointer;
(* Const before type ignored *)

  Pgconstpointer = ^Tgconstpointer;
  Tgconstpointer = pointer;

  TGCompareFunc = function (a:Tgconstpointer; b:Tgconstpointer):Tgint;cdecl;

  TGCompareDataFunc = function (a:Tgconstpointer; b:Tgconstpointer; user_data:Tgpointer):Tgint;cdecl;

  TGEqualFunc = function (a:Tgconstpointer; b:Tgconstpointer):Tgboolean;cdecl;
{*
 * GEqualFuncFull:
 * @a: a value
 * @b: a value to compare with
 * @user_data: user data provided by the caller
 *
 * Specifies the type of a function used to test two values for
 * equality. The function should return %TRUE if both values are equal
 * and %FALSE otherwise.
 *
 * This is a version of #GEqualFunc which provides a @user_data closure from
 * the caller.
 *
 * Returns: %TRUE if @a = @b; %FALSE otherwise
 * Since: 2.74
  }

  TGEqualFuncFull = function (a:Tgconstpointer; b:Tgconstpointer; user_data:Tgpointer):Tgboolean;cdecl;

  TGDestroyNotify = procedure (data:Tgpointer);cdecl;

  TGFunc = procedure (data:Tgpointer; user_data:Tgpointer);cdecl;

  TGHashFunc = function (key:Tgconstpointer):Tguint;cdecl;

  TGHFunc = procedure (key:Tgpointer; value:Tgpointer; user_data:Tgpointer);cdecl;
{*
 * GCopyFunc:
 * @src: (not nullable): A pointer to the data which should be copied
 * @data: Additional data
 *
 * A function of this signature is used to copy the node data
 * when doing a deep-copy of a tree.
 *
 * Returns: (not nullable): A pointer to the copy
 *
 * Since: 2.4
  }

  TGCopyFunc = function (src:Tgconstpointer; data:Tgpointer):Tgpointer;cdecl;
{*
 * GFreeFunc:
 * @data: a data pointer
 *
 * Declares a type of function which takes an arbitrary
 * data pointer argument and has no return value. It is
 * not currently used in GLib or GTK.
  }

  TGFreeFunc = procedure (data:Tgpointer);cdecl;
{*
 * GTranslateFunc:
 * @str: the untranslated string
 * @data: user data specified when installing the function, e.g.
 *  in g_option_group_set_translate_func()
 * 
 * The type of functions which are used to translate user-visible
 * strings, for <option>--help</option> output.
 * 
 * Returns: a translation of the string for the current locale.
 *  The returned string is owned by GLib and must not be freed.
  }
(* Const before type ignored *)
(* Const before type ignored *)

  PGTranslateFunc = ^TGTranslateFunc;
  TGTranslateFunc = function (str:Pgchar; data:Tgpointer):Pgchar;cdecl;
{ Define some mathematical constants that aren't available
 * symbolically in some strict ISO C implementations.
 *
 * Note that the large number of digits used in these definitions
 * doesn't imply that GLib or current computers in general would be
 * able to handle floating point numbers with an accuracy like this.
 * It's mostly an exercise in futility and future proofing. For
 * extended precision floating point support, look somewhere else
 * than GLib.
  }

const
  G_E = 2.7182818284590452353602874713526624977572470937000;  
  G_LN2 = 0.69314718055994530941723212145817656807550013436026;  
  G_LN10 = 2.3025850929940456840179914546843642076011014886288;  
  G_PI = 3.1415926535897932384626433832795028841971693993751;  
  G_PI_2 = 1.5707963267948966192313216916397514420985846996876;  
  G_PI_4 = 0.78539816339744830961566084581987572104929234984378;  
  G_SQRT2 = 1.4142135623730950488016887242096980785696718753769;  
{ Portable endian checks and conversions
 *
 * glibconfig.h defines G_BYTE_ORDER which expands to one of
 * the below macros.
  }
  G_LITTLE_ENDIAN = 1234;  
  G_BIG_ENDIAN = 4321;  
{ unused, need specific PDP check  }  G_PDP_ENDIAN = 3412;  
{ Basic bit swapping functions
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function GUINT16_SWAP_LE_BE_CONSTANT(val : longint) : Tguint16;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GUINT32_SWAP_LE_BE_CONSTANT(val : longint) : Tguint32;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GUINT64_SWAP_LE_BE_CONSTANT(val : longint) : Tguint64;

{ Arch specific stuff for speed
  }
{$if defined (__GNUC__) && (__GNUC__ >= 2) && defined (__OPTIMIZE__)}
{$if __GNUC__ >= 4 && defined (__GNUC_MINOR__) && __GNUC_MINOR__ >= 3}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function GUINT32_SWAP_LE_BE(val : longint) : Tguint32;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GUINT64_SWAP_LE_BE(val : longint) : Tguint64;

{$endif}
{
#  if defined (__i386__)
#    define GUINT16_SWAP_LE_BE_IA32(val) \
       (G_GNUC_EXTENSION					\
	( guint16 __v, __x = ((guint16) (val));		\
	   if (__builtin_constant_p (__x))			\
	     __v = GUINT16_SWAP_LE_BE_CONSTANT (__x);		\
	   else							\
	     __asm__ ("rorw $8, %w0"				\
		      : "=r" (__v)				\
		      : "0" (__x)				\
		      : "cc");					\
	    __v; ))
#    if !defined (__i486__) && !defined (__i586__) \
	&& !defined (__pentium__) && !defined (__i686__) \
	&& !defined (__pentiumpro__) && !defined (__pentium4__)
#       define GUINT32_SWAP_LE_BE_IA32(val) \
	  (G_GNUC_EXTENSION					\
	   ( guint32 __v, __x = ((guint32) (val));		\
	      if (__builtin_constant_p (__x))			\
		__v = GUINT32_SWAP_LE_BE_CONSTANT (__x);	\
	      else						\
		__asm__ ("rorw $8, %w0\n\t"			\
			 "rorl $16, %0\n\t"			\
			 "rorw $8, %w0"				\
			 : "=r" (__v)				\
			 : "0" (__x)				\
			 : "cc");				\
	      __v; ))
#    else //* 486 and higher has bswap 
#       define GUINT32_SWAP_LE_BE_IA32(val) \
	  (G_GNUC_EXTENSION					\
	   ( guint32 __v, __x = ((guint32) (val));		\
	      if (__builtin_constant_p (__x))			\
		__v = GUINT32_SWAP_LE_BE_CONSTANT (__x);	\
	      else						\
		__asm__ ("bswap %0"				\
			 : "=r" (__v)				\
			 : "0" (__x));				\
	      __v; ))
#    endif //* processor specific 32-bit stuff 
#    define GUINT64_SWAP_LE_BE_IA32(val) \
       (G_GNUC_EXTENSION						\
	( union  guint64 __ll;					\
		   guint32 __l[2];  __w, __r;				\
	   __w.__ll = ((guint64) (val));				\
	   if (__builtin_constant_p (__w.__ll))				\
	     __r.__ll = GUINT64_SWAP_LE_BE_CONSTANT (__w.__ll);		\
	   else								\
	     								\
	       __r.__l[0] = GUINT32_SWAP_LE_BE (__w.__l[1]);		\
	       __r.__l[1] = GUINT32_SWAP_LE_BE (__w.__l[0]);		\
	     								\
	   __r.__ll; ))
     //* Possibly just use the constant version and let gcc figure it out? 
#    define GUINT16_SWAP_LE_BE(val) (GUINT16_SWAP_LE_BE_IA32 (val))
#    ifndef GUINT32_SWAP_LE_BE
#      define GUINT32_SWAP_LE_BE(val) (GUINT32_SWAP_LE_BE_IA32 (val))
#    endif
#    ifndef GUINT64_SWAP_LE_BE
#      define GUINT64_SWAP_LE_BE(val) (GUINT64_SWAP_LE_BE_IA32 (val))
#    endif
#  elif defined (__ia64__)
#    define GUINT16_SWAP_LE_BE_IA64(val) \
       (G_GNUC_EXTENSION					\
	( guint16 __v, __x = ((guint16) (val));		\
	   if (__builtin_constant_p (__x))			\
	     __v = GUINT16_SWAP_LE_BE_CONSTANT (__x);		\
	   else							\
	     __asm__ __volatile__ ("shl %0 = %1, 48 ;;"		\
				   "mux1 %0 = %0, @rev ;;"	\
				    : "=r" (__v)		\
				    : "r" (__x));		\
	    __v; ))
#    define GUINT32_SWAP_LE_BE_IA64(val) \
       (G_GNUC_EXTENSION					\
	 ( guint32 __v, __x = ((guint32) (val));		\
	    if (__builtin_constant_p (__x))			\
	      __v = GUINT32_SWAP_LE_BE_CONSTANT (__x);		\
	    else						\
	     __asm__ __volatile__ ("shl %0 = %1, 32 ;;"		\
				   "mux1 %0 = %0, @rev ;;"	\
				    : "=r" (__v)		\
				    : "r" (__x));		\
	    __v; ))
#    define GUINT64_SWAP_LE_BE_IA64(val) \
       (G_GNUC_EXTENSION					\
	( guint64 __v, __x = ((guint64) (val));		\
	   if (__builtin_constant_p (__x))			\
	     __v = GUINT64_SWAP_LE_BE_CONSTANT (__x);		\
	   else							\
	     __asm__ __volatile__ ("mux1 %0 = %1, @rev ;;"	\
				   : "=r" (__v)			\
				   : "r" (__x));		\
	   __v; ))
#    define GUINT16_SWAP_LE_BE(val) (GUINT16_SWAP_LE_BE_IA64 (val))
#    ifndef GUINT32_SWAP_LE_BE
#      define GUINT32_SWAP_LE_BE(val) (GUINT32_SWAP_LE_BE_IA64 (val))
#    endif
#    ifndef GUINT64_SWAP_LE_BE
#      define GUINT64_SWAP_LE_BE(val) (GUINT64_SWAP_LE_BE_IA64 (val))
#    endif
#  elif defined (__x86_64__)
#    define GUINT32_SWAP_LE_BE_X86_64(val) \
       (G_GNUC_EXTENSION					\
	 ( guint32 __v, __x = ((guint32) (val));		\
	    if (__builtin_constant_p (__x))			\
	      __v = GUINT32_SWAP_LE_BE_CONSTANT (__x);		\
	    else						\
	     __asm__ ("bswapl %0"				\
		      : "=r" (__v)				\
		      : "0" (__x));				\
	    __v; ))
#    define GUINT64_SWAP_LE_BE_X86_64(val) \
       (G_GNUC_EXTENSION					\
	( guint64 __v, __x = ((guint64) (val));		\
	   if (__builtin_constant_p (__x))			\
	     __v = GUINT64_SWAP_LE_BE_CONSTANT (__x);		\
	   else							\
	     __asm__ ("bswapq %0"				\
		      : "=r" (__v)				\
		      : "0" (__x));				\
	   __v; ))
     //* gcc seems to figure out optimal code for this on its own  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GUINT16_SWAP_LE_BE(val : longint) : longint;

{$ifndef GUINT32_SWAP_LE_BE}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GUINT32_SWAP_LE_BE(val : longint) : longint;

{$endif}
{$ifndef GUINT64_SWAP_LE_BE}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GUINT64_SWAP_LE_BE(val : longint) : longint;

{$endif}
{$else}
{* generic gcc */ }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GUINT16_SWAP_LE_BE(val : longint) : longint;

{$ifndef GUINT32_SWAP_LE_BE}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GUINT32_SWAP_LE_BE(val : longint) : longint;

{$endif}
{$ifndef GUINT64_SWAP_LE_BE}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GUINT64_SWAP_LE_BE(val : longint) : longint;

{$endif}
{$endif}
{$else}
{* generic */ }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GUINT16_SWAP_LE_BE(val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GUINT32_SWAP_LE_BE(val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GUINT64_SWAP_LE_BE(val : longint) : longint;

{$endif}
{* generic */ }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function GUINT16_SWAP_LE_PDP(val : longint) : Tguint16;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GUINT16_SWAP_BE_PDP(val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GUINT32_SWAP_LE_PDP(val : longint) : Tguint32;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GUINT32_SWAP_BE_PDP(val : longint) : Tguint32;

{ The G*_TO_?E() macros are defined in glibconfig.h.
 * The transformation is symmetric, so the FROM just maps to the TO.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GINT16_FROM_LE(val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GUINT16_FROM_LE(val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GINT16_FROM_BE(val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GUINT16_FROM_BE(val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GINT32_FROM_LE(val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GUINT32_FROM_LE(val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GINT32_FROM_BE(val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GUINT32_FROM_BE(val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GINT64_FROM_LE(val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GUINT64_FROM_LE(val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GINT64_FROM_BE(val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GUINT64_FROM_BE(val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GLONG_FROM_LE(val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GULONG_FROM_LE(val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GLONG_FROM_BE(val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GULONG_FROM_BE(val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GINT_FROM_LE(val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GUINT_FROM_LE(val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GINT_FROM_BE(val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GUINT_FROM_BE(val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GSIZE_FROM_LE(val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GSSIZE_FROM_LE(val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GSIZE_FROM_BE(val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GSSIZE_FROM_BE(val : longint) : longint;

{ Portable versions of host-network order stuff
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_ntohl(val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_ntohs(val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_htonl(val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_htons(val : longint) : longint;

{ Overflow-checked unsigned integer arithmetic
  }
{$ifndef _GLIB_TEST_OVERFLOW_FALLBACK}
{ https://bugzilla.gnome.org/show_bug.cgi?id=769104  }
{$if __GNUC__ >= 5 && !defined(__INTEL_COMPILER)}
{$define _GLIB_HAVE_BUILTIN_OVERFLOW_CHECKS}
(*** was #elif ****){$else g_macro__has_builtin(__builtin_add_overflow)}
{$define _GLIB_HAVE_BUILTIN_OVERFLOW_CHECKS}
{$endif}
{$endif}
{$ifdef _GLIB_HAVE_BUILTIN_OVERFLOW_CHECKS}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function g_uint_checked_add(dest,a,b : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_uint_checked_mul(dest,a,b : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_uint64_checked_add(dest,a,b : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_uint64_checked_mul(dest,a,b : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_size_checked_add(dest,a,b : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_size_checked_mul(dest,a,b : longint) : longint;

{$else}
{ !_GLIB_HAVE_BUILTIN_OVERFLOW_CHECKS  }
{ The names of the following inlines are private.  Use the macro
 * definitions above.
  }
{
static inline gboolean _GLIB_CHECKED_ADD_UINT (guint *dest, guint a, guint b) 
  *dest = a + b; return *dest >= a; 
static inline gboolean _GLIB_CHECKED_MUL_UINT (guint *dest, guint a, guint b) 
  *dest = a * b; return !a || *dest / a == b; 
static inline gboolean _GLIB_CHECKED_ADD_UINT64 (guint64 *dest, guint64 a, guint64 b) 
  *dest = a + b; return *dest >= a; 
static inline gboolean _GLIB_CHECKED_MUL_UINT64 (guint64 *dest, guint64 a, guint64 b) 
  *dest = a * b; return !a || *dest / a == b; 
static inline gboolean _GLIB_CHECKED_ADD_SIZE (gsize *dest, gsize a, gsize b) 
  *dest = a + b; return *dest >= a; 
static inline gboolean _GLIB_CHECKED_MUL_SIZE (gsize *dest, gsize a, gsize b) 
  *dest = a * b; return !a || *dest / a == b; 
 }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function g_uint_checked_add(dest,a,b : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_uint_checked_mul(dest,a,b : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_uint64_checked_add(dest,a,b : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_uint64_checked_mul(dest,a,b : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_size_checked_add(dest,a,b : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_size_checked_mul(dest,a,b : longint) : longint;

{$endif}
{ !_GLIB_HAVE_BUILTIN_OVERFLOW_CHECKS  }
{ IEEE Standard 754 Single Precision Storage Format (gfloat):
 *
 *        31 30           23 22            0
 * +--------+---------------+---------------+
 * | s 1bit | e[30:23] 8bit | f[22:0] 23bit |
 * +--------+---------------+---------------+
 * B0------------------->B1------->B2-->B3-->
 *
 * IEEE Standard 754 Double Precision Storage Format (gdouble):
 *
 *        63 62            52 51            32   31            0
 * +--------+----------------+----------------+ +---------------+
 * | s 1bit | e[62:52] 11bit | f[51:32] 20bit | | f[31:0] 32bit |
 * +--------+----------------+----------------+ +---------------+
 * B0--------------->B1---------->B2--->B3---->  B4->B5->B6->B7->
  }
{ subtract from biased_exponent to form base2 exponent (normal numbers)  }
type
  PGDoubleIEEE754 = ^TGDoubleIEEE754;
  TGDoubleIEEE754 = TGDoubleIEEE754;

  PGFloatIEEE754 = ^TGFloatIEEE754;
  TGFloatIEEE754 = TGFloatIEEE754;

const
  G_IEEE754_FLOAT_BIAS = 127;  
  G_IEEE754_DOUBLE_BIAS = 1023;  
{ multiply with base2 exponent to get base10 exponent (normal numbers)  }
  G_LOG_2_BASE_10 = 0.30102999566398119521;  
{$if G_BYTE_ORDER == G_LITTLE_ENDIAN}
type
  PGFloatIEEE754 = ^TGFloatIEEE754;
  TGFloatIEEE754 = record
      case longint of
        0 : ( v_float : Tgfloat );
        1 : ( mpn : record
            flag0 : longint;
          end );
      end;


const
  bm_TGFloatIEEE754_mantissa = $7FFFFF;
  bp_TGFloatIEEE754_mantissa = 0;
  bm_TGFloatIEEE754_biased_exponent = $7F800000;
  bp_TGFloatIEEE754_biased_exponent = 23;
  bm_TGFloatIEEE754_sign = $80000000;
  bp_TGFloatIEEE754_sign = 31;

type
  PGDoubleIEEE754 = ^TGDoubleIEEE754;
  TGDoubleIEEE754 = record
      case longint of
        0 : ( v_double : Tgdouble );
        1 : ( mpn : record
            flag0 : longint;
            flag1 : longint;
          end );
      end;


const
  bm_TGDoubleIEEE754_mantissa_low = $FFFFFFFF;
  bp_TGDoubleIEEE754_mantissa_low = 0;
  bm_TGDoubleIEEE754_mantissa_high = $FFFFF;
  bp_TGDoubleIEEE754_mantissa_high = 0;
  bm_TGDoubleIEEE754_biased_exponent = $7FF00000;
  bp_TGDoubleIEEE754_biased_exponent = 20;
  bm_TGDoubleIEEE754_sign = $80000000;
  bp_TGDoubleIEEE754_sign = 31;

(*** was #elif ****){$else G_BYTE_ORDER == G_BIG_ENDIAN}
type
  PGFloatIEEE754 = ^TGFloatIEEE754;
  TGFloatIEEE754 = record
      case longint of
        0 : ( v_float : Tgfloat );
        1 : ( mpn : record
            flag0 : longint;
          end );
      end;


const
  bm_TGFloatIEEE754_sign = $1;
  bp_TGFloatIEEE754_sign = 0;
  bm_TGFloatIEEE754_biased_exponent = $1FE;
  bp_TGFloatIEEE754_biased_exponent = 1;
  bm_TGFloatIEEE754_mantissa = $FFFFFE00;
  bp_TGFloatIEEE754_mantissa = 9;

type
  PGDoubleIEEE754 = ^TGDoubleIEEE754;
  TGDoubleIEEE754 = record
      case longint of
        0 : ( v_double : Tgdouble );
        1 : ( mpn : record
            flag0 : longint;
            flag1 : longint;
          end );
      end;


const
  bm_TGDoubleIEEE754_sign = $1;
  bp_TGDoubleIEEE754_sign = 0;
  bm_TGDoubleIEEE754_biased_exponent = $FFE;
  bp_TGDoubleIEEE754_biased_exponent = 1;
  bm_TGDoubleIEEE754_mantissa_high = $FFFFF000;
  bp_TGDoubleIEEE754_mantissa_high = 12;
  bm_TGDoubleIEEE754_mantissa_low = $FFFFFFFF;
  bp_TGDoubleIEEE754_mantissa_low = 0;

{$else}
{ !G_LITTLE_ENDIAN && !G_BIG_ENDIAN  }
{$error unknown ENDIAN type}
{$endif}
{ !G_LITTLE_ENDIAN && !G_BIG_ENDIAN  }
type
  PGTimeVal = ^TGTimeVal;
  TGTimeVal = record
      tv_sec : Tglong;
      tv_usec : Tglong;
    end;


  Pgrefcount = ^Tgrefcount;
  Tgrefcount = Tgint;

  Pgatomicrefcount = ^Tgatomicrefcount;
  Tgatomicrefcount = Tgint;
{ should be accessed only using atomics  }
{$endif}
{ __G_TYPES_H__  }

implementation

{ was #define dname def_expr }
function G_MININT8 : Tgint8;
  begin
    G_MININT8:=Tgint8((-(G_MAXINT8))-1);
  end;

{ was #define dname def_expr }
function G_MAXINT8 : Tgint8;
  begin
    G_MAXINT8:=Tgint8($7f);
  end;

{ was #define dname def_expr }
function G_MAXUINT8 : Tguint8;
  begin
    G_MAXUINT8:=Tguint8($ff);
  end;

{ was #define dname def_expr }
function G_MININT16 : Tgint16;
  begin
    G_MININT16:=Tgint16((-(G_MAXINT16))-1);
  end;

{ was #define dname def_expr }
function G_MAXINT16 : Tgint16;
  begin
    G_MAXINT16:=Tgint16($7fff);
  end;

{ was #define dname def_expr }
function G_MAXUINT16 : Tguint16;
  begin
    G_MAXUINT16:=Tguint16($ffff);
  end;

{ was #define dname def_expr }
function G_MININT32 : Tgint32;
  begin
    G_MININT32:=Tgint32((-(G_MAXINT32))-1);
  end;

{ was #define dname def_expr }
function G_MAXINT32 : Tgint32;
  begin
    G_MAXINT32:=Tgint32($7fffffff);
  end;

{ was #define dname def_expr }
function G_MAXUINT32 : Tguint32;
  begin
    G_MAXUINT32:=Tguint32($ffffffff);
  end;

{ was #define dname def_expr }
function G_MININT64 : Tgint64;
  begin
    G_MININT64:=Tgint64((-(G_MAXINT64))-(G_GINT64_CONSTANT(1)));
  end;

{ was #define dname def_expr }
function G_MAXINT64 : longint; { return type might be wrong }
  begin
    G_MAXINT64:=G_GINT64_CONSTANT($7fffffffffffffff);
  end;

{ was #define dname def_expr }
function G_MAXUINT64 : longint; { return type might be wrong }
  begin
    G_MAXUINT64:=G_GUINT64_CONSTANT($ffffffffffffffff);
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GUINT16_SWAP_LE_BE_CONSTANT(val : longint) : Tguint16;
begin
  GUINT16_SWAP_LE_BE_CONSTANT:=Tguint16((Tguint16((Tguint16(val)) shr 8)) or (Tguint16((Tguint16(val)) shl 8)));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GUINT32_SWAP_LE_BE_CONSTANT(val : longint) : Tguint32;
begin
  GUINT32_SWAP_LE_BE_CONSTANT:=Tguint32(((((Tguint32(Tval(@(Tguint32($000000ff))))) shl 24) or ((Tguint32(Tval(@(Tguint32($0000ff00))))) shl 8)) or ((Tguint32(Tval(@(Tguint32($00ff0000))))) shr 8)) or ((Tguint32(Tval(@(Tguint32($ff000000))))) shr 24));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GUINT64_SWAP_LE_BE_CONSTANT(val : longint) : Tguint64;
begin
  GUINT64_SWAP_LE_BE_CONSTANT:=Tguint64(((((((((Tguint64(Tval(@(Tguint64(G_GINT64_CONSTANT($00000000000000ff)))))) shl 56) or ((Tguint64(Tval(@(Tguint64(G_GINT64_CONSTANT($000000000000ff00)))))) shl 40)) or ((Tguint64(Tval(@(Tguint64(G_GINT64_CONSTANT($0000000000ff0000)))))) shl 24)) or ((Tguint64(Tval(@(Tguint64(G_GINT64_CONSTANT($00000000ff000000)))))) shl 8)) or ((Tguint64(Tval(@(Tguint64(G_GINT64_CONSTANT($000000ff00000000)))))) shr 8)) or ((Tguint64(Tval(@(Tguint64(G_GINT64_CONSTANT($0000ff0000000000)))))) shr 24)) or ((Tguint64(Tval(@(Tguint64(G_GINT64_CONSTANT($00ff000000000000)))))) shr 40)) or ((Tguint64(Tval(@(Tguint64(G_GINT64_CONSTANT($ff00000000000000)))))) shr 56));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GUINT32_SWAP_LE_BE(val : longint) : Tguint32;
begin
  GUINT32_SWAP_LE_BE:=Tguint32(__builtin_bswap32(Tguint32(val)));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GUINT64_SWAP_LE_BE(val : longint) : Tguint64;
begin
  GUINT64_SWAP_LE_BE:=Tguint64(__builtin_bswap64(Tguint64(val)));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GUINT16_SWAP_LE_BE(val : longint) : longint;
begin
  GUINT16_SWAP_LE_BE:=GUINT16_SWAP_LE_BE_CONSTANT(val);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GUINT32_SWAP_LE_BE(val : longint) : longint;
begin
  GUINT32_SWAP_LE_BE:=GUINT32_SWAP_LE_BE_X86_64(val);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GUINT64_SWAP_LE_BE(val : longint) : longint;
begin
  GUINT64_SWAP_LE_BE:=GUINT64_SWAP_LE_BE_X86_64(val);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GUINT16_SWAP_LE_BE(val : longint) : longint;
begin
  GUINT16_SWAP_LE_BE:=GUINT16_SWAP_LE_BE_CONSTANT(val);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GUINT32_SWAP_LE_BE(val : longint) : longint;
begin
  GUINT32_SWAP_LE_BE:=GUINT32_SWAP_LE_BE_CONSTANT(val);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GUINT64_SWAP_LE_BE(val : longint) : longint;
begin
  GUINT64_SWAP_LE_BE:=GUINT64_SWAP_LE_BE_CONSTANT(val);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GUINT16_SWAP_LE_BE(val : longint) : longint;
begin
  GUINT16_SWAP_LE_BE:=GUINT16_SWAP_LE_BE_CONSTANT(val);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GUINT32_SWAP_LE_BE(val : longint) : longint;
begin
  GUINT32_SWAP_LE_BE:=GUINT32_SWAP_LE_BE_CONSTANT(val);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GUINT64_SWAP_LE_BE(val : longint) : longint;
begin
  GUINT64_SWAP_LE_BE:=GUINT64_SWAP_LE_BE_CONSTANT(val);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GUINT16_SWAP_LE_PDP(val : longint) : Tguint16;
begin
  GUINT16_SWAP_LE_PDP:=Tguint16(val);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GUINT16_SWAP_BE_PDP(val : longint) : longint;
begin
  GUINT16_SWAP_BE_PDP:=GUINT16_SWAP_LE_BE(val);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GUINT32_SWAP_LE_PDP(val : longint) : Tguint32;
begin
  GUINT32_SWAP_LE_PDP:=Tguint32(((Tguint32(Tval(@(Tguint32($0000ffff))))) shl 16) or ((Tguint32(Tval(@(Tguint32($ffff0000))))) shr 16));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GUINT32_SWAP_BE_PDP(val : longint) : Tguint32;
begin
  GUINT32_SWAP_BE_PDP:=Tguint32(((Tguint32(Tval(@(Tguint32($00ff00ff))))) shl 8) or ((Tguint32(Tval(@(Tguint32($ff00ff00))))) shr 8));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GINT16_FROM_LE(val : longint) : longint;
begin
  GINT16_FROM_LE:=GINT16_TO_LE(val);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GUINT16_FROM_LE(val : longint) : longint;
begin
  GUINT16_FROM_LE:=GUINT16_TO_LE(val);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GINT16_FROM_BE(val : longint) : longint;
begin
  GINT16_FROM_BE:=GINT16_TO_BE(val);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GUINT16_FROM_BE(val : longint) : longint;
begin
  GUINT16_FROM_BE:=GUINT16_TO_BE(val);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GINT32_FROM_LE(val : longint) : longint;
begin
  GINT32_FROM_LE:=GINT32_TO_LE(val);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GUINT32_FROM_LE(val : longint) : longint;
begin
  GUINT32_FROM_LE:=GUINT32_TO_LE(val);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GINT32_FROM_BE(val : longint) : longint;
begin
  GINT32_FROM_BE:=GINT32_TO_BE(val);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GUINT32_FROM_BE(val : longint) : longint;
begin
  GUINT32_FROM_BE:=GUINT32_TO_BE(val);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GINT64_FROM_LE(val : longint) : longint;
begin
  GINT64_FROM_LE:=GINT64_TO_LE(val);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GUINT64_FROM_LE(val : longint) : longint;
begin
  GUINT64_FROM_LE:=GUINT64_TO_LE(val);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GINT64_FROM_BE(val : longint) : longint;
begin
  GINT64_FROM_BE:=GINT64_TO_BE(val);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GUINT64_FROM_BE(val : longint) : longint;
begin
  GUINT64_FROM_BE:=GUINT64_TO_BE(val);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GLONG_FROM_LE(val : longint) : longint;
begin
  GLONG_FROM_LE:=GLONG_TO_LE(val);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GULONG_FROM_LE(val : longint) : longint;
begin
  GULONG_FROM_LE:=GULONG_TO_LE(val);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GLONG_FROM_BE(val : longint) : longint;
begin
  GLONG_FROM_BE:=GLONG_TO_BE(val);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GULONG_FROM_BE(val : longint) : longint;
begin
  GULONG_FROM_BE:=GULONG_TO_BE(val);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GINT_FROM_LE(val : longint) : longint;
begin
  GINT_FROM_LE:=GINT_TO_LE(val);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GUINT_FROM_LE(val : longint) : longint;
begin
  GUINT_FROM_LE:=GUINT_TO_LE(val);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GINT_FROM_BE(val : longint) : longint;
begin
  GINT_FROM_BE:=GINT_TO_BE(val);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GUINT_FROM_BE(val : longint) : longint;
begin
  GUINT_FROM_BE:=GUINT_TO_BE(val);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GSIZE_FROM_LE(val : longint) : longint;
begin
  GSIZE_FROM_LE:=GSIZE_TO_LE(val);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GSSIZE_FROM_LE(val : longint) : longint;
begin
  GSSIZE_FROM_LE:=GSSIZE_TO_LE(val);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GSIZE_FROM_BE(val : longint) : longint;
begin
  GSIZE_FROM_BE:=GSIZE_TO_BE(val);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GSSIZE_FROM_BE(val : longint) : longint;
begin
  GSSIZE_FROM_BE:=GSSIZE_TO_BE(val);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_ntohl(val : longint) : longint;
begin
  g_ntohl:=GUINT32_FROM_BE(val);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_ntohs(val : longint) : longint;
begin
  g_ntohs:=GUINT16_FROM_BE(val);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_htonl(val : longint) : longint;
begin
  g_htonl:=GUINT32_TO_BE(val);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_htons(val : longint) : longint;
begin
  g_htons:=GUINT16_TO_BE(val);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_uint_checked_add(dest,a,b : longint) : longint;
begin
  g_uint_checked_add:= not (__builtin_add_overflow(a,b,dest));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_uint_checked_mul(dest,a,b : longint) : longint;
begin
  g_uint_checked_mul:= not (__builtin_mul_overflow(a,b,dest));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_uint64_checked_add(dest,a,b : longint) : longint;
begin
  g_uint64_checked_add:= not (__builtin_add_overflow(a,b,dest));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_uint64_checked_mul(dest,a,b : longint) : longint;
begin
  g_uint64_checked_mul:= not (__builtin_mul_overflow(a,b,dest));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_size_checked_add(dest,a,b : longint) : longint;
begin
  g_size_checked_add:= not (__builtin_add_overflow(a,b,dest));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_size_checked_mul(dest,a,b : longint) : longint;
begin
  g_size_checked_mul:= not (__builtin_mul_overflow(a,b,dest));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_uint_checked_add(dest,a,b : longint) : longint;
begin
  g_uint_checked_add:=_GLIB_CHECKED_ADD_UINT(dest,a,b);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_uint_checked_mul(dest,a,b : longint) : longint;
begin
  g_uint_checked_mul:=_GLIB_CHECKED_MUL_UINT(dest,a,b);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_uint64_checked_add(dest,a,b : longint) : longint;
begin
  g_uint64_checked_add:=_GLIB_CHECKED_ADD_UINT64(dest,a,b);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_uint64_checked_mul(dest,a,b : longint) : longint;
begin
  g_uint64_checked_mul:=_GLIB_CHECKED_MUL_UINT64(dest,a,b);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_size_checked_add(dest,a,b : longint) : longint;
begin
  g_size_checked_add:=_GLIB_CHECKED_ADD_SIZE(dest,a,b);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_size_checked_mul(dest,a,b : longint) : longint;
begin
  g_size_checked_mul:=_GLIB_CHECKED_MUL_SIZE(dest,a,b);
end;


end.
