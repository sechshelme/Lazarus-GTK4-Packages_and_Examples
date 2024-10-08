/*
 * Copyright © 2020 Canonical Ltd.
 * Copyright © 2021 Alexandros Theodotou
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

#ifndef __G_STRVBUILDER_H__
#define __G_STRVBUILDER_H__

#if !defined(__GLIB_H_INSIDE__) && !defined(GLIB_COMPILATION)
#error "Only <glib.h> can be included directly."
#endif

#include <glib/gstrfuncs.h>
#include <glib/gtypes.h>



typedef struct _GStrvBuilder GStrvBuilder;


GStrvBuilder *g_strv_builder_new (void);


void g_strv_builder_unref (GStrvBuilder *builder);


GStrvBuilder *g_strv_builder_ref (GStrvBuilder *builder);


void g_strv_builder_add (GStrvBuilder *builder,
                         const char *value);


void g_strv_builder_addv (GStrvBuilder *builder,
                          const char **value);


void g_strv_builder_add_many (GStrvBuilder *builder,
                              ...) ;


void g_strv_builder_take (GStrvBuilder *builder,
                          char *value);


GStrv g_strv_builder_end (GStrvBuilder *builder);



#endif /* __G_STRVBUILDER_H__ */
