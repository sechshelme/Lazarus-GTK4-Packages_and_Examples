/* GTK - The GIMP Toolkit
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

#include <gtk/gtkenums.h>
#include <gtk/gtkgesturedrag.h>



#define GTK_TYPE_GESTURE_PAN         (gtk_gesture_pan_get_type ())
#define GTK_GESTURE_PAN(o)           (G_TYPE_CHECK_INSTANCE_CAST ((o), GTK_TYPE_GESTURE_PAN, GtkGesturePan))
#define GTK_GESTURE_PAN_CLASS(k)     (G_TYPE_CHECK_CLASS_CAST ((k), GTK_TYPE_GESTURE_PAN, GtkGesturePanClass))
#define GTK_IS_GESTURE_PAN(o)        (G_TYPE_CHECK_INSTANCE_TYPE ((o), GTK_TYPE_GESTURE_PAN))
#define GTK_IS_GESTURE_PAN_CLASS(k)  (G_TYPE_CHECK_CLASS_TYPE ((k), GTK_TYPE_GESTURE_PAN))
#define GTK_GESTURE_PAN_GET_CLASS(o) (G_TYPE_INSTANCE_GET_CLASS ((o), GTK_TYPE_GESTURE_PAN, GtkGesturePanClass))

typedef struct _GtkGesturePan GtkGesturePan;
typedef struct _GtkGesturePanClass GtkGesturePanClass;


GType             gtk_gesture_pan_get_type        (void) ;


GtkGesture *      gtk_gesture_pan_new             (GtkOrientation  orientation);


GtkOrientation    gtk_gesture_pan_get_orientation (GtkGesturePan  *gesture);


void              gtk_gesture_pan_set_orientation (GtkGesturePan  *gesture,
                                                   GtkOrientation  orientation);





