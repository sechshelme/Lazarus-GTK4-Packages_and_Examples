/* gdkapplaunchcontext.h - Gtk+ implementation for GAppLaunchContext
 *
 * Copyright (C) 2007 Red Hat, Inc.
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
 * Author: Alexander Larsson <alexl@redhat.com>
 */

#pragma once

#if !defined (__GDK_H_INSIDE__) && !defined (GTK_COMPILATION)
#error "Only <gdk/gdk.h> can be included directly."
#endif

#include <gdk/gdktypes.h>



#define GDK_TYPE_APP_LAUNCH_CONTEXT         (gdk_app_launch_context_get_type ())
#define GDK_APP_LAUNCH_CONTEXT(o)           (G_TYPE_CHECK_INSTANCE_CAST ((o), GDK_TYPE_APP_LAUNCH_CONTEXT, GdkAppLaunchContext))
#define GDK_IS_APP_LAUNCH_CONTEXT(o)        (G_TYPE_CHECK_INSTANCE_TYPE ((o), GDK_TYPE_APP_LAUNCH_CONTEXT))



GType                gdk_app_launch_context_get_type      (void);


GdkDisplay *         gdk_app_launch_context_get_display   (GdkAppLaunchContext *context);


void                 gdk_app_launch_context_set_desktop   (GdkAppLaunchContext *context,
                                                           int                  desktop);

void                 gdk_app_launch_context_set_timestamp (GdkAppLaunchContext *context,
                                                           guint32              timestamp);

void                 gdk_app_launch_context_set_icon      (GdkAppLaunchContext *context,
                                                           GIcon               *icon);

void                 gdk_app_launch_context_set_icon_name (GdkAppLaunchContext *context,
                                                           const char          *icon_name);





