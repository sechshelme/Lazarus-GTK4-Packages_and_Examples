/*
 * Copyright © 2019 Benjamin Otte
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
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
 *
 * Authors: Benjamin Otte <otte@gnome.org>
 */

#pragma once

#if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)
#error "Only <gtk/gtk.h> can be included directly."
#endif

#include <gtk/gtktreelistmodel.h>
#include <gtk/gtkwidget.h>



#define GTK_TYPE_TREE_EXPANDER         (gtk_tree_expander_get_type ())


//G_DECLARE_FINAL_TYPE (GtkTreeExpander, gtk_tree_expander, GTK, TREE_EXPANDER, GtkWidget)


GtkWidget *             gtk_tree_expander_new                  (void);


GtkWidget *             gtk_tree_expander_get_child            (GtkTreeExpander        *self);

void                    gtk_tree_expander_set_child            (GtkTreeExpander        *self,
                                                                GtkWidget              *child);


gpointer                gtk_tree_expander_get_item             (GtkTreeExpander        *self);

GtkTreeListRow *        gtk_tree_expander_get_list_row         (GtkTreeExpander        *self);

void                    gtk_tree_expander_set_list_row         (GtkTreeExpander        *self,
                                                                GtkTreeListRow         *list_row);

gboolean                gtk_tree_expander_get_indent_for_depth (GtkTreeExpander        *self);

void                    gtk_tree_expander_set_indent_for_depth (GtkTreeExpander        *self,
                                                                gboolean                indent_for_depth);

gboolean                gtk_tree_expander_get_indent_for_icon  (GtkTreeExpander        *self);

void                    gtk_tree_expander_set_indent_for_icon  (GtkTreeExpander        *self,
                                                                gboolean               indent_for_icon);

gboolean                gtk_tree_expander_get_hide_expander    (GtkTreeExpander        *self);

void                    gtk_tree_expander_set_hide_expander    (GtkTreeExpander        *self,
                                                                gboolean                hide_expander);



