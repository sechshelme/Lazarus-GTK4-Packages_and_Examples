/* gtkshortcutswindow.h
 *
 * Copyright (C) 2015 Christian Hergert <christian@hergert.me>
 *
 *  This library is free software; you can redistribute it and/or
 *  modify it under the terms of the GNU Library General Public License as
 *  published by the Free Software Foundation; either version 2 of the
 *  License, or (at your option) any later version.
 *
 *  This library is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 *  Library General Public License for more details.
 *
 *  You should have received a copy of the GNU Library General Public
 *  License along with this library. If not, see <http://www.gnu.org/licenses/>.
 */

#pragma once

#if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)
#error "Only <gtk/gtk.h> can be included directly."
#endif

#include <gtk/gtkwindow.h>
#include <gtk/gtkshortcutssection.h>



#define GTK_TYPE_SHORTCUTS_WINDOW            (gtk_shortcuts_window_get_type ())
#define GTK_SHORTCUTS_WINDOW(obj)            (G_TYPE_CHECK_INSTANCE_CAST ((obj), GTK_TYPE_SHORTCUTS_WINDOW, GtkShortcutsWindow))
#define GTK_IS_SHORTCUTS_WINDOW(obj)         (G_TYPE_CHECK_INSTANCE_TYPE ((obj), GTK_TYPE_SHORTCUTS_WINDOW))

typedef struct _GtkShortcutsWindow GtkShortcutsWindow;


GType gtk_shortcuts_window_get_type (void) ;


void gtk_shortcuts_window_add_section (GtkShortcutsWindow  *self,
                                       GtkShortcutsSection *section);





