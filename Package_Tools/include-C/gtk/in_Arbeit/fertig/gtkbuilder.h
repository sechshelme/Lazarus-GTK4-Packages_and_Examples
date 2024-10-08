/* GTK - The GIMP Toolkit
 * Copyright (C) 2006-2007 Async Open Source,
 *                         Johan Dahlin <jdahlin@async.com.br>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
 */

#pragma once

#if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)
#error "Only <gtk/gtk.h> can be included directly."
#endif

#include <gtk/gtkbuilderscope.h>
#include <gtk/gtkwidget.h>



#define GTK_TYPE_BUILDER                 (gtk_builder_get_type ())
#define GTK_BUILDER(obj)                 (G_TYPE_CHECK_INSTANCE_CAST ((obj), GTK_TYPE_BUILDER, GtkBuilder))
#define GTK_BUILDER_CLASS(klass)         (G_TYPE_CHECK_CLASS_CAST ((klass), GTK_TYPE_BUILDER, GtkBuilderClass))
#define GTK_IS_BUILDER(obj)              (G_TYPE_CHECK_INSTANCE_TYPE ((obj), GTK_TYPE_BUILDER))
#define GTK_IS_BUILDER_CLASS(klass)      (G_TYPE_CHECK_CLASS_TYPE ((klass), GTK_TYPE_BUILDER))
#define GTK_BUILDER_GET_CLASS(obj)       (G_TYPE_INSTANCE_GET_CLASS ((obj), GTK_TYPE_BUILDER, GtkBuilderClass))

#define GTK_BUILDER_ERROR                (gtk_builder_error_quark ())

typedef struct _GtkBuilderClass   GtkBuilderClass;

/**
 * GtkBuilderError:
 * @GTK_BUILDER_ERROR_INVALID_TYPE_FUNCTION: A type-func attribute didn’t name
 *  a function that returns a `GType`.
 * @GTK_BUILDER_ERROR_UNHANDLED_TAG: The input contained a tag that `GtkBuilder`
 *  can’t handle.
 * @GTK_BUILDER_ERROR_MISSING_ATTRIBUTE: An attribute that is required by
 *  `GtkBuilder` was missing.
 * @GTK_BUILDER_ERROR_INVALID_ATTRIBUTE: `GtkBuilder` found an attribute that
 *  it doesn’t understand.
 * @GTK_BUILDER_ERROR_INVALID_TAG: `GtkBuilder` found a tag that
 *  it doesn’t understand.
 * @GTK_BUILDER_ERROR_MISSING_PROPERTY_VALUE: A required property value was
 *  missing.
 * @GTK_BUILDER_ERROR_INVALID_VALUE: `GtkBuilder` couldn’t parse
 *  some attribute value.
 * @GTK_BUILDER_ERROR_VERSION_MISMATCH: The input file requires a newer version
 *  of GTK.
 * @GTK_BUILDER_ERROR_DUPLICATE_ID: An object id occurred twice.
 * @GTK_BUILDER_ERROR_OBJECT_TYPE_REFUSED: A specified object type is of the same type or
 *  derived from the type of the composite class being extended with builder XML.
 * @GTK_BUILDER_ERROR_TEMPLATE_MISMATCH: The wrong type was specified in a composite class’s template XML
 * @GTK_BUILDER_ERROR_INVALID_PROPERTY: The specified property is unknown for the object class.
 * @GTK_BUILDER_ERROR_INVALID_SIGNAL: The specified signal is unknown for the object class.
 * @GTK_BUILDER_ERROR_INVALID_ID: An object id is unknown.
 * @GTK_BUILDER_ERROR_INVALID_FUNCTION: A function could not be found. This often happens
 *   when symbols are set to be kept private. Compiling code with -rdynamic or using the
 *   `gmodule-export-2.0` pkgconfig module can fix this problem.
 *
 * Error codes that identify various errors that can occur while using
 * `GtkBuilder`.
 */
