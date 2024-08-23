/*
 * Copyright © 2020 Red Hat, Inc.
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
 * Authors: Matthias Clasen <mclasen@redhat.com>
 */

#pragma once


#if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)
#error "Only <gtk/gtk.h> can be included directly."
#endif

#include <gio/gio.h>
/* for  */
#include <gdk/gdk.h>




#define GTK_TYPE_STRING_OBJECT (gtk_string_object_get_type ())

//G_DECLARE_FINAL_TYPE (GtkStringObject, gtk_string_object, GTK, STRING_OBJECT, GObject)


GtkStringObject *       gtk_string_object_new        (const char      *string);

const char *            gtk_string_object_get_string (GtkStringObject *self);

#define GTK_TYPE_STRING_LIST (gtk_string_list_get_type ())


//G_DECLARE_FINAL_TYPE (GtkStringList, gtk_string_list, GTK, STRING_LIST, GObject)


GtkStringList * gtk_string_list_new             (const char * const    *strings);


void            gtk_string_list_append          (GtkStringList         *self,
                                                 const char            *string);


void            gtk_string_list_take            (GtkStringList         *self,
                                                 char                  *string);


void            gtk_string_list_remove          (GtkStringList         *self,
                                                 guint                  position);


void            gtk_string_list_splice          (GtkStringList         *self,
                                                 guint                  position,
                                                 guint                  n_removals,
                                                 const char * const    *additions);


const char *    gtk_string_list_get_string      (GtkStringList         *self,
                                                 guint                  position);



