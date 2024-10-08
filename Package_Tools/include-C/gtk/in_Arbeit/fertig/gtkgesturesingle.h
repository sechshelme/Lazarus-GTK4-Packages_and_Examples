/* GTK - The GIMP Toolkit
 * Copyright (C) 2012, One Laptop Per Child.
 * Copyright (C) 2014, Red Hat, Inc.
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
 * Author(s): Carlos Garnacho <carlosg@gnome.org>
 */

#pragma once

#if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)
#error "Only <gtk/gtk.h> can be included directly."
#endif

#include <gtk/gtkgesture.h>



#define GTK_TYPE_GESTURE_SINGLE         (gtk_gesture_single_get_type ())
#define GTK_GESTURE_SINGLE(o)           (G_TYPE_CHECK_INSTANCE_CAST ((o), GTK_TYPE_GESTURE_SINGLE, GtkGestureSingle))
#define GTK_GESTURE_SINGLE_CLASS(k)     (G_TYPE_CHECK_CLASS_CAST ((k), GTK_TYPE_GESTURE_SINGLE, GtkGestureSingleClass))
#define GTK_IS_GESTURE_SINGLE(o)        (G_TYPE_CHECK_INSTANCE_TYPE ((o), GTK_TYPE_GESTURE_SINGLE))
#define GTK_IS_GESTURE_SINGLE_CLASS(k)  (G_TYPE_CHECK_CLASS_TYPE ((k), GTK_TYPE_GESTURE_SINGLE))
#define GTK_GESTURE_SINGLE_GET_CLASS(o) (G_TYPE_INSTANCE_GET_CLASS ((o), GTK_TYPE_GESTURE_SINGLE, GtkGestureSingleClass))

typedef struct _GtkGestureSingle GtkGestureSingle;
typedef struct _GtkGestureSingleClass GtkGestureSingleClass;


GType       gtk_gesture_single_get_type       (void) ;


gboolean    gtk_gesture_single_get_touch_only (GtkGestureSingle *gesture);


void        gtk_gesture_single_set_touch_only (GtkGestureSingle *gesture,
                                               gboolean          touch_only);

gboolean    gtk_gesture_single_get_exclusive  (GtkGestureSingle *gesture);


void        gtk_gesture_single_set_exclusive  (GtkGestureSingle *gesture,
                                               gboolean          exclusive);


guint       gtk_gesture_single_get_button     (GtkGestureSingle *gesture);


void        gtk_gesture_single_set_button     (GtkGestureSingle *gesture,
                                               guint             button);


guint       gtk_gesture_single_get_current_button
                                              (GtkGestureSingle *gesture);


GdkEventSequence * gtk_gesture_single_get_current_sequence
                                              (GtkGestureSingle *gesture);





