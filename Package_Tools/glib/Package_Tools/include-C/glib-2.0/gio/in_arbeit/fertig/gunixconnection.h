/* GIO - GLib Input, Output and Streaming Library
 *
 * Copyright © 2009 Codethink Limited
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
 * Authors: Ryan Lortie <desrt@desrt.ca>
 */

#ifndef __G_UNIX_CONNECTION_H__
#define __G_UNIX_CONNECTION_H__

#include <gio/gio.h>



#define G_TYPE_UNIX_CONNECTION                              (g_unix_connection_get_type ())
#define G_UNIX_CONNECTION(inst)                             (G_TYPE_CHECK_INSTANCE_CAST ((inst),                     \
                                                             G_TYPE_UNIX_CONNECTION, GUnixConnection))
#define G_UNIX_CONNECTION_CLASS(class)                      (G_TYPE_CHECK_CLASS_CAST ((class),                       \
                                                             G_TYPE_UNIX_CONNECTION, GUnixConnectionClass))
#define G_IS_UNIX_CONNECTION(inst)                          (G_TYPE_CHECK_INSTANCE_TYPE ((inst),                     \
                                                             G_TYPE_UNIX_CONNECTION))
#define G_IS_UNIX_CONNECTION_CLASS(class)                   (G_TYPE_CHECK_CLASS_TYPE ((class),                       \
                                                             G_TYPE_UNIX_CONNECTION))
#define G_UNIX_CONNECTION_GET_CLASS(inst)                   (G_TYPE_INSTANCE_GET_CLASS ((inst),                      \
                                                             G_TYPE_UNIX_CONNECTION, GUnixConnectionClass))

typedef struct _GUnixConnection                             GUnixConnection;
typedef struct _GUnixConnectionPrivate                      GUnixConnectionPrivate;
typedef struct _GUnixConnectionClass                        GUnixConnectionClass;



struct _GUnixConnectionClass
{
  GSocketConnectionClass parent_class;
};

struct _GUnixConnection
{
  GSocketConnection parent_instance;
  GUnixConnectionPrivate *priv;
};


GType                   g_unix_connection_get_type                      (void);


gboolean                g_unix_connection_send_fd                       (GUnixConnection      *connection,
                                                                         gint                  fd,
                                                                         GCancellable         *cancellable,
                                                                         GError              **error);

gint                    g_unix_connection_receive_fd                    (GUnixConnection      *connection,
                                                                         GCancellable         *cancellable,
                                                                         GError              **error);


gboolean                g_unix_connection_send_credentials              (GUnixConnection      *connection,
                                                                         GCancellable         *cancellable,
                                                                         GError              **error);

void                    g_unix_connection_send_credentials_async        (GUnixConnection      *connection,
                                                                         GCancellable         *cancellable,
                                                                         GAsyncReadyCallback   callback,
                                                                         gpointer              user_data);

gboolean                g_unix_connection_send_credentials_finish       (GUnixConnection      *connection,
                                                                         GAsyncResult         *result,
                                                                         GError              **error);


GCredentials           *g_unix_connection_receive_credentials           (GUnixConnection      *connection,
                                                                         GCancellable         *cancellable,
                                                                         GError              **error);

void                    g_unix_connection_receive_credentials_async     (GUnixConnection      *connection,
                                                                         GCancellable         *cancellable,
                                                                         GAsyncReadyCallback   callback,
                                                                         gpointer              user_data);

GCredentials           *g_unix_connection_receive_credentials_finish    (GUnixConnection      *connection,
                                                                         GAsyncResult         *result,
                                                                         GError              **error);



#endif /* __G_UNIX_CONNECTION_H__ */
