/*
 * Copyright © 2019 Benjamin Otte
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
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
 *
 * Authors: Benjamin Otte <otte@gnome.org>
 */

#pragma once

#if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)
#error "Only <gtk/gtk.h> can be included directly."
#endif

#include <gtk/gtkexpression.h>
#include <gtk/gtkfilter.h>



/**
 * GtkStringFilterMatchMode:
 * @GTK_STRING_FILTER_MATCH_MODE_EXACT: The search string and
 *   text must match exactly.
 * @GTK_STRING_FILTER_MATCH_MODE_SUBSTRING: The search string
 *   must be contained as a substring inside the text.
 * @GTK_STRING_FILTER_MATCH_MODE_PREFIX: The text must begin
 *   with the search string.
 *
 * Specifies how search strings are matched inside text.
 */
typedef enum {
  GTK_STRING_FILTER_MATCH_MODE_EXACT,
  GTK_STRING_FILTER_MATCH_MODE_SUBSTRING,
  GTK_STRING_FILTER_MATCH_MODE_PREFIX
} GtkStringFilterMatchMode;

#define GTK_TYPE_STRING_FILTER             (gtk_string_filter_get_type ())

//G_DECLARE_FINAL_TYPE (GtkStringFilter, gtk_string_filter, GTK, STRING_FILTER, GtkFilter)


GtkStringFilter *       gtk_string_filter_new                   (GtkExpression          *expression);


const char *            gtk_string_filter_get_search            (GtkStringFilter        *self);

void                    gtk_string_filter_set_search            (GtkStringFilter        *self,
                                                                 const char             *search);

GtkExpression *         gtk_string_filter_get_expression        (GtkStringFilter        *self);

void                    gtk_string_filter_set_expression        (GtkStringFilter        *self,
                                                                 GtkExpression          *expression);

gboolean                gtk_string_filter_get_ignore_case       (GtkStringFilter        *self);

void                    gtk_string_filter_set_ignore_case       (GtkStringFilter        *self,
                                                                 gboolean                ignore_case);

GtkStringFilterMatchMode gtk_string_filter_get_match_mode       (GtkStringFilter        *self);

void                     gtk_string_filter_set_match_mode       (GtkStringFilter        *self,
                                                                 GtkStringFilterMatchMode mode);





