/*
 * Copyright © 2011 Canonical Limited
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the licence, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
 *
 * Author: Ryan Lortie <desrt@desrt.ca>
 */

#pragma once

#if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)
#error "Only <gtk/gtk.h> can be included directly."
#endif

#include <gtk/gtkwindow.h>
#include <gtk/gtkshortcutswindow.h>



#define GTK_TYPE_APPLICATION_WINDOW            (gtk_application_window_get_type ())
#define GTK_APPLICATION_WINDOW(inst)           (G_TYPE_CHECK_INSTANCE_CAST ((inst), \
                                                GTK_TYPE_APPLICATION_WINDOW, GtkApplicationWindow))
#define GTK_APPLICATION_WINDOW_CLASS(class)    (G_TYPE_CHECK_CLASS_CAST ((class),   \
                                                GTK_TYPE_APPLICATION_WINDOW, GtkApplicationWindowClass))
#define GTK_IS_APPLICATION_WINDOW(inst)        (G_TYPE_CHECK_INSTANCE_TYPE ((inst), \
                                                GTK_TYPE_APPLICATION_WINDOW))
#define GTK_IS_APPLICATION_WINDOW_CLASS(class) (G_TYPE_CHECK_CLASS_TYPE ((class),   \
                                                GTK_TYPE_APPLICATION_WINDOW))
#define GTK_APPLICATION_WINDOW_GET_CLASS(inst) (G_TYPE_INSTANCE_GET_CLASS ((inst),  \
                                                GTK_TYPE_APPLICATION_WINDOW, GtkApplicationWindowClass))

typedef struct _GtkApplicationWindowClass   GtkApplicationWindowClass;
typedef struct _GtkApplicationWindow        GtkApplicationWindow;

struct _GtkApplicationWindow
{
  GtkWindow parent_instance;
};

/**
 * GtkApplicationWindowClass:
 * @parent_class: The parent class.
 */
struct _GtkApplicationWindowClass
{
  GtkWindowClass parent_class;

  /*< private >*/
  gpointer padding[8];
};


GType       gtk_application_window_get_type          (void) ;

GtkWidget * gtk_application_window_new               (GtkApplication      *application);


void        gtk_application_window_set_show_menubar (GtkApplicationWindow *window,
                                                     gboolean              show_menubar);

gboolean    gtk_application_window_get_show_menubar (GtkApplicationWindow *window);


guint       gtk_application_window_get_id           (GtkApplicationWindow *window);


void        gtk_application_window_set_help_overlay (GtkApplicationWindow *window,
                                                     GtkShortcutsWindow   *help_overlay);

GtkShortcutsWindow *
            gtk_application_window_get_help_overlay (GtkApplicationWindow *window);





