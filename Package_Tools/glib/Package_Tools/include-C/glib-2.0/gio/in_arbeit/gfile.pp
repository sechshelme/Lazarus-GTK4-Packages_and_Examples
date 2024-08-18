
unit gfile;
interface

{
  Automatically converted by H2Pas 1.0.0 from gfile.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gfile.h
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
PGAppInfo  = ^GAppInfo;
PGAsyncResult  = ^GAsyncResult;
PGBytes  = ^GBytes;
PGCancellable  = ^GCancellable;
Pgchar  = ^gchar;
PGError  = ^GError;
PGFile  = ^GFile;
PGFileAttributeInfoList  = ^GFileAttributeInfoList;
PGFileEnumerator  = ^GFileEnumerator;
PGFileIface  = ^GFileIface;
PGFileInfo  = ^GFileInfo;
PGFileInputStream  = ^GFileInputStream;
PGFileIOStream  = ^GFileIOStream;
PGFileMonitor  = ^GFileMonitor;
PGFileOutputStream  = ^GFileOutputStream;
PGMount  = ^GMount;
PGMountOperation  = ^GMountOperation;
Pgsize  = ^gsize;
Pguint64  = ^guint64;
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
{$ifndef __G_FILE_H__}
{$define __G_FILE_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}

{ was #define dname def_expr }
function G_TYPE_FILE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_FILE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_FILE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_FILE_GET_IFACE(obj : longint) : longint;

type
{*
 * GFileIface:
 * @g_iface: The parent interface.
 * @dup: Duplicates a #GFile.
 * @hash: Creates a hash of a #GFile.
 * @equal: Checks equality of two given #GFiles.
 * @is_native: Checks to see if a file is native to the system.
 * @has_uri_scheme: Checks to see if a #GFile has a given URI scheme.
 * @get_uri_scheme: Gets the URI scheme for a #GFile.
 * @get_basename: Gets the basename for a given #GFile.
 * @get_path: Gets the current path within a #GFile.
 * @get_uri: Gets a URI for the path within a #GFile.
 * @get_parse_name: Gets the parsed name for the #GFile.
 * @get_parent: Gets the parent directory for the #GFile.
 * @prefix_matches: Checks whether a #GFile contains a specified file.
 * @get_relative_path: Gets the path for a #GFile relative to a given path.
 * @resolve_relative_path: Resolves a relative path for a #GFile to an absolute path.
 * @get_child_for_display_name: Gets the child #GFile for a given display name.
 * @enumerate_children: Gets a #GFileEnumerator with the children of a #GFile.
 * @enumerate_children_async: Asynchronously gets a #GFileEnumerator with the children of a #GFile.
 * @enumerate_children_finish: Finishes asynchronously enumerating the children.
 * @query_info: Gets the #GFileInfo for a #GFile.
 * @query_info_async: Asynchronously gets the #GFileInfo for a #GFile.
 * @query_info_finish: Finishes an asynchronous query info operation.
 * @query_filesystem_info: Gets a #GFileInfo for the file system #GFile is on.
 * @query_filesystem_info_async: Asynchronously gets a #GFileInfo for the file system #GFile is on.
 * @query_filesystem_info_finish: Finishes asynchronously getting the file system info.
 * @find_enclosing_mount: Gets a #GMount for the #GFile.
 * @find_enclosing_mount_async: Asynchronously gets the #GMount for a #GFile.
 * @find_enclosing_mount_finish: Finishes asynchronously getting the volume.
 * @set_display_name: Sets the display name for a #GFile.
 * @set_display_name_async: Asynchronously sets a #GFile's display name.
 * @set_display_name_finish: Finishes asynchronously setting a #GFile's display name.
 * @query_settable_attributes: Returns a list of #GFileAttributeInfos that can be set.
 * @_query_settable_attributes_async: Asynchronously gets a list of #GFileAttributeInfos that can be set.
 * @_query_settable_attributes_finish: Finishes asynchronously querying settable attributes.
 * @query_writable_namespaces: Returns a list of #GFileAttributeInfo namespaces that are writable.
 * @_query_writable_namespaces_async: Asynchronously gets a list of #GFileAttributeInfo namespaces that are writable.
 * @_query_writable_namespaces_finish: Finishes asynchronously querying the writable namespaces.
 * @set_attribute: Sets a #GFileAttributeInfo.
 * @set_attributes_from_info: Sets a #GFileAttributeInfo with information from a #GFileInfo.
 * @set_attributes_async: Asynchronously sets a file's attributes.
 * @set_attributes_finish: Finishes setting a file's attributes asynchronously.
 * @read_fn: Reads a file asynchronously.
 * @read_async: Asynchronously reads a file.
 * @read_finish: Finishes asynchronously reading a file.
 * @append_to: Writes to the end of a file.
 * @append_to_async: Asynchronously writes to the end of a file.
 * @append_to_finish: Finishes an asynchronous file append operation.
 * @create: Creates a new file.
 * @create_async: Asynchronously creates a file.
 * @create_finish: Finishes asynchronously creating a file.
 * @replace: Replaces the contents of a file.
 * @replace_async: Asynchronously replaces the contents of a file.
 * @replace_finish: Finishes asynchronously replacing a file.
 * @delete_file: Deletes a file.
 * @delete_file_async: Asynchronously deletes a file.
 * @delete_file_finish: Finishes an asynchronous delete.
 * @trash: Sends a #GFile to the Trash location.
 * @trash_async: Asynchronously sends a #GFile to the Trash location.
 * @trash_finish: Finishes an asynchronous file trashing operation.
 * @make_directory: Makes a directory.
 * @make_directory_async: Asynchronously makes a directory.
 * @make_directory_finish: Finishes making a directory asynchronously.
 * @make_symbolic_link: (nullable): Makes a symbolic link. %NULL if symbolic
 *    links are unsupported.
 * @make_symbolic_link_async: Asynchronously makes a symbolic link
 * @make_symbolic_link_finish: Finishes making a symbolic link asynchronously.
 * @copy: (nullable): Copies a file. %NULL if copying is unsupported, which will
 *     cause `GFile` to use a fallback copy method where it reads from the
 *     source and writes to the destination.
 * @copy_async: Asynchronously copies a file.
 * @copy_finish: Finishes an asynchronous copy operation.
 * @move: Moves a file.
 * @move_async: Asynchronously moves a file. Since: 2.72
 * @move_finish: Finishes an asynchronous move operation. Since: 2.72
 * @mount_mountable: Mounts a mountable object.
 * @mount_mountable_finish: Finishes a mounting operation.
 * @unmount_mountable: Unmounts a mountable object.
 * @unmount_mountable_finish: Finishes an unmount operation.
 * @eject_mountable: Ejects a mountable.
 * @eject_mountable_finish: Finishes an eject operation.
 * @mount_enclosing_volume: Mounts a specified location.
 * @mount_enclosing_volume_finish: Finishes mounting a specified location.
 * @monitor_dir: Creates a #GFileMonitor for the location.
 * @monitor_file: Creates a #GFileMonitor for the location.
 * @open_readwrite: Open file read/write. Since 2.22.
 * @open_readwrite_async: Asynchronously opens file read/write. Since 2.22.
 * @open_readwrite_finish: Finishes an asynchronous open read/write. Since 2.22.
 * @create_readwrite: Creates file read/write. Since 2.22.
 * @create_readwrite_async: Asynchronously creates file read/write. Since 2.22.
 * @create_readwrite_finish: Finishes an asynchronous creates read/write. Since 2.22.
 * @replace_readwrite: Replaces file read/write. Since 2.22.
 * @replace_readwrite_async: Asynchronously replaces file read/write. Since 2.22.
 * @replace_readwrite_finish: Finishes an asynchronous replace read/write. Since 2.22.
 * @start_mountable: Starts a mountable object. Since 2.22.
 * @start_mountable_finish: Finishes a start operation. Since 2.22.
 * @stop_mountable: Stops a mountable. Since 2.22.
 * @stop_mountable_finish: Finishes a stop operation. Since 2.22.
 * @supports_thread_contexts: a boolean that indicates whether the #GFile implementation supports thread-default contexts. Since 2.22.
 * @unmount_mountable_with_operation: Unmounts a mountable object using a #GMountOperation. Since 2.22.
 * @unmount_mountable_with_operation_finish: Finishes an unmount operation using a #GMountOperation. Since 2.22.
 * @eject_mountable_with_operation: Ejects a mountable object using a #GMountOperation. Since 2.22.
 * @eject_mountable_with_operation_finish: Finishes an eject operation using a #GMountOperation. Since 2.22.
 * @poll_mountable: Polls a mountable object for media changes. Since 2.22.
 * @poll_mountable_finish: Finishes a poll operation for media changes. Since 2.22.
 * @measure_disk_usage: Recursively measures the disk usage of @file. Since 2.38
 * @measure_disk_usage_async: Asynchronously recursively measures the disk usage of @file. Since 2.38
 * @measure_disk_usage_finish: Finishes an asynchronous recursive measurement of the disk usage of @file. Since 2.38
 *
 * An interface for writing VFS file handles.
 * }
{ Virtual Table  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
  PGFileIface = ^TGFileIface;
  TGFileIface = record
      g_iface : TGTypeInterface;
      dup : function (file:PGFile):PGFile;cdecl;
      hash : function (file:PGFile):Tguint;cdecl;
      equal : function (file1:PGFile; file2:PGFile):Tgboolean;cdecl;
      is_native : function (file:PGFile):Tgboolean;cdecl;
      has_uri_scheme : function (file:PGFile; uri_scheme:Pchar):Tgboolean;cdecl;
      get_uri_scheme : function (file:PGFile):Pchar;cdecl;
      get_basename : function (file:PGFile):Pchar;cdecl;
      get_path : function (file:PGFile):Pchar;cdecl;
      get_uri : function (file:PGFile):Pchar;cdecl;
      get_parse_name : function (file:PGFile):Pchar;cdecl;
      get_parent : function (file:PGFile):PGFile;cdecl;
      prefix_matches : function (prefix:PGFile; file:PGFile):Tgboolean;cdecl;
      get_relative_path : function (parent:PGFile; descendant:PGFile):Pchar;cdecl;
      resolve_relative_path : function (file:PGFile; relative_path:Pchar):PGFile;cdecl;
      get_child_for_display_name : function (file:PGFile; display_name:Pchar; error:PPGError):PGFile;cdecl;
      enumerate_children : function (file:PGFile; attributes:Pchar; flags:TGFileQueryInfoFlags; cancellable:PGCancellable; error:PPGError):PGFileEnumerator;cdecl;
      enumerate_children_async : procedure (file:PGFile; attributes:Pchar; flags:TGFileQueryInfoFlags; io_priority:longint; cancellable:PGCancellable; 
                    callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;
      enumerate_children_finish : function (file:PGFile; res:PGAsyncResult; error:PPGError):PGFileEnumerator;cdecl;
      query_info : function (file:PGFile; attributes:Pchar; flags:TGFileQueryInfoFlags; cancellable:PGCancellable; error:PPGError):PGFileInfo;cdecl;
      query_info_async : procedure (file:PGFile; attributes:Pchar; flags:TGFileQueryInfoFlags; io_priority:longint; cancellable:PGCancellable; 
                    callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;
      query_info_finish : function (file:PGFile; res:PGAsyncResult; error:PPGError):PGFileInfo;cdecl;
      query_filesystem_info : function (file:PGFile; attributes:Pchar; cancellable:PGCancellable; error:PPGError):PGFileInfo;cdecl;
      query_filesystem_info_async : procedure (file:PGFile; attributes:Pchar; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
                    user_data:Tgpointer);cdecl;
      query_filesystem_info_finish : function (file:PGFile; res:PGAsyncResult; error:PPGError):PGFileInfo;cdecl;
      find_enclosing_mount : function (file:PGFile; cancellable:PGCancellable; error:PPGError):PGMount;cdecl;
      find_enclosing_mount_async : procedure (file:PGFile; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;
      find_enclosing_mount_finish : function (file:PGFile; res:PGAsyncResult; error:PPGError):PGMount;cdecl;
      set_display_name : function (file:PGFile; display_name:Pchar; cancellable:PGCancellable; error:PPGError):PGFile;cdecl;
      set_display_name_async : procedure (file:PGFile; display_name:Pchar; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
                    user_data:Tgpointer);cdecl;
      set_display_name_finish : function (file:PGFile; res:PGAsyncResult; error:PPGError):PGFile;cdecl;
      query_settable_attributes : function (file:PGFile; cancellable:PGCancellable; error:PPGError):PGFileAttributeInfoList;cdecl;
      _query_settable_attributes_async : procedure ;cdecl;
      _query_settable_attributes_finish : procedure ;cdecl;
      query_writable_namespaces : function (file:PGFile; cancellable:PGCancellable; error:PPGError):PGFileAttributeInfoList;cdecl;
      _query_writable_namespaces_async : procedure ;cdecl;
      _query_writable_namespaces_finish : procedure ;cdecl;
      set_attribute : function (file:PGFile; attribute:Pchar; _type:TGFileAttributeType; value_p:Tgpointer; flags:TGFileQueryInfoFlags; 
                   cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;
      set_attributes_from_info : function (file:PGFile; info:PGFileInfo; flags:TGFileQueryInfoFlags; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;
      set_attributes_async : procedure (file:PGFile; info:PGFileInfo; flags:TGFileQueryInfoFlags; io_priority:longint; cancellable:PGCancellable; 
                    callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;
      set_attributes_finish : function (file:PGFile; result:PGAsyncResult; info:PPGFileInfo; error:PPGError):Tgboolean;cdecl;
      read_fn : function (file:PGFile; cancellable:PGCancellable; error:PPGError):PGFileInputStream;cdecl;
      read_async : procedure (file:PGFile; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;
      read_finish : function (file:PGFile; res:PGAsyncResult; error:PPGError):PGFileInputStream;cdecl;
      append_to : function (file:PGFile; flags:TGFileCreateFlags; cancellable:PGCancellable; error:PPGError):PGFileOutputStream;cdecl;
      append_to_async : procedure (file:PGFile; flags:TGFileCreateFlags; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
                    user_data:Tgpointer);cdecl;
      append_to_finish : function (file:PGFile; res:PGAsyncResult; error:PPGError):PGFileOutputStream;cdecl;
      create : function (file:PGFile; flags:TGFileCreateFlags; cancellable:PGCancellable; error:PPGError):PGFileOutputStream;cdecl;
      create_async : procedure (file:PGFile; flags:TGFileCreateFlags; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
                    user_data:Tgpointer);cdecl;
      create_finish : function (file:PGFile; res:PGAsyncResult; error:PPGError):PGFileOutputStream;cdecl;
      replace : function (file:PGFile; etag:Pchar; make_backup:Tgboolean; flags:TGFileCreateFlags; cancellable:PGCancellable; 
                   error:PPGError):PGFileOutputStream;cdecl;
      replace_async : procedure (file:PGFile; etag:Pchar; make_backup:Tgboolean; flags:TGFileCreateFlags; io_priority:longint; 
                    cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;
      replace_finish : function (file:PGFile; res:PGAsyncResult; error:PPGError):PGFileOutputStream;cdecl;
      delete_file : function (file:PGFile; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;
      delete_file_async : procedure (file:PGFile; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;
      delete_file_finish : function (file:PGFile; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;
      trash : function (file:PGFile; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;
      trash_async : procedure (file:PGFile; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;
      trash_finish : function (file:PGFile; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;
      make_directory : function (file:PGFile; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;
      make_directory_async : procedure (file:PGFile; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;
      make_directory_finish : function (file:PGFile; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;
      make_symbolic_link : function (file:PGFile; symlink_value:Pchar; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;
      make_symbolic_link_async : procedure (file:PGFile; symlink_value:Pchar; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
                    user_data:Tgpointer);cdecl;
      make_symbolic_link_finish : function (file:PGFile; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;
      copy : function (source:PGFile; destination:PGFile; flags:TGFileCopyFlags; cancellable:PGCancellable; progress_callback:TGFileProgressCallback; 
                   progress_callback_data:Tgpointer; error:PPGError):Tgboolean;cdecl;
      copy_async : procedure (source:PGFile; destination:PGFile; flags:TGFileCopyFlags; io_priority:longint; cancellable:PGCancellable; 
                    progress_callback:TGFileProgressCallback; progress_callback_data:Tgpointer; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;
      copy_finish : function (file:PGFile; res:PGAsyncResult; error:PPGError):Tgboolean;cdecl;
      move : function (source:PGFile; destination:PGFile; flags:TGFileCopyFlags; cancellable:PGCancellable; progress_callback:TGFileProgressCallback; 
                   progress_callback_data:Tgpointer; error:PPGError):Tgboolean;cdecl;
      move_async : procedure (source:PGFile; destination:PGFile; flags:TGFileCopyFlags; io_priority:longint; cancellable:PGCancellable; 
                    progress_callback:TGFileProgressCallback; progress_callback_data:Tgpointer; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;
      move_finish : function (file:PGFile; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;
      mount_mountable : procedure (file:PGFile; flags:TGMountMountFlags; mount_operation:PGMountOperation; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
                    user_data:Tgpointer);cdecl;
      mount_mountable_finish : function (file:PGFile; result:PGAsyncResult; error:PPGError):PGFile;cdecl;
      unmount_mountable : procedure (file:PGFile; flags:TGMountUnmountFlags; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;
      unmount_mountable_finish : function (file:PGFile; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;
      eject_mountable : procedure (file:PGFile; flags:TGMountUnmountFlags; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;
      eject_mountable_finish : function (file:PGFile; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;
      mount_enclosing_volume : procedure (location:PGFile; flags:TGMountMountFlags; mount_operation:PGMountOperation; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
                    user_data:Tgpointer);cdecl;
      mount_enclosing_volume_finish : function (location:PGFile; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;
      monitor_dir : function (file:PGFile; flags:TGFileMonitorFlags; cancellable:PGCancellable; error:PPGError):PGFileMonitor;cdecl;
      monitor_file : function (file:PGFile; flags:TGFileMonitorFlags; cancellable:PGCancellable; error:PPGError):PGFileMonitor;cdecl;
      open_readwrite : function (file:PGFile; cancellable:PGCancellable; error:PPGError):PGFileIOStream;cdecl;
      open_readwrite_async : procedure (file:PGFile; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;
      open_readwrite_finish : function (file:PGFile; res:PGAsyncResult; error:PPGError):PGFileIOStream;cdecl;
      create_readwrite : function (file:PGFile; flags:TGFileCreateFlags; cancellable:PGCancellable; error:PPGError):PGFileIOStream;cdecl;
      create_readwrite_async : procedure (file:PGFile; flags:TGFileCreateFlags; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
                    user_data:Tgpointer);cdecl;
      create_readwrite_finish : function (file:PGFile; res:PGAsyncResult; error:PPGError):PGFileIOStream;cdecl;
      replace_readwrite : function (file:PGFile; etag:Pchar; make_backup:Tgboolean; flags:TGFileCreateFlags; cancellable:PGCancellable; 
                   error:PPGError):PGFileIOStream;cdecl;
      replace_readwrite_async : procedure (file:PGFile; etag:Pchar; make_backup:Tgboolean; flags:TGFileCreateFlags; io_priority:longint; 
                    cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;
      replace_readwrite_finish : function (file:PGFile; res:PGAsyncResult; error:PPGError):PGFileIOStream;cdecl;
      start_mountable : procedure (file:PGFile; flags:TGDriveStartFlags; start_operation:PGMountOperation; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
                    user_data:Tgpointer);cdecl;
      start_mountable_finish : function (file:PGFile; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;
      stop_mountable : procedure (file:PGFile; flags:TGMountUnmountFlags; mount_operation:PGMountOperation; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
                    user_data:Tgpointer);cdecl;
      stop_mountable_finish : function (file:PGFile; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;
      supports_thread_contexts : Tgboolean;
      unmount_mountable_with_operation : procedure (file:PGFile; flags:TGMountUnmountFlags; mount_operation:PGMountOperation; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
                    user_data:Tgpointer);cdecl;
      unmount_mountable_with_operation_finish : function (file:PGFile; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;
      eject_mountable_with_operation : procedure (file:PGFile; flags:TGMountUnmountFlags; mount_operation:PGMountOperation; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
                    user_data:Tgpointer);cdecl;
      eject_mountable_with_operation_finish : function (file:PGFile; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;
      poll_mountable : procedure (file:PGFile; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;
      poll_mountable_finish : function (file:PGFile; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;
      measure_disk_usage : function (file:PGFile; flags:TGFileMeasureFlags; cancellable:PGCancellable; progress_callback:TGFileMeasureProgressCallback; progress_data:Tgpointer; 
                   disk_usage:Pguint64; num_dirs:Pguint64; num_files:Pguint64; error:PPGError):Tgboolean;cdecl;
      measure_disk_usage_async : procedure (file:PGFile; flags:TGFileMeasureFlags; io_priority:Tgint; cancellable:PGCancellable; progress_callback:TGFileMeasureProgressCallback; 
                    progress_data:Tgpointer; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;
      measure_disk_usage_finish : function (file:PGFile; result:PGAsyncResult; disk_usage:Pguint64; num_dirs:Pguint64; num_files:Pguint64; 
                   error:PPGError):Tgboolean;cdecl;
    end;


function g_file_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function g_file_new_for_path(path:Pchar):PGFile;cdecl;external;
(* Const before type ignored *)
function g_file_new_for_uri(uri:Pchar):PGFile;cdecl;external;
(* Const before type ignored *)
function g_file_new_for_commandline_arg(arg:Pchar):PGFile;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_file_new_for_commandline_arg_and_cwd(arg:Pgchar; cwd:Pgchar):PGFile;cdecl;external;
(* Const before type ignored *)
function g_file_new_tmp(tmpl:Pchar; iostream:PPGFileIOStream; error:PPGError):PGFile;cdecl;external;
(* Const before type ignored *)
procedure g_file_new_tmp_async(tmpl:Pchar; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_file_new_tmp_finish(result:PGAsyncResult; iostream:PPGFileIOStream; error:PPGError):PGFile;cdecl;external;
(* Const before type ignored *)
procedure g_file_new_tmp_dir_async(tmpl:Pchar; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_file_new_tmp_dir_finish(result:PGAsyncResult; error:PPGError):PGFile;cdecl;external;
(* Const before type ignored *)
function g_file_parse_name(parse_name:Pchar):PGFile;cdecl;external;
(* Const before type ignored *)
function g_file_new_build_filename(first_element:Pgchar; args:array of const):PGFile;cdecl;external;
function g_file_new_build_filename(first_element:Pgchar):PGFile;cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
function g_file_new_build_filenamev(args:PPgchar):PGFile;cdecl;external;
function g_file_dup(file:PGFile):PGFile;cdecl;external;
function g_file_hash(file:Tgconstpointer):Tguint;cdecl;external;
function g_file_equal(file1:PGFile; file2:PGFile):Tgboolean;cdecl;external;
function g_file_get_basename(file:PGFile):Pchar;cdecl;external;
function g_file_get_path(file:PGFile):Pchar;cdecl;external;
(* Const before type ignored *)
function g_file_peek_path(file:PGFile):Pchar;cdecl;external;
function g_file_get_uri(file:PGFile):Pchar;cdecl;external;
function g_file_get_parse_name(file:PGFile):Pchar;cdecl;external;
function g_file_get_parent(file:PGFile):PGFile;cdecl;external;
function g_file_has_parent(file:PGFile; parent:PGFile):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_file_get_child(file:PGFile; name:Pchar):PGFile;cdecl;external;
(* Const before type ignored *)
function g_file_get_child_for_display_name(file:PGFile; display_name:Pchar; error:PPGError):PGFile;cdecl;external;
function g_file_has_prefix(file:PGFile; prefix:PGFile):Tgboolean;cdecl;external;
function g_file_get_relative_path(parent:PGFile; descendant:PGFile):Pchar;cdecl;external;
(* Const before type ignored *)
function g_file_resolve_relative_path(file:PGFile; relative_path:Pchar):PGFile;cdecl;external;
function g_file_is_native(file:PGFile):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_file_has_uri_scheme(file:PGFile; uri_scheme:Pchar):Tgboolean;cdecl;external;
function g_file_get_uri_scheme(file:PGFile):Pchar;cdecl;external;
function g_file_read(file:PGFile; cancellable:PGCancellable; error:PPGError):PGFileInputStream;cdecl;external;
procedure g_file_read_async(file:PGFile; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_file_read_finish(file:PGFile; res:PGAsyncResult; error:PPGError):PGFileInputStream;cdecl;external;
function g_file_append_to(file:PGFile; flags:TGFileCreateFlags; cancellable:PGCancellable; error:PPGError):PGFileOutputStream;cdecl;external;
function g_file_create(file:PGFile; flags:TGFileCreateFlags; cancellable:PGCancellable; error:PPGError):PGFileOutputStream;cdecl;external;
(* Const before type ignored *)
function g_file_replace(file:PGFile; etag:Pchar; make_backup:Tgboolean; flags:TGFileCreateFlags; cancellable:PGCancellable; 
           error:PPGError):PGFileOutputStream;cdecl;external;
procedure g_file_append_to_async(file:PGFile; flags:TGFileCreateFlags; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external;
function g_file_append_to_finish(file:PGFile; res:PGAsyncResult; error:PPGError):PGFileOutputStream;cdecl;external;
procedure g_file_create_async(file:PGFile; flags:TGFileCreateFlags; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external;
function g_file_create_finish(file:PGFile; res:PGAsyncResult; error:PPGError):PGFileOutputStream;cdecl;external;
(* Const before type ignored *)
procedure g_file_replace_async(file:PGFile; etag:Pchar; make_backup:Tgboolean; flags:TGFileCreateFlags; io_priority:longint; 
            cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_file_replace_finish(file:PGFile; res:PGAsyncResult; error:PPGError):PGFileOutputStream;cdecl;external;
function g_file_open_readwrite(file:PGFile; cancellable:PGCancellable; error:PPGError):PGFileIOStream;cdecl;external;
procedure g_file_open_readwrite_async(file:PGFile; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_file_open_readwrite_finish(file:PGFile; res:PGAsyncResult; error:PPGError):PGFileIOStream;cdecl;external;
function g_file_create_readwrite(file:PGFile; flags:TGFileCreateFlags; cancellable:PGCancellable; error:PPGError):PGFileIOStream;cdecl;external;
procedure g_file_create_readwrite_async(file:PGFile; flags:TGFileCreateFlags; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external;
function g_file_create_readwrite_finish(file:PGFile; res:PGAsyncResult; error:PPGError):PGFileIOStream;cdecl;external;
(* Const before type ignored *)
function g_file_replace_readwrite(file:PGFile; etag:Pchar; make_backup:Tgboolean; flags:TGFileCreateFlags; cancellable:PGCancellable; 
           error:PPGError):PGFileIOStream;cdecl;external;
(* Const before type ignored *)
procedure g_file_replace_readwrite_async(file:PGFile; etag:Pchar; make_backup:Tgboolean; flags:TGFileCreateFlags; io_priority:longint; 
            cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_file_replace_readwrite_finish(file:PGFile; res:PGAsyncResult; error:PPGError):PGFileIOStream;cdecl;external;
function g_file_query_exists(file:PGFile; cancellable:PGCancellable):Tgboolean;cdecl;external;
function g_file_query_file_type(file:PGFile; flags:TGFileQueryInfoFlags; cancellable:PGCancellable):TGFileType;cdecl;external;
(* Const before type ignored *)
function g_file_query_info(file:PGFile; attributes:Pchar; flags:TGFileQueryInfoFlags; cancellable:PGCancellable; error:PPGError):PGFileInfo;cdecl;external;
(* Const before type ignored *)
procedure g_file_query_info_async(file:PGFile; attributes:Pchar; flags:TGFileQueryInfoFlags; io_priority:longint; cancellable:PGCancellable; 
            callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_file_query_info_finish(file:PGFile; res:PGAsyncResult; error:PPGError):PGFileInfo;cdecl;external;
(* Const before type ignored *)
function g_file_query_filesystem_info(file:PGFile; attributes:Pchar; cancellable:PGCancellable; error:PPGError):PGFileInfo;cdecl;external;
(* Const before type ignored *)
procedure g_file_query_filesystem_info_async(file:PGFile; attributes:Pchar; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external;
function g_file_query_filesystem_info_finish(file:PGFile; res:PGAsyncResult; error:PPGError):PGFileInfo;cdecl;external;
function g_file_find_enclosing_mount(file:PGFile; cancellable:PGCancellable; error:PPGError):PGMount;cdecl;external;
procedure g_file_find_enclosing_mount_async(file:PGFile; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_file_find_enclosing_mount_finish(file:PGFile; res:PGAsyncResult; error:PPGError):PGMount;cdecl;external;
(* Const before type ignored *)
function g_file_enumerate_children(file:PGFile; attributes:Pchar; flags:TGFileQueryInfoFlags; cancellable:PGCancellable; error:PPGError):PGFileEnumerator;cdecl;external;
(* Const before type ignored *)
procedure g_file_enumerate_children_async(file:PGFile; attributes:Pchar; flags:TGFileQueryInfoFlags; io_priority:longint; cancellable:PGCancellable; 
            callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_file_enumerate_children_finish(file:PGFile; res:PGAsyncResult; error:PPGError):PGFileEnumerator;cdecl;external;
(* Const before type ignored *)
function g_file_set_display_name(file:PGFile; display_name:Pchar; cancellable:PGCancellable; error:PPGError):PGFile;cdecl;external;
(* Const before type ignored *)
procedure g_file_set_display_name_async(file:PGFile; display_name:Pchar; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external;
function g_file_set_display_name_finish(file:PGFile; res:PGAsyncResult; error:PPGError):PGFile;cdecl;external;
function g_file_delete(file:PGFile; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
procedure g_file_delete_async(file:PGFile; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_file_delete_finish(file:PGFile; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
function g_file_trash(file:PGFile; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
procedure g_file_trash_async(file:PGFile; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_file_trash_finish(file:PGFile; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
function g_file_copy(source:PGFile; destination:PGFile; flags:TGFileCopyFlags; cancellable:PGCancellable; progress_callback:TGFileProgressCallback; 
           progress_callback_data:Tgpointer; error:PPGError):Tgboolean;cdecl;external;
procedure g_file_copy_async(source:PGFile; destination:PGFile; flags:TGFileCopyFlags; io_priority:longint; cancellable:PGCancellable; 
            progress_callback:TGFileProgressCallback; progress_callback_data:Tgpointer; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_file_copy_finish(file:PGFile; res:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
function g_file_move(source:PGFile; destination:PGFile; flags:TGFileCopyFlags; cancellable:PGCancellable; progress_callback:TGFileProgressCallback; 
           progress_callback_data:Tgpointer; error:PPGError):Tgboolean;cdecl;external;
procedure g_file_move_async(source:PGFile; destination:PGFile; flags:TGFileCopyFlags; io_priority:longint; cancellable:PGCancellable; 
            progress_callback:TGFileProgressCallback; progress_callback_data:Tgpointer; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_file_move_finish(file:PGFile; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
function g_file_make_directory(file:PGFile; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
procedure g_file_make_directory_async(file:PGFile; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_file_make_directory_finish(file:PGFile; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
function g_file_make_directory_with_parents(file:PGFile; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_file_make_symbolic_link(file:PGFile; symlink_value:Pchar; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure g_file_make_symbolic_link_async(file:PGFile; symlink_value:Pchar; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external;
function g_file_make_symbolic_link_finish(file:PGFile; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
function g_file_query_settable_attributes(file:PGFile; cancellable:PGCancellable; error:PPGError):PGFileAttributeInfoList;cdecl;external;
function g_file_query_writable_namespaces(file:PGFile; cancellable:PGCancellable; error:PPGError):PGFileAttributeInfoList;cdecl;external;
(* Const before type ignored *)
function g_file_set_attribute(file:PGFile; attribute:Pchar; _type:TGFileAttributeType; value_p:Tgpointer; flags:TGFileQueryInfoFlags; 
           cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
function g_file_set_attributes_from_info(file:PGFile; info:PGFileInfo; flags:TGFileQueryInfoFlags; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
procedure g_file_set_attributes_async(file:PGFile; info:PGFileInfo; flags:TGFileQueryInfoFlags; io_priority:longint; cancellable:PGCancellable; 
            callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_file_set_attributes_finish(file:PGFile; result:PGAsyncResult; info:PPGFileInfo; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_file_set_attribute_string(file:PGFile; attribute:Pchar; value:Pchar; flags:TGFileQueryInfoFlags; cancellable:PGCancellable; 
           error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_file_set_attribute_byte_string(file:PGFile; attribute:Pchar; value:Pchar; flags:TGFileQueryInfoFlags; cancellable:PGCancellable; 
           error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_file_set_attribute_uint32(file:PGFile; attribute:Pchar; value:Tguint32; flags:TGFileQueryInfoFlags; cancellable:PGCancellable; 
           error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_file_set_attribute_int32(file:PGFile; attribute:Pchar; value:Tgint32; flags:TGFileQueryInfoFlags; cancellable:PGCancellable; 
           error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_file_set_attribute_uint64(file:PGFile; attribute:Pchar; value:Tguint64; flags:TGFileQueryInfoFlags; cancellable:PGCancellable; 
           error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_file_set_attribute_int64(file:PGFile; attribute:Pchar; value:Tgint64; flags:TGFileQueryInfoFlags; cancellable:PGCancellable; 
           error:PPGError):Tgboolean;cdecl;external;
procedure g_file_mount_enclosing_volume(location:PGFile; flags:TGMountMountFlags; mount_operation:PGMountOperation; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external;
function g_file_mount_enclosing_volume_finish(location:PGFile; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
procedure g_file_mount_mountable(file:PGFile; flags:TGMountMountFlags; mount_operation:PGMountOperation; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external;
function g_file_mount_mountable_finish(file:PGFile; result:PGAsyncResult; error:PPGError):PGFile;cdecl;external;
procedure g_file_unmount_mountable(file:PGFile; flags:TGMountUnmountFlags; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_file_unmount_mountable_finish(file:PGFile; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
procedure g_file_unmount_mountable_with_operation(file:PGFile; flags:TGMountUnmountFlags; mount_operation:PGMountOperation; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external;
function g_file_unmount_mountable_with_operation_finish(file:PGFile; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
procedure g_file_eject_mountable(file:PGFile; flags:TGMountUnmountFlags; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_file_eject_mountable_finish(file:PGFile; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
procedure g_file_eject_mountable_with_operation(file:PGFile; flags:TGMountUnmountFlags; mount_operation:PGMountOperation; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external;
function g_file_eject_mountable_with_operation_finish(file:PGFile; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
function g_file_build_attribute_list_for_copy(file:PGFile; flags:TGFileCopyFlags; cancellable:PGCancellable; error:PPGError):Pchar;cdecl;external;
function g_file_copy_attributes(source:PGFile; destination:PGFile; flags:TGFileCopyFlags; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
function g_file_monitor_directory(file:PGFile; flags:TGFileMonitorFlags; cancellable:PGCancellable; error:PPGError):PGFileMonitor;cdecl;external;
function g_file_monitor_file(file:PGFile; flags:TGFileMonitorFlags; cancellable:PGCancellable; error:PPGError):PGFileMonitor;cdecl;external;
function g_file_monitor(file:PGFile; flags:TGFileMonitorFlags; cancellable:PGCancellable; error:PPGError):PGFileMonitor;cdecl;external;
function g_file_measure_disk_usage(file:PGFile; flags:TGFileMeasureFlags; cancellable:PGCancellable; progress_callback:TGFileMeasureProgressCallback; progress_data:Tgpointer; 
           disk_usage:Pguint64; num_dirs:Pguint64; num_files:Pguint64; error:PPGError):Tgboolean;cdecl;external;
procedure g_file_measure_disk_usage_async(file:PGFile; flags:TGFileMeasureFlags; io_priority:Tgint; cancellable:PGCancellable; progress_callback:TGFileMeasureProgressCallback; 
            progress_data:Tgpointer; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_file_measure_disk_usage_finish(file:PGFile; result:PGAsyncResult; disk_usage:Pguint64; num_dirs:Pguint64; num_files:Pguint64; 
           error:PPGError):Tgboolean;cdecl;external;
procedure g_file_start_mountable(file:PGFile; flags:TGDriveStartFlags; start_operation:PGMountOperation; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external;
function g_file_start_mountable_finish(file:PGFile; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
procedure g_file_stop_mountable(file:PGFile; flags:TGMountUnmountFlags; mount_operation:PGMountOperation; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external;
function g_file_stop_mountable_finish(file:PGFile; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
procedure g_file_poll_mountable(file:PGFile; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_file_poll_mountable_finish(file:PGFile; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
{ Utilities  }
function g_file_query_default_handler(file:PGFile; cancellable:PGCancellable; error:PPGError):PGAppInfo;cdecl;external;
procedure g_file_query_default_handler_async(file:PGFile; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_file_query_default_handler_finish(file:PGFile; result:PGAsyncResult; error:PPGError):PGAppInfo;cdecl;external;
function g_file_load_contents(file:PGFile; cancellable:PGCancellable; contents:PPchar; length:Pgsize; etag_out:PPchar; 
           error:PPGError):Tgboolean;cdecl;external;
procedure g_file_load_contents_async(file:PGFile; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_file_load_contents_finish(file:PGFile; res:PGAsyncResult; contents:PPchar; length:Pgsize; etag_out:PPchar; 
           error:PPGError):Tgboolean;cdecl;external;
procedure g_file_load_partial_contents_async(file:PGFile; cancellable:PGCancellable; read_more_callback:TGFileReadMoreCallback; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_file_load_partial_contents_finish(file:PGFile; res:PGAsyncResult; contents:PPchar; length:Pgsize; etag_out:PPchar; 
           error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_file_replace_contents(file:PGFile; contents:Pchar; length:Tgsize; etag:Pchar; make_backup:Tgboolean; 
           flags:TGFileCreateFlags; new_etag:PPchar; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure g_file_replace_contents_async(file:PGFile; contents:Pchar; length:Tgsize; etag:Pchar; make_backup:Tgboolean; 
            flags:TGFileCreateFlags; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
(* Const before type ignored *)
procedure g_file_replace_contents_bytes_async(file:PGFile; contents:PGBytes; etag:Pchar; make_backup:Tgboolean; flags:TGFileCreateFlags; 
            cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_file_replace_contents_finish(file:PGFile; res:PGAsyncResult; new_etag:PPchar; error:PPGError):Tgboolean;cdecl;external;
function g_file_supports_thread_contexts(file:PGFile):Tgboolean;cdecl;external;
function g_file_load_bytes(file:PGFile; cancellable:PGCancellable; etag_out:PPgchar; error:PPGError):PGBytes;cdecl;external;
procedure g_file_load_bytes_async(file:PGFile; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_file_load_bytes_finish(file:PGFile; result:PGAsyncResult; etag_out:PPgchar; error:PPGError):PGBytes;cdecl;external;
{$endif}
{ __G_FILE_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_FILE : longint; { return type might be wrong }
  begin
    G_TYPE_FILE:=g_file_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_FILE(obj : longint) : longint;
begin
  G_FILE:=G_TYPE_CHECK_INSTANCE_CAST(obj,G_TYPE_FILE,GFile);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_FILE(obj : longint) : longint;
begin
  G_IS_FILE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,G_TYPE_FILE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_FILE_GET_IFACE(obj : longint) : longint;
begin
  G_FILE_GET_IFACE:=G_TYPE_INSTANCE_GET_INTERFACE(obj,G_TYPE_FILE,GFileIface);
end;


end.
