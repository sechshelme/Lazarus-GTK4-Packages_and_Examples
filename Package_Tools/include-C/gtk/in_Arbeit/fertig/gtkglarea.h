/* GTK - The GIMP Toolkit
 *
 * gtkglarea.h: A GL drawing area
 *
 * Copyright © 2014  Emmanuele Bassi
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



#define GTK_TYPE_GL_AREA                (gtk_gl_area_get_type ())
#define GTK_GL_AREA(obj)                (G_TYPE_CHECK_INSTANCE_CAST ((obj), GTK_TYPE_GL_AREA, GtkGLArea))
#define GTK_IS_GL_AREA(obj)             (G_TYPE_CHECK_INSTANCE_TYPE ((obj), GTK_TYPE_GL_AREA))
#define GTK_GL_AREA_CLASS(klass)        (G_TYPE_CHECK_CLASS_CAST ((klass), GTK_TYPE_GL_AREA, GtkGLAreaClass))
#define GTK_IS_GL_AREA_CLASS(klass)     (G_TYPE_CHECK_CLASS_TYPE ((klass), GTK_TYPE_GL_AREA))
#define GTK_GL_AREA_GET_CLASS(obj)      (G_TYPE_INSTANCE_GET_CLASS ((obj), GTK_TYPE_GL_AREA, GtkGLAreaClass))

typedef struct _GtkGLArea               GtkGLArea;
typedef struct _GtkGLAreaClass          GtkGLAreaClass;

struct _GtkGLArea
{
  /*< private >*/
  GtkWidget parent_instance;
};

/**
 * GtkGLAreaClass:
 * @render: class closure for the `GtkGLArea::render` signal
 * @resize: class closeure for the `GtkGLArea::resize` signal
 * @create_context: class closure for the `GtkGLArea::create-context` signal
 *
 * The `GtkGLAreaClass` structure contains only private data.
 */
struct _GtkGLAreaClass
{
  /*< private >*/
  GtkWidgetClass parent_class;

  /*< public >*/
  gboolean       (* render)         (GtkGLArea        *area,
                                     GdkGLContext     *context);
  void           (* resize)         (GtkGLArea        *area,
                                     int               width,
                                     int               height);
  GdkGLContext * (* create_context) (GtkGLArea        *area);

  /*< private >*/
  gpointer _padding[8];
};


GType gtk_gl_area_get_type (void) ;


GtkWidget *     gtk_gl_area_new                         (void);


void            gtk_gl_area_set_allowed_apis            (GtkGLArea    *area,
                                                         GdkGLAPI      apis);

GdkGLAPI        gtk_gl_area_get_allowed_apis            (GtkGLArea    *area);

GdkGLAPI        gtk_gl_area_get_api                     (GtkGLArea    *area);

void            gtk_gl_area_set_use_es                  (GtkGLArea    *area,
                                                         gboolean      use_es);
gboolean        gtk_gl_area_get_use_es                  (GtkGLArea    *area);


void            gtk_gl_area_set_required_version        (GtkGLArea    *area,
                                                         int           major,
                                                         int           minor);

void            gtk_gl_area_get_required_version        (GtkGLArea    *area,
                                                         int          *major,
                                                         int          *minor);

gboolean        gtk_gl_area_get_has_depth_buffer        (GtkGLArea    *area);

void            gtk_gl_area_set_has_depth_buffer        (GtkGLArea    *area,
                                                         gboolean      has_depth_buffer);

gboolean        gtk_gl_area_get_has_stencil_buffer      (GtkGLArea    *area);

void            gtk_gl_area_set_has_stencil_buffer      (GtkGLArea    *area,
                                                         gboolean      has_stencil_buffer);

gboolean        gtk_gl_area_get_auto_render             (GtkGLArea    *area);

void            gtk_gl_area_set_auto_render             (GtkGLArea    *area,
                                                         gboolean      auto_render);

void           gtk_gl_area_queue_render                 (GtkGLArea    *area);



GdkGLContext *  gtk_gl_area_get_context                 (GtkGLArea    *area);


void            gtk_gl_area_make_current                (GtkGLArea    *area);

void            gtk_gl_area_attach_buffers              (GtkGLArea    *area);


void            gtk_gl_area_set_error                   (GtkGLArea    *area,
                                                         const GError *error);

GError *        gtk_gl_area_get_error                   (GtkGLArea    *area);





