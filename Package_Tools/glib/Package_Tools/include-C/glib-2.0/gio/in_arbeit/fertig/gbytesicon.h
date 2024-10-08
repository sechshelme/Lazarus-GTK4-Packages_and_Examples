/* GIO - GLib Input, Output and Streaming Library
 *
 * Copyright (C) 2006-2007 Red Hat, Inc.
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
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
 * You should have received a copy of the GNU Lesser General
 * Public License along with this library; if not, see <http://www.gnu.org/licenses/>.
 *
 * Author: Ryan Lortie <desrt@desrt.ca>
 */

#ifndef __G_BYTES_ICON_H__
#define __G_BYTES_ICON_H__

#if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)
#error "Only <gio/gio.h> can be included directly."
#endif

#include <gio/giotypes.h>



#define G_TYPE_BYTES_ICON         (g_bytes_icon_get_type ())
#define G_BYTES_ICON(inst)        (G_TYPE_CHECK_INSTANCE_CAST ((inst), G_TYPE_BYTES_ICON, GBytesIcon))
#define G_IS_BYTES_ICON(inst)     (G_TYPE_CHECK_INSTANCE_TYPE ((inst), G_TYPE_BYTES_ICON))


GType   g_bytes_icon_get_type   (void) ;


GIcon * g_bytes_icon_new        (GBytes     *bytes);


GBytes * g_bytes_icon_get_bytes (GBytesIcon *icon);



#endif /* __G_BYTES_ICON_H__ */
