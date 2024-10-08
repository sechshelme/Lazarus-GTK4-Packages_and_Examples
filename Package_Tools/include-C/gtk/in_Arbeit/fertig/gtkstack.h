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
 * Author: Alexander Larsson <alexl@redhat.com>
 *
 */

#pragma once

#if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)
#error "Only <gtk/gtk.h> can be included directly."
#endif

#include <gtk/gtkwidget.h>
#include <gtk/gtkselectionmodel.h>




#define GTK_TYPE_STACK (gtk_stack_get_type ())
#define GTK_STACK(obj) (G_TYPE_CHECK_INSTANCE_CAST ((obj), GTK_TYPE_STACK, GtkStack))
#define GTK_IS_STACK(obj) (G_TYPE_CHECK_INSTANCE_TYPE ((obj), GTK_TYPE_STACK))

typedef struct _GtkStack GtkStack;

#define GTK_TYPE_STACK_PAGE (gtk_stack_page_get_type ())
#define GTK_STACK_PAGE(obj) (G_TYPE_CHECK_INSTANCE_CAST ((obj), GTK_TYPE_STACK_PAGE, GtkStackPage))
#define GTK_IS_STACK_PAGE(obj) (G_TYPE_CHECK_INSTANCE_TYPE ((obj), GTK_TYPE_STACK_PAGE))

typedef struct _GtkStackPage GtkStackPage;

typedef enum {
  GTK_STACK_TRANSITION_TYPE_NONE,
  GTK_STACK_TRANSITION_TYPE_CROSSFADE,
  GTK_STACK_TRANSITION_TYPE_SLIDE_RIGHT,
  GTK_STACK_TRANSITION_TYPE_SLIDE_LEFT,
  GTK_STACK_TRANSITION_TYPE_SLIDE_UP,
  GTK_STACK_TRANSITION_TYPE_SLIDE_DOWN,
  GTK_STACK_TRANSITION_TYPE_SLIDE_LEFT_RIGHT,
  GTK_STACK_TRANSITION_TYPE_SLIDE_UP_DOWN,
  GTK_STACK_TRANSITION_TYPE_OVER_UP,
  GTK_STACK_TRANSITION_TYPE_OVER_DOWN,
  GTK_STACK_TRANSITION_TYPE_OVER_LEFT,
  GTK_STACK_TRANSITION_TYPE_OVER_RIGHT,
  GTK_STACK_TRANSITION_TYPE_UNDER_UP,
  GTK_STACK_TRANSITION_TYPE_UNDER_DOWN,
  GTK_STACK_TRANSITION_TYPE_UNDER_LEFT,
  GTK_STACK_TRANSITION_TYPE_UNDER_RIGHT,
  GTK_STACK_TRANSITION_TYPE_OVER_UP_DOWN,
  GTK_STACK_TRANSITION_TYPE_OVER_DOWN_UP,
  GTK_STACK_TRANSITION_TYPE_OVER_LEFT_RIGHT,
  GTK_STACK_TRANSITION_TYPE_OVER_RIGHT_LEFT,
  GTK_STACK_TRANSITION_TYPE_ROTATE_LEFT,
  GTK_STACK_TRANSITION_TYPE_ROTATE_RIGHT,
  GTK_STACK_TRANSITION_TYPE_ROTATE_LEFT_RIGHT
} GtkStackTransitionType;


GType                  gtk_stack_page_get_type            (void) ;

GtkWidget *            gtk_stack_page_get_child           (GtkStackPage           *self);

gboolean               gtk_stack_page_get_visible         (GtkStackPage           *self);

void                   gtk_stack_page_set_visible         (GtkStackPage           *self,
                                                           gboolean                visible);

gboolean               gtk_stack_page_get_needs_attention (GtkStackPage           *self);

void                   gtk_stack_page_set_needs_attention (GtkStackPage           *self,
                                                           gboolean                setting);

gboolean               gtk_stack_page_get_use_underline   (GtkStackPage           *self);

void                   gtk_stack_page_set_use_underline   (GtkStackPage           *self,
                                                           gboolean                setting);

const char *           gtk_stack_page_get_name            (GtkStackPage           *self);

void                   gtk_stack_page_set_name            (GtkStackPage           *self,
                                                            const char            *setting);

const char *           gtk_stack_page_get_title           (GtkStackPage           *self);

void                   gtk_stack_page_set_title           (GtkStackPage           *self,
                                                           const char             *setting);

const char *           gtk_stack_page_get_icon_name       (GtkStackPage           *self);

void                   gtk_stack_page_set_icon_name       (GtkStackPage           *self,
                                                           const char             *setting);




GType                  gtk_stack_get_type                (void) ;


GtkWidget *            gtk_stack_new                     (void);

GtkStackPage *         gtk_stack_add_child               (GtkStack               *stack,
                                                          GtkWidget              *child);

GtkStackPage *         gtk_stack_add_named               (GtkStack               *stack,
                                                          GtkWidget              *child,
                                                          const char             *name);

GtkStackPage *         gtk_stack_add_titled              (GtkStack               *stack,
                                                          GtkWidget              *child,
                                                          const char             *name,
                                                          const char             *title);

void                   gtk_stack_remove                  (GtkStack               *stack,
                                                          GtkWidget              *child);


GtkStackPage *         gtk_stack_get_page                (GtkStack               *stack,
                                                          GtkWidget              *child);

GtkWidget *            gtk_stack_get_child_by_name       (GtkStack               *stack,
                                                          const char             *name);

void                   gtk_stack_set_visible_child       (GtkStack               *stack,
                                                          GtkWidget              *child);

GtkWidget *            gtk_stack_get_visible_child       (GtkStack               *stack);

void                   gtk_stack_set_visible_child_name  (GtkStack               *stack,
                                                          const char             *name);

const char *          gtk_stack_get_visible_child_name  (GtkStack               *stack);

void                   gtk_stack_set_visible_child_full  (GtkStack               *stack,
                                                          const char             *name,
                                                          GtkStackTransitionType  transition);

void                   gtk_stack_set_hhomogeneous        (GtkStack               *stack,
                                                          gboolean                hhomogeneous);

gboolean               gtk_stack_get_hhomogeneous        (GtkStack               *stack);

void                   gtk_stack_set_vhomogeneous        (GtkStack               *stack,
                                                          gboolean                vhomogeneous);

gboolean               gtk_stack_get_vhomogeneous        (GtkStack               *stack);

void                   gtk_stack_set_transition_duration (GtkStack               *stack,
                                                          guint                   duration);

guint                  gtk_stack_get_transition_duration (GtkStack               *stack);

void                   gtk_stack_set_transition_type     (GtkStack               *stack,
                                                          GtkStackTransitionType  transition);

GtkStackTransitionType gtk_stack_get_transition_type     (GtkStack               *stack);

gboolean               gtk_stack_get_transition_running  (GtkStack               *stack);

void                   gtk_stack_set_interpolate_size    (GtkStack *stack,
                                                          gboolean  interpolate_size);

gboolean               gtk_stack_get_interpolate_size    (GtkStack *stack);


GtkSelectionModel *    gtk_stack_get_pages               (GtkStack *stack);






