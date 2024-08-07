/* gbookmarkfile.h: parsing and building desktop bookmarks
 *
 * Copyright (C) 2005-2006 Emmanuele Bassi
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
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
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library; if not, see <http://www.gnu.org/licenses/>.
 */

#ifndef __G_BOOKMARK_FILE_H__
#define __G_BOOKMARK_FILE_H__

#if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)
#error "Only <glib.h> can be included directly."
#endif

#include <glib/gdatetime.h>
#include <glib/gerror.h>
#include <time.h>



/**
 * G_BOOKMARK_FILE_ERROR:
 *
 * Error domain for bookmark file parsing.
 *
 * Errors in this domain will be from the #GBookmarkFileError
 * enumeration. See #GError for information on error domains.
 */
#define G_BOOKMARK_FILE_ERROR	(g_bookmark_file_error_quark ())


/**
 * GBookmarkFileError:
 * @G_BOOKMARK_FILE_ERROR_INVALID_URI: URI was ill-formed
 * @G_BOOKMARK_FILE_ERROR_INVALID_VALUE: a requested field was not found
 * @G_BOOKMARK_FILE_ERROR_APP_NOT_REGISTERED: a requested application did
 *     not register a bookmark
 * @G_BOOKMARK_FILE_ERROR_URI_NOT_FOUND: a requested URI was not found
 * @G_BOOKMARK_FILE_ERROR_READ: document was ill formed
 * @G_BOOKMARK_FILE_ERROR_UNKNOWN_ENCODING: the text being parsed was
 *     in an unknown encoding
 * @G_BOOKMARK_FILE_ERROR_WRITE: an error occurred while writing
 * @G_BOOKMARK_FILE_ERROR_FILE_NOT_FOUND: requested file was not found
 *
 * Error codes returned by bookmark file parsing.
 */
typedef enum
{
  G_BOOKMARK_FILE_ERROR_INVALID_URI,
  G_BOOKMARK_FILE_ERROR_INVALID_VALUE,
  G_BOOKMARK_FILE_ERROR_APP_NOT_REGISTERED,
  G_BOOKMARK_FILE_ERROR_URI_NOT_FOUND,
  G_BOOKMARK_FILE_ERROR_READ,
  G_BOOKMARK_FILE_ERROR_UNKNOWN_ENCODING,
  G_BOOKMARK_FILE_ERROR_WRITE,
  G_BOOKMARK_FILE_ERROR_FILE_NOT_FOUND
} GBookmarkFileError;


GQuark g_bookmark_file_error_quark (void);

/**
 * GBookmarkFile:
 *
 * `GBookmarkFile` lets you parse, edit or create files containing bookmarks.
 *
 * Bookmarks refer to a URI, along with some meta-data about the resource
 * pointed by the URI like its MIME type, the application that is registering
 * the bookmark and the icon that should be used to represent the bookmark.
 * The data is stored using the
 * [Desktop Bookmark Specification](http://www.gnome.org/~ebassi/bookmark-spec).
 *
 * The syntax of the bookmark files is described in detail inside the
 * Desktop Bookmark Specification, here is a quick summary: bookmark
 * files use a sub-class of the XML Bookmark Exchange Language
 * specification, consisting of valid UTF-8 encoded XML, under the
 * `<xbel>` root element; each bookmark is stored inside a
 * `<bookmark>` element, using its URI: no relative paths can
 * be used inside a bookmark file. The bookmark may have a user defined
 * title and description, to be used instead of the URI. Under the
 * `<metadata>` element, with its owner attribute set to
 * `http://freedesktop.org`, is stored the meta-data about a resource
 * pointed by its URI. The meta-data consists of the resource's MIME
 * type; the applications that have registered a bookmark; the groups
 * to which a bookmark belongs to; a visibility flag, used to set the
 * bookmark as "private" to the applications and groups that has it
 * registered; the URI and MIME type of an icon, to be used when
 * displaying the bookmark inside a GUI.
 *
 * Here is an example of a bookmark file:
 * [bookmarks.xbel](https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/glib/tests/bookmarks.xbel)
 *
 * A bookmark file might contain more than one bookmark; each bookmark
 * is accessed through its URI.
 *
 * The important caveat of bookmark files is that when you add a new
 * bookmark you must also add the application that is registering it, using
 * [method@GLib.BookmarkFile.add_application] or [method@GLib.BookmarkFile.set_application_info].
 * If a bookmark has no applications then it won't be dumped when creating
 * the on disk representation, using [method@GLib.BookmarkFile.to_data] or
 * [method@GLib.BookmarkFile.to_file].
 *
 * Since: 2.12
 */
