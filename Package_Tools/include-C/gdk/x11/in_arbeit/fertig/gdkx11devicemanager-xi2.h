/* GDK - The GIMP Drawing Kit
 * Copyright (C) 2009 Carlos Garnacho <carlosg@gnome.org>
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

#include <gdk/gdk.h>



#define GDK_TYPE_X11_DEVICE_MANAGER_XI2         (gdk_x11_device_manager_xi2_get_type ())
#define GDK_X11_DEVICE_MANAGER_XI2(o)           (G_TYPE_CHECK_INSTANCE_CAST ((o), GDK_TYPE_X11_DEVICE_MANAGER_XI2, GdkX11DeviceManagerXI2))
#define GDK_X11_DEVICE_MANAGER_XI2_CLASS(c)     (G_TYPE_CHECK_CLASS_CAST ((c), GDK_TYPE_X11_DEVICE_MANAGER_XI2, GdkX11DeviceManagerXI2Class))
#define GDK_IS_X11_DEVICE_MANAGER_XI2(o)        (G_TYPE_CHECK_INSTANCE_TYPE ((o), GDK_TYPE_X11_DEVICE_MANAGER_XI2))
#define GDK_IS_X11_DEVICE_MANAGER_XI2_CLASS(c)  (G_TYPE_CHECK_CLASS_TYPE ((c), GDK_TYPE_X11_DEVICE_MANAGER_XI2))
#define GDK_X11_DEVICE_MANAGER_XI2_GET_CLASS(o) (G_TYPE_INSTANCE_GET_CLASS ((o), GDK_TYPE_X11_DEVICE_MANAGER_XI2, GdkX11DeviceManagerXI2Class))

typedef struct _GdkX11DeviceManagerXI2 GdkX11DeviceManagerXI2;
typedef struct _GdkX11DeviceManagerXI2Class GdkX11DeviceManagerXI2Class;



GType gdk_x11_device_manager_xi2_get_type (void) ;




