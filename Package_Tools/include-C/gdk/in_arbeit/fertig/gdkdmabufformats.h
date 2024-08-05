/* gdkdmabufformats.h
 *
 * Copyright 2023 Red Hat, Inc.
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



#define GDK_TYPE_DMABUF_FORMATS (gdk_dmabuf_formats_get_type ())


GType              gdk_dmabuf_formats_get_type        (void) ;


GdkDmabufFormats * gdk_dmabuf_formats_ref             (GdkDmabufFormats *formats);


void               gdk_dmabuf_formats_unref           (GdkDmabufFormats *formats);


gsize              gdk_dmabuf_formats_get_n_formats   (GdkDmabufFormats *formats) ;


void               gdk_dmabuf_formats_get_format      (GdkDmabufFormats *formats,
                                                       gsize             idx,
                                                       guint32          *fourcc,
                                                       guint64          *modifier);


gboolean           gdk_dmabuf_formats_contains        (GdkDmabufFormats *formats,
                                                       guint32           fourcc,
                                                       guint64           modifier) ;


gboolean           gdk_dmabuf_formats_equal           (const GdkDmabufFormats *formats1,
                                                       const GdkDmabufFormats *formats2);


