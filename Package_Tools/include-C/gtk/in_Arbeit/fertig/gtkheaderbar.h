/*
 * Copyright (c) 2013 Red Hat, Inc.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
 * or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public
 * License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
 *
 */

#pragma once

#if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)
#error "Only <gtk/gtk.h> can be included directly."
#endif

#include <gtk/gtkwidget.h>



#define GTK_TYPE_HEADER_BAR            (gtk_header_bar_get_type ())
#define GTK_HEADER_BAR(obj)            (G_TYPE_CHECK_INSTANCE_CAST ((obj), GTK_TYPE_HEADER_BAR, GtkHeaderBar))
#define GTK_IS_HEADER_BAR(obj)         (G_TYPE_CHECK_INSTANCE_TYPE ((obj), GTK_TYPE_HEADER_BAR))

typedef struct _GtkHeaderBar              GtkHeaderBar;


GType        gtk_header_bar_get_type          (void) ;

GtkWidget   *gtk_header_bar_new               (void);


void         gtk_header_bar_set_title_widget  (GtkHeaderBar *bar,
                                               GtkWidget    *title_widget);

GtkWidget   *gtk_header_bar_get_title_widget  (GtkHeaderBar *bar);

void         gtk_header_bar_pack_start        (GtkHeaderBar *bar,
                                               GtkWidget    *child);

void         gtk_header_bar_pack_end          (GtkHeaderBar *bar,
                                               GtkWidget    *child);

void         gtk_header_bar_remove            (GtkHeaderBar *bar,
                                               GtkWidget    *child);


gboolean     gtk_header_bar_get_show_title_buttons (GtkHeaderBar *bar);


void         gtk_header_bar_set_show_title_buttons (GtkHeaderBar *bar,
                                                    gboolean      setting);


void         gtk_header_bar_set_decoration_layout (GtkHeaderBar *bar,
                                                   const char   *layout);

const char *gtk_header_bar_get_decoration_layout (GtkHeaderBar *bar);





