/* GIO - GLib Input, Output and Streaming Library
 *
 * Copyright © 2010 Red Hat, Inc.
 * Copyright © 2015 Collabora, Ltd.
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
 */

#ifndef __G_DTLS_SERVER_CONNECTION_H__
#define __G_DTLS_SERVER_CONNECTION_H__

#if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)
#error "Only <gio/gio.h> can be included directly."
#endif

#include <gio/gdtlsconnection.h>



#define G_TYPE_DTLS_SERVER_CONNECTION                (g_dtls_server_connection_get_type ())
#define G_DTLS_SERVER_CONNECTION(inst)               (G_TYPE_CHECK_INSTANCE_CAST ((inst), G_TYPE_DTLS_SERVER_CONNECTION, GDtlsServerConnection))
#define G_IS_DTLS_SERVER_CONNECTION(inst)            (G_TYPE_CHECK_INSTANCE_TYPE ((inst), G_TYPE_DTLS_SERVER_CONNECTION))
#define G_DTLS_SERVER_CONNECTION_GET_INTERFACE(inst) (G_TYPE_INSTANCE_GET_INTERFACE ((inst), G_TYPE_DTLS_SERVER_CONNECTION, GDtlsServerConnectionInterface))

typedef struct _GDtlsServerConnectionInterface GDtlsServerConnectionInterface;

/**
 * GDtlsServerConnectionInterface:
 * @g_iface: The parent interface.
 *
 * vtable for a #GDtlsServerConnection implementation.
 *
 * Since: 2.48
 */
struct _GDtlsServerConnectionInterface
{
  GTypeInterface g_iface;
};

GType           g_dtls_server_connection_get_type (void) ;

GDatagramBased *g_dtls_server_connection_new      (GDatagramBased   *base_socket,
                                                   GTlsCertificate  *certificate,
                                                   GError          **error);



#endif /* __G_DTLS_SERVER_CONNECTION_H__ */
