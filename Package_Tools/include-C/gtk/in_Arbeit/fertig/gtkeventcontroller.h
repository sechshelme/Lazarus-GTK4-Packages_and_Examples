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

typedef struct _GtkEventControllerClass GtkEventControllerClass;

#include <gdk/gdk.h>
#include <gtk/gtktypes.h>
#include <gtk/gtkenums.h>



#define GTK_TYPE_EVENT_CONTROLLER         (gtk_event_controller_get_type ())
#define GTK_EVENT_CONTROLLER(o)           (G_TYPE_CHECK_INSTANCE_CAST ((o), GTK_TYPE_EVENT_CONTROLLER, GtkEventController))
#define GTK_EVENT_CONTROLLER_CLASS(k)     (G_TYPE_CHECK_CLASS_CAST ((k), GTK_TYPE_EVENT_CONTROLLER, GtkEventControllerClass))
#define GTK_IS_EVENT_CONTROLLER(o)        (G_TYPE_CHECK_INSTANCE_TYPE ((o), GTK_TYPE_EVENT_CONTROLLER))
#define GTK_IS_EVENT_CONTROLLER_CLASS(k)  (G_TYPE_CHECK_CLASS_TYPE ((k), GTK_TYPE_EVENT_CONTROLLER))
#define GTK_EVENT_CONTROLLER_GET_CLASS(o) (G_TYPE_INSTANCE_GET_CLASS ((o), GTK_TYPE_EVENT_CONTROLLER, GtkEventControllerClass))




GType        gtk_event_controller_get_type       (void) ;


GtkWidget  * gtk_event_controller_get_widget     (GtkEventController *controller);


void         gtk_event_controller_reset          (GtkEventController *controller);


GtkPropagationPhase gtk_event_controller_get_propagation_phase (GtkEventController *controller);


void                gtk_event_controller_set_propagation_phase (GtkEventController  *controller,
                                                                GtkPropagationPhase  phase);


GtkPropagationLimit gtk_event_controller_get_propagation_limit (GtkEventController *controller);


void                gtk_event_controller_set_propagation_limit (GtkEventController  *controller,
                                                                GtkPropagationLimit  limit);

const char *        gtk_event_controller_get_name              (GtkEventController *controller);

void                gtk_event_controller_set_name              (GtkEventController *controller,
                                                                const char         *name);

void                gtk_event_controller_set_static_name       (GtkEventController *controller,
                                                                const char         *name);


GdkEvent *          gtk_event_controller_get_current_event    (GtkEventController *controller);

guint32             gtk_event_controller_get_current_event_time   (GtkEventController *controller);

GdkDevice *         gtk_event_controller_get_current_event_device (GtkEventController *controller);

GdkModifierType     gtk_event_controller_get_current_event_state (GtkEventController *controller);





