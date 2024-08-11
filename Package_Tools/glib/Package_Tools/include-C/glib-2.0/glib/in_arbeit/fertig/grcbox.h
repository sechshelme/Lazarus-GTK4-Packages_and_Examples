/* grcbox.h: Reference counted data
 *
 * Copyright 2018  Emmanuele Bassi
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

#pragma once

#if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)
#error "Only <glib.h> can be included directly."
#endif

#include <glib/gmem.h>
#include <glib/glib-typeof.h>




gpointer        g_rc_box_alloc                  (gsize           block_size)  ;

gpointer        g_rc_box_alloc0                 (gsize           block_size)  ;

gpointer        g_rc_box_dup                    (gsize           block_size,
                                                 gconstpointer   mem_block) ;

gpointer        g_rc_box_acquire                (gpointer        mem_block);

void            g_rc_box_release                (gpointer        mem_block);

void            g_rc_box_release_full           (gpointer        mem_block,
                                                 GDestroyNotify  clear_func);


gsize           g_rc_box_get_size               (gpointer        mem_block);


gpointer        g_atomic_rc_box_alloc           (gsize           block_size)  ;

gpointer        g_atomic_rc_box_alloc0          (gsize           block_size)  ;

gpointer        g_atomic_rc_box_dup             (gsize           block_size,
                                                 gconstpointer   mem_block) ;

gpointer        g_atomic_rc_box_acquire         (gpointer        mem_block);

void            g_atomic_rc_box_release         (gpointer        mem_block);

void            g_atomic_rc_box_release_full    (gpointer        mem_block,
                                                 GDestroyNotify  clear_func);


gsize           g_atomic_rc_box_get_size        (gpointer        mem_block);

#define g_rc_box_new(type) \
  ((type *) g_rc_box_alloc (sizeof (type)))
#define g_rc_box_new0(type) \
  ((type *) g_rc_box_alloc0 (sizeof (type)))
#define g_atomic_rc_box_new(type) \
  ((type *) g_atomic_rc_box_alloc (sizeof (type)))
#define g_atomic_rc_box_new0(type) \
  ((type *) g_atomic_rc_box_alloc0 (sizeof (type)))


