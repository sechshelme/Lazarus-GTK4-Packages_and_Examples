/* GLIB - Library of useful routines for C programming
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
 */

/*
 * Modified by the GLib Team and others 1997-2000.  See the AUTHORS
 * file for a list of people on the GLib Team.  See the ChangeLog
 * files for a list of changes.  These files are distributed with
 * GLib at ftp://ftp.gtk.org/pub/gtk/.
 */

#ifndef __G_ARRAY_H__
#define __G_ARRAY_H__

#if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)
#error "Only <glib.h> can be included directly."
#endif

#include <glib/gtypes.h>



typedef struct _GBytes          GBytes;
typedef struct _GArray		GArray;
typedef struct _GByteArray	GByteArray;
typedef struct _GPtrArray	GPtrArray;

struct _GArray
{
  gchar *data;
  guint len;
};

struct _GByteArray
{
  guint8 *data;
  guint	  len;
};

struct _GPtrArray
{
  gpointer *pdata;
  guint	    len;
};

/* Resizable arrays. remove fills any cleared spot and shortens the
 * array, while preserving the order. remove_fast will distort the
 * order by moving the last element to the position of the removed.
 */

#define g_array_append_val(a,v)	  g_array_append_vals (a, &(v), 1)
#define g_array_prepend_val(a,v)  g_array_prepend_vals (a, &(v), 1)
#define g_array_insert_val(a,i,v) g_array_insert_vals (a, i, &(v), 1)
// #define g_array_index(a,t,i)      (((t*) (void *) (a)->data) [(i)])


GArray* g_array_new               (gboolean          zero_terminated,
				   gboolean          clear_,
				   guint             element_size);

GArray* g_array_new_take          (gpointer          data,
                                   gsize             len,
                                   gboolean          clear,
                                   gsize             element_size);

GArray* g_array_new_take_zero_terminated (gpointer  data,
                                          gboolean  clear,
                                          gsize     element_size);

gpointer g_array_steal            (GArray           *array,
                                   gsize            *len);

GArray* g_array_sized_new         (gboolean          zero_terminated,
				   gboolean          clear_,
				   guint             element_size,
				   guint             reserved_size);

GArray* g_array_copy              (GArray           *array);

gchar*  g_array_free              (GArray           *array,
				   gboolean          free_segment);

GArray *g_array_ref               (GArray           *array);

void    g_array_unref             (GArray           *array);

guint   g_array_get_element_size  (GArray           *array);

GArray* g_array_append_vals       (GArray           *array,
				   gconstpointer     data,
				   guint             len);

GArray* g_array_prepend_vals      (GArray           *array,
				   gconstpointer     data,
				   guint             len);

GArray* g_array_insert_vals       (GArray           *array,
				   guint             index_,
				   gconstpointer     data,
				   guint             len);

GArray* g_array_set_size          (GArray           *array,
				   guint             length);

GArray* g_array_remove_index      (GArray           *array,
				   guint             index_);

GArray* g_array_remove_index_fast (GArray           *array,
				   guint             index_);

GArray* g_array_remove_range      (GArray           *array,
				   guint             index_,
				   guint             length);

void    g_array_sort              (GArray           *array,
				   GCompareFunc      compare_func);

void    g_array_sort_with_data    (GArray           *array,
				   GCompareDataFunc  compare_func,
				   gpointer          user_data);

gboolean g_array_binary_search    (GArray           *array,
                                   gconstpointer     target,
                                   GCompareFunc      compare_func,
                                   guint            *out_match_index);

void    g_array_set_clear_func    (GArray           *array,
                                   GDestroyNotify    clear_func);

/* Resizable pointer array.  This interface is much less complicated
 * than the above.  Add appends a pointer.  Remove fills any cleared 
 * spot and shortens the array. remove_fast will again distort order.  
 */
//#define    g_ptr_array_index(array,index_) ((array)->pdata)[index_]

GPtrArray* g_ptr_array_new                (void);

GPtrArray* g_ptr_array_new_with_free_func (GDestroyNotify    element_free_func);

GPtrArray* g_ptr_array_new_take           (gpointer         *data,
                                           gsize             len,
                                           GDestroyNotify    element_free_func);

GPtrArray* g_ptr_array_new_from_array     (gpointer         *data,
                                           gsize             len,
                                           GCopyFunc         copy_func,
                                           gpointer          copy_func_user_data,
                                           GDestroyNotify    element_free_func);

gpointer*   g_ptr_array_steal              (GPtrArray        *array,
                                            gsize            *len);

GPtrArray *g_ptr_array_copy               (GPtrArray        *array,
                                           GCopyFunc         func,
                                           gpointer          user_data);

GPtrArray* g_ptr_array_sized_new          (guint             reserved_size);

GPtrArray* g_ptr_array_new_full           (guint             reserved_size,
					   GDestroyNotify    element_free_func);