typedef struct _GBookmarkFile GBookmarkFile;


GBookmarkFile *g_bookmark_file_new                 (void);

void           g_bookmark_file_free                (GBookmarkFile  *bookmark);


GBookmarkFile *g_bookmark_file_copy                (GBookmarkFile  *bookmark);


gboolean       g_bookmark_file_load_from_file      (GBookmarkFile  *bookmark,
						    const gchar    *filename,
						    GError        **error);

gboolean       g_bookmark_file_load_from_data      (GBookmarkFile  *bookmark,
						    const gchar    *data,
						    gsize           length,
						    GError        **error);

gboolean       g_bookmark_file_load_from_data_dirs (GBookmarkFile  *bookmark,
						    const gchar    *file,
						    gchar         **full_path,
						    GError        **error);

gchar *        g_bookmark_file_to_data             (GBookmarkFile  *bookmark,
						    gsize          *length,
						    GError        **error) ;

gboolean       g_bookmark_file_to_file             (GBookmarkFile  *bookmark,
						    const gchar    *filename,
						    GError        **error);


void           g_bookmark_file_set_title           (GBookmarkFile  *bookmark,
						    const gchar    *uri,
						    const gchar    *title);

gchar *        g_bookmark_file_get_title           (GBookmarkFile  *bookmark,
						    const gchar    *uri,
						    GError        **error) ;

void           g_bookmark_file_set_description     (GBookmarkFile  *bookmark,
						    const gchar    *uri,
						    const gchar    *description);

gchar *        g_bookmark_file_get_description     (GBookmarkFile  *bookmark,
						    const gchar    *uri,
						    GError        **error) ;

void           g_bookmark_file_set_mime_type       (GBookmarkFile  *bookmark,
						    const gchar    *uri,
						    const gchar    *mime_type);

gchar *        g_bookmark_file_get_mime_type       (GBookmarkFile  *bookmark,
						    const gchar    *uri,
						    GError        **error) ;

void           g_bookmark_file_set_groups          (GBookmarkFile  *bookmark,
						    const gchar    *uri,
						    const gchar   **groups,
						    gsize           length);

void           g_bookmark_file_add_group           (GBookmarkFile  *bookmark,
						    const gchar    *uri,
						    const gchar    *group);

gboolean       g_bookmark_file_has_group           (GBookmarkFile  *bookmark,
						    const gchar    *uri,
						    const gchar    *group,
						    GError        **error);

gchar **       g_bookmark_file_get_groups          (GBookmarkFile  *bookmark,
						    const gchar    *uri,
						    gsize          *length,
						    GError        **error);

void           g_bookmark_file_add_application     (GBookmarkFile  *bookmark,
						    const gchar    *uri,
						    const gchar    *name,
						    const gchar    *exec);

gboolean       g_bookmark_file_has_application     (GBookmarkFile  *bookmark,
						    const gchar    *uri,
						    const gchar    *name,
						    GError        **error);

gchar **       g_bookmark_file_get_applications    (GBookmarkFile  *bookmark,
						    const gchar    *uri,
						    gsize          *length,
						    GError        **error);

gboolean       g_bookmark_file_set_app_info        (GBookmarkFile  *bookmark,
						    const gchar    *uri,
						    const gchar    *name,
						    const gchar    *exec,
						    gint            count,
						    time_t          stamp,
						    GError        **error);

gboolean       g_bookmark_file_set_application_info (GBookmarkFile  *bookmark,
                                                     const char     *uri,
                                                     const char     *name,
                                                     const char     *exec,
                                                     int             count,
                                                     GDateTime      *stamp,
                                                     GError        **error);

