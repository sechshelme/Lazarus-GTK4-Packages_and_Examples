/* GTK - The GIMP Toolkit
 * gtkpagesetup.h: Page Setup
 * Copyright (C) 2006, Red Hat, Inc.
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

#include <gtk/print/gtkpapersize.h>




typedef struct _GtkPageSetup GtkPageSetup;

#define GTK_TYPE_PAGE_SETUP    (gtk_page_setup_get_type ())
#define GTK_PAGE_SETUP(obj)    (G_TYPE_CHECK_INSTANCE_CAST ((obj), GTK_TYPE_PAGE_SETUP, GtkPageSetup))
#define GTK_IS_PAGE_SETUP(obj) (G_TYPE_CHECK_INSTANCE_TYPE ((obj), GTK_TYPE_PAGE_SETUP))


GType              gtk_page_setup_get_type          (void) ;

GtkPageSetup *     gtk_page_setup_new               (void);

GtkPageSetup *     gtk_page_setup_copy              (GtkPageSetup       *other);

GtkPageOrientation gtk_page_setup_get_orientation   (GtkPageSetup       *setup);

void               gtk_page_setup_set_orientation   (GtkPageSetup       *setup,
						     GtkPageOrientation  orientation);

GtkPaperSize *     gtk_page_setup_get_paper_size    (GtkPageSetup       *setup);

void               gtk_page_setup_set_paper_size    (GtkPageSetup       *setup,
						     GtkPaperSize       *size);

double             gtk_page_setup_get_top_margin    (GtkPageSetup       *setup,
						     GtkUnit             unit);

void               gtk_page_setup_set_top_margin    (GtkPageSetup       *setup,
						     double              margin,
						     GtkUnit             unit);

double             gtk_page_setup_get_bottom_margin (GtkPageSetup       *setup,
						     GtkUnit             unit);

void               gtk_page_setup_set_bottom_margin (GtkPageSetup       *setup,
						     double              margin,
						     GtkUnit             unit);

double             gtk_page_setup_get_left_margin   (GtkPageSetup       *setup,
						     GtkUnit             unit);

void               gtk_page_setup_set_left_margin   (GtkPageSetup       *setup,
						     double              margin,
						     GtkUnit             unit);

double             gtk_page_setup_get_right_margin  (GtkPageSetup       *setup,
						     GtkUnit             unit);

void               gtk_page_setup_set_right_margin  (GtkPageSetup       *setup,
						     double              margin,
						     GtkUnit             unit);


void gtk_page_setup_set_paper_size_and_default_margins (GtkPageSetup    *setup,
							GtkPaperSize    *size);

/* These take orientation, but not margins into consideration */

double             gtk_page_setup_get_paper_width   (GtkPageSetup       *setup,
						     GtkUnit             unit);

double             gtk_page_setup_get_paper_height  (GtkPageSetup       *setup,
						     GtkUnit             unit);


/* These take orientation, and margins into consideration */

double             gtk_page_setup_get_page_width    (GtkPageSetup       *setup,
						     GtkUnit             unit);

double             gtk_page_setup_get_page_height   (GtkPageSetup       *setup,
						     GtkUnit             unit);

/* Saving and restoring page setup */

GtkPageSetup	  *gtk_page_setup_new_from_file	    (const char          *file_name,
						     GError              **error);

gboolean	   gtk_page_setup_load_file	    (GtkPageSetup        *setup,
						     const char          *file_name,
						     GError             **error);

gboolean	   gtk_page_setup_to_file	    (GtkPageSetup        *setup,
						     const char          *file_name,
						     GError             **error);

GtkPageSetup	  *gtk_page_setup_new_from_key_file (GKeyFile            *key_file,
						     const char          *group_name,
						     GError             **error);

gboolean           gtk_page_setup_load_key_file     (GtkPageSetup        *setup,
				                     GKeyFile            *key_file,
				                     const char          *group_name,
				                     GError             **error);

void		   gtk_page_setup_to_key_file	    (GtkPageSetup        *setup,
						     GKeyFile            *key_file,
						     const char          *group_name);


GVariant          *gtk_page_setup_to_gvariant       (GtkPageSetup        *setup);

GtkPageSetup      *gtk_page_setup_new_from_gvariant (GVariant            *variant);





