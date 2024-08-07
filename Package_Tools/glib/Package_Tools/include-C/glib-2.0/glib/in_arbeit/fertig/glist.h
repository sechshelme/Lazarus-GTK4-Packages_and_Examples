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

#ifndef __G_LIST_H__
#define __G_LIST_H__

#if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)
#error "Only <glib.h> can be included directly."
#endif

#include <glib/gmem.h>
#include <glib/gnode.h>



typedef struct _GList GList;

struct _GList
{
  gpointer data;
  GList *next;
  GList *prev;
};

/* Doubly linked lists
 */

GList*   g_list_alloc                   (void) ;

void     g_list_free                    (GList            *list);

void     g_list_free_1                  (GList            *list);
#define  g_list_free1                   g_list_free_1

void     g_list_free_full               (GList            *list,
					 GDestroyNotify    free_func);

GList*   g_list_append                  (GList            *list,
					 gpointer          data) ;

GList*   g_list_prepend                 (GList            *list,
					 gpointer          data) ;

GList*   g_list_insert                  (GList            *list,
					 gpointer          data,
					 gint              position) ;

GList*   g_list_insert_sorted           (GList            *list,
					 gpointer          data,
					 GCompareFunc      func) ;

GList*   g_list_insert_sorted_with_data (GList            *list,
					 gpointer          data,
					 GCompareDataFunc  func,
					 gpointer          user_data) ;

GList*   g_list_insert_before           (GList            *list,
					 GList            *sibling,
					 gpointer          data) ;

GList*   g_list_insert_before_link      (GList            *list,
					 GList            *sibling,
					 GList            *link_) ;

GList*   g_list_concat                  (GList            *list1,
					 GList            *list2) ;

GList*   g_list_remove                  (GList            *list,
					 gconstpointer     data) ;

GList*   g_list_remove_all              (GList            *list,
					 gconstpointer     data) ;

GList*   g_list_remove_link             (GList            *list,
					 GList            *llink) ;

GList*   g_list_delete_link             (GList            *list,
					 GList            *link_) ;

GList*   g_list_reverse                 (GList            *list) ;

GList*   g_list_copy                    (GList            *list) ;


GList*   g_list_copy_deep               (GList            *list,
					 GCopyFunc         func,
					 gpointer          user_data) ;


GList*   g_list_nth                     (GList            *list,
					 guint             n);

GList*   g_list_nth_prev                (GList            *list,
					 guint             n);

GList*   g_list_find                    (GList            *list,
					 gconstpointer     data);

GList*   g_list_find_custom             (GList            *list,
					 gconstpointer     data,
					 GCompareFunc      func);

gint     g_list_position                (GList            *list,
					 GList            *llink);

gint     g_list_index                   (GList            *list,
					 gconstpointer     data);

GList*   g_list_last                    (GList            *list);

GList*   g_list_first                   (GList            *list);

guint    g_list_length                  (GList            *list);

void     g_list_foreach                 (GList            *list,
					 GFunc             func,
					 gpointer          user_data);

GList*   g_list_sort                    (GList            *list,
					 GCompareFunc      compare_func) ;

GList*   g_list_sort_with_data          (GList            *list,
					 GCompareDataFunc  compare_func,
					 gpointer          user_data)  ;

gpointer g_list_nth_data                (GList            *list,
					 guint             n);


void     g_clear_list                   (GList           **list_ptr,
                                         GDestroyNotify    destroy);

/*
#define  g_clear_list(list_ptr, destroy)       \
  G_STMT_START {                               \
    GList *_list;                              \
                                               \
    _list = *(list_ptr);                       \
    if (_list)                                 \
      {                                        \
        *list_ptr = NULL;                      \
                                               \
        if ((destroy) != NULL)                 \
          g_list_free_full (_list, (destroy)); \
        else                                   \
          g_list_free (_list);                 \
      }                                        \
  } G_STMT_END                                 \
  GLIB_AVAILABLE_MACRO_IN_2_64
*/


#define g_list_previous(list)	        ((list) ? (((GList *)(list))->prev) : NULL)
#define g_list_next(list)	        ((list) ? (((GList *)(list))->next) : NULL)



#endif /* __G_LIST_H__ */
