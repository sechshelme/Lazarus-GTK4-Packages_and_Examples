/* GDK - The GIMP Drawing Kit
 *
 * gdkcairocontext.h:  specific Cairo wrappers
 *
 * Copyright © 2018  Benjamin Otte
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
 */

#pragma once

#if !defined (__GDK_H_INSIDE__) && !defined (GTK_COMPILATION)
#error "Only <gdk/gdk.h> can be included directly."
#endif

#include <gdk/gdktypes.h>



#define GDK_TYPE_CAIRO_CONTEXT             (gdk_cairo_context_get_type ())
#define GDK_CAIRO_CONTEXT(obj)             (G_TYPE_CHECK_INSTANCE_CAST ((obj), GDK_TYPE_CAIRO_CONTEXT, GdkCairoContext))
#define GDK_IS_CAIRO_CONTEXT(obj)          (G_TYPE_CHECK_INSTANCE_TYPE ((obj), GDK_TYPE_CAIRO_CONTEXT))

#define GDK_CAIRO_ERROR                    (gdk_cairo_error_quark ())


GType                   gdk_cairo_context_get_type                      (void) ;


cairo_t *               gdk_cairo_context_cairo_create                  (GdkCairoContext        *self);



