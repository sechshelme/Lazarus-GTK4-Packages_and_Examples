/*
 * Copyright © 2022 Matthias Clasen
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
 * Authors: Matthias Clasen <mclasen@redhat.com>
 */

#pragma once

#if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)
#error "Only <gtk/gtk.h> can be included directly."
#endif

#include <gdk/gdk.h>
#include <gtk/gtksorter.h>
#include <gtk/gtkcolumnviewcolumn.h>



#define GTK_TYPE_COLUMN_VIEW_SORTER             (gtk_column_view_sorter_get_type ())


//G_DECLARE_FINAL_TYPE (GtkColumnViewSorter, gtk_column_view_sorter, GTK, COLUMN_VIEW_SORTER, GtkSorter)


GtkColumnViewColumn *   gtk_column_view_sorter_get_primary_sort_column (GtkColumnViewSorter *self);


GtkSortType             gtk_column_view_sorter_get_primary_sort_order  (GtkColumnViewSorter *self);


guint                   gtk_column_view_sorter_get_n_sort_columns      (GtkColumnViewSorter *self);


GtkColumnViewColumn *   gtk_column_view_sorter_get_nth_sort_column     (GtkColumnViewSorter *self,
                                                                        guint                position,
                                                                        GtkSortType         *sort_order);




