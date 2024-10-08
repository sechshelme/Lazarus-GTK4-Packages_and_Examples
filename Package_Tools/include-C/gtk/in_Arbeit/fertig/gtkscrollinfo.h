/* GTK - The GIMP Toolkit
 * Copyright (C) 2023 Benjamin Otte
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

#pragma once

#if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)
#error "Only <gtk/gtk.h> can be included directly."
#endif


#include <gdk/gdk.h>
#include <gtk/gtkenums.h>
#include <gtk/gtktypes.h>

#include <graphene.h>



#define GTK_TYPE_SCROLL_INFO    (gtk_scroll_info_get_type ())


GType                   gtk_scroll_info_get_type                (void) ;

GtkScrollInfo *         gtk_scroll_info_new                     (void);


GtkScrollInfo *         gtk_scroll_info_ref                     (GtkScrollInfo           *self);

void                    gtk_scroll_info_unref                   (GtkScrollInfo           *self);


void                    gtk_scroll_info_set_enable_horizontal   (GtkScrollInfo           *self,
                                                                 gboolean                 horizontal);

gboolean                gtk_scroll_info_get_enable_horizontal   (GtkScrollInfo           *self);


void                    gtk_scroll_info_set_enable_vertical     (GtkScrollInfo           *self,
                                                                 gboolean                 vertical);

gboolean                gtk_scroll_info_get_enable_vertical     (GtkScrollInfo           *self);






