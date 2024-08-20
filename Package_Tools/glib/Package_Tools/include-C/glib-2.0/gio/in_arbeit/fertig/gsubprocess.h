/* GIO - GLib Input, Output and Streaming Library
 *
 * Copyright (C) 2012 Colin Walters <walters@verbum.org>
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
 * Author: Colin Walters <walters@verbum.org>
 */

#if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)
#error "Only <gio/gio.h> can be included directly."
#endif

#ifndef __G_SUBPROCESS_H__
#define __G_SUBPROCESS_H__

#include <gio/giotypes.h>



#define G_TYPE_SUBPROCESS         (g_subprocess_get_type ())
#define G_SUBPROCESS(o)           (G_TYPE_CHECK_INSTANCE_CAST ((o), G_TYPE_SUBPROCESS, GSubprocess))
#define G_IS_SUBPROCESS(o)        (G_TYPE_CHECK_INSTANCE_TYPE ((o), G_TYPE_SUBPROCESS))


GType            g_subprocess_get_type                  (void) ;

/**** Core API ****/


GSubprocess *    g_subprocess_new                       (GSubprocessFlags        flags,
                                                         GError                **error,
                                                         const gchar            *argv0,
                                                         ...) ;

GSubprocess *    g_subprocess_newv                      (const gchar * const  *argv,
                                                         GSubprocessFlags      flags,
                                                         GError              **error);


GOutputStream *  g_subprocess_get_stdin_pipe            (GSubprocess          *subprocess);


GInputStream *   g_subprocess_get_stdout_pipe           (GSubprocess          *subprocess);


GInputStream *   g_subprocess_get_stderr_pipe           (GSubprocess          *subprocess);


const gchar *    g_subprocess_get_identifier            (GSubprocess          *subprocess);

#ifdef G_OS_UNIX

void             g_subprocess_send_signal               (GSubprocess          *subprocess,
                                                         gint                  signal_num);
#endif


void             g_subprocess_force_exit                (GSubprocess          *subprocess);


gboolean         g_subprocess_wait                      (GSubprocess          *subprocess,
                                                         GCancellable         *cancellable,
                                                         GError              **error);


void             g_subprocess_wait_async                (GSubprocess          *subprocess,
                                                         GCancellable         *cancellable,
                                                         GAsyncReadyCallback   callback,
                                                         gpointer              user_data);


gboolean         g_subprocess_wait_finish               (GSubprocess          *subprocess,
                                                         GAsyncResult         *result,
                                                         GError              **error);


gboolean         g_subprocess_wait_check                (GSubprocess          *subprocess,
                                                         GCancellable         *cancellable,
                                                         GError              **error);


void             g_subprocess_wait_check_async          (GSubprocess          *subprocess,
                                                         GCancellable         *cancellable,
                                                         GAsyncReadyCallback   callback,
                                                         gpointer              user_data);


gboolean         g_subprocess_wait_check_finish         (GSubprocess          *subprocess,
                                                         GAsyncResult         *result,
                                                         GError              **error);



gint             g_subprocess_get_status                (GSubprocess          *subprocess);


gboolean         g_subprocess_get_successful            (GSubprocess          *subprocess);


gboolean         g_subprocess_get_if_exited             (GSubprocess          *subprocess);


gint             g_subprocess_get_exit_status           (GSubprocess          *subprocess);


gboolean         g_subprocess_get_if_signaled           (GSubprocess          *subprocess);


gint             g_subprocess_get_term_sig              (GSubprocess          *subprocess);


gboolean         g_subprocess_communicate               (GSubprocess          *subprocess,
                                                         GBytes               *stdin_buf,
                                                         GCancellable         *cancellable,
                                                         GBytes              **stdout_buf,
                                                         GBytes              **stderr_buf,
                                                         GError              **error);

void            g_subprocess_communicate_async          (GSubprocess          *subprocess,
                                                         GBytes               *stdin_buf,
                                                         GCancellable         *cancellable,
                                                         GAsyncReadyCallback   callback,
                                                         gpointer              user_data);


gboolean        g_subprocess_communicate_finish         (GSubprocess          *subprocess,
                                                         GAsyncResult         *result,
                                                         GBytes              **stdout_buf,
                                                         GBytes              **stderr_buf,
                                                         GError              **error);


gboolean         g_subprocess_communicate_utf8          (GSubprocess          *subprocess,
                                                         const char           *stdin_buf,
                                                         GCancellable         *cancellable,
                                                         char                **stdout_buf,
                                                         char                **stderr_buf,
                                                         GError              **error);

void            g_subprocess_communicate_utf8_async     (GSubprocess          *subprocess,
                                                         const char           *stdin_buf,
                                                         GCancellable         *cancellable,
                                                         GAsyncReadyCallback   callback,
                                                         gpointer              user_data);


gboolean        g_subprocess_communicate_utf8_finish    (GSubprocess          *subprocess,
                                                         GAsyncResult         *result,
                                                         char                **stdout_buf,
                                                         char                **stderr_buf,
                                                         GError              **error);



#endif /* __G_SUBPROCESS_H__ */
