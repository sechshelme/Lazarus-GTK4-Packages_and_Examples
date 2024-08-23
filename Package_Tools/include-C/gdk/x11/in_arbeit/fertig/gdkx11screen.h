/* GDK - The GIMP Drawing Kit
 * Copyright (C) 1995-1997 Peter Mattis, Spencer Kimball and Josh MacDonald
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

/*
 * Modified by the GTK+ Team and others 1997-2000.  See the AUTHORS
 * file for a list of people on the GTK+ Team.  See the ChangeLog
 * files for a list of changes.  These files are distributed with
 * GTK+ at ftp://ftp.gtk.org/pub/gtk/. 
 */

#pragma once

#if !defined (__GDKX_H_INSIDE__) && !defined (GTK_COMPILATION)
#error "Only <gdk/x11/gdkx.h> can be included directly."
#endif

#include <gdk/gdk.h>

#include <X11/Xlib.h>
#include <X11/Xutil.h>



#define GDK_TYPE_X11_SCREEN              (gdk_x11_screen_get_type ())
#define GDK_X11_SCREEN(object)           (G_TYPE_CHECK_INSTANCE_CAST ((object), GDK_TYPE_X11_SCREEN, GdkX11Screen))
#define GDK_X11_SCREEN_CLASS(klass)      (G_TYPE_CHECK_CLASS_CAST ((klass), GDK_TYPE_X11_SCREEN, GdkX11ScreenClass))
#define GDK_IS_X11_SCREEN(object)        (G_TYPE_CHECK_INSTANCE_TYPE ((object), GDK_TYPE_X11_SCREEN))
#define GDK_IS_X11_SCREEN_CLASS(klass)   (G_TYPE_CHECK_CLASS_TYPE ((klass), GDK_TYPE_X11_SCREEN))
#define GDK_X11_SCREEN_GET_CLASS(obj)    (G_TYPE_INSTANCE_GET_CLASS ((obj), GDK_TYPE_X11_SCREEN, GdkX11ScreenClass))

typedef struct _GdkX11Screen GdkX11Screen;
typedef struct _GdkX11ScreenClass GdkX11ScreenClass;


GType    gdk_x11_screen_get_type          (void);


Screen * gdk_x11_screen_get_xscreen       (GdkX11Screen   *screen);

int      gdk_x11_screen_get_screen_number (GdkX11Screen   *screen);


const char* gdk_x11_screen_get_window_manager_name (GdkX11Screen *screen);


gboolean gdk_x11_screen_supports_net_wm_hint (GdkX11Screen *screen,
                                              const char   *property_name);


XID      gdk_x11_screen_get_monitor_output   (GdkX11Screen *screen,
                                              int           monitor_num);


guint32  gdk_x11_screen_get_number_of_desktops (GdkX11Screen *screen);

guint32  gdk_x11_screen_get_current_desktop    (GdkX11Screen *screen);



