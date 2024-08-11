/* GLIB - Library of useful routines for C programming
 * Copyright (C) 1995-1997, 2002  Peter Mattis, Red Hat, Inc.
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

#ifndef __G_PRINTF_H__
#define __G_PRINTF_H__

#include <glib.h>
#include <stdio.h>
#include <stdarg.h>




gint                  g_printf    (gchar const *format,
                                   ...) ;

gint                  g_fprintf   (FILE        *file,
				   gchar const *format,
				   ...);

gint                  g_sprintf   (gchar       *string,
				   gchar const *format,
				   ...);


gint                  g_vprintf   (gchar const *format,
                                   va_list      args) ;

gint                  g_vfprintf  (FILE        *file,
				   gchar const *format,
				   va_list      args) ;

gint                  g_vsprintf  (gchar       *string,
				   gchar const *format,
				   va_list      args) ;

gint                  g_vasprintf (gchar      **string,
				   gchar const *format,
				   va_list      args) ;



#endif /* __G_PRINTF_H__ */
