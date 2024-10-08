/* GTK - The GIMP Toolkit
 * gtknativedialog.h: Native dialog
 * Copyright (C) 2015, Red Hat, Inc.
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

#include <gtk/gtkwindow.h>



#define GTK_TYPE_NATIVE_DIALOG             (gtk_native_dialog_get_type ())


//G_DECLARE_DERIVABLE_TYPE (GtkNativeDialog, gtk_native_dialog, GTK, NATIVE_DIALOG, GObject)

/**
 * GtkNativeDialogClass:
 * @response: class handler for the `GtkNativeDialog::response` signal
 *
 * Class structure for `GtkNativeDialog`.
 */
struct _GtkNativeDialogClass
{
  /*< private >*/
  GObjectClass parent_class;

  /*< public >*/
  void (* response) (GtkNativeDialog *self, int response_id);

  /* <private> */
  void (* show) (GtkNativeDialog *self);
  void (* hide) (GtkNativeDialog *self);

  /* Padding for future expansion */
  void (*_gtk_reserved1) (void);
  void (*_gtk_reserved2) (void);
  void (*_gtk_reserved3) (void);
  void (*_gtk_reserved4) (void);
};


void                  gtk_native_dialog_show (GtkNativeDialog *self);

void                  gtk_native_dialog_hide (GtkNativeDialog *self);

void                  gtk_native_dialog_destroy (GtkNativeDialog *self);

gboolean              gtk_native_dialog_get_visible (GtkNativeDialog *self);

void                  gtk_native_dialog_set_modal (GtkNativeDialog *self,
                                                   gboolean modal);

gboolean              gtk_native_dialog_get_modal (GtkNativeDialog *self);

void                  gtk_native_dialog_set_title (GtkNativeDialog *self,
                                                   const char *title);

const char *          gtk_native_dialog_get_title (GtkNativeDialog *self);

void                  gtk_native_dialog_set_transient_for (GtkNativeDialog *self,
                                                           GtkWindow *parent);

GtkWindow *           gtk_native_dialog_get_transient_for (GtkNativeDialog *self);



