/*
 * Copyright © 2015 Canonical Limited
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
 *
 * Author: Ryan Lortie <desrt@desrt.ca>
 */

#if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)
#error "Only <glib.h> can be included directly."
#endif

#ifndef __GI_SCANNER__

static inline void
g_autoptr_cleanup_generic_gfree (void *p)
{
  void **pp = (void**)p;
  g_free (*pp);
}

static inline void
g_autoptr_cleanup_gstring_free (GString *string)
{
  if (string)
    g_string_free (string, TRUE);
}

/* Ignore deprecations in case we refer to a type which was added in a more
 * recent GLib version than the user’s #GLIB_VERSION_MAX_ALLOWED definition. */


/* If adding a cleanup here, please also add a test case to
 * glib/tests/autoptr.c
 */



























G_DEFINE_AUTO_CLEANUP_CLEAR_FUNC(GQueue, g_queue_clear)










G_DEFINE_AUTO_CLEANUP_CLEAR_FUNC(GMutex, g_mutex_clear)




G_DEFINE_AUTO_CLEANUP_CLEAR_FUNC(GCond, g_cond_clear)





G_DEFINE_AUTO_CLEANUP_CLEAR_FUNC(GVariantBuilder, g_variant_builder_clear)


G_DEFINE_AUTO_CLEANUP_CLEAR_FUNC(GVariantDict, g_variant_dict_clear)

G_DEFINE_AUTO_CLEANUP_FREE_FUNC(GStrv, g_strfreev, NULL)


G_DEFINE_AUTOPTR_CLEANUP_FUNC (GPathBuf, g_path_buf_free)
G_DEFINE_AUTO_CLEANUP_CLEAR_FUNC (GPathBuf, g_path_buf_clear)



#endif /* __GI_SCANNER__ */
