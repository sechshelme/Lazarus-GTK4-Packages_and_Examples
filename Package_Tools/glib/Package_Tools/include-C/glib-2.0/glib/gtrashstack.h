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

#ifndef __G_TRASH_STACK_H__
#define __G_TRASH_STACK_H__

#if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)
#error "Only <glib.h> can be included directly."
#endif

#include <glib/gutils.h>





typedef struct _GTrashStack GTrashStack _TYPE_IN_2_48;
struct _GTrashStack
{
  GTrashStack *next;
} _TYPE_IN_2_48;

_IN_2_48
void      g_trash_stack_push   (GTrashStack **stack_p,
                                gpointer      data_p);
_IN_2_48
gpointer  g_trash_stack_pop    (GTrashStack **stack_p);
_IN_2_48
gpointer  g_trash_stack_peek   (GTrashStack **stack_p);
_IN_2_48
guint     g_trash_stack_height (GTrashStack **stack_p);





#endif /* __G_TRASH_STACK_H_ */
