/*
 * Copyright (c) 2013 Red Hat, Inc.
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
 */

#pragma once

#if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)
#error "Only <gtk/gtk.h> can be included directly."
#endif

#include <gtk/gtkstack.h>



#define GTK_TYPE_STACK_SWITCHER            (gtk_stack_switcher_get_type ())
#define GTK_STACK_SWITCHER(obj)            (G_TYPE_CHECK_INSTANCE_CAST ((obj), GTK_TYPE_STACK_SWITCHER, GtkStackSwitcher))
#define GTK_IS_STACK_SWITCHER(obj)         (G_TYPE_CHECK_INSTANCE_TYPE ((obj), GTK_TYPE_STACK_SWITCHER))

typedef struct _GtkStackSwitcher              GtkStackSwitcher;



GType        gtk_stack_switcher_get_type          (void) ;

GtkWidget *  gtk_stack_switcher_new               (void);

void         gtk_stack_switcher_set_stack         (GtkStackSwitcher *switcher,
                                                   GtkStack         *stack);

GtkStack *   gtk_stack_switcher_get_stack         (GtkStackSwitcher *switcher);





