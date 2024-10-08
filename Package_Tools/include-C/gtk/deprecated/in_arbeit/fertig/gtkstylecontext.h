/* GTK - The GIMP Toolkit
 * Copyright (C) 2010 Carlos Garnacho <carlosg@gnome.org>
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

#include <gtk/css/gtkcss.h>

#include <gtk/gtkborder.h>
#include <gtk/gtkstyleprovider.h>
#include <gtk/gtktypes.h>



#define GTK_TYPE_STYLE_CONTEXT         (gtk_style_context_get_type ())
#define GTK_STYLE_CONTEXT(o)           (G_TYPE_CHECK_INSTANCE_CAST ((o), GTK_TYPE_STYLE_CONTEXT, GtkStyleContext))
#define GTK_STYLE_CONTEXT_CLASS(c)     (G_TYPE_CHECK_CLASS_CAST    ((c), GTK_TYPE_STYLE_CONTEXT, GtkStyleContextClass))
#define GTK_IS_STYLE_CONTEXT(o)        (G_TYPE_CHECK_INSTANCE_TYPE ((o), GTK_TYPE_STYLE_CONTEXT))
#define GTK_IS_STYLE_CONTEXT_CLASS(c)  (G_TYPE_CHECK_CLASS_TYPE    ((c), GTK_TYPE_STYLE_CONTEXT))
#define GTK_STYLE_CONTEXT_GET_CLASS(o) (G_TYPE_INSTANCE_GET_CLASS  ((o), GTK_TYPE_STYLE_CONTEXT, GtkStyleContextClass))

typedef struct _GtkStyleContextClass GtkStyleContextClass;

struct _GtkStyleContext
{
  GObject parent_object;
};

struct _GtkStyleContextClass
{
  GObjectClass parent_class;

  void (* changed) (GtkStyleContext *context);

  /* Padding for future expansion */
  void (*_gtk_reserved1) (void);
  void (*_gtk_reserved2) (void);
  void (*_gtk_reserved3) (void);
  void (*_gtk_reserved4) (void);
};



GType gtk_style_context_get_type (void) ;


void gtk_style_context_add_provider    (GtkStyleContext  *context,
                                        GtkStyleProvider *provider,
                                        guint             priority);


void gtk_style_context_remove_provider (GtkStyleContext  *context,
                                        GtkStyleProvider *provider);


void gtk_style_context_save    (GtkStyleContext *context);

void gtk_style_context_restore (GtkStyleContext *context);


void          gtk_style_context_set_state    (GtkStyleContext *context,
                                              GtkStateFlags    flags);

GtkStateFlags gtk_style_context_get_state    (GtkStyleContext *context);


void          gtk_style_context_set_scale    (GtkStyleContext *context,
                                              int              scale);

int           gtk_style_context_get_scale    (GtkStyleContext *context);


void     gtk_style_context_add_class    (GtkStyleContext *context,
                                         const char      *class_name);

void     gtk_style_context_remove_class (GtkStyleContext *context,
                                         const char      *class_name);

gboolean gtk_style_context_has_class    (GtkStyleContext *context,
                                         const char      *class_name);


void        gtk_style_context_set_display (GtkStyleContext *context,
                                           GdkDisplay      *display);

GdkDisplay *gtk_style_context_get_display (GtkStyleContext *context);


gboolean gtk_style_context_lookup_color (GtkStyleContext *context,
                                         const char      *color_name,
                                         GdkRGBA         *color);

/* Some helper functions to retrieve most common properties */

void gtk_style_context_get_color            (GtkStyleContext *context,
                                             GdkRGBA         *color);

void gtk_style_context_get_border           (GtkStyleContext *context,
                                             GtkBorder       *border);

void gtk_style_context_get_padding          (GtkStyleContext *context,
                                             GtkBorder       *padding);

void gtk_style_context_get_margin           (GtkStyleContext *context,
                                             GtkBorder       *margin);

typedef enum {
  GTK_STYLE_CONTEXT_PRINT_NONE         = 0,
  GTK_STYLE_CONTEXT_PRINT_RECURSE      = 1 << 0,
  GTK_STYLE_CONTEXT_PRINT_SHOW_STYLE   = 1 << 1,
  GTK_STYLE_CONTEXT_PRINT_SHOW_CHANGE  = 1 << 2
} GtkStyleContextPrintFlags;


char * gtk_style_context_to_string (GtkStyleContext           *context,
                                    GtkStyleContextPrintFlags  flags);





