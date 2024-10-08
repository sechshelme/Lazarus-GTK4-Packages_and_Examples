/* GTK - The GIMP Toolkit
 * Copyright (C) 1995-1997 Peter Mattis, Spencer Kimball and Josh MacDonald
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
 * Modified by the GTK+ Team and others 1997-2000.  See the AUTHORS
 * file for a list of people on the GTK+ Team.  See the ChangeLog
 * files for a list of changes.  These files are distributed with
 * GTK+ at ftp://ftp.gtk.org/pub/gtk/.
 */

#pragma once


#if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)
#error "Only <gtk/gtk.h> can be included directly."
#endif

#include <gtk/gtkbutton.h>




#define GTK_TYPE_TOGGLE_BUTTON                  (gtk_toggle_button_get_type ())
#define GTK_TOGGLE_BUTTON(obj)                  (G_TYPE_CHECK_INSTANCE_CAST ((obj), GTK_TYPE_TOGGLE_BUTTON, GtkToggleButton))
#define GTK_TOGGLE_BUTTON_CLASS(klass)          (G_TYPE_CHECK_CLASS_CAST ((klass), GTK_TYPE_TOGGLE_BUTTON, GtkToggleButtonClass))
#define GTK_IS_TOGGLE_BUTTON(obj)               (G_TYPE_CHECK_INSTANCE_TYPE ((obj), GTK_TYPE_TOGGLE_BUTTON))
#define GTK_IS_TOGGLE_BUTTON_CLASS(klass)       (G_TYPE_CHECK_CLASS_TYPE ((klass), GTK_TYPE_TOGGLE_BUTTON))
#define GTK_TOGGLE_BUTTON_GET_CLASS(obj)        (G_TYPE_INSTANCE_GET_CLASS ((obj), GTK_TYPE_TOGGLE_BUTTON, GtkToggleButtonClass))

typedef struct _GtkToggleButton              GtkToggleButton;
typedef struct _GtkToggleButtonClass         GtkToggleButtonClass;

struct _GtkToggleButton
{
  /*< private >*/
  GtkButton button;
};

struct _GtkToggleButtonClass
{
  GtkButtonClass parent_class;

  void (* toggled) (GtkToggleButton *toggle_button);

  /*< private >*/

  gpointer padding[8];
};



GType      gtk_toggle_button_get_type          (void) ;


GtkWidget* gtk_toggle_button_new               (void);

GtkWidget* gtk_toggle_button_new_with_label    (const char      *label);

GtkWidget* gtk_toggle_button_new_with_mnemonic (const char      *label);

void       gtk_toggle_button_set_active        (GtkToggleButton *toggle_button,
                                                gboolean         is_active);

gboolean   gtk_toggle_button_get_active        (GtkToggleButton *toggle_button);

void       gtk_toggle_button_toggled           (GtkToggleButton *toggle_button);

void       gtk_toggle_button_set_group         (GtkToggleButton *toggle_button,
                                                GtkToggleButton *group);





