
unit garray;
interface

{
  Automatically converted by H2Pas 1.0.0 from garray.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    garray.h
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
PGArray  = ^GArray;
PGByteArray  = ^GByteArray;
PGBytes  = ^GBytes;
Pgchar  = ^gchar;
Pgpointer  = ^gpointer;
PGPtrArray  = ^GPtrArray;
Pgsize  = ^gsize;
Pguint  = ^guint;
Pguint8  = ^guint8;
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
{$ifndef __G_ARRAY_H__}
{$define __G_ARRAY_H__}
{$if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)}
{$error "Only <glib.h> can be included directly."}
{$endif}
{$include <glib/gtypes.h>}
type
  PGArray = ^TGArray;
  TGArray = record
      data : Pgchar;
      len : Tguint;
    end;

  PGByteArray = ^TGByteArray;
  TGByteArray = record
      data : Pguint8;
      len : Tguint;
    end;

  PGPtrArray = ^TGPtrArray;
  TGPtrArray = record
      pdata : Pgpointer;
      len : Tguint;
    end;

{ Resizable arrays. remove fills any cleared spot and shortens the
 * array, while preserving the order. remove_fast will distort the
 * order by moving the last element to the position of the removed.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function g_array_append_val(a,v : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_array_prepend_val(a,v : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_array_insert_val(a,i,v : longint) : longint;

{ #define g_array_index(a,t,i)      (((t*) (void *) (a)->data) [(i)]) }
function g_array_new(zero_terminated:Tgboolean; clear_:Tgboolean; element_size:Tguint):PGArray;cdecl;external;
function g_array_new_take(data:Tgpointer; len:Tgsize; clear:Tgboolean; element_size:Tgsize):PGArray;cdecl;external;
function g_array_new_take_zero_terminated(data:Tgpointer; clear:Tgboolean; element_size:Tgsize):PGArray;cdecl;external;
function g_array_steal(array:PGArray; len:Pgsize):Tgpointer;cdecl;external;
function g_array_sized_new(zero_terminated:Tgboolean; clear_:Tgboolean; element_size:Tguint; reserved_size:Tguint):PGArray;cdecl;external;
function g_array_copy(array:PGArray):PGArray;cdecl;external;
function g_array_free(array:PGArray; free_segment:Tgboolean):Pgchar;cdecl;external;
function g_array_ref(array:PGArray):PGArray;cdecl;external;
procedure g_array_unref(array:PGArray);cdecl;external;
function g_array_get_element_size(array:PGArray):Tguint;cdecl;external;
function g_array_append_vals(array:PGArray; data:Tgconstpointer; len:Tguint):PGArray;cdecl;external;
function g_array_prepend_vals(array:PGArray; data:Tgconstpointer; len:Tguint):PGArray;cdecl;external;
function g_array_insert_vals(array:PGArray; index_:Tguint; data:Tgconstpointer; len:Tguint):PGArray;cdecl;external;
function g_array_set_size(array:PGArray; length:Tguint):PGArray;cdecl;external;
function g_array_remove_index(array:PGArray; index_:Tguint):PGArray;cdecl;external;
function g_array_remove_index_fast(array:PGArray; index_:Tguint):PGArray;cdecl;external;
function g_array_remove_range(array:PGArray; index_:Tguint; length:Tguint):PGArray;cdecl;external;
procedure g_array_sort(array:PGArray; compare_func:TGCompareFunc);cdecl;external;
procedure g_array_sort_with_data(array:PGArray; compare_func:TGCompareDataFunc; user_data:Tgpointer);cdecl;external;
function g_array_binary_search(array:PGArray; target:Tgconstpointer; compare_func:TGCompareFunc; out_match_index:Pguint):Tgboolean;cdecl;external;
procedure g_array_set_clear_func(array:PGArray; clear_func:TGDestroyNotify);cdecl;external;
{ Resizable pointer array.  This interface is much less complicated
 * than the above.  Add appends a pointer.  Remove fills any cleared 
 * spot and shortens the array. remove_fast will again distort order.  
  }
{#define    g_ptr_array_index(array,index_) ((array)->pdata)[index_] }
function g_ptr_array_new:PGPtrArray;cdecl;external;
function g_ptr_array_new_with_free_func(element_free_func:TGDestroyNotify):PGPtrArray;cdecl;external;
function g_ptr_array_new_take(data:Pgpointer; len:Tgsize; element_free_func:TGDestroyNotify):PGPtrArray;cdecl;external;
function g_ptr_array_new_from_array(data:Pgpointer; len:Tgsize; copy_func:TGCopyFunc; copy_func_user_data:Tgpointer; element_free_func:TGDestroyNotify):PGPtrArray;cdecl;external;
function g_ptr_array_steal(array:PGPtrArray; len:Pgsize):Pgpointer;cdecl;external;
function g_ptr_array_copy(array:PGPtrArray; func:TGCopyFunc; user_data:Tgpointer):PGPtrArray;cdecl;external;
function g_ptr_array_sized_new(reserved_size:Tguint):PGPtrArray;cdecl;external;
function g_ptr_array_new_full(reserved_size:Tguint; element_free_func:TGDestroyNotify):PGPtrArray;cdecl;external;
function g_ptr_array_new_null_terminated(reserved_size:Tguint; element_free_func:TGDestroyNotify; null_terminated:Tgboolean):PGPtrArray;cdecl;external;
function g_ptr_array_new_take_null_terminated(data:Pgpointer; element_free_func:TGDestroyNotify):PGPtrArray;cdecl;external;
function g_ptr_array_new_from_null_terminated_array(data:Pgpointer; copy_func:TGCopyFunc; copy_func_user_data:Tgpointer; element_free_func:TGDestroyNotify):PGPtrArray;cdecl;external;
function g_ptr_array_free(array:PGPtrArray; free_seg:Tgboolean):Pgpointer;cdecl;external;
function g_ptr_array_ref(array:PGPtrArray):PGPtrArray;cdecl;external;
procedure g_ptr_array_unref(array:PGPtrArray);cdecl;external;
procedure g_ptr_array_set_free_func(array:PGPtrArray; element_free_func:TGDestroyNotify);cdecl;external;
procedure g_ptr_array_set_size(array:PGPtrArray; length:Tgint);cdecl;external;
function g_ptr_array_remove_index(array:PGPtrArray; index_:Tguint):Tgpointer;cdecl;external;
function g_ptr_array_remove_index_fast(array:PGPtrArray; index_:Tguint):Tgpointer;cdecl;external;
function g_ptr_array_steal_index(array:PGPtrArray; index_:Tguint):Tgpointer;cdecl;external;
function g_ptr_array_steal_index_fast(array:PGPtrArray; index_:Tguint):Tgpointer;cdecl;external;
function g_ptr_array_remove(array:PGPtrArray; data:Tgpointer):Tgboolean;cdecl;external;
function g_ptr_array_remove_fast(array:PGPtrArray; data:Tgpointer):Tgboolean;cdecl;external;
function g_ptr_array_remove_range(array:PGPtrArray; index_:Tguint; length:Tguint):PGPtrArray;cdecl;external;
procedure g_ptr_array_add(array:PGPtrArray; data:Tgpointer);cdecl;external;
procedure g_ptr_array_extend(array_to_extend:PGPtrArray; array:PGPtrArray; func:TGCopyFunc; user_data:Tgpointer);cdecl;external;
procedure g_ptr_array_extend_and_steal(array_to_extend:PGPtrArray; array:PGPtrArray);cdecl;external;
procedure g_ptr_array_insert(array:PGPtrArray; index_:Tgint; data:Tgpointer);cdecl;external;
procedure g_ptr_array_sort(array:PGPtrArray; compare_func:TGCompareFunc);cdecl;external;
procedure g_ptr_array_sort_with_data(array:PGPtrArray; compare_func:TGCompareDataFunc; user_data:Tgpointer);cdecl;external;
procedure g_ptr_array_sort_values(array:PGPtrArray; compare_func:TGCompareFunc);cdecl;external;
procedure g_ptr_array_sort_values_with_data(array:PGPtrArray; compare_func:TGCompareDataFunc; user_data:Tgpointer);cdecl;external;
procedure g_ptr_array_foreach(array:PGPtrArray; func:TGFunc; user_data:Tgpointer);cdecl;external;
function g_ptr_array_find(haystack:PGPtrArray; needle:Tgconstpointer; index_:Pguint):Tgboolean;cdecl;external;
function g_ptr_array_find_with_equal_func(haystack:PGPtrArray; needle:Tgconstpointer; equal_func:TGEqualFunc; index_:Pguint):Tgboolean;cdecl;external;
function g_ptr_array_is_null_terminated(array:PGPtrArray):Tgboolean;cdecl;external;
{ Byte arrays, an array of guint8.  Implemented as a GArray,
 * but type-safe.
  }
function g_byte_array_new:PGByteArray;cdecl;external;
function g_byte_array_new_take(data:Pguint8; len:Tgsize):PGByteArray;cdecl;external;
function g_byte_array_steal(array:PGByteArray; len:Pgsize):Pguint8;cdecl;external;
function g_byte_array_sized_new(reserved_size:Tguint):PGByteArray;cdecl;external;
function g_byte_array_free(array:PGByteArray; free_segment:Tgboolean):Pguint8;cdecl;external;
function g_byte_array_free_to_bytes(array:PGByteArray):PGBytes;cdecl;external;
function g_byte_array_ref(array:PGByteArray):PGByteArray;cdecl;external;
procedure g_byte_array_unref(array:PGByteArray);cdecl;external;
(* Const before type ignored *)
function g_byte_array_append(array:PGByteArray; data:Pguint8; len:Tguint):PGByteArray;cdecl;external;
(* Const before type ignored *)
function g_byte_array_prepend(array:PGByteArray; data:Pguint8; len:Tguint):PGByteArray;cdecl;external;
function g_byte_array_set_size(array:PGByteArray; length:Tguint):PGByteArray;cdecl;external;
function g_byte_array_remove_index(array:PGByteArray; index_:Tguint):PGByteArray;cdecl;external;
function g_byte_array_remove_index_fast(array:PGByteArray; index_:Tguint):PGByteArray;cdecl;external;
function g_byte_array_remove_range(array:PGByteArray; index_:Tguint; length:Tguint):PGByteArray;cdecl;external;
procedure g_byte_array_sort(array:PGByteArray; compare_func:TGCompareFunc);cdecl;external;
procedure g_byte_array_sort_with_data(array:PGByteArray; compare_func:TGCompareDataFunc; user_data:Tgpointer);cdecl;external;
{$endif}
{ __G_ARRAY_H__  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_array_append_val(a,v : longint) : longint;
begin
  g_array_append_val:=g_array_append_vals(a,@(v),1);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_array_prepend_val(a,v : longint) : longint;
begin
  g_array_prepend_val:=g_array_prepend_vals(a,@(v),1);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_array_insert_val(a,i,v : longint) : longint;
begin
  g_array_insert_val:=g_array_insert_vals(a,i,@(v),1);
end;


end.
