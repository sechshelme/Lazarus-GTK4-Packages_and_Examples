/*
 * gtkappchooserwidget.h: an app-chooser widget
 *
 * Copyright (C) 2004 Novell, Inc.
 * Copyright (C) 2007, 2010 Red Hat, Inc.
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
 * Authors: Dave Camp <dave@novell.com>
 *          Alexander Larsson <alexl@redhat.com>
 *          Cosimo Cecchi <ccecchi@redhat.com>
 */

#pragma once

#if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)
#error "Only <gtk/gtk.h> can be included directly."
#endif

#include <gtk/gtkwidget.h>
#include <gio/gio.h>



#define GTK_TYPE_APP_CHOOSER_WIDGET            (gtk_app_chooser_widget_get_type ())
#define GTK_APP_CHOOSER_WIDGET(obj)            (G_TYPE_CHECK_INSTANCE_CAST ((obj), GTK_TYPE_APP_CHOOSER_WIDGET, GtkAppChooserWidget))
#define GTK_IS_APP_CHOOSER_WIDGET(obj)         (G_TYPE_CHECK_INSTANCE_TYPE ((obj), GTK_TYPE_APP_CHOOSER_WIDGET))

typedef struct _GtkAppChooserWidget        GtkAppChooserWidget;


GType         gtk_app_chooser_widget_get_type             (void) ;


GtkWidget *   gtk_app_chooser_widget_new                  (const char          *content_type);


void          gtk_app_chooser_widget_set_show_default     (GtkAppChooserWidget *self,
                                                           gboolean             setting);

gboolean      gtk_app_chooser_widget_get_show_default     (GtkAppChooserWidget *self);


void          gtk_app_chooser_widget_set_show_recommended (GtkAppChooserWidget *self,
                                                           gboolean             setting);

gboolean      gtk_app_chooser_widget_get_show_recommended (GtkAppChooserWidget *self);


void          gtk_app_chooser_widget_set_show_fallback    (GtkAppChooserWidget *self,
                                                           gboolean             setting);

gboolean      gtk_app_chooser_widget_get_show_fallback    (GtkAppChooserWidget *self);


void          gtk_app_chooser_widget_set_show_other       (GtkAppChooserWidget *self,
                                                           gboolean             setting);

gboolean      gtk_app_chooser_widget_get_show_other       (GtkAppChooserWidget *self);


void          gtk_app_chooser_widget_set_show_all         (GtkAppChooserWidget *self,
                                                           gboolean             setting);

gboolean      gtk_app_chooser_widget_get_show_all         (GtkAppChooserWidget *self);


void          gtk_app_chooser_widget_set_default_text     (GtkAppChooserWidget *self,
                                                           const char          *text);

const char * gtk_app_chooser_widget_get_default_text     (GtkAppChooserWidget *self);





