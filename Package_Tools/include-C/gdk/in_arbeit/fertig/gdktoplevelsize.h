/* GDK - The GIMP Drawing Kit
 * Copyright (C) 2020 Red Hat
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
 */

#pragma once

#if !defined(__GDK_H_INSIDE__) && !defined(GTK_COMPILATION)
#error "Only <gdk/gdk.h> can be included directly."
#endif

#include <gdk/gdktypes.h>



typedef struct _GdkToplevelSize GdkToplevelSize;

#define GDK_TYPE_TOPLEVEL_SIZE (gdk_toplevel_size_get_type ())


GType                   gdk_toplevel_size_get_type      (void);


void                    gdk_toplevel_size_get_bounds    (GdkToplevelSize       *size,
                                                         int                   *bounds_width,
                                                         int                   *bounds_height);


void                    gdk_toplevel_size_set_size      (GdkToplevelSize       *size,
                                                         int                    width,
                                                         int                    height);

void                    gdk_toplevel_size_set_min_size  (GdkToplevelSize       *size,
                                                         int                    min_width,
                                                         int                    min_height);


void                    gdk_toplevel_size_set_shadow_width (GdkToplevelSize    *size,
                                                            int                 left,
                                                            int                 right,
                                                            int                 top,
                                                            int                 bottom);



