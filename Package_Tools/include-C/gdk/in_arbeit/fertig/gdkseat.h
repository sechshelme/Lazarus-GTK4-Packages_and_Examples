/* GDK - The GIMP Drawing Kit
 * Copyright (C) 2015 Red Hat
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
 * Author: Carlos Garnacho <carlosg@gnome.org>
 */

#pragma once

#if !defined (__GDK_H_INSIDE__) && !defined (GTK_COMPILATION)
#error "Only <gdk/gdk.h> can be included directly."
#endif

#include <glib-object.h>
#include <gdk/gdksurface.h>
#include <gdk/gdkevents.h>
#include <gdk/gdktypes.h>



#define GDK_TYPE_SEAT  (gdk_seat_get_type ())
#define GDK_SEAT(o)    (G_TYPE_CHECK_INSTANCE_CAST ((o), GDK_TYPE_SEAT, GdkSeat))
#define GDK_IS_SEAT(o) (G_TYPE_CHECK_INSTANCE_TYPE ((o), GDK_TYPE_SEAT))

/**
 * GdkSeatCapabilities:
 * @GDK_SEAT_CAPABILITY_NONE: No input capabilities
 * @GDK_SEAT_CAPABILITY_POINTER: The seat has a pointer (e.g. mouse)
 * @GDK_SEAT_CAPABILITY_TOUCH: The seat has touchscreen(s) attached
 * @GDK_SEAT_CAPABILITY_TABLET_STYLUS: The seat has drawing tablet(s) attached
 * @GDK_SEAT_CAPABILITY_KEYBOARD: The seat has keyboard(s) attached
 * @GDK_SEAT_CAPABILITY_TABLET_PAD: The seat has drawing tablet pad(s) attached
 * @GDK_SEAT_CAPABILITY_ALL_POINTING: The union of all pointing capabilities
 * @GDK_SEAT_CAPABILITY_ALL: The union of all capabilities
 *
 * Flags describing the seat capabilities.
 */
typedef enum {
  GDK_SEAT_CAPABILITY_NONE          = 0,
  GDK_SEAT_CAPABILITY_POINTER       = 1 << 0,
  GDK_SEAT_CAPABILITY_TOUCH         = 1 << 1,
  GDK_SEAT_CAPABILITY_TABLET_STYLUS = 1 << 2,
  GDK_SEAT_CAPABILITY_KEYBOARD      = 1 << 3,
  GDK_SEAT_CAPABILITY_TABLET_PAD    = 1 << 4,
  GDK_SEAT_CAPABILITY_ALL_POINTING  = (GDK_SEAT_CAPABILITY_POINTER | GDK_SEAT_CAPABILITY_TOUCH | GDK_SEAT_CAPABILITY_TABLET_STYLUS),
  GDK_SEAT_CAPABILITY_ALL           = (GDK_SEAT_CAPABILITY_ALL_POINTING | GDK_SEAT_CAPABILITY_KEYBOARD | GDK_SEAT_CAPABILITY_TABLET_PAD)
} GdkSeatCapabilities;

struct _GdkSeat
{
  GObject parent_instance;
};


GType          gdk_seat_get_type         (void) ;


GdkDisplay *   gdk_seat_get_display             (GdkSeat             *seat);


GdkSeatCapabilities
               gdk_seat_get_capabilities        (GdkSeat             *seat);


GList *        gdk_seat_get_devices             (GdkSeat             *seat,
                                                 GdkSeatCapabilities  capabilities);


GList *        gdk_seat_get_tools               (GdkSeat *seat);


GdkDevice *    gdk_seat_get_pointer             (GdkSeat             *seat);

GdkDevice *    gdk_seat_get_keyboard            (GdkSeat             *seat);