typedef enum
{
  GTK_BUILDER_ERROR_INVALID_TYPE_FUNCTION,
  GTK_BUILDER_ERROR_UNHANDLED_TAG,
  GTK_BUILDER_ERROR_MISSING_ATTRIBUTE,
  GTK_BUILDER_ERROR_INVALID_ATTRIBUTE,
  GTK_BUILDER_ERROR_INVALID_TAG,
  GTK_BUILDER_ERROR_MISSING_PROPERTY_VALUE,
  GTK_BUILDER_ERROR_INVALID_VALUE,
  GTK_BUILDER_ERROR_VERSION_MISMATCH,
  GTK_BUILDER_ERROR_DUPLICATE_ID,
  GTK_BUILDER_ERROR_OBJECT_TYPE_REFUSED,
  GTK_BUILDER_ERROR_TEMPLATE_MISMATCH,
  GTK_BUILDER_ERROR_INVALID_PROPERTY,
  GTK_BUILDER_ERROR_INVALID_SIGNAL,
  GTK_BUILDER_ERROR_INVALID_ID,
  GTK_BUILDER_ERROR_INVALID_FUNCTION
} GtkBuilderError;


GQuark gtk_builder_error_quark (void);


GType        gtk_builder_get_type                (void) ;

GtkBuilder*  gtk_builder_new                     (void);


gboolean     gtk_builder_add_from_file           (GtkBuilder    *builder,
                                                  const char    *filename,
                                                  GError       **error);

gboolean     gtk_builder_add_from_resource       (GtkBuilder    *builder,
                                                  const char    *resource_path,
                                                  GError       **error);

gboolean     gtk_builder_add_from_string         (GtkBuilder    *builder,
                                                  const char    *buffer,
                                                  gssize         length,
                                                  GError       **error);

gboolean     gtk_builder_add_objects_from_file   (GtkBuilder    *builder,
                                                  const char    *filename,
                                                  const char   **object_ids,
                                                  GError       **error);

gboolean     gtk_builder_add_objects_from_resource(GtkBuilder    *builder,
                                                  const char    *resource_path,
                                                  const char   **object_ids,
                                                  GError       **error);

gboolean     gtk_builder_add_objects_from_string (GtkBuilder    *builder,
                                                  const char    *buffer,
                                                  gssize         length,
                                                  const char   **object_ids,
                                                  GError       **error);

GObject*     gtk_builder_get_object              (GtkBuilder    *builder,
                                                  const char    *name);

GSList*      gtk_builder_get_objects             (GtkBuilder    *builder);

void         gtk_builder_expose_object           (GtkBuilder    *builder,
                                                  const char    *name,
                                                  GObject       *object);

GObject *    gtk_builder_get_current_object      (GtkBuilder    *builder);

void         gtk_builder_set_current_object      (GtkBuilder    *builder,
                                                  GObject       *current_object);

void         gtk_builder_set_translation_domain  (GtkBuilder   	*builder,
                                                  const char   	*domain);

const char * gtk_builder_get_translation_domain  (GtkBuilder   	*builder);

GtkBuilderScope *gtk_builder_get_scope           (GtkBuilder    *builder);

void         gtk_builder_set_scope               (GtkBuilder    *builder,
                                                  GtkBuilderScope *scope);

GType        gtk_builder_get_type_from_name      (GtkBuilder   	*builder,
                                                  const char   	*type_name);


gboolean     gtk_builder_value_from_string       (GtkBuilder    *builder,
						  GParamSpec   	*pspec,
                                                  const char   	*string,
                                                  GValue       	*value,
						  GError       **error);

gboolean     gtk_builder_value_from_string_type  (GtkBuilder    *builder,
						  GType        	 type,
                                                  const char   	*string,
                                                  GValue       	*value,
						  GError       **error);

GtkBuilder * gtk_builder_new_from_file           (const char    *filename);

GtkBuilder * gtk_builder_new_from_resource       (const char    *resource_path);

GtkBuilder * gtk_builder_new_from_string         (const char    *string,
                                                  gssize         length);


GClosure *   gtk_builder_create_closure          (GtkBuilder    *builder,
                                                  const char    *function_name,
                                                  GtkBuilderClosureFlags flags,
                                                  GObject       *object,
                                                  GError       **error);



/**
 * GTK_BUILDER_WARN_INVALID_CHILD_TYPE:
 * @object: the `GtkBuildable` on which the warning occurred
 * @type: the unexpected type value
 *
 * This macro should be used to emit a warning about and unexpected @type value
 * in a `GtkBuildable` add_child implementation.
 */
#define GTK_BUILDER_WARN_INVALID_CHILD_TYPE(object, type) \
  g_warning ("'%s' is not a valid child type of '%s'", type, g_type_name (G_OBJECT_TYPE (object)))


gboolean  gtk_builder_extend_with_template  (GtkBuilder    *builder,
                                             GObject       *object,
                                             GType          template_type,
                                             const char    *buffer,
                                             gssize         length,
                                             GError       **error);





