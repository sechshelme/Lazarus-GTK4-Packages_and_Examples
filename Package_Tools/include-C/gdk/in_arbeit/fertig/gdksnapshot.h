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

#if !defined (__GDK_H_INSIDE__) && !defined (GTK_COMPILATION)
#error "Only <gdk/gdk.h> can be included directly."
#endif

#include <gdk/gdktypes.h>



typedef struct _GdkSnapshotClass        GdkSnapshotClass;

#define GDK_TYPE_SNAPSHOT               (gdk_snapshot_get_type ())

#define GDK_SNAPSHOT(obj)               (G_TYPE_CHECK_INSTANCE_CAST ((obj), GDK_TYPE_SNAPSHOT, GdkSnapshot))
#define GDK_IS_SNAPSHOT(obj)            (G_TYPE_CHECK_INSTANCE_TYPE ((obj), GDK_TYPE_SNAPSHOT))


GType           gdk_snapshot_get_type   (void) ;





