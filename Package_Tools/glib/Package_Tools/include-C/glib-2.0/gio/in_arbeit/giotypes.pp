
unit giotypes;
interface

{
  Automatically converted by H2Pas 1.0.0 from giotypes.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    giotypes.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
PGAsyncResult  = ^GAsyncResult;
PGCancellable  = ^GCancellable;
Pgchar  = ^gchar;
PGDatagramBased  = ^GDatagramBased;
PGDBusObjectManagerClient  = ^GDBusObjectManagerClient;
PGInputMessage  = ^GInputMessage;
PGInputVector  = ^GInputVector;
PGIOSchedulerJob  = ^GIOSchedulerJob;
PGObject  = ^GObject;
PGOutputMessage  = ^GOutputMessage;
PGOutputVector  = ^GOutputVector;
PGSimpleAsyncResult  = ^GSimpleAsyncResult;
PGSocket  = ^GSocket;
PGSocketAddress  = ^GSocketAddress;
PGSocketControlMessage  = ^GSocketControlMessage;
Pguint  = ^guint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GIO - GLib Input, Output and Streaming Library
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
  }
{$ifndef __GIO_TYPES_H__}
{$define __GIO_TYPES_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/gioenums.h>}
type
{ Dummy typedef  }
{ Dummy typedef  }
{ Dummy typedef  }
{ Dummy typedef  }
{*
 * GFileAttributeMatcher:
 *
 * Determines if a string matches a file attribute.
 * }
{ Dummy typedef  }
{*
 * GIOSchedulerJob:
 *
 * Opaque class for defining and scheduling IO jobs.
 *
 * Deprecated: 2.36: Use [struct@GLib.ThreadPool] or
 *   [method@Gio.Task.run_in_thread]
 * }
{ Dummy typedef  }
{ Dummy typedef  }
{ Dummy typedef  }
{ Dummy typedef  }
{ Dummy typedef  }
{ Dummy typedef  }
{ Dummy typedef  }
{ Dummy typedef  }
{ Dummy typedef  }
{ Dummy typedef  }
{*
 * GAsyncReadyCallback:
 * @source_object: (nullable): the object the asynchronous operation was started with.
 * @res: a #GAsyncResult.
 * @data: user data passed to the callback.
 *
 * Type definition for a function that will be called back when an asynchronous
 * operation within GIO has been completed. #GAsyncReadyCallback
 * callbacks from #GTask are guaranteed to be invoked in a later
 * iteration of the
 * [thread-default main context][g-main-context-push-thread-default]
 * where the #GTask was created. All other users of
 * #GAsyncReadyCallback must likewise call it asynchronously in a
 * later iteration of the main context.
 *
 * The asynchronous operation is guaranteed to have held a reference to
 * @source_object from the time when the `*_async()` function was called, until
 * after this callback returns.
 * }

  TGAsyncReadyCallback = procedure (source_object:PGObject; res:PGAsyncResult; data:Tgpointer);cdecl;
{*
 * GFileProgressCallback:
 * @current_num_bytes: the current number of bytes in the operation.
 * @total_num_bytes: the total number of bytes in the operation.
 * @data: user data passed to the callback.
 *
 * When doing file operations that may take a while, such as moving
 * a file or copying a file, a progress callback is used to pass how
 * far along that operation is to the application.
 * }

  TGFileProgressCallback = procedure (current_num_bytes:Tgoffset; total_num_bytes:Tgoffset; data:Tgpointer);cdecl;
{*
 * GFileReadMoreCallback:
 * @file_contents: the data as currently read.
 * @file_size: the size of the data currently read.
 * @callback_data: data passed to the callback.
 *
 * When loading the partial contents of a file with g_file_load_partial_contents_async(),
 * it may become necessary to determine if any more data from the file should be loaded.
 * A #GFileReadMoreCallback function facilitates this by returning %TRUE if more data
 * should be read, or %FALSE otherwise.
 *
 * Returns: %TRUE if more data should be read back. %FALSE otherwise.
 * }
