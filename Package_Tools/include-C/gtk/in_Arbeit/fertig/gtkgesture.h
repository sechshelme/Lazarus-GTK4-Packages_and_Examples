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

#include <gtk/gtkeventcontroller.h>
#include <gtk/gtkenums.h>



#define GTK_TYPE_GESTURE         (gtk_gesture_get_type ())
#define GTK_GESTURE(o)           (G_TYPE_CHECK_INSTANCE_CAST ((o), GTK_TYPE_GESTURE, GtkGesture))
#define GTK_GESTURE_CLASS(k)     (G_TYPE_CHECK_CLASS_CAST ((k), GTK_TYPE_GESTURE, GtkGestureClass))
#define GTK_IS_GESTURE(o)        (G_TYPE_CHECK_INSTANCE_TYPE ((o), GTK_TYPE_GESTURE))
#define GTK_IS_GESTURE_CLASS(k)  (G_TYPE_CHECK_CLASS_TYPE ((k), GTK_TYPE_GESTURE))
#define GTK_GESTURE_GET_CLASS(o) (G_TYPE_INSTANCE_GET_CLASS ((o), GTK_TYPE_GESTURE, GtkGestureClass))

typedef struct _GtkGestureClass GtkGestureClass;


GType       gtk_gesture_get_type             (void) ;


GdkDevice * gtk_gesture_get_device           (GtkGesture       *gesture);


gboolean    gtk_gesture_set_state            (GtkGesture            *gesture,
                                              GtkEventSequenceState  state);

GtkEventSequenceState
            gtk_gesture_get_sequence_state   (GtkGesture            *gesture,
                                              GdkEventSequence      *sequence);

gboolean    gtk_gesture_set_sequence_state   (GtkGesture            *gesture,
                                              GdkEventSequence      *sequence,
                                              GtkEventSequenceState  state);

GList     * gtk_gesture_get_sequences        (GtkGesture       *gesture);


GdkEventSequence * gtk_gesture_get_last_updated_sequence
                                             (GtkGesture       *gesture);


gboolean    gtk_gesture_handles_sequence     (GtkGesture       *gesture,
                                              GdkEventSequence *sequence);

GdkEvent *
            gtk_gesture_get_last_event       (GtkGesture       *gesture,
                                              GdkEventSequence *sequence);


gboolean    gtk_gesture_get_point            (GtkGesture       *gesture,
                                              GdkEventSequence *sequence,
                                              double           *x,
                                              double           *y);

gboolean    gtk_gesture_get_bounding_box     (GtkGesture       *gesture,
                                              GdkRectangle     *rect);

gboolean    gtk_gesture_get_bounding_box_center
                                             (GtkGesture       *gesture,
                                              double           *x,
                                              double           *y);

gboolean    gtk_gesture_is_active            (GtkGesture       *gesture);


gboolean    gtk_gesture_is_recognized        (GtkGesture       *gesture);


void        gtk_gesture_group                (GtkGesture       *group_gesture,
                                              GtkGesture       *gesture);

void        gtk_gesture_ungroup              (GtkGesture       *gesture);


GList *     gtk_gesture_get_group            (GtkGesture       *gesture);


gboolean    gtk_gesture_is_grouped_with      (GtkGesture       *gesture,
                                              GtkGesture       *other);





