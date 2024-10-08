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

#include <gtk/gtkwidget.h>





#define GTK_TYPE_BOX            (gtk_box_get_type ())
#define GTK_BOX(obj)            (G_TYPE_CHECK_INSTANCE_CAST ((obj), GTK_TYPE_BOX, GtkBox))
#define GTK_BOX_CLASS(klass)    (G_TYPE_CHECK_CLASS_CAST ((klass), GTK_TYPE_BOX, GtkBoxClass))
#define GTK_IS_BOX(obj)         (G_TYPE_CHECK_INSTANCE_TYPE ((obj), GTK_TYPE_BOX))
#define GTK_IS_BOX_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE ((klass), GTK_TYPE_BOX))
#define GTK_BOX_GET_CLASS(obj)  (G_TYPE_INSTANCE_GET_CLASS ((obj), GTK_TYPE_BOX, GtkBoxClass))


typedef struct _GtkBox              GtkBox;
typedef struct _GtkBoxClass         GtkBoxClass;

struct _GtkBox
{
  GtkWidget parent_instance;
};

/**
 * GtkBoxClass:
 * @parent_class: The parent class.
 */
struct _GtkBoxClass
{
  GtkWidgetClass parent_class;

  /*< private >*/

  gpointer padding[8];
};



GType       gtk_box_get_type            (void) ;

GtkWidget*  gtk_box_new                 (GtkOrientation  orientation,
                                         int             spacing);

void        gtk_box_set_homogeneous     (GtkBox         *box,
                                         gboolean        homogeneous);

gboolean    gtk_box_get_homogeneous     (GtkBox         *box);

void        gtk_box_set_spacing         (GtkBox         *box,
                                         int             spacing);

int         gtk_box_get_spacing         (GtkBox         *box);

void        gtk_box_set_baseline_position (GtkBox             *box,
                                           GtkBaselinePosition position);

GtkBaselinePosition gtk_box_get_baseline_position (GtkBox         *box);


void        gtk_box_set_baseline_child (GtkBox         *box,
                                        int             child);

int         gtk_box_get_baseline_child (GtkBox         *box);


void        gtk_box_append             (GtkBox         *box,
                                        GtkWidget      *child);

void        gtk_box_prepend            (GtkBox         *box,
                                        GtkWidget      *child);

void        gtk_box_remove             (GtkBox         *box,
                                        GtkWidget      *child);


void        gtk_box_insert_child_after (GtkBox         *box,
                                        GtkWidget      *child,
                                        GtkWidget      *sibling);


void        gtk_box_reorder_child_after (GtkBox         *box,
                                         GtkWidget      *child,
                                         GtkWidget      *sibling);





