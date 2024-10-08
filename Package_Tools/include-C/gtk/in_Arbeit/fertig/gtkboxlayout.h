/* gtkboxlayout.h: Box layout manager
 *
 * Copyright 2019  GNOME Foundation
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
 */

#pragma once

#if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)
#error "Only <gtk/gtk.h> can be included directly."
#endif

#include <gtk/gtkenums.h>
#include <gtk/gtklayoutmanager.h>



#define GTK_TYPE_BOX_LAYOUT (gtk_box_layout_get_type())


//G_DECLARE_FINAL_TYPE (GtkBoxLayout, gtk_box_layout, GTK, BOX_LAYOUT, GtkLayoutManager)


GtkLayoutManager *      gtk_box_layout_new                      (GtkOrientation  orientation);


void                    gtk_box_layout_set_homogeneous          (GtkBoxLayout        *box_layout,
                                                                 gboolean             homogeneous);

gboolean                gtk_box_layout_get_homogeneous          (GtkBoxLayout        *box_layout);

void                    gtk_box_layout_set_spacing              (GtkBoxLayout        *box_layout,
                                                                 guint                spacing);

guint                   gtk_box_layout_get_spacing              (GtkBoxLayout        *box_layout);

void                    gtk_box_layout_set_baseline_position    (GtkBoxLayout        *box_layout,
                                                                 GtkBaselinePosition  position);

GtkBaselinePosition     gtk_box_layout_get_baseline_position    (GtkBoxLayout        *box_layout);


void                    gtk_box_layout_set_baseline_child       (GtkBoxLayout        *box_layout,
                                                                 int                  child);

int                     gtk_box_layout_get_baseline_child       (GtkBoxLayout        *box_layout);


