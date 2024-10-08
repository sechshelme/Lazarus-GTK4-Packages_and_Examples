/*
 * gtkappchooser.h: app-chooser interface
 *
 * Copyright (C) 2010 Red Hat, Inc.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public License as
 * published by the Free Software Foundation; either version 2 of the
 * License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
 *
 * Authors: Cosimo Cecchi <ccecchi@redhat.com>
 */

#pragma once

#if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)
#error "Only <gtk/gtk.h> can be included directly."
#endif

#include <glib.h>
#include <gio/gio.h>
#include <gdk/gdk.h>



#define GTK_TYPE_APP_CHOOSER    (gtk_app_chooser_get_type ())
#define GTK_APP_CHOOSER(obj)    (G_TYPE_CHECK_INSTANCE_CAST ((obj), GTK_TYPE_APP_CHOOSER, GtkAppChooser))
#define GTK_IS_APP_CHOOSER(obj) (G_TYPE_CHECK_INSTANCE_TYPE ((obj), GTK_TYPE_APP_CHOOSER))

typedef struct _GtkAppChooser GtkAppChooser;


GType      gtk_app_chooser_get_type         (void) ;


GAppInfo * gtk_app_chooser_get_app_info     (GtkAppChooser *self);

char *    gtk_app_chooser_get_content_type (GtkAppChooser *self);

void       gtk_app_chooser_refresh          (GtkAppChooser *self);






