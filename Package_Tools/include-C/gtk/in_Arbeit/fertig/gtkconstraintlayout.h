/* gtkconstraintlayout.h: Layout manager using constraints
 * Copyright 2019  GNOME Foundation
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
 * Author: Emmanuele Bassi
 */
#pragma once

#include <gtk/gtklayoutmanager.h>
#include <gtk/gtkconstraint.h>
#include <gtk/gtkconstraintguide.h>



#define GTK_TYPE_CONSTRAINT_LAYOUT (gtk_constraint_layout_get_type ())
#define GTK_TYPE_CONSTRAINT_LAYOUT_CHILD (gtk_constraint_layout_child_get_type ())
#define GTK_CONSTRAINT_VFL_PARSER_ERROR (gtk_constraint_vfl_parser_error_quark ())


//G_DECLARE_FINAL_TYPE (GtkConstraintLayoutChild, gtk_constraint_layout_child, GTK, CONSTRAINT_LAYOUT_CHILD, GtkLayoutChild)


//G_DECLARE_FINAL_TYPE (GtkConstraintLayout, gtk_constraint_layout, GTK, CONSTRAINT_LAYOUT, GtkLayoutManager)


GQuark                  gtk_constraint_vfl_parser_error_quark   (void);


GtkLayoutManager *      gtk_constraint_layout_new               (void);


void                    gtk_constraint_layout_add_constraint    (GtkConstraintLayout *layout,
                                                                 GtkConstraint       *constraint);

void                    gtk_constraint_layout_remove_constraint (GtkConstraintLayout *layout,
                                                                 GtkConstraint       *constraint);


void                    gtk_constraint_layout_add_guide         (GtkConstraintLayout *layout,
                                                                 GtkConstraintGuide  *guide);

void                    gtk_constraint_layout_remove_guide      (GtkConstraintLayout *layout,
                                                                 GtkConstraintGuide  *guide);

void                    gtk_constraint_layout_remove_all_constraints            (GtkConstraintLayout *layout);


GList *                 gtk_constraint_layout_add_constraints_from_description  (GtkConstraintLayout *layout,
                                                                                 const char * const   lines[],
                                                                                 gsize                n_lines,
                                                                                 int                  hspacing,
                                                                                 int                  vspacing,
                                                                                 GError             **error,
                                                                                 const char          *first_view,
                                                                                 ...) ;

GList *                 gtk_constraint_layout_add_constraints_from_descriptionv (GtkConstraintLayout *layout,
                                                                                 const char * const   lines[],
                                                                                 gsize                n_lines,
                                                                                 int                  hspacing,
                                                                                 int                  vspacing,
                                                                                 GHashTable          *views,
                                                                                 GError             **error);


GListModel *          gtk_constraint_layout_observe_constraints (GtkConstraintLayout *layout);

GListModel *          gtk_constraint_layout_observe_guides (GtkConstraintLayout *layout);


