/* gtkentrybuffer.h
 * Copyright (C) 2009  Stefan Walter <stef@memberwebs.com>
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

#include <glib-object.h>
#include <gdk/gdk.h>



/* Maximum size of text buffer, in bytes */
#define GTK_ENTRY_BUFFER_MAX_SIZE        G_MAXUSHORT

#define GTK_TYPE_ENTRY_BUFFER            (gtk_entry_buffer_get_type ())
#define GTK_ENTRY_BUFFER(obj)            (G_TYPE_CHECK_INSTANCE_CAST ((obj), GTK_TYPE_ENTRY_BUFFER, GtkEntryBuffer))
#define GTK_ENTRY_BUFFER_CLASS(klass)    (G_TYPE_CHECK_CLASS_CAST ((klass), GTK_TYPE_ENTRY_BUFFER, GtkEntryBufferClass))
#define GTK_IS_ENTRY_BUFFER(obj)         (G_TYPE_CHECK_INSTANCE_TYPE ((obj), GTK_TYPE_ENTRY_BUFFER))
#define GTK_IS_ENTRY_BUFFER_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE ((klass), GTK_TYPE_ENTRY_BUFFER))
#define GTK_ENTRY_BUFFER_GET_CLASS(obj)  (G_TYPE_INSTANCE_GET_CLASS ((obj), GTK_TYPE_ENTRY_BUFFER, GtkEntryBufferClass))

typedef struct _GtkEntryBuffer            GtkEntryBuffer;
typedef struct _GtkEntryBufferClass       GtkEntryBufferClass;

struct _GtkEntryBuffer
{
  GObject parent_instance;
};

struct _GtkEntryBufferClass
{
  GObjectClass parent_class;

  /* Signals */

  void         (*inserted_text)          (GtkEntryBuffer *buffer,
                                          guint           position,
                                          const char     *chars,
                                          guint           n_chars);

  void         (*deleted_text)           (GtkEntryBuffer *buffer,
                                          guint           position,
                                          guint           n_chars);

  /* Virtual Methods */

  const char * (*get_text)               (GtkEntryBuffer *buffer,
                                          gsize          *n_bytes);

  guint        (*get_length)             (GtkEntryBuffer *buffer);

  guint        (*insert_text)            (GtkEntryBuffer *buffer,
                                          guint           position,
                                          const char     *chars,
                                          guint           n_chars);

  guint        (*delete_text)            (GtkEntryBuffer *buffer,
                                          guint           position,
                                          guint           n_chars);

  /* Padding for future expansion */
  void (*_gtk_reserved1) (void);
  void (*_gtk_reserved2) (void);
  void (*_gtk_reserved3) (void);
  void (*_gtk_reserved4) (void);
  void (*_gtk_reserved5) (void);
  void (*_gtk_reserved6) (void);
  void (*_gtk_reserved7) (void);
  void (*_gtk_reserved8) (void);
};


GType                     gtk_entry_buffer_get_type               (void) ;


GtkEntryBuffer*           gtk_entry_buffer_new                    (const char      *initial_chars,
                                                                   int              n_initial_chars);


gsize                     gtk_entry_buffer_get_bytes              (GtkEntryBuffer  *buffer);


guint                     gtk_entry_buffer_get_length             (GtkEntryBuffer  *buffer);


const char *              gtk_entry_buffer_get_text               (GtkEntryBuffer  *buffer);


void                      gtk_entry_buffer_set_text               (GtkEntryBuffer  *buffer,
                                                                   const char      *chars,
                                                                   int              n_chars);


void                      gtk_entry_buffer_set_max_length         (GtkEntryBuffer  *buffer,
                                                                   int              max_length);


int                       gtk_entry_buffer_get_max_length         (GtkEntryBuffer  *buffer);


guint                     gtk_entry_buffer_insert_text            (GtkEntryBuffer  *buffer,
                                                                   guint            position,
                                                                   const char      *chars,
                                                                   int              n_chars);


guint                     gtk_entry_buffer_delete_text            (GtkEntryBuffer  *buffer,
                                                                   guint            position,
                                                                   int              n_chars);


void                      gtk_entry_buffer_emit_inserted_text     (GtkEntryBuffer  *buffer,
                                                                   guint            position,
                                                                   const char      *chars,
                                                                   guint            n_chars);


void                      gtk_entry_buffer_emit_deleted_text      (GtkEntryBuffer  *buffer,
                                                                   guint            position,
                                                                   guint            n_chars);





