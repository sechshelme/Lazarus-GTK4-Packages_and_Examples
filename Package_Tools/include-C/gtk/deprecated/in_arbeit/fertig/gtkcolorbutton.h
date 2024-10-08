/*
 * GTK - The GIMP Toolkit
 * Copyright (C) 1998, 1999 Red Hat, Inc.
 * All rights reserved.
 *
 * This Library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public License as
 * published by the Free Software Foundation; either version 2 of the
 * License, or (at your option) any later version.
 *
 * This Library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
 */

/* Color picker button for GNOME
 *
 * Author: Federico Mena <federico@nuclecu.unam.mx>
 *
 * Modified by the GTK+ Team and others 2003.  See the AUTHORS
 * file for a list of people on the GTK+ Team.  See the ChangeLog
 * files for a list of changes.  These files are distributed with
 * GTK+ at ftp://ftp.gtk.org/pub/gtk/.
 */

#pragma once


#if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)
#error "Only <gtk/gtk.h> can be included directly."
#endif

#include <gtk/gtkbutton.h>




#define GTK_TYPE_COLOR_BUTTON             (gtk_color_button_get_type ())
#define GTK_COLOR_BUTTON(obj)             (G_TYPE_CHECK_INSTANCE_CAST ((obj), GTK_TYPE_COLOR_BUTTON, GtkColorButton))
#define GTK_IS_COLOR_BUTTON(obj)          (G_TYPE_CHECK_INSTANCE_TYPE ((obj), GTK_TYPE_COLOR_BUTTON))

typedef struct _GtkColorButton GtkColorButton;


GType        gtk_color_button_get_type      (void) ;

GtkWidget *  gtk_color_button_new           (void);

GtkWidget *  gtk_color_button_new_with_rgba (const GdkRGBA  *rgba);

void         gtk_color_button_set_title     (GtkColorButton *button,
                                             const char     *title);

const char *gtk_color_button_get_title     (GtkColorButton *button);


gboolean     gtk_color_button_get_modal        (GtkColorButton *button);

void         gtk_color_button_set_modal        (GtkColorButton *button,
                                                gboolean        modal);





