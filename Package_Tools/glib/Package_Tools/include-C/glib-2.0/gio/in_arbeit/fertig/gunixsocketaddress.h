/* GIO - GLib Input, Output and Streaming Library
 *
 * Copyright (C) 2008 Christian Kellner, Samuel Cormier-Iijima
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
 * Authors: Christian Kellner <gicmo@gnome.org>
 *          Samuel Cormier-Iijima <sciyoshi@gmail.com>
 */

#ifndef __G_UNIX_SOCKET_ADDRESS_H__
#define __G_UNIX_SOCKET_ADDRESS_H__

#include <gio/gio.h>



#define G_TYPE_UNIX_SOCKET_ADDRESS         (g_unix_socket_address_get_type ())
#define G_UNIX_SOCKET_ADDRESS(o)           (G_TYPE_CHECK_INSTANCE_CAST ((o), G_TYPE_UNIX_SOCKET_ADDRESS, GUnixSocketAddress))
#define G_UNIX_SOCKET_ADDRESS_CLASS(k)     (G_TYPE_CHECK_CLASS_CAST((k), G_TYPE_UNIX_SOCKET_ADDRESS, GUnixSocketAddressClass))
#define G_IS_UNIX_SOCKET_ADDRESS(o)        (G_TYPE_CHECK_INSTANCE_TYPE ((o), G_TYPE_UNIX_SOCKET_ADDRESS))
#define G_IS_UNIX_SOCKET_ADDRESS_CLASS(k)  (G_TYPE_CHECK_CLASS_TYPE ((k), G_TYPE_UNIX_SOCKET_ADDRESS))
#define G_UNIX_SOCKET_ADDRESS_GET_CLASS(o) (G_TYPE_INSTANCE_GET_CLASS ((o), G_TYPE_UNIX_SOCKET_ADDRESS, GUnixSocketAddressClass))

typedef struct _GUnixSocketAddress        GUnixSocketAddress;
typedef struct _GUnixSocketAddressClass   GUnixSocketAddressClass;
typedef struct _GUnixSocketAddressPrivate GUnixSocketAddressPrivate;



struct _GUnixSocketAddress
{
  GSocketAddress parent_instance;

  /*< private >*/
  GUnixSocketAddressPrivate *priv;
};

struct _GUnixSocketAddressClass
{
  GSocketAddressClass parent_class;
};


GType           g_unix_socket_address_get_type    (void) ;


GSocketAddress *g_unix_socket_address_new             (const gchar        *path);
GSocketAddress *g_unix_socket_address_new_abstract    (const gchar        *path,
                                                       gint                path_len);

GSocketAddress *g_unix_socket_address_new_with_type   (const gchar            *path,
                                                       gint                    path_len,
                                                       GUnixSocketAddressType  type);

const char *    g_unix_socket_address_get_path        (GUnixSocketAddress *address);

gsize           g_unix_socket_address_get_path_len    (GUnixSocketAddress *address);

GUnixSocketAddressType g_unix_socket_address_get_address_type (GUnixSocketAddress *address);
gboolean        g_unix_socket_address_get_is_abstract (GUnixSocketAddress *address);


gboolean        g_unix_socket_address_abstract_names_supported (void);



#endif /* __G_UNIX_SOCKET_ADDRESS_H__ */
