/*
 * Copyright (c) 2014 Intel Corporation
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
 * or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public
 * License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
 *
 * Author:
 *      Ikey Doherty <michael.i.doherty@intel.com>
 */

#pragma once

#if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)
#error "Only <gtk/gtk.h> can be included directly."
#endif

#include <gtk/gtkstack.h>



#define GTK_TYPE_STACK_SIDEBAR           (gtk_stack_sidebar_get_type ())
#define GTK_STACK_SIDEBAR(obj)           (G_TYPE_CHECK_INSTANCE_CAST ((obj), GTK_TYPE_STACK_SIDEBAR, GtkStackSidebar))
#define GTK_IS_STACK_SIDEBAR(obj)        (G_TYPE_CHECK_INSTANCE_TYPE ((obj), GTK_TYPE_STACK_SIDEBAR))

typedef struct _GtkStackSidebar GtkStackSidebar;


GType       gtk_stack_sidebar_get_type  (void) ;

GtkWidget * gtk_stack_sidebar_new       (void);

void        gtk_stack_sidebar_set_stack (GtkStackSidebar *self,
                                         GtkStack        *stack);

GtkStack *  gtk_stack_sidebar_get_stack (GtkStackSidebar *self);





