/*
 * Copyright © 2020 Benjamin Otte
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


#include <gsk/gsktypes.h>



#define GSK_TYPE_STROKE (gsk_stroke_get_type ())


GType                   gsk_stroke_get_type                     (void) ;

GskStroke *             gsk_stroke_new                          (float                   line_width);

GskStroke *             gsk_stroke_copy                         (const GskStroke        *other);

void                    gsk_stroke_free                         (GskStroke              *self);


gboolean                gsk_stroke_equal                        (gconstpointer           stroke1,
                                                                 gconstpointer           stroke2);


void                    gsk_stroke_set_line_width               (GskStroke              *self,
                                                                 float                   line_width);

float                   gsk_stroke_get_line_width               (const GskStroke        *self);

void                    gsk_stroke_set_line_cap                 (GskStroke              *self,
                                                                 GskLineCap              line_cap);

GskLineCap              gsk_stroke_get_line_cap                 (const GskStroke        *self);

void                    gsk_stroke_set_line_join                (GskStroke              *self,
                                                                 GskLineJoin             line_join);

GskLineJoin             gsk_stroke_get_line_join                (const GskStroke        *self);


void                    gsk_stroke_set_miter_limit              (GskStroke              *self,
                                                                 float                   limit);

float                   gsk_stroke_get_miter_limit              (const GskStroke        *self);


void                    gsk_stroke_set_dash                     (GskStroke              *self,
                                                                 const float            *dash,
                                                                 gsize                   n_dash);

const float *           gsk_stroke_get_dash                     (const GskStroke        *self,
                                                                 gsize                  *n_dash);


void                    gsk_stroke_set_dash_offset              (GskStroke              *self,
                                                                 float                   offset);

float                   gsk_stroke_get_dash_offset              (const GskStroke        *self);


void                    gsk_stroke_to_cairo                     (const GskStroke        *self,
                                                                 cairo_t                *cr);



