/* GDK - The GIMP Drawing Kit
 * Copyright (C) 2013 Jan Arne Petersen
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

#if !defined (__GDKWAYLAND_H_INSIDE__) && !defined (GTK_COMPILATION)
#error "Only <gdk/wayland/gdkwayland.h> can be included directly."
#endif

#include <gdk/gdk.h>

#include <wayland-client.h>



#ifdef GTK_COMPILATION
typedef struct _GdkWaylandDevice GdkWaylandDevice;
#else
typedef GdkDevice GdkWaylandDevice;
#endif

typedef struct _GdkWaylandDeviceClass GdkWaylandDeviceClass;

#define GDK_TYPE_WAYLAND_DEVICE         (gdk_wayland_device_get_type ())
#define GDK_WAYLAND_DEVICE(o)           (G_TYPE_CHECK_INSTANCE_CAST ((o), GDK_TYPE_WAYLAND_DEVICE, GdkWaylandDevice))
#define GDK_WAYLAND_DEVICE_CLASS(c)     (G_TYPE_CHECK_CLASS_CAST ((c), GDK_TYPE_WAYLAND_DEVICE, GdkWaylandDeviceClass))
#define GDK_IS_WAYLAND_DEVICE(o)        (G_TYPE_CHECK_INSTANCE_TYPE ((o), GDK_TYPE_WAYLAND_DEVICE))
#define GDK_IS_WAYLAND_DEVICE_CLASS(c)  (G_TYPE_CHECK_CLASS_TYPE ((c), GDK_TYPE_WAYLAND_DEVICE))
#define GDK_WAYLAND_DEVICE_GET_CLASS(o) (G_TYPE_INSTANCE_GET_CLASS ((o), GDK_TYPE_WAYLAND_DEVICE, GdkWaylandDeviceClass))


GType                gdk_wayland_device_get_type            (void);


wl_seat      *gdk_wayland_device_get_wl_seat         (GdkDevice *device);

wl_pointer   *gdk_wayland_device_get_wl_pointer      (GdkDevice *device);

wl_keyboard  *gdk_wayland_device_get_wl_keyboard     (GdkDevice *device);

xkb_keymap   *gdk_wayland_device_get_xkb_keymap      (GdkDevice *device);


const char          *gdk_wayland_device_get_node_path       (GdkDevice *device);



