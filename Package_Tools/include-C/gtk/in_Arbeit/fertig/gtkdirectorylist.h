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

#include <gio/gio.h>
/* for  */
#include <gdk/gdk.h>




#define GTK_TYPE_DIRECTORY_LIST (gtk_directory_list_get_type ())


//G_DECLARE_FINAL_TYPE (GtkDirectoryList, gtk_directory_list, GTK, DIRECTORY_LIST, GObject)


GtkDirectoryList *      gtk_directory_list_new                  (const char             *attributes,
                                                                 GFile                  *file);


void                    gtk_directory_list_set_file             (GtkDirectoryList       *self,
                                                                 GFile                  *file);

GFile *                 gtk_directory_list_get_file             (GtkDirectoryList       *self);

void                    gtk_directory_list_set_attributes       (GtkDirectoryList       *self,
                                                                 const char             *attributes);

const char *            gtk_directory_list_get_attributes       (GtkDirectoryList       *self);

void                    gtk_directory_list_set_io_priority      (GtkDirectoryList       *self,
                                                                 int                     io_priority);

int                     gtk_directory_list_get_io_priority      (GtkDirectoryList       *self);


gboolean                gtk_directory_list_is_loading           (GtkDirectoryList       *self);

const GError *          gtk_directory_list_get_error            (GtkDirectoryList       *self);


void                    gtk_directory_list_set_monitored        (GtkDirectoryList       *self,
                                                                 gboolean                monitored);

gboolean                gtk_directory_list_get_monitored        (GtkDirectoryList       *self);



