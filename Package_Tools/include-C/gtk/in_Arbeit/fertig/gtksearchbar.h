/* GTK - The GIMP Toolkit
 * Copyright (C) 2013 Red Hat, Inc.
 *
 * Authors:
 * - Bastien Nocera <bnocera@redhat.com>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
 */

/*
 * Modified by the GTK+ Team and others 2013.  See the AUTHORS
 * file for a list of people on the GTK+ Team.  See the ChangeLog
 * files for a list of changes.  These files are distributed with
 * GTK+ at ftp://ftp.gtk.org/pub/gtk/.
 */

#pragma once

#if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)
#error "Only <gtk/gtk.h> can be included directly."
#endif

#include <gtk/gtkwidget.h>
#include <gtk/gtkeditable.h>



#define GTK_TYPE_SEARCH_BAR                 (gtk_search_bar_get_type ())
#define GTK_SEARCH_BAR(obj)                 (G_TYPE_CHECK_INSTANCE_CAST ((obj), GTK_TYPE_SEARCH_BAR, GtkSearchBar))
#define GTK_IS_SEARCH_BAR(obj)              (G_TYPE_CHECK_INSTANCE_TYPE ((obj), GTK_TYPE_SEARCH_BAR))

typedef struct _GtkSearchBar        GtkSearchBar;


GType       gtk_search_bar_get_type        (void) ;


GtkWidget*  gtk_search_bar_new             (void);


void        gtk_search_bar_connect_entry   (GtkSearchBar *bar,
                                            GtkEditable  *entry);


gboolean    gtk_search_bar_get_search_mode (GtkSearchBar *bar);

void        gtk_search_bar_set_search_mode (GtkSearchBar *bar,
                                            gboolean      search_mode);


gboolean    gtk_search_bar_get_show_close_button (GtkSearchBar *bar);

void        gtk_search_bar_set_show_close_button (GtkSearchBar *bar,
                                                  gboolean      visible);


void        gtk_search_bar_set_key_capture_widget (GtkSearchBar *bar,
                                                   GtkWidget    *widget);

GtkWidget * gtk_search_bar_get_key_capture_widget (GtkSearchBar *bar);


void        gtk_search_bar_set_child          (GtkSearchBar *bar,
                                               GtkWidget    *child);

GtkWidget * gtk_search_bar_get_child          (GtkSearchBar *bar);





