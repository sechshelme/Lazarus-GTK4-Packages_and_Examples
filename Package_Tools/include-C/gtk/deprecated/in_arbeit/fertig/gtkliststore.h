/* gtkliststore.h
 * Copyright (C) 2000  Red Hat, Inc.,  Jonathan Blandford <jrb@redhat.com>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
 */

#pragma once

#if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)
#error "Only <gtk/gtk.h> can be included directly."
#endif

#include <gdk/gdk.h>
#include <gtk/deprecated/gtktreemodel.h>
#include <gtk/deprecated/gtktreesortable.h>





#define GTK_TYPE_LIST_STORE	       (gtk_list_store_get_type ())
#define GTK_LIST_STORE(obj)	       (G_TYPE_CHECK_INSTANCE_CAST ((obj), GTK_TYPE_LIST_STORE, GtkListStore))
#define GTK_LIST_STORE_CLASS(klass)    (G_TYPE_CHECK_CLASS_CAST ((klass), GTK_TYPE_LIST_STORE, GtkListStoreClass))
#define GTK_IS_LIST_STORE(obj)	       (G_TYPE_CHECK_INSTANCE_TYPE ((obj), GTK_TYPE_LIST_STORE))
#define GTK_IS_LIST_STORE_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE ((klass), GTK_TYPE_LIST_STORE))
#define GTK_LIST_STORE_GET_CLASS(obj)  (G_TYPE_INSTANCE_GET_CLASS ((obj), GTK_TYPE_LIST_STORE, GtkListStoreClass))

typedef struct _GtkListStore              GtkListStore;
typedef struct _GtkListStorePrivate       GtkListStorePrivate;
typedef struct _GtkListStoreClass         GtkListStoreClass;

struct _GtkListStore
{
  GObject parent;

  /*< private >*/
  GtkListStorePrivate *priv;
};

struct _GtkListStoreClass
{
  GObjectClass parent_class;

  /*< private >*/
  gpointer padding[8];
};



GType         gtk_list_store_get_type         (void) ;

GtkListStore *gtk_list_store_new              (int           n_columns,
					       ...);

GtkListStore *gtk_list_store_newv             (int           n_columns,
					       GType        *types);

void          gtk_list_store_set_column_types (GtkListStore *list_store,
					       int           n_columns,
					       GType        *types);

/* NOTE: use gtk_tree_model_get to get values from a GtkListStore */


void          gtk_list_store_set_value        (GtkListStore *list_store,
					       GtkTreeIter  *iter,
					       int           column,
					       GValue       *value);

void          gtk_list_store_set              (GtkListStore *list_store,
					       GtkTreeIter  *iter,
					       ...);

void          gtk_list_store_set_valuesv      (GtkListStore *list_store,
					       GtkTreeIter  *iter,
					       int          *columns,
					       GValue       *values,
					       int           n_values);

void          gtk_list_store_set_valist       (GtkListStore *list_store,
					       GtkTreeIter  *iter,
					       va_list       var_args);

gboolean      gtk_list_store_remove           (GtkListStore *list_store,
					       GtkTreeIter  *iter);

void          gtk_list_store_insert           (GtkListStore *list_store,
					       GtkTreeIter  *iter,
					       int           position);

void          gtk_list_store_insert_before    (GtkListStore *list_store,
					       GtkTreeIter  *iter,
					       GtkTreeIter  *sibling);

void          gtk_list_store_insert_after     (GtkListStore *list_store,
					       GtkTreeIter  *iter,
					       GtkTreeIter  *sibling);

void          gtk_list_store_insert_with_values  (GtkListStore *list_store,
						  GtkTreeIter  *iter,
						  int           position,
						  ...);

void          gtk_list_store_insert_with_valuesv (GtkListStore *list_store,
						  GtkTreeIter  *iter,
						  int           position,
						  int          *columns,
						  GValue       *values,
						  int           n_values);

void          gtk_list_store_prepend          (GtkListStore *list_store,
					       GtkTreeIter  *iter);

void          gtk_list_store_append           (GtkListStore *list_store,
					       GtkTreeIter  *iter);

void          gtk_list_store_clear            (GtkListStore *list_store);

gboolean      gtk_list_store_iter_is_valid    (GtkListStore *list_store,
                                               GtkTreeIter  *iter);

void          gtk_list_store_reorder          (GtkListStore *store,
                                               int          *new_order);

void          gtk_list_store_swap             (GtkListStore *store,
                                               GtkTreeIter  *a,
                                               GtkTreeIter  *b);

void          gtk_list_store_move_after       (GtkListStore *store,
                                               GtkTreeIter  *iter,
                                               GtkTreeIter  *position);

void          gtk_list_store_move_before      (GtkListStore *store,
                                               GtkTreeIter  *iter,
                                               GtkTreeIter  *position);






