/*
 * Copyright © 2016  Endless 
 *             2018  Benjamin Otte
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

#if !defined (__GSK_H_INSIDE__) && !defined (GTK_COMPILATION)
#error "Only <gsk/gsk.h> can be included directly."
#endif

#include <cairo.h>
#include <gsk/gskrenderer.h>



#define GSK_TYPE_CAIRO_RENDERER (gsk_cairo_renderer_get_type ())

#define GSK_CAIRO_RENDERER(obj)                 (G_TYPE_CHECK_INSTANCE_CAST ((obj), GSK_TYPE_CAIRO_RENDERER, GskCairoRenderer))
#define GSK_IS_CAIRO_RENDERER(obj)              (G_TYPE_CHECK_INSTANCE_TYPE ((obj), GSK_TYPE_CAIRO_RENDERER))
#define GSK_CAIRO_RENDERER_CLASS(klass)         (G_TYPE_CHECK_CLASS_CAST ((klass), GSK_TYPE_CAIRO_RENDERER, GskCairoRendererClass))
#define GSK_IS_CAIRO_RENDERER_CLASS(klass)      (G_TYPE_CHECK_CLASS_TYPE ((klass), GSK_TYPE_CAIRO_RENDERER))
#define GSK_CAIRO_RENDERER_GET_CLASS(obj)       (G_TYPE_INSTANCE_GET_CLASS ((obj), GSK_TYPE_CAIRO_RENDERER, GskCairoRendererClass))

/**
 * GskCairoRenderer:
 *
 * A GSK renderer that is using cairo.
 *
 * Since it is using cairo, this renderer cannot support
 * 3D transformations.
 */
typedef struct _GskCairoRenderer                GskCairoRenderer;
typedef struct _GskCairoRendererClass           GskCairoRendererClass;


GType                   gsk_cairo_renderer_get_type             (void) ;


GskRenderer *           gsk_cairo_renderer_new                  (void);



