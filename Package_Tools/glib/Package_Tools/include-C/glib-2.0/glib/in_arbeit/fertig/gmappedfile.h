/* GLIB - Library of useful routines for C programming
 * gmappedfile.h: Simplified wrapper around the mmap function
 *
 * Copyright 2005 Matthias Clasen
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

#ifndef __G_MAPPED_FILE_H__
#define __G_MAPPED_FILE_H__

#if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)
#error "Only <glib.h> can be included directly."
#endif

#include <glib/gbytes.h>
#include <glib/gerror.h>



typedef struct _GMappedFile GMappedFile;


GMappedFile *g_mapped_file_new          (const gchar  *filename,
				         gboolean      writable,
				         GError      **error);

GMappedFile *g_mapped_file_new_from_fd  (gint          fd,
					 gboolean      writable,
					 GError      **error);

gsize        g_mapped_file_get_length   (GMappedFile  *file);

gchar       *g_mapped_file_get_contents (GMappedFile  *file);

GBytes *     g_mapped_file_get_bytes    (GMappedFile  *file);

GMappedFile *g_mapped_file_ref          (GMappedFile  *file);

void         g_mapped_file_unref        (GMappedFile  *file);

void         g_mapped_file_free         (GMappedFile  *file);



#endif /* __G_MAPPED_FILE_H__ */
