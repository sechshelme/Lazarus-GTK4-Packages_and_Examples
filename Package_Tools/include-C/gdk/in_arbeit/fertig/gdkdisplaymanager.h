/* GDK - The GIMP Drawing Kit
 * Copyright (C) 2000 Red Hat, Inc.
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

#if !defined (__GDK_H_INSIDE__) && !defined (GTK_COMPILATION)
#error "Only <gdk/gdk.h> can be included directly."
#endif

#include <gdk/gdktypes.h>
#include <gdk/gdkdisplay.h>



#define GDK_TYPE_DISPLAY_MANAGER              (gdk_display_manager_get_type ())
#define GDK_DISPLAY_MANAGER(object)           (G_TYPE_CHECK_INSTANCE_CAST ((object), GDK_TYPE_DISPLAY_MANAGER, GdkDisplayManager))
#define GDK_IS_DISPLAY_MANAGER(object)        (G_TYPE_CHECK_INSTANCE_TYPE ((object), GDK_TYPE_DISPLAY_MANAGER))



GType              gdk_display_manager_get_type            (void) ;


GdkDisplayManager *gdk_display_manager_get                 (void);

GdkDisplay *       gdk_display_manager_get_default_display (GdkDisplayManager *manager);

void               gdk_display_manager_set_default_display (GdkDisplayManager *manager,
                                                            GdkDisplay        *display);

GSList *           gdk_display_manager_list_displays       (GdkDisplayManager *manager);

GdkDisplay *       gdk_display_manager_open_display        (GdkDisplayManager *manager,
                                                            const char        *name);

void               gdk_set_allowed_backends                (const char        *backends);





