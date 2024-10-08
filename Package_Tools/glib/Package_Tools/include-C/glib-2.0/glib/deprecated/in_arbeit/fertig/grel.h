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
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the GNU
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

#ifndef __G_REL_H__
#define __G_REL_H__

#if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)
#error "Only <glib.h> can be included directly."
#endif

#include <glib/gtypes.h>



typedef struct _GRelation       GRelation;
typedef struct _GTuples         GTuples;

struct _GTuples
{
  guint len;
};


GRelation* g_relation_new     (gint         fields);

void       g_relation_destroy (GRelation   *relation);

void       g_relation_index   (GRelation   *relation,
                               gint         field,
                               GHashFunc    hash_func,
                               GEqualFunc   key_equal_func);

void       g_relation_insert  (GRelation   *relation,
                               ...);

gint       g_relation_delete  (GRelation   *relation,
                               gconstpointer  key,
                               gint         field);

GTuples*   g_relation_select  (GRelation   *relation,
                               gconstpointer  key,
                               gint         field);

gint       g_relation_count   (GRelation   *relation,
                               gconstpointer  key,
                               gint         field);

gboolean   g_relation_exists  (GRelation   *relation,
                               ...);

void       g_relation_print   (GRelation   *relation);

void       g_tuples_destroy   (GTuples     *tuples);

gpointer   g_tuples_index     (GTuples     *tuples,
                               gint         index_,
                               gint         field);



#endif /* __G_REL_H__ */
