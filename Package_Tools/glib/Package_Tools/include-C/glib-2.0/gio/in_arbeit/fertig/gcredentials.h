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

#ifndef __G_CREDENTIALS_H__
#define __G_CREDENTIALS_H__

#if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)
#error "Only <gio/gio.h> can be included directly."
#endif

#include <gio/giotypes.h>

#ifdef G_OS_UNIX
/* To get the uid_t type */
#include <unistd.h>
#include <sys/types.h>
#endif



#define G_TYPE_CREDENTIALS         (g_credentials_get_type ())
#define G_CREDENTIALS(o)           (G_TYPE_CHECK_INSTANCE_CAST ((o), G_TYPE_CREDENTIALS, GCredentials))
#define G_CREDENTIALS_CLASS(k)     (G_TYPE_CHECK_CLASS_CAST((k), G_TYPE_CREDENTIALS, GCredentialsClass))
#define G_IS_CREDENTIALS(o)        (G_TYPE_CHECK_INSTANCE_TYPE ((o), G_TYPE_CREDENTIALS))
#define G_IS_CREDENTIALS_CLASS(k)  (G_TYPE_CHECK_CLASS_TYPE ((k), G_TYPE_CREDENTIALS))
#define G_CREDENTIALS_GET_CLASS(o) (G_TYPE_INSTANCE_GET_CLASS ((o), G_TYPE_CREDENTIALS, GCredentialsClass))

typedef struct _GCredentialsClass   GCredentialsClass;


GType            g_credentials_get_type           (void) ;


GCredentials    *g_credentials_new                (void);


gchar           *g_credentials_to_string          (GCredentials    *credentials);


gpointer         g_credentials_get_native         (GCredentials    *credentials,
                                                   GCredentialsType native_type);


void             g_credentials_set_native         (GCredentials    *credentials,
                                                   GCredentialsType native_type,
                                                   gpointer         native);


gboolean         g_credentials_is_same_user       (GCredentials    *credentials,
                                                   GCredentials    *other_credentials,
                                                   GError         **error);

#ifdef G_OS_UNIX
pid_t            g_credentials_get_unix_pid       (GCredentials    *credentials,
                                                   GError         **error);

uid_t            g_credentials_get_unix_user      (GCredentials    *credentials,
                                                   GError         **error);

gboolean         g_credentials_set_unix_user      (GCredentials    *credentials,
                                                   uid_t           uid,
                                                   GError         **error);
#endif



#endif /* __G_CREDENTIALS_H__ */
