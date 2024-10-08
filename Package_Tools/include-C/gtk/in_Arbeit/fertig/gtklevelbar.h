/* GTK - The GIMP Toolkit
 * Copyright © 2012 Red Hat, Inc.
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
 *
 * Author: Cosimo Cecchi <cosimoc@gnome.org>
 *
 */

#pragma once

#if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)
#error "Only <gtk/gtk.h> can be included directly."
#endif

#include <gtk/gtkwidget.h>



#define GTK_TYPE_LEVEL_BAR            (gtk_level_bar_get_type ())
#define GTK_LEVEL_BAR(obj)            (G_TYPE_CHECK_INSTANCE_CAST ((obj), GTK_TYPE_LEVEL_BAR, GtkLevelBar))
#define GTK_IS_LEVEL_BAR(obj)         (G_TYPE_CHECK_INSTANCE_TYPE ((obj), GTK_TYPE_LEVEL_BAR))

/**
 * GTK_LEVEL_BAR_OFFSET_LOW:
 *
 * The name used for the stock low offset included by `GtkLevelBar`.
 */
#define GTK_LEVEL_BAR_OFFSET_LOW  "low"

/**
 * GTK_LEVEL_BAR_OFFSET_HIGH:
 *
 * The name used for the stock high offset included by `GtkLevelBar`.
 */
#define GTK_LEVEL_BAR_OFFSET_HIGH "high"

/**
 * GTK_LEVEL_BAR_OFFSET_FULL:
 *
 * The name used for the stock full offset included by `GtkLevelBar`.
 */
#define GTK_LEVEL_BAR_OFFSET_FULL "full"

typedef struct _GtkLevelBar        GtkLevelBar;



GType      gtk_level_bar_get_type           (void) ;


GtkWidget *gtk_level_bar_new                (void);


GtkWidget *gtk_level_bar_new_for_interval   (double       min_value,
                                             double       max_value);


void       gtk_level_bar_set_mode           (GtkLevelBar *self,
                                             GtkLevelBarMode mode);

GtkLevelBarMode gtk_level_bar_get_mode      (GtkLevelBar *self);


void       gtk_level_bar_set_value          (GtkLevelBar *self,
                                             double       value);

double     gtk_level_bar_get_value          (GtkLevelBar *self);


void       gtk_level_bar_set_min_value      (GtkLevelBar *self,
                                             double       value);

double     gtk_level_bar_get_min_value      (GtkLevelBar *self);


void       gtk_level_bar_set_max_value      (GtkLevelBar *self,
                                             double       value);

double     gtk_level_bar_get_max_value      (GtkLevelBar *self);


void       gtk_level_bar_set_inverted       (GtkLevelBar *self,
                                             gboolean     inverted);


gboolean   gtk_level_bar_get_inverted       (GtkLevelBar *self);


void       gtk_level_bar_add_offset_value   (GtkLevelBar *self,
                                             const char *name,
                                             double       value);

void       gtk_level_bar_remove_offset_value (GtkLevelBar *self,
                                              const char *name);

gboolean   gtk_level_bar_get_offset_value   (GtkLevelBar *self,
                                             const char *name,
                                             double      *value);





