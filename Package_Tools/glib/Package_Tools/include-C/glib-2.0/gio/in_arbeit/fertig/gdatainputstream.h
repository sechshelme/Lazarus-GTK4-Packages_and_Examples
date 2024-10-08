/* GIO - GLib Input, Output and Streaming Library
 *
 * Copyright (C) 2006-2007 Red Hat, Inc.
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
 * You should have received a copy of the GNU Lesser General
 * Public License along with this library; if not, see <http://www.gnu.org/licenses/>.
 *
 * Author: Alexander Larsson <alexl@redhat.com>
 */

#ifndef __G_DATA_INPUT_STREAM_H__
#define __G_DATA_INPUT_STREAM_H__

#if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)
#error "Only <gio/gio.h> can be included directly."
#endif

#include <gio/gbufferedinputstream.h>



#define G_TYPE_DATA_INPUT_STREAM         (g_data_input_stream_get_type ())
#define G_DATA_INPUT_STREAM(o)           (G_TYPE_CHECK_INSTANCE_CAST ((o), G_TYPE_DATA_INPUT_STREAM, GDataInputStream))
#define G_DATA_INPUT_STREAM_CLASS(k)     (G_TYPE_CHECK_CLASS_CAST((k), G_TYPE_DATA_INPUT_STREAM, GDataInputStreamClass))
#define G_IS_DATA_INPUT_STREAM(o)        (G_TYPE_CHECK_INSTANCE_TYPE ((o), G_TYPE_DATA_INPUT_STREAM))
#define G_IS_DATA_INPUT_STREAM_CLASS(k)  (G_TYPE_CHECK_CLASS_TYPE ((k), G_TYPE_DATA_INPUT_STREAM))
#define G_DATA_INPUT_STREAM_GET_CLASS(o) (G_TYPE_INSTANCE_GET_CLASS ((o), G_TYPE_DATA_INPUT_STREAM, GDataInputStreamClass))

typedef struct _GDataInputStreamClass    GDataInputStreamClass;
typedef struct _GDataInputStreamPrivate  GDataInputStreamPrivate;

struct _GDataInputStream
{
  GBufferedInputStream parent_instance;

  /*< private >*/
  GDataInputStreamPrivate *priv;
};

struct _GDataInputStreamClass
{
  GBufferedInputStreamClass parent_class;

  /*< private >*/
  /* Padding for future expansion */
  void (*_g_reserved1) (void);
  void (*_g_reserved2) (void);
  void (*_g_reserved3) (void);
  void (*_g_reserved4) (void);
  void (*_g_reserved5) (void);
};


GType                  g_data_input_stream_get_type             (void) ;

GDataInputStream *     g_data_input_stream_new                  (GInputStream            *base_stream);


void                   g_data_input_stream_set_byte_order       (GDataInputStream        *stream,
                                                                 GDataStreamByteOrder     order);

GDataStreamByteOrder   g_data_input_stream_get_byte_order       (GDataInputStream        *stream);

void                   g_data_input_stream_set_newline_type     (GDataInputStream        *stream,
                                                                 GDataStreamNewlineType   type);

GDataStreamNewlineType g_data_input_stream_get_newline_type     (GDataInputStream        *stream);

guchar                 g_data_input_stream_read_byte            (GDataInputStream        *stream,
                                                                 GCancellable            *cancellable,
                                                                 GError                 **error);

gint16                 g_data_input_stream_read_int16           (GDataInputStream        *stream,
                                                                 GCancellable            *cancellable,
                                                                 GError                 **error);

guint16                g_data_input_stream_read_uint16          (GDataInputStream        *stream,
                                                                 GCancellable            *cancellable,
                                                                 GError                 **error);

gint32                 g_data_input_stream_read_int32           (GDataInputStream        *stream,
                                                                 GCancellable            *cancellable,
                                                                 GError                 **error);

guint32                g_data_input_stream_read_uint32          (GDataInputStream        *stream,
                                                                 GCancellable            *cancellable,
                                                                 GError                 **error);

gint64                 g_data_input_stream_read_int64           (GDataInputStream        *stream,
                                                                 GCancellable            *cancellable,
                                                                 GError                 **error);

guint64                g_data_input_stream_read_uint64          (GDataInputStream        *stream,
                                                                 GCancellable            *cancellable,
                                                                 GError                 **error);

char *                 g_data_input_stream_read_line            (GDataInputStream        *stream,
                                                                 gsize                   *length,
                                                                 GCancellable            *cancellable,
                                                                 GError                 **error);

char *                 g_data_input_stream_read_line_utf8       (GDataInputStream        *stream,
								 gsize                   *length,
								 GCancellable            *cancellable,
								 GError                 **error);

void                   g_data_input_stream_read_line_async      (GDataInputStream        *stream,
                                                                 gint                     io_priority,
                                                                 GCancellable            *cancellable,
                                                                 GAsyncReadyCallback      callback,
                                                                 gpointer                 user_data);

char *                 g_data_input_stream_read_line_finish     (GDataInputStream        *stream,
                                                                 GAsyncResult            *result,
                                                                 gsize                   *length,
                                                                 GError                 **error);

char *                 g_data_input_stream_read_line_finish_utf8(GDataInputStream        *stream,
                                                                 GAsyncResult            *result,
                                                                 gsize                   *length,
                                                                 GError                 **error);
char *                 g_data_input_stream_read_until           (GDataInputStream        *stream,
                                                                 const gchar             *stop_chars,
                                                                 gsize                   *length,
                                                                 GCancellable            *cancellable,
                                                                 GError                 **error);
void                   g_data_input_stream_read_until_async     (GDataInputStream        *stream,
                                                                 const gchar             *stop_chars,
                                                                 gint                     io_priority,
                                                                 GCancellable            *cancellable,
                                                                 GAsyncReadyCallback      callback,
                                                                 gpointer                 user_data);
char *                 g_data_input_stream_read_until_finish    (GDataInputStream        *stream,
                                                                 GAsyncResult            *result,
                                                                 gsize                   *length,
                                                                 GError                 **error);


char *                 g_data_input_stream_read_upto            (GDataInputStream        *stream,
                                                                 const gchar             *stop_chars,
                                                                 gssize                   stop_chars_len,
                                                                 gsize                   *length,
                                                                 GCancellable            *cancellable,
                                                                 GError                 **error);

void                   g_data_input_stream_read_upto_async      (GDataInputStream        *stream,
                                                                 const gchar             *stop_chars,
                                                                 gssize                   stop_chars_len,
                                                                 gint                     io_priority,
                                                                 GCancellable            *cancellable,
                                                                 GAsyncReadyCallback      callback,
                                                                 gpointer                 user_data);

char *                 g_data_input_stream_read_upto_finish     (GDataInputStream        *stream,
                                                                 GAsyncResult            *result,
                                                                 gsize                   *length,
                                                                 GError                 **error);



#endif /* __G_DATA_INPUT_STREAM_H__ */
