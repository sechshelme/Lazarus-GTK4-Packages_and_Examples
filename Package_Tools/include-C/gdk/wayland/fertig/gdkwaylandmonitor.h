/*
 * gdkwaylandmonitor.h
 *
 * Copyright 2016 Red Hat, Inc.
 *
 * Matthias Clasen <mclasen@redhat.com>
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

#if !defined (__GDKWAYLAND_H_INSIDE__) && !defined (GTK_COMPILATION)
#error "Only <gdk/wayland/gdkwayland.h> can be included directly."
#endif

#include <gdk/gdkmonitor.h>



#define GDK_TYPE_WAYLAND_MONITOR           (gdk_wayland_monitor_get_type ())
#define GDK_WAYLAND_MONITOR(object)        (G_TYPE_CHECK_INSTANCE_CAST ((object), GDK_TYPE_WAYLAND_MONITOR, GdkWaylandMonitor))
#define GDK_IS_WAYLAND_MONITOR(object)     (G_TYPE_CHECK_INSTANCE_TYPE ((object), GDK_TYPE_WAYLAND_MONITOR))

typedef struct _GdkWaylandMonitor      GdkWaylandMonitor;
typedef struct _GdkWaylandMonitorClass GdkWaylandMonitorClass;


GType             gdk_wayland_monitor_get_type            (void) ;


wl_output *gdk_wayland_monitor_get_wl_output       (GdkMonitor *monitor);



