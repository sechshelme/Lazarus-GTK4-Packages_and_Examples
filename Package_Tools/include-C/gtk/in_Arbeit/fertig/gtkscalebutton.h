/* GTK - The GIMP Toolkit
 * Copyright (C) 2005 Ronald S. Bultje
 * Copyright (C) 2006, 2007 Christian Persch
 * Copyright (C) 2006 Jan Arne Petersen
 * Copyright (C) 2007 Red Hat, Inc.
 *
 * Authors:
 * - Ronald S. Bultje <rbultje@ronald.bitfreak.net>
 * - Bastien Nocera <bnocera@redhat.com>
 * - Jan Arne Petersen <jpetersen@jpetersen.org>
 * - Christian Persch <chpe@svn.gnome.org>
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
 * Modified by the GTK+ Team and others 2007.  See the AUTHORS
 * file for a list of people on the GTK+ Team.  See the ChangeLog
 * files for a list of changes.  These files are distributed with
 * GTK+ at ftp://ftp.gtk.org/pub/gtk/.
 */

#pragma once

#if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)
#error "Only <gtk/gtk.h> can be included directly."
#endif

#include <gtk/gtkwidget.h>



#define GTK_TYPE_SCALE_BUTTON                 (gtk_scale_button_get_type ())
#define GTK_SCALE_BUTTON(obj)                 (G_TYPE_CHECK_INSTANCE_CAST ((obj), GTK_TYPE_SCALE_BUTTON, GtkScaleButton))
#define GTK_SCALE_BUTTON_CLASS(klass)         (G_TYPE_CHECK_CLASS_CAST ((klass), GTK_TYPE_SCALE_BUTTON, GtkScaleButtonClass))
#define GTK_IS_SCALE_BUTTON(obj)              (G_TYPE_CHECK_INSTANCE_TYPE ((obj), GTK_TYPE_SCALE_BUTTON))
#define GTK_IS_SCALE_BUTTON_CLASS(klass)      (G_TYPE_CHECK_CLASS_TYPE ((klass), GTK_TYPE_SCALE_BUTTON))
#define GTK_SCALE_BUTTON_GET_CLASS(obj)       (G_TYPE_INSTANCE_GET_CLASS ((obj), GTK_TYPE_SCALE_BUTTON, GtkScaleButtonClass))

typedef struct _GtkScaleButton        GtkScaleButton;
typedef struct _GtkScaleButtonClass   GtkScaleButtonClass;

struct _GtkScaleButton
{
  GtkWidget parent_instance;
};

struct _GtkScaleButtonClass
{
  GtkWidgetClass parent_class;

  /* signals */
  void	(* value_changed) (GtkScaleButton *button,
                           double          value);

  /*< private >*/

  gpointer padding[8];
};


GType            gtk_scale_button_get_type         (void) ;

GtkWidget *      gtk_scale_button_new              (double           min,
                                                    double           max,
                                                    double           step,
                                                    const char     **icons);

void             gtk_scale_button_set_icons        (GtkScaleButton  *button,
                                                    const char     **icons);

double           gtk_scale_button_get_value        (GtkScaleButton  *button);

void             gtk_scale_button_set_value        (GtkScaleButton  *button,
                                                    double           value);

GtkAdjustment *  gtk_scale_button_get_adjustment   (GtkScaleButton  *button);

void             gtk_scale_button_set_adjustment   (GtkScaleButton  *button,
                                                    GtkAdjustment   *adjustment);

GtkWidget *      gtk_scale_button_get_plus_button  (GtkScaleButton  *button);

GtkWidget *      gtk_scale_button_get_minus_button (GtkScaleButton  *button);

GtkWidget *      gtk_scale_button_get_popup        (GtkScaleButton  *button);

gboolean         gtk_scale_button_get_active       (GtkScaleButton  *button);

gboolean         gtk_scale_button_get_has_frame    (GtkScaleButton  *button);

void             gtk_scale_button_set_has_frame    (GtkScaleButton  *button,
                                                    gboolean         has_frame);





