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
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the GNU
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




const char *gdk_keyval_name      (guint        keyval) ;


guint    gdk_keyval_from_name    (const char *keyval_name);

void     gdk_keyval_convert_case (guint        symbol,
				  guint       *lower,
				  guint       *upper);

guint    gdk_keyval_to_upper     (guint        keyval) ;

guint    gdk_keyval_to_lower     (guint        keyval) ;

gboolean gdk_keyval_is_upper     (guint        keyval) ;

gboolean gdk_keyval_is_lower     (guint        keyval) ;


guint32  gdk_keyval_to_unicode   (guint        keyval) ;

guint    gdk_unicode_to_keyval   (guint32      wc) ;