GPtrArray* g_ptr_array_new_null_terminated (guint          reserved_size,
                                            GDestroyNotify element_free_func,
                                            gboolean       null_terminated);

GPtrArray* g_ptr_array_new_take_null_terminated  (gpointer       *data,
                                                  GDestroyNotify  element_free_func);

GPtrArray* g_ptr_array_new_from_null_terminated_array (gpointer       *data,
                                                       GCopyFunc       copy_func,
                                                       gpointer        copy_func_user_data,
                                                       GDestroyNotify  element_free_func);

gpointer*  g_ptr_array_free               (GPtrArray        *array,
					   gboolean          free_seg);

GPtrArray* g_ptr_array_ref                (GPtrArray        *array);

void       g_ptr_array_unref              (GPtrArray        *array);

void       g_ptr_array_set_free_func      (GPtrArray        *array,
                                           GDestroyNotify    element_free_func);

void       g_ptr_array_set_size           (GPtrArray        *array,
					   gint              length);

gpointer   g_ptr_array_remove_index       (GPtrArray        *array,
					   guint             index_);

gpointer   g_ptr_array_remove_index_fast  (GPtrArray        *array,
					   guint             index_);

gpointer   g_ptr_array_steal_index        (GPtrArray        *array,
                                           guint             index_);

gpointer   g_ptr_array_steal_index_fast   (GPtrArray        *array,
                                           guint             index_);

gboolean   g_ptr_array_remove             (GPtrArray        *array,
					   gpointer          data);

gboolean   g_ptr_array_remove_fast        (GPtrArray        *array,
					   gpointer          data);

GPtrArray *g_ptr_array_remove_range       (GPtrArray        *array,
					   guint             index_,
					   guint             length);

void       g_ptr_array_add                (GPtrArray        *array,
					   gpointer          data);

void g_ptr_array_extend                   (GPtrArray        *array_to_extend,
                                           GPtrArray        *array,
                                           GCopyFunc         func,
                                           gpointer          user_data);

void g_ptr_array_extend_and_steal         (GPtrArray        *array_to_extend,
                                           GPtrArray        *array);

void       g_ptr_array_insert             (GPtrArray        *array,
                                           gint              index_,
                                           gpointer          data);

void       g_ptr_array_sort               (GPtrArray        *array,
					   GCompareFunc      compare_func);

void       g_ptr_array_sort_with_data     (GPtrArray        *array,
					   GCompareDataFunc  compare_func,
					   gpointer          user_data);

void       g_ptr_array_sort_values        (GPtrArray        *array,
                                           GCompareFunc      compare_func);

void       g_ptr_array_sort_values_with_data (GPtrArray        *array,
                                              GCompareDataFunc  compare_func,
                                              gpointer          user_data);

void       g_ptr_array_foreach            (GPtrArray        *array,
					   GFunc             func,
					   gpointer          user_data);

gboolean   g_ptr_array_find               (GPtrArray        *haystack,
                                           gconstpointer     needle,
                                           guint            *index_);

gboolean   g_ptr_array_find_with_equal_func (GPtrArray     *haystack,
                                             gconstpointer  needle,
                                             GEqualFunc     equal_func,
                                             guint         *index_);


gboolean   g_ptr_array_is_null_terminated (GPtrArray *array);

/* Byte arrays, an array of guint8.  Implemented as a GArray,
 * but type-safe.
 */


GByteArray* g_byte_array_new               (void);

GByteArray* g_byte_array_new_take          (guint8           *data,
                                            gsize             len);

guint8*     g_byte_array_steal             (GByteArray       *array,
                                            gsize            *len);

GByteArray* g_byte_array_sized_new         (guint             reserved_size);

guint8*     g_byte_array_free              (GByteArray       *array,
					    gboolean          free_segment);

GBytes*     g_byte_array_free_to_bytes     (GByteArray       *array);

GByteArray *g_byte_array_ref               (GByteArray       *array);

void        g_byte_array_unref             (GByteArray       *array);

GByteArray* g_byte_array_append            (GByteArray       *array,
					    const guint8     *data,
					    guint             len);

GByteArray* g_byte_array_prepend           (GByteArray       *array,
					    const guint8     *data,
					    guint             len);

GByteArray* g_byte_array_set_size          (GByteArray       *array,
					    guint             length);

GByteArray* g_byte_array_remove_index      (GByteArray       *array,
					    guint             index_);

GByteArray* g_byte_array_remove_index_fast (GByteArray       *array,
					    guint             index_);

GByteArray* g_byte_array_remove_range      (GByteArray       *array,
					    guint             index_,
					    guint             length);

void        g_byte_array_sort              (GByteArray       *array,
					    GCompareFunc      compare_func);

void        g_byte_array_sort_with_data    (GByteArray       *array,
					    GCompareDataFunc  compare_func,
					    gpointer          user_data);



#endif /* __G_ARRAY_H__ */
