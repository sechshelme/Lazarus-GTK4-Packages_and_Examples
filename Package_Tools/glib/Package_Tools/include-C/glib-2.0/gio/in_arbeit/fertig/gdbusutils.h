/* GDBus - GLib D-Bus Library
 *
 * Copyright (C) 2008-2010 Red Hat, Inc.
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
 * Author: David Zeuthen <davidz@redhat.com>
 */

#ifndef __G_DBUS_UTILS_H__
#define __G_DBUS_UTILS_H__

#if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)
#error "Only <gio/gio.h> can be included directly."
#endif

#include <gio/giotypes.h>




gboolean g_dbus_is_guid (const gchar *string);

gchar *g_dbus_generate_guid (void);


gboolean g_dbus_is_name (const gchar *string);

gboolean g_dbus_is_unique_name (const gchar *string);

gboolean g_dbus_is_member_name (const gchar *string);

gboolean g_dbus_is_interface_name (const gchar *string);
gboolean g_dbus_is_error_name (const gchar *string);


void g_dbus_gvariant_to_gvalue (GVariant  *value,
                                GValue    *out_gvalue);

GVariant *g_dbus_gvalue_to_gvariant (const GValue         *gvalue,
                                     const GVariantType   *type);
gchar *g_dbus_escape_object_path_bytestring (const guint8 *bytes);
gchar *g_dbus_escape_object_path (const gchar *s);
guint8 *g_dbus_unescape_object_path (const gchar *s);



#endif /* __G_DBUS_UTILS_H__ */