(* Const before type ignored *)

  TGFileReadMoreCallback = function (file_contents:Pchar; file_size:Tgoffset; callback_data:Tgpointer):Tgboolean;cdecl;
{*
 * GFileMeasureProgressCallback:
 * @reporting: %TRUE if more reports will come
 * @current_size: the current cumulative size measurement
 * @num_dirs: the number of directories visited so far
 * @num_files: the number of non-directory files encountered
 * @data: the data passed to the original request for this callback
 *
 * This callback type is used by g_file_measure_disk_usage() to make
 * periodic progress reports when measuring the amount of disk spaced
 * used by a directory.
 *
 * These calls are made on a best-effort basis and not all types of
 * #GFile will support them.  At the minimum, however, one call will
 * always be made immediately.
 *
 * In the case that there is no support, @reporting will be set to
 * %FALSE (and the other values undefined) and no further calls will be
 * made.  Otherwise, the @reporting will be %TRUE and the other values
 * all-zeros during the first (immediate) call.  In this way, you can
 * know which type of progress UI to show without a delay.
 *
 * For g_file_measure_disk_usage() the callback is made directly.  For
 * g_file_measure_disk_usage_async() the callback is made via the
 * default main context of the calling thread (ie: the same way that the
 * final async result would be reported).
 *
 * @current_size is in the same units as requested by the operation (see
 * %G_FILE_MEASURE_APPARENT_SIZE).
 *
 * The frequency of the updates is implementation defined, but is
 * ideally about once every 200ms.
 *
 * The last progress callback may or may not be equal to the final
 * result.  Always check the async result to get the final value.
 *
 * Since: 2.38
 * }

  TGFileMeasureProgressCallback = procedure (reporting:Tgboolean; current_size:Tguint64; num_dirs:Tguint64; num_files:Tguint64; data:Tgpointer);cdecl;
{*
 * GIOSchedulerJobFunc:
 * @job: a #GIOSchedulerJob.
 * @cancellable: optional #GCancellable object, %NULL to ignore.
 * @data: data passed to the callback function
 *
 * I/O Job function.
 *
 * Long-running jobs should periodically check the @cancellable
 * to see if they have been cancelled.
 *
 * Returns: %TRUE if this function should be called again to
 *    complete the job, %FALSE if the job is complete (or cancelled)
 * Deprecated: 2.36: Use [struct@GLib.ThreadPool] or
 *   [method@Gio.Task.run_in_thread]
 * }

  TGIOSchedulerJobFunc = function (job:PGIOSchedulerJob; cancellable:PGCancellable; data:Tgpointer):Tgboolean;cdecl;
{*
 * GSimpleAsyncThreadFunc:
 * @res: a #GSimpleAsyncResult.
 * @object: a #GObject.
 * @cancellable: optional #GCancellable object, %NULL to ignore.
 *
 * Simple thread function that runs an asynchronous operation and
 * checks for cancellation.
 * }

  TGSimpleAsyncThreadFunc = procedure (res:PGSimpleAsyncResult; object:PGObject; cancellable:PGCancellable);cdecl;
{*
 * GSocketSourceFunc:
 * @socket: the #GSocket
 * @condition: the current condition at the source fired.
 * @data: data passed in by the user.
 *
 * This is the function type of the callback used for the #GSource
 * returned by g_socket_create_source().
 *
 * Returns: it should return %FALSE if the source should be removed.
 *
 * Since: 2.22
  }

  TGSocketSourceFunc = function (socket:PGSocket; condition:TGIOCondition; data:Tgpointer):Tgboolean;cdecl;
{*
 * GDatagramBasedSourceFunc:
 * @datagram_based: the #GDatagramBased
 * @condition: the current condition at the source fired
 * @data: data passed in by the user
 *
 * This is the function type of the callback used for the #GSource
 * returned by g_datagram_based_create_source().
 *
 * Returns: %G_SOURCE_REMOVE if the source should be removed,
 *   %G_SOURCE_CONTINUE otherwise
 *
 * Since: 2.48
  }

  TGDatagramBasedSourceFunc = function (datagram_based:PGDatagramBased; condition:TGIOCondition; data:Tgpointer):Tgboolean;cdecl;
{*
 * GInputVector:
 * @buffer: Pointer to a buffer where data will be written.
 * @size: the available size in @buffer.
 *
 * Structure used for scatter/gather data input.
 * You generally pass in an array of #GInputVectors
 * and the operation will store the read data starting in the
 * first buffer, switching to the next as needed.
 *
 * Since: 2.22
  }
  PGInputVector = ^TGInputVector;
  TGInputVector = record
      buffer : Tgpointer;cdecl;
      size : Tgsize;
    end;

{*
 * GInputMessage:
 * @address: (optional) (out) (transfer full): return location
 *   for a #GSocketAddress, or %NULL
 * @vectors: (array length=num_vectors) (out): pointer to an
 *   array of input vectors
 * @num_vectors: the number of input vectors pointed to by @vectors
 * @bytes_received: (out): will be set to the number of bytes that have been
 *   received
 * @flags: (out): collection of #GSocketMsgFlags for the received message,
 *   outputted by the call
 * @control_messages: (array length=num_control_messages) (optional)
 *   (out) (transfer full): return location for a
 *   caller-allocated array of #GSocketControlMessages, or %NULL
 * @num_control_messages: (out) (optional): return location for the number of
 *   elements in @control_messages
 *
 * Structure used for scatter/gather data input when receiving multiple
 * messages or packets in one go. You generally pass in an array of empty
 * #GInputVectors and the operation will use all the buffers as if they
 * were one buffer, and will set @bytes_received to the total number of bytes
 * received across all #GInputVectors.
 *
 * This structure closely mirrors `struct mmsghdr` and `struct msghdr` from
 * the POSIX sockets API (see `man 2 recvmmsg`).
 *
 * If @address is non-%NULL then it is set to the source address the message
 * was received from, and the caller must free it afterwards.
 *
 * If @control_messages is non-%NULL then it is set to an array of control
 * messages received with the message (if any), and the caller must free it
 * afterwards. @num_control_messages is set to the number of elements in
 * this array, which may be zero.
 *
 * Flags relevant to this message will be returned in @flags. For example,
 * `MSG_EOR` or `MSG_TRUNC`.
 *
 * Since: 2.48
  }
  PGInputMessage = ^TGInputMessage;
  TGInputMessage = record
      address : ^PGSocketAddress;
      vectors : PGInputVector;
      num_vectors : Tguint;
      bytes_received : Tgsize;
      flags : Tgint;
      control_messages : ^^PGSocketControlMessage;
      num_control_messages : Pguint;
    end;

