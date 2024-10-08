/*
 * Copyright © 2023 Benjamin Otte
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

#include <gtk/gtktypes.h>



#define GTK_TYPE_LIST_HEADER (gtk_list_header_get_type ())

//GDK_DECLARE_INTERNAL_TYPE (GtkListHeader, gtk_list_header, GTK, LIST_HEADER, GObject)


gpointer        gtk_list_header_get_item                        (GtkListHeader          *self);

guint           gtk_list_header_get_start                       (GtkListHeader          *self) ;

guint           gtk_list_header_get_end                         (GtkListHeader          *self) ;

guint           gtk_list_header_get_n_items                     (GtkListHeader          *self) ;


void            gtk_list_header_set_child                       (GtkListHeader          *self,
                                                                 GtkWidget              *child);

GtkWidget *     gtk_list_header_get_child                       (GtkListHeader          *self);



