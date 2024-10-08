/*
 * Copyright © 2018 Benjamin Otte
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
 * Authors: Benjamin Otte <otte@gnome.org>
 */

#pragma once

#if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)
#error "Only <gtk/gtk.h> can be included directly."
#endif

#include <gtk/gtkmediastream.h>
#include <gtk/gtkwidget.h>



#define GTK_TYPE_MEDIA_CONTROLS         (gtk_media_controls_get_type ())


//G_DECLARE_FINAL_TYPE (GtkMediaControls, gtk_media_controls, GTK, MEDIA_CONTROLS, GtkWidget)


GtkWidget      *gtk_media_controls_new                  (GtkMediaStream         *stream);


GtkMediaStream *gtk_media_controls_get_media_stream     (GtkMediaControls       *controls);

void            gtk_media_controls_set_media_stream     (GtkMediaControls       *controls,
                                                         GtkMediaStream         *stream);




