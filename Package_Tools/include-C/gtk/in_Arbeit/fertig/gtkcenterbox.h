/*
 * Copyright (c) 2017 Timm Bäder <mail@baedert.org>
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
 * Author: Timm Bäder <mail@baedert.org>
 *
 */

#pragma once

#if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)
#error "Only <gtk/gtk.h> can be included directly."
#endif

#include "gtkwidget.h"



#define GTK_TYPE_CENTER_BOX                 (gtk_center_box_get_type ())
#define GTK_CENTER_BOX(obj)                 (G_TYPE_CHECK_INSTANCE_CAST ((obj), GTK_TYPE_CENTER_BOX, GtkCenterBox))
#define GTK_CENTER_BOX_CLASS(klass)         (G_TYPE_CHECK_CLASS_CAST ((klass), GTK_TYPE_CENTER_BOX, GtkCenterBoxClass))
#define GTK_IS_CENTER_BOX(obj)              (G_TYPE_CHECK_INSTANCE_TYPE ((obj), GTK_TYPE_CENTER_BOX))
#define GTK_IS_CENTER_BOX_CLASS(klass)      (G_TYPE_CHECK_CLASS_TYPE ((klass), GTK_TYPE_CENTER_BOX))
#define GTK_CENTER_BOX_GET_CLASS(obj)       (G_TYPE_INSTANCE_GET_CLASS ((obj), GTK_TYPE_CENTER_BOX, GtkCenterBoxClass))

typedef struct _GtkCenterBox             GtkCenterBox;
typedef struct _GtkCenterBoxClass        GtkCenterBoxClass;


GType      gtk_center_box_get_type (void) ;


GtkWidget *gtk_center_box_new (void);

void       gtk_center_box_set_start_widget   (GtkCenterBox *self,
                                              GtkWidget    *child);

void       gtk_center_box_set_center_widget  (GtkCenterBox *self,
                                              GtkWidget    *child);

void       gtk_center_box_set_end_widget     (GtkCenterBox *self,
                                              GtkWidget    *child);


GtkWidget * gtk_center_box_get_start_widget  (GtkCenterBox *self);

GtkWidget * gtk_center_box_get_center_widget (GtkCenterBox *self);

GtkWidget * gtk_center_box_get_end_widget    (GtkCenterBox *self);


void                gtk_center_box_set_baseline_position (GtkCenterBox        *self,
                                                          GtkBaselinePosition  position);

GtkBaselinePosition gtk_center_box_get_baseline_position (GtkCenterBox        *self);


void        gtk_center_box_set_shrink_center_last (GtkCenterBox *self,
                                                   gboolean      shrink_center_last);

gboolean    gtk_center_box_get_shrink_center_last (GtkCenterBox *self);



