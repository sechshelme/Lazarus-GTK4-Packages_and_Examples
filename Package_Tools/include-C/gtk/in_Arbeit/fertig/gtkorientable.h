/* GTK - The GIMP Toolkit
 * Copyright (C) 1995-1997 Peter Mattis, Spencer Kimball and Josh MacDonald
 *
 * gtkorientable.h
 * Copyright (C) 2008 Imendio AB
 * Contact: Michael Natterer <mitch@imendio.com>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
 */

#pragma once

#if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)
#error "Only <gtk/gtk.h> can be included directly."
#endif

#include <gtk/gtkwidget.h>



#define GTK_TYPE_ORIENTABLE             (gtk_orientable_get_type ())
#define GTK_ORIENTABLE(obj)             (G_TYPE_CHECK_INSTANCE_CAST ((obj), GTK_TYPE_ORIENTABLE, GtkOrientable))
#define GTK_IS_ORIENTABLE(obj)          (G_TYPE_CHECK_INSTANCE_TYPE ((obj), GTK_TYPE_ORIENTABLE))
#define GTK_ORIENTABLE_GET_IFACE(inst)  (G_TYPE_INSTANCE_GET_INTERFACE ((inst), GTK_TYPE_ORIENTABLE, GtkOrientableIface))

typedef struct _GtkOrientable       GtkOrientable;         /* Dummy typedef */
typedef struct _GtkOrientableIface  GtkOrientableIface;

struct _GtkOrientableIface
{
  GTypeInterface base_iface;
};



GType          gtk_orientable_get_type        (void) ;


void           gtk_orientable_set_orientation (GtkOrientable  *orientable,
                                               GtkOrientation  orientation);

GtkOrientation gtk_orientable_get_orientation (GtkOrientable  *orientable);





