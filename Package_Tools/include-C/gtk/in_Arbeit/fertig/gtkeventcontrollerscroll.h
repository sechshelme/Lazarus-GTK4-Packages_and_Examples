/* GTK - The GIMP Toolkit
 * Copyright (C) 2017, Red Hat, Inc.
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

#include <gdk/gdk.h>
#include <gtk/gtkeventcontroller.h>



#define GTK_TYPE_EVENT_CONTROLLER_SCROLL         (gtk_event_controller_scroll_get_type ())
#define GTK_EVENT_CONTROLLER_SCROLL(o)           (G_TYPE_CHECK_INSTANCE_CAST ((o), GTK_TYPE_EVENT_CONTROLLER_SCROLL, GtkEventControllerScroll))
#define GTK_EVENT_CONTROLLER_SCROLL_CLASS(k)     (G_TYPE_CHECK_CLASS_CAST ((k), GTK_TYPE_EVENT_CONTROLLER_SCROLL, GtkEventControllerScrollClass))
#define GTK_IS_EVENT_CONTROLLER_SCROLL(o)        (G_TYPE_CHECK_INSTANCE_TYPE ((o), GTK_TYPE_EVENT_CONTROLLER_SCROLL))
#define GTK_IS_EVENT_CONTROLLER_SCROLL_CLASS(k)  (G_TYPE_CHECK_CLASS_TYPE ((k), GTK_TYPE_EVENT_CONTROLLER_SCROLL))
#define GTK_EVENT_CONTROLLER_SCROLL_GET_CLASS(o) (G_TYPE_INSTANCE_GET_CLASS ((o), GTK_TYPE_EVENT_CONTROLLER_SCROLL, GtkEventControllerScrollClass))

typedef struct _GtkEventControllerScroll GtkEventControllerScroll;
typedef struct _GtkEventControllerScrollClass GtkEventControllerScrollClass;

/**
 * GtkEventControllerScrollFlags:
 * @GTK_EVENT_CONTROLLER_SCROLL_NONE: Don't emit scroll.
 * @GTK_EVENT_CONTROLLER_SCROLL_VERTICAL: Emit scroll with vertical deltas.
 * @GTK_EVENT_CONTROLLER_SCROLL_HORIZONTAL: Emit scroll with horizontal deltas.
 * @GTK_EVENT_CONTROLLER_SCROLL_DISCRETE: Only emit deltas that are multiples of 1.
 * @GTK_EVENT_CONTROLLER_SCROLL_KINETIC: Emit ::decelerate after continuous scroll finishes.
 * @GTK_EVENT_CONTROLLER_SCROLL_BOTH_AXES: Emit scroll on both axes.
 *
 * Describes the behavior of a `GtkEventControllerScroll`.
 **/
typedef enum {
  GTK_EVENT_CONTROLLER_SCROLL_NONE       = 0,
  GTK_EVENT_CONTROLLER_SCROLL_VERTICAL   = 1 << 0,
  GTK_EVENT_CONTROLLER_SCROLL_HORIZONTAL = 1 << 1,
  GTK_EVENT_CONTROLLER_SCROLL_DISCRETE   = 1 << 2,
  GTK_EVENT_CONTROLLER_SCROLL_KINETIC    = 1 << 3,
  GTK_EVENT_CONTROLLER_SCROLL_BOTH_AXES  = (GTK_EVENT_CONTROLLER_SCROLL_VERTICAL | GTK_EVENT_CONTROLLER_SCROLL_HORIZONTAL),
} GtkEventControllerScrollFlags;


GType               gtk_event_controller_scroll_get_type  (void) ;


GtkEventController *gtk_event_controller_scroll_new       (GtkEventControllerScrollFlags  flags);

void                gtk_event_controller_scroll_set_flags (GtkEventControllerScroll      *scroll,
                                                           GtkEventControllerScrollFlags  flags);

GtkEventControllerScrollFlags
                    gtk_event_controller_scroll_get_flags (GtkEventControllerScroll      *scroll);


GdkScrollUnit       gtk_event_controller_scroll_get_unit (GtkEventControllerScroll       *scroll);



