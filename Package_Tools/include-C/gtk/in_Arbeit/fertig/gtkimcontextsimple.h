/* GTK - The GIMP Toolkit
 * Copyright (C) 2000 Red Hat Software
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

#include <gtk/gtkimcontext.h>




/*
 * No longer used by GTK, just left here on the off chance that some
 * 3rd party code used this define.
 */
#define GTK_MAX_COMPOSE_LEN 7

#define GTK_TYPE_IM_CONTEXT_SIMPLE              (gtk_im_context_simple_get_type ())
#define GTK_IM_CONTEXT_SIMPLE(obj)              (G_TYPE_CHECK_INSTANCE_CAST ((obj), GTK_TYPE_IM_CONTEXT_SIMPLE, GtkIMContextSimple))
#define GTK_IM_CONTEXT_SIMPLE_CLASS(klass)      (G_TYPE_CHECK_CLASS_CAST ((klass), GTK_TYPE_IM_CONTEXT_SIMPLE, GtkIMContextSimpleClass))
#define GTK_IS_IM_CONTEXT_SIMPLE(obj)           (G_TYPE_CHECK_INSTANCE_TYPE ((obj), GTK_TYPE_IM_CONTEXT_SIMPLE))
#define GTK_IS_IM_CONTEXT_SIMPLE_CLASS(klass)   (G_TYPE_CHECK_CLASS_TYPE ((klass), GTK_TYPE_IM_CONTEXT_SIMPLE))
#define GTK_IM_CONTEXT_SIMPLE_GET_CLASS(obj)    (G_TYPE_INSTANCE_GET_CLASS ((obj), GTK_TYPE_IM_CONTEXT_SIMPLE, GtkIMContextSimpleClass))


typedef struct _GtkIMContextSimple              GtkIMContextSimple;
typedef struct _GtkIMContextSimplePrivate       GtkIMContextSimplePrivate;
typedef struct _GtkIMContextSimpleClass         GtkIMContextSimpleClass;

struct _GtkIMContextSimple
{
  GtkIMContext object;

  /*< private >*/
  GtkIMContextSimplePrivate *priv;
};

struct _GtkIMContextSimpleClass
{
  GtkIMContextClass parent_class;
};


GType         gtk_im_context_simple_get_type  (void) ;

GtkIMContext *gtk_im_context_simple_new       (void);

void          gtk_im_context_simple_add_table (GtkIMContextSimple *context_simple,
                                               guint16            *data,
                                               int                 max_seq_len,
                                               int                 n_seqs);

void          gtk_im_context_simple_add_compose_file (GtkIMContextSimple *context_simple,
                                                      const char         *compose_file);






