/* gcharset.h - Charset functions
 *
 *  Copyright (C) 2011 Red Hat, Inc.
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
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library; if not, see <http://www.gnu.org/licenses/>.
 */

#ifndef __G_CHARSET_H__
#define __G_CHARSET_H__

#if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)
#error "Only <glib.h> can be included directly."
#endif

#include <glib/gtypes.h>




gboolean              g_get_charset         (const char **charset);

gchar *               g_get_codeset         (void);

gboolean              g_get_console_charset (const char **charset);


const gchar * const * g_get_language_names  (void);

const gchar * const * g_get_language_names_with_category
                                            (const gchar *category_name);

gchar **              g_get_locale_variants (const gchar *locale);



#endif  /* __G_CHARSET_H__ */