gboolean       g_bookmark_file_get_app_info        (GBookmarkFile  *bookmark,
						    const gchar    *uri,
						    const gchar    *name,
						    gchar         **exec,
						    guint          *count,
						    time_t         *stamp,
						    GError        **error);

gboolean       g_bookmark_file_get_application_info (GBookmarkFile  *bookmark,
                                                     const char     *uri,
                                                     const char     *name,
                                                     char          **exec,
                                                     unsigned int   *count,
                                                     GDateTime     **stamp,
                                                     GError        **error);

void           g_bookmark_file_set_is_private      (GBookmarkFile  *bookmark,
						    const gchar    *uri,
						    gboolean        is_private);

gboolean       g_bookmark_file_get_is_private      (GBookmarkFile  *bookmark,
						    const gchar    *uri,
						    GError        **error);

void           g_bookmark_file_set_icon            (GBookmarkFile  *bookmark,
						    const gchar    *uri,
						    const gchar    *href,
						    const gchar    *mime_type);

gboolean       g_bookmark_file_get_icon            (GBookmarkFile  *bookmark,
						    const gchar    *uri,
						    gchar         **href,
						    gchar         **mime_type,
						    GError        **error);

void           g_bookmark_file_set_added           (GBookmarkFile  *bookmark,
						    const gchar    *uri,
						    time_t          added);

void           g_bookmark_file_set_added_date_time (GBookmarkFile  *bookmark,
                                                    const char     *uri,
                                                    GDateTime      *added);

time_t         g_bookmark_file_get_added           (GBookmarkFile  *bookmark,
						    const gchar    *uri,
						    GError        **error);

GDateTime     *g_bookmark_file_get_added_date_time (GBookmarkFile  *bookmark,
                                                    const char     *uri,
                                                    GError        **error);

void           g_bookmark_file_set_modified        (GBookmarkFile  *bookmark,
						    const gchar    *uri,
						    time_t          modified);

void           g_bookmark_file_set_modified_date_time (GBookmarkFile  *bookmark,
                                                       const char     *uri,
                                                       GDateTime      *modified);

time_t         g_bookmark_file_get_modified        (GBookmarkFile  *bookmark,
						    const gchar    *uri,
						    GError        **error);

GDateTime     *g_bookmark_file_get_modified_date_time (GBookmarkFile  *bookmark,
                                                       const char     *uri,
                                                       GError        **error);

void           g_bookmark_file_set_visited         (GBookmarkFile  *bookmark,
						    const gchar    *uri,
						    time_t          visited);

void           g_bookmark_file_set_visited_date_time (GBookmarkFile  *bookmark,
                                                      const char     *uri,
                                                      GDateTime      *visited);

time_t         g_bookmark_file_get_visited         (GBookmarkFile  *bookmark,
						    const gchar    *uri, 
						    GError        **error);

GDateTime     *g_bookmark_file_get_visited_date_time (GBookmarkFile  *bookmark,
                                                      const char     *uri,
                                                      GError        **error);

gboolean       g_bookmark_file_has_item            (GBookmarkFile  *bookmark,
						    const gchar    *uri);

gint           g_bookmark_file_get_size            (GBookmarkFile  *bookmark);

gchar **       g_bookmark_file_get_uris            (GBookmarkFile  *bookmark,
						    gsize          *length);

gboolean       g_bookmark_file_remove_group        (GBookmarkFile  *bookmark,
						    const gchar    *uri,
						    const gchar    *group,
						    GError        **error);

gboolean       g_bookmark_file_remove_application  (GBookmarkFile  *bookmark,
						    const gchar    *uri,
						    const gchar    *name,
						    GError        **error);

gboolean       g_bookmark_file_remove_item         (GBookmarkFile  *bookmark,
						    const gchar    *uri,
						    GError        **error);

gboolean       g_bookmark_file_move_item           (GBookmarkFile  *bookmark,
						    const gchar    *old_uri,
						    const gchar    *new_uri,
						    GError        **error);



#endif /* __G_BOOKMARK_FILE_H__ */
