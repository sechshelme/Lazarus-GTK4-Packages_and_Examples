/* GSK - The GTK Scene Kit
 *
 * Copyright 2016  Endless
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

#if !defined (__GSK_H_INSIDE__) && !defined (GTK_COMPILATION)
#error "Only <gsk/gsk.h> can be included directly."
#endif

#include <gsk/gsktypes.h>



/**
 * GSK_ROUNDED_RECT_INIT:
 * @_x: the X coordinate of the origin
 * @_y: the Y coordinate of the origin
 * @_w: the width
 * @_h: the height
 *
 * Initializes a `GskRoundedRect` when declaring it.
 * All corner sizes will be initialized to 0.
 */
/*
#define GSK_ROUNDED_RECT_INIT(_x,_y,_w,_h)       (GskRoundedRect) { .bounds = GRAPHENE_RECT_INIT(_x,_y,_w,_h), \
                                                                    .corner = { \
                                                                       GRAPHENE_SIZE_INIT(0, 0),\
                                                                       GRAPHENE_SIZE_INIT(0, 0),\
                                                                       GRAPHENE_SIZE_INIT(0, 0),\
                                                                       GRAPHENE_SIZE_INIT(0, 0),\
                                                                    }}

*/

struct _GskRoundedRect
{
  graphene_rect_t bounds;

  graphene_size_t corner[4];
};


GskRoundedRect *        gsk_rounded_rect_init                   (GskRoundedRect           *self,
                                                                 const graphene_rect_t    *bounds,
                                                                 const graphene_size_t    *top_left,
                                                                 const graphene_size_t    *top_right,
                                                                 const graphene_size_t    *bottom_right,
                                                                 const graphene_size_t    *bottom_left);

GskRoundedRect *        gsk_rounded_rect_init_copy              (GskRoundedRect           *self,
                                                                 const GskRoundedRect     *src);

GskRoundedRect *        gsk_rounded_rect_init_from_rect         (GskRoundedRect           *self,
                                                                 const graphene_rect_t    *bounds,
                                                                 float                     radius);


GskRoundedRect *        gsk_rounded_rect_normalize              (GskRoundedRect           *self);


GskRoundedRect *        gsk_rounded_rect_offset                 (GskRoundedRect           *self,
                                                                 float                     dx,
                                                                 float                     dy);

GskRoundedRect *        gsk_rounded_rect_shrink                 (GskRoundedRect           *self,
                                                                 float                     top,
                                                                 float                     right,
                                                                 float                     bottom,
                                                                 float                     left);


gboolean                gsk_rounded_rect_is_rectilinear         (const GskRoundedRect     *self) ;

gboolean                gsk_rounded_rect_contains_point         (const GskRoundedRect     *self,
                                                                 const graphene_point_t   *point) ;

gboolean                gsk_rounded_rect_contains_rect          (const GskRoundedRect     *self,
                                                                 const graphene_rect_t    *rect) ;

gboolean                gsk_rounded_rect_intersects_rect        (const GskRoundedRect     *self,
                                                                 const graphene_rect_t    *rect) ;



