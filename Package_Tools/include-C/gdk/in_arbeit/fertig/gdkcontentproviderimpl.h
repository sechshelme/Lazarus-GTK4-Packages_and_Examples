/* GDK - The GIMP Drawing Kit
 *
 * Copyright (C) 2017 Benjamin Otte <otte@gnome.org>
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

#if !defined (__GDK_H_INSIDE__) && !defined (GTK_COMPILATION)
#error "Only <gdk/gdk.h> can be included directly."
#endif

#include <gdk/gdktypes.h>





GdkContentProvider *    gdk_content_provider_new_for_value              (const GValue           *value);

GdkContentProvider *    gdk_content_provider_new_typed                  (GType                   type,
                                                                         ...);

GdkContentProvider *    gdk_content_provider_new_union                  (GdkContentProvider    **providers,
                                                                         gsize                   n_providers);

GdkContentProvider *    gdk_content_provider_new_for_bytes              (const char             *mime_type,
                                                                         GBytes                 *bytes);




