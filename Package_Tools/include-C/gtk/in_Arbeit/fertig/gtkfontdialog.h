/* GTK - The GIMP Toolkit
 *
 * Copyright (C) 2022 Red Hat, Inc.
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

#include <gdk/gdk.h>
#include <gtk/gtkwindow.h>
#include <gtk/gtkfilter.h>



#define GTK_TYPE_FONT_DIALOG (gtk_font_dialog_get_type ())


//G_DECLARE_FINAL_TYPE (GtkFontDialog, gtk_font_dialog, GTK, FONT_DIALOG, GObject)


GtkFontDialog *  gtk_font_dialog_new           (void);


const char *     gtk_font_dialog_get_title     (GtkFontDialog        *self);


void             gtk_font_dialog_set_title     (GtkFontDialog        *self,
                                                const char           *title);


gboolean         gtk_font_dialog_get_modal     (GtkFontDialog        *self);


void             gtk_font_dialog_set_modal     (GtkFontDialog        *self,
                                                gboolean              modal);


PangoLanguage *  gtk_font_dialog_get_language  (GtkFontDialog        *self);


void             gtk_font_dialog_set_language  (GtkFontDialog        *self,
                                                PangoLanguage        *language);


PangoFontMap *   gtk_font_dialog_get_font_map  (GtkFontDialog        *self);


void             gtk_font_dialog_set_font_map  (GtkFontDialog        *self,
                                                PangoFontMap         *fontmap);


GtkFilter *      gtk_font_dialog_get_filter    (GtkFontDialog        *self);


void             gtk_font_dialog_set_filter    (GtkFontDialog        *self,
                                                GtkFilter            *filter);


void             gtk_font_dialog_choose_family (GtkFontDialog        *self,
                                                GtkWindow            *parent,
                                                PangoFontFamily      *initial_value,
                                                GCancellable         *cancellable,
                                                GAsyncReadyCallback   callback,
                                                gpointer              user_data);


PangoFontFamily *
                 gtk_font_dialog_choose_family_finish
                                               (GtkFontDialog         *self,
                                                GAsyncResult          *result,
                                                GError               **error);


void             gtk_font_dialog_choose_face   (GtkFontDialog        *self,
                                                GtkWindow            *parent,
                                                PangoFontFace        *initial_value,
                                                GCancellable         *cancellable,
                                                GAsyncReadyCallback   callback,
                                                gpointer              user_data);


PangoFontFace *  gtk_font_dialog_choose_face_finish
                                               (GtkFontDialog         *self,
                                                GAsyncResult          *result,
                                                GError               **error);


void             gtk_font_dialog_choose_font   (GtkFontDialog        *self,
                                                GtkWindow            *parent,
                                                PangoFontDescription *initial_value,
                                                GCancellable         *cancellable,
                                                GAsyncReadyCallback   callback,
                                                gpointer              user_data);


PangoFontDescription *
                 gtk_font_dialog_choose_font_finish
                                               (GtkFontDialog         *self,
                                                GAsyncResult          *result,
                                                GError               **error);


void             gtk_font_dialog_choose_font_and_features
                                               (GtkFontDialog        *self,
                                                GtkWindow            *parent,
                                                PangoFontDescription *initial_value,
                                                GCancellable         *cancellable,
                                                GAsyncReadyCallback   callback,
                                                gpointer              user_data);


gboolean        gtk_font_dialog_choose_font_and_features_finish
                                               (GtkFontDialog         *self,
                                                GAsyncResult          *result,
                                                PangoFontDescription **font_desc,
                                                char                 **font_features,
                                                PangoLanguage        **language,
                                                GError               **error);