{*
 * GOutputVector:
 * @buffer: Pointer to a buffer of data to read.
 * @size: the size of @buffer.
 *
 * Structure used for scatter/gather data output.
 * You generally pass in an array of #GOutputVectors
 * and the operation will use all the buffers as if they were
 * one buffer.
 *
 * Since: 2.22
  }
  PGOutputVector = ^TGOutputVector;
  TGOutputVector = record
      buffer : Tgconstpointer;
      size : Tgsize;
    end;

{*
 * GOutputMessage:
 * @address: (nullable): a #GSocketAddress, or %NULL
 * @vectors: pointer to an array of output vectors
 * @num_vectors: the number of output vectors pointed to by @vectors.
 * @bytes_sent: initialize to 0. Will be set to the number of bytes
 *     that have been sent
 * @control_messages: (array length=num_control_messages) (nullable): a pointer
 *   to an array of #GSocketControlMessages, or %NULL.
 * @num_control_messages: number of elements in @control_messages.
 *
 * Structure used for scatter/gather data output when sending multiple
 * messages or packets in one go. You generally pass in an array of
 * #GOutputVectors and the operation will use all the buffers as if they
 * were one buffer.
 *
 * If @address is %NULL then the message is sent to the default receiver
 * (as previously set by g_socket_connect()).
 *
 * Since: 2.44
  }
  PGOutputMessage = ^TGOutputMessage;
  TGOutputMessage = record
      address : PGSocketAddress;
      vectors : PGOutputVector;
      num_vectors : Tguint;
      bytes_sent : Tguint;
      control_messages : ^PGSocketControlMessage;
      num_control_messages : Tguint;
    end;

{*
 * GCancellableSourceFunc:
 * @cancellable: the #GCancellable
 * @data: data passed in by the user.
 *
 * This is the function type of the callback used for the #GSource
 * returned by g_cancellable_source_new().
 *
 * Returns: it should return %FALSE if the source should be removed.
 *
 * Since: 2.28
  }

  TGCancellableSourceFunc = function (cancellable:PGCancellable; data:Tgpointer):Tgboolean;cdecl;
{*
 * GPollableSourceFunc:
 * @pollable_stream: the #GPollableInputStream or #GPollableOutputStream
 * @data: data passed in by the user.
 *
 * This is the function type of the callback used for the #GSource
 * returned by g_pollable_input_stream_create_source() and
 * g_pollable_output_stream_create_source().
 *
 * Returns: it should return %FALSE if the source should be removed.
 *
 * Since: 2.28
  }

  TGPollableSourceFunc = function (pollable_stream:PGObject; data:Tgpointer):Tgboolean;cdecl;
{ Dummy typedef  }
{ Dummy typedef  }
{ Dummy typedef  }
{*
 * GDBusProxyTypeFunc:
 * @manager: A #GDBusObjectManagerClient.
 * @object_path: The object path of the remote object.
 * @interface_name: (nullable): The interface name of the remote object or %NULL if a #GDBusObjectProxy #GType is requested.
 * @data: data passed in by the user.
 *
 * Function signature for a function used to determine the #GType to
 * use for an interface proxy (if @interface_name is not %NULL) or
 * object proxy (if @interface_name is %NULL).
 *
 * This function is called in the
 * [thread-default main loop][g-main-context-push-thread-default]
 * that @manager was constructed in.
 *
 * Returns: A #GType to use for the remote object. The returned type
 *   must be a #GDBusProxy or #GDBusObjectProxy -derived
 *   type.
 *
 * Since: 2.30
  }
(* Const before type ignored *)
(* Const before type ignored *)

  TGDBusProxyTypeFunc = function (manager:PGDBusObjectManagerClient; object_path:Pgchar; interface_name:Pgchar; data:Tgpointer):TGType;cdecl;
{$endif}
{ __GIO_TYPES_H__  }

implementation


end.
