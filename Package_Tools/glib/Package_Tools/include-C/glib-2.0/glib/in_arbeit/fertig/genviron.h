/* GLIB - Library of useful routines for C programming
 * Copyright (C) 1995-1997  Peter Mattis, Spencer Kimball and Josh MacDonald
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
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, see <http://www.gnu.org/licenses/>.
 */

/*
 * Modified by the GLib Team and others 1997-2000.  See the AUTHORS
 * file for a list of people on the GLib Team.  See the ChangeLog
 * files for a list of changes.  These files are distributed with
 * GLib at ftp://ftp.gtk.org/pub/gtk/.
 */

#ifndef __G_ENVIRON_H__
#define __G_ENVIRON_H__

#if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)
#error "Only <glib.h> can be included directly."
#endif

#include <glib/gtypes.h>




const gchar * g_getenv           (const gchar  *variable);

gboolean      g_setenv           (const gchar  *variable,
                                  const gchar  *value,
                                  gboolean      overwrite);

void          g_unsetenv         (const gchar  *variable);

gchar **      g_listenv          (void);


gchar **      g_get_environ      (void);

const gchar * g_environ_getenv   (gchar       **envp,
                                  const gchar  *variable);

gchar **      g_environ_setenv   (gchar       **envp,
                                  const gchar  *variable,
                                  const gchar  *value,
                                  gboolean      overwrite) ;

gchar **      g_environ_unsetenv (gchar       **envp,
                                  const gchar  *variable) ;



#endif /* __G_ENVIRON_H__ */
