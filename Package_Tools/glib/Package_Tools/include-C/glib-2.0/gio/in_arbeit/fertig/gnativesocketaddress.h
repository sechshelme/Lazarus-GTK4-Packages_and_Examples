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

#ifndef __G_NATIVE_SOCKET_ADDRESS_H__
#define __G_NATIVE_SOCKET_ADDRESS_H__

#if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)
#error "Only <gio/gio.h> can be included directly."
#endif

#include <gio/gsocketaddress.h>



#define G_TYPE_NATIVE_SOCKET_ADDRESS         (g_native_socket_address_get_type ())
#define G_NATIVE_SOCKET_ADDRESS(o)           (G_TYPE_CHECK_INSTANCE_CAST ((o), G_TYPE_NATIVE_SOCKET_ADDRESS, GNativeSocketAddress))
#define G_NATIVE_SOCKET_ADDRESS_CLASS(k)     (G_TYPE_CHECK_CLASS_CAST((k), G_TYPE_NATIVE_SOCKET_ADDRESS, GNativeSocketAddressClass))
#define G_IS_NATIVE_SOCKET_ADDRESS(o)        (G_TYPE_CHECK_INSTANCE_TYPE ((o), G_TYPE_NATIVE_SOCKET_ADDRESS))
#define G_IS_NATIVE_SOCKET_ADDRESS_CLASS(k)  (G_TYPE_CHECK_CLASS_TYPE ((k), G_TYPE_NATIVE_SOCKET_ADDRESS))
#define G_NATIVE_SOCKET_ADDRESS_GET_CLASS(o) (G_TYPE_INSTANCE_GET_CLASS ((o), G_TYPE_NATIVE_SOCKET_ADDRESS, GNativeSocketAddressClass))

typedef struct _GNativeSocketAddressClass   GNativeSocketAddressClass;
typedef struct _GNativeSocketAddressPrivate GNativeSocketAddressPrivate;

struct _GNativeSocketAddress
{
  GSocketAddress parent_instance;

  /*< private >*/
  GNativeSocketAddressPrivate *priv;
};

struct _GNativeSocketAddressClass
{
  GSocketAddressClass parent_class;
};

GType           g_native_socket_address_get_type        (void) ;

GSocketAddress *g_native_socket_address_new            (gpointer        native,
                                                        gsize           len);



#endif /* __G_NATIVE_SOCKET_ADDRESS_H__ */
