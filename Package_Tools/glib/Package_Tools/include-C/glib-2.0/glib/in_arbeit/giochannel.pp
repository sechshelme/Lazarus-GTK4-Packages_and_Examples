
unit giochannel;
interface

{
  Automatically converted by H2Pas 1.0.0 from giochannel.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    giochannel.h
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
Pgchar  = ^gchar;
PGError  = ^GError;
Pgint  = ^gint;
PGIOChannel  = ^GIOChannel;
PGIOChannelError  = ^GIOChannelError;
PGIOError  = ^GIOError;
PGIOFlags  = ^GIOFlags;
PGIOFuncs  = ^GIOFuncs;
PGIOStatus  = ^GIOStatus;
PGPollFD  = ^GPollFD;
PGSeekType  = ^GSeekType;
Pgsize  = ^gsize;
PGSource  = ^GSource;
PGString  = ^GString;
Pgunichar  = ^gunichar;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GLIB - Library of useful routines for C programming
 * Copyright (C) 1995-1997  Peter Mattis, Spencer Kimball and Josh MacDonald
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
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  }
{
 * Modified by the GLib Team and others 1997-2000.  See the AUTHORS
 * file for a list of people on the GLib Team.  See the ChangeLog
 * files for a list of changes.  These files are distributed with
 * GLib at ftp://ftp.gtk.org/pub/gtk/.
  }
{$ifndef __G_IOCHANNEL_H__}
{$define __G_IOCHANNEL_H__}
{$if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)}
{$error "Only <glib.h> can be included directly."}
{$endif}
{$include <glib/gconvert.h>}
{$include <glib/gmain.h>}
{$include <glib/gstring.h>}
{ GIOChannel
  }
type

  PGIOError = ^TGIOError;
  TGIOError =  Longint;
  Const
    G_IO_ERROR_NONE = 0;
    G_IO_ERROR_AGAIN = 1;
    G_IO_ERROR_INVAL = 2;
    G_IO_ERROR_UNKNOWN = 3;
;

{ was #define dname def_expr }
function G_IO_CHANNEL_ERROR : longint; { return type might be wrong }

{ Derived from errno  }
{ Other  }
type
  PGIOChannelError = ^TGIOChannelError;
  TGIOChannelError =  Longint;
  Const
    G_IO_CHANNEL_ERROR_FBIG = 0;
    G_IO_CHANNEL_ERROR_INVAL = 1;
    G_IO_CHANNEL_ERROR_IO = 2;
    G_IO_CHANNEL_ERROR_ISDIR = 3;
    G_IO_CHANNEL_ERROR_NOSPC = 4;
    G_IO_CHANNEL_ERROR_NXIO = 5;
    G_IO_CHANNEL_ERROR_OVERFLOW = 6;
    G_IO_CHANNEL_ERROR_PIPE = 7;
    G_IO_CHANNEL_ERROR_FAILED = 8;
;
type
  PGIOStatus = ^TGIOStatus;
  TGIOStatus =  Longint;
  Const
    G_IO_STATUS_ERROR = 0;
    G_IO_STATUS_NORMAL = 1;
    G_IO_STATUS_EOF = 2;
    G_IO_STATUS_AGAIN = 3;
;
type
  PGSeekType = ^TGSeekType;
  TGSeekType =  Longint;
  Const
    G_SEEK_CUR = 0;
    G_SEEK_SET = 1;
    G_SEEK_END = 2;
;
{ Read only flag  }
{ Read only flag  }
{ Misspelling in 2.29.10 and earlier  }
{ Read only flag  }
type
  PGIOFlags = ^TGIOFlags;
  TGIOFlags =  Longint;
  Const
    G_IO_FLAG_NONE = 0;
    G_IO_FLAG_APPEND = 1 shl 0;
    G_IO_FLAG_NONBLOCK = 1 shl 1;
    G_IO_FLAG_IS_READABLE = 1 shl 2;
    G_IO_FLAG_IS_WRITABLE = 1 shl 3;
    G_IO_FLAG_IS_WRITEABLE = 1 shl 3;
    G_IO_FLAG_IS_SEEKABLE = 1 shl 4;
    G_IO_FLAG_MASK = (1 shl 5)-1;
    G_IO_FLAG_GET_MASK = G_IO_FLAG_MASK;
    G_IO_FLAG_SET_MASK = G_IO_FLAG_APPEND or G_IO_FLAG_NONBLOCK;
;
{< private > }
{ String which indicates the end of a line of text  }
{ So we can have null in the line term  }
{ Raw data from the channel  }
{ Channel data converted to UTF-8  }
{ Data ready to be written to the file  }
{ UTF-8 partial characters, null terminated  }
{ Group the flags together, immediately after partial_write_buf, to save memory  }
{ The encoding uses the buffers  }
{ The encoding uses the GIConv coverters  }
{ Close the channel on final unref  }
{ Cached GIOFlag  }
{ ditto  }
{ ditto  }
type
  PGIOChannel = ^TGIOChannel;
  TGIOChannel = record
      ref_count : Tgint;
      funcs : PGIOFuncs;
      encoding : Pgchar;
      read_cd : TGIConv;
      write_cd : TGIConv;
      line_term : Pgchar;
      line_term_len : Tguint;
      buf_size : Tgsize;
      read_buf : PGString;
      encoded_read_buf : PGString;
      write_buf : PGString;
      partial_write_buf : array[0..5] of Tgchar;
      flag0 : word;
      reserved1 : Tgpointer;
      reserved2 : Tgpointer;
    end;


const
  bm_TGIOChannel_use_buffer = $1;
  bp_TGIOChannel_use_buffer = 0;
  bm_TGIOChannel_do_encode = $2;
  bp_TGIOChannel_do_encode = 1;
  bm_TGIOChannel_close_on_unref = $4;
  bp_TGIOChannel_close_on_unref = 2;
  bm_TGIOChannel_is_readable = $8;
  bp_TGIOChannel_is_readable = 3;
  bm_TGIOChannel_is_writeable = $10;
  bp_TGIOChannel_is_writeable = 4;
  bm_TGIOChannel_is_seekable = $20;
  bp_TGIOChannel_is_seekable = 5;

function use_buffer(var a : TGIOChannel) : Tguint;
procedure set_use_buffer(var a : TGIOChannel; __use_buffer : Tguint);
function do_encode(var a : TGIOChannel) : Tguint;
procedure set_do_encode(var a : TGIOChannel; __do_encode : Tguint);
function close_on_unref(var a : TGIOChannel) : Tguint;
procedure set_close_on_unref(var a : TGIOChannel; __close_on_unref : Tguint);
function is_readable(var a : TGIOChannel) : Tguint;
procedure set_is_readable(var a : TGIOChannel; __is_readable : Tguint);
function is_writeable(var a : TGIOChannel) : Tguint;
procedure set_is_writeable(var a : TGIOChannel; __is_writeable : Tguint);
function is_seekable(var a : TGIOChannel) : Tguint;
procedure set_is_seekable(var a : TGIOChannel; __is_seekable : Tguint);
type

  TGIOFunc = function (source:PGIOChannel; condition:TGIOCondition; data:Tgpointer):Tgboolean;cdecl;
(* Const before type ignored *)
  PGIOFuncs = ^TGIOFuncs;
  TGIOFuncs = record
      io_read : function (channel:PGIOChannel; buf:Pgchar; count:Tgsize; bytes_read:Pgsize; err:PPGError):TGIOStatus;cdecl;
      io_write : function (channel:PGIOChannel; buf:Pgchar; count:Tgsize; bytes_written:Pgsize; err:PPGError):TGIOStatus;cdecl;
      io_seek : function (channel:PGIOChannel; offset:Tgint64; _type:TGSeekType; err:PPGError):TGIOStatus;cdecl;
      io_close : function (channel:PGIOChannel; err:PPGError):TGIOStatus;cdecl;
      io_create_watch : function (channel:PGIOChannel; condition:TGIOCondition):PGSource;cdecl;
      io_free : procedure (channel:PGIOChannel);cdecl;
      io_set_flags : function (channel:PGIOChannel; flags:TGIOFlags; err:PPGError):TGIOStatus;cdecl;
      io_get_flags : function (channel:PGIOChannel):TGIOFlags;cdecl;
    end;


procedure g_io_channel_init(channel:PGIOChannel);cdecl;external;
function g_io_channel_ref(channel:PGIOChannel):PGIOChannel;cdecl;external;
procedure g_io_channel_unref(channel:PGIOChannel);cdecl;external;
function g_io_channel_read(channel:PGIOChannel; buf:Pgchar; count:Tgsize; bytes_read:Pgsize):TGIOError;cdecl;external;
(* Const before type ignored *)
function g_io_channel_write(channel:PGIOChannel; buf:Pgchar; count:Tgsize; bytes_written:Pgsize):TGIOError;cdecl;external;
function g_io_channel_seek(channel:PGIOChannel; offset:Tgint64; _type:TGSeekType):TGIOError;cdecl;external;
procedure g_io_channel_close(channel:PGIOChannel);cdecl;external;
function g_io_channel_shutdown(channel:PGIOChannel; flush:Tgboolean; err:PPGError):TGIOStatus;cdecl;external;
function g_io_add_watch_full(channel:PGIOChannel; priority:Tgint; condition:TGIOCondition; func:TGIOFunc; user_data:Tgpointer; 
           notify:TGDestroyNotify):Tguint;cdecl;external;
function g_io_create_watch(channel:PGIOChannel; condition:TGIOCondition):PGSource;cdecl;external;
function g_io_add_watch(channel:PGIOChannel; condition:TGIOCondition; func:TGIOFunc; user_data:Tgpointer):Tguint;cdecl;external;
{ character encoding conversion involved functions.
  }
procedure g_io_channel_set_buffer_size(channel:PGIOChannel; size:Tgsize);cdecl;external;
function g_io_channel_get_buffer_size(channel:PGIOChannel):Tgsize;cdecl;external;
function g_io_channel_get_buffer_condition(channel:PGIOChannel):TGIOCondition;cdecl;external;
function g_io_channel_set_flags(channel:PGIOChannel; flags:TGIOFlags; error:PPGError):TGIOStatus;cdecl;external;
function g_io_channel_get_flags(channel:PGIOChannel):TGIOFlags;cdecl;external;
(* Const before type ignored *)
procedure g_io_channel_set_line_term(channel:PGIOChannel; line_term:Pgchar; length:Tgint);cdecl;external;
(* Const before type ignored *)
function g_io_channel_get_line_term(channel:PGIOChannel; length:Pgint):Pgchar;cdecl;external;
procedure g_io_channel_set_buffered(channel:PGIOChannel; buffered:Tgboolean);cdecl;external;
function g_io_channel_get_buffered(channel:PGIOChannel):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_io_channel_set_encoding(channel:PGIOChannel; encoding:Pgchar; error:PPGError):TGIOStatus;cdecl;external;
(* Const before type ignored *)
function g_io_channel_get_encoding(channel:PGIOChannel):Pgchar;cdecl;external;
procedure g_io_channel_set_close_on_unref(channel:PGIOChannel; do_close:Tgboolean);cdecl;external;
function g_io_channel_get_close_on_unref(channel:PGIOChannel):Tgboolean;cdecl;external;
function g_io_channel_flush(channel:PGIOChannel; error:PPGError):TGIOStatus;cdecl;external;
function g_io_channel_read_line(channel:PGIOChannel; str_return:PPgchar; length:Pgsize; terminator_pos:Pgsize; error:PPGError):TGIOStatus;cdecl;external;
function g_io_channel_read_line_string(channel:PGIOChannel; buffer:PGString; terminator_pos:Pgsize; error:PPGError):TGIOStatus;cdecl;external;
function g_io_channel_read_to_end(channel:PGIOChannel; str_return:PPgchar; length:Pgsize; error:PPGError):TGIOStatus;cdecl;external;
function g_io_channel_read_chars(channel:PGIOChannel; buf:Pgchar; count:Tgsize; bytes_read:Pgsize; error:PPGError):TGIOStatus;cdecl;external;
function g_io_channel_read_unichar(channel:PGIOChannel; thechar:Pgunichar; error:PPGError):TGIOStatus;cdecl;external;
(* Const before type ignored *)
function g_io_channel_write_chars(channel:PGIOChannel; buf:Pgchar; count:Tgssize; bytes_written:Pgsize; error:PPGError):TGIOStatus;cdecl;external;
function g_io_channel_write_unichar(channel:PGIOChannel; thechar:Tgunichar; error:PPGError):TGIOStatus;cdecl;external;
function g_io_channel_seek_position(channel:PGIOChannel; offset:Tgint64; _type:TGSeekType; error:PPGError):TGIOStatus;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_io_channel_new_file(filename:Pgchar; mode:Pgchar; error:PPGError):PGIOChannel;cdecl;external;
{ Error handling  }
function g_io_channel_error_quark:TGQuark;cdecl;external;
function g_io_channel_error_from_errno(en:Tgint):TGIOChannelError;cdecl;external;
{ On Unix, IO channels created with this function for any file
 * descriptor or socket.
 *
 * On Win32, this can be used either for files opened with the MSVCRT
 * (the Microsoft run-time C library) _open() or _pipe, including file
 * descriptors 0, 1 and 2 (corresponding to stdin, stdout and stderr),
 * or for Winsock SOCKETs. If the parameter is a legal file
 * descriptor, it is assumed to be such, otherwise it should be a
 * SOCKET. This relies on SOCKETs and file descriptors not
 * overlapping. If you want to be certain, call either
 * g_io_channel_win32_new_fd() or g_io_channel_win32_new_socket()
 * instead as appropriate.
 *
 * The term file descriptor as used in the context of Win32 refers to
 * the emulated Unix-like file descriptors MSVCRT provides. The native
 * corresponding concept is file HANDLE. There isn't as of yet a way to
 * get GIOChannels for Win32 file HANDLEs.
  }
function g_io_channel_unix_new(fd:longint):PGIOChannel;cdecl;external;
function g_io_channel_unix_get_fd(channel:PGIOChannel):Tgint;cdecl;external;
{ Hook for GClosure / GSource integration. Don't touch  }
  var
    g_io_watch_funcs : TGSourceFuncs;cvar;public;
{$ifdef G_OS_WIN32}
{ You can use this "pseudo file descriptor" in a GPollFD to add
 * polling for Windows messages. GTK applications should not do that.
  }

const
  G_WIN32_MSG_HANDLE = 19981206;  
{ Use this to get a GPollFD from a GIOChannel, so that you can call
 * g_io_channel_win32_poll(). After calling this you should only use
 * g_io_channel_read() to read from the GIOChannel, i.e. never read()
 * from the underlying file descriptor. For SOCKETs, it is possible to call
 * recv().
  }

procedure g_io_channel_win32_make_pollfd(channel:PGIOChannel; condition:TGIOCondition; fd:PGPollFD);cdecl;external;
{ This can be used to wait until at least one of the channels is readable.
 * On Unix you would do a select() on the file descriptors of the channels.
  }
function g_io_channel_win32_poll(fds:PGPollFD; n_fds:Tgint; timeout_:Tgint):Tgint;cdecl;external;
{ Create an IO channel for Windows messages for window handle hwnd.  }
{$if GLIB_SIZEOF_VOID_P == 8}
{ We use gsize here so that it is still an integer type and not a
 * pointer, like the guint in the traditional prototype. We can't use
 * intptr_t as that is not portable enough.
  }

function g_io_channel_win32_new_messages(hwnd:Tgsize):PGIOChannel;cdecl;external;
{$else}

function g_io_channel_win32_new_messages(hwnd:Tguint):PGIOChannel;cdecl;external;
{$endif}
{ Create an IO channel for C runtime (emulated Unix-like) file
 * descriptors. After calling g_io_add_watch() on a IO channel
 * returned by this function, you shouldn't call read() on the file
 * descriptor. This is because adding polling for a file descriptor is
 * implemented on Win32 by starting a thread that sits blocked in a
 * read() from the file descriptor most of the time. All reads from
 * the file descriptor should be done by this internal GLib
 * thread. Your code should call only g_io_channel_read_chars().
  }

function g_io_channel_win32_new_fd(fd:Tgint):PGIOChannel;cdecl;external;
{ Get the C runtime file descriptor of a channel.  }
function g_io_channel_win32_get_fd(channel:PGIOChannel):Tgint;cdecl;external;
{ Create an IO channel for a winsock socket. The parameter should be
 * a SOCKET. Contrary to IO channels for file descriptors (on *Win32),
 * you can use normal recv() or recvfrom() on sockets even if GLib
 * is polling them.
  }
function g_io_channel_win32_new_socket(socket:Tgint):PGIOChannel;cdecl;external;
function g_io_channel_win32_new_stream_socket(socket:Tgint):PGIOChannel;cdecl;external;
procedure g_io_channel_win32_set_debug(channel:PGIOChannel; flag:Tgboolean);cdecl;external;
{$endif}
{$endif}
{ __G_IOCHANNEL_H__  }

implementation

{ was #define dname def_expr }
function G_IO_CHANNEL_ERROR : longint; { return type might be wrong }
  begin
    G_IO_CHANNEL_ERROR:=g_io_channel_error_quark;
  end;

function use_buffer(var a : TGIOChannel) : Tguint;
begin
  use_buffer:=(a.flag0 and bm_TGIOChannel_use_buffer) shr bp_TGIOChannel_use_buffer;
end;

procedure set_use_buffer(var a : TGIOChannel; __use_buffer : Tguint);
begin
  a.flag0:=a.flag0 or ((__use_buffer shl bp_TGIOChannel_use_buffer) and bm_TGIOChannel_use_buffer);
end;

function do_encode(var a : TGIOChannel) : Tguint;
begin
  do_encode:=(a.flag0 and bm_TGIOChannel_do_encode) shr bp_TGIOChannel_do_encode;
end;

procedure set_do_encode(var a : TGIOChannel; __do_encode : Tguint);
begin
  a.flag0:=a.flag0 or ((__do_encode shl bp_TGIOChannel_do_encode) and bm_TGIOChannel_do_encode);
end;

function close_on_unref(var a : TGIOChannel) : Tguint;
begin
  close_on_unref:=(a.flag0 and bm_TGIOChannel_close_on_unref) shr bp_TGIOChannel_close_on_unref;
end;

procedure set_close_on_unref(var a : TGIOChannel; __close_on_unref : Tguint);
begin
  a.flag0:=a.flag0 or ((__close_on_unref shl bp_TGIOChannel_close_on_unref) and bm_TGIOChannel_close_on_unref);
end;

function is_readable(var a : TGIOChannel) : Tguint;
begin
  is_readable:=(a.flag0 and bm_TGIOChannel_is_readable) shr bp_TGIOChannel_is_readable;
end;

procedure set_is_readable(var a : TGIOChannel; __is_readable : Tguint);
begin
  a.flag0:=a.flag0 or ((__is_readable shl bp_TGIOChannel_is_readable) and bm_TGIOChannel_is_readable);
end;

function is_writeable(var a : TGIOChannel) : Tguint;
begin
  is_writeable:=(a.flag0 and bm_TGIOChannel_is_writeable) shr bp_TGIOChannel_is_writeable;
end;

procedure set_is_writeable(var a : TGIOChannel; __is_writeable : Tguint);
begin
  a.flag0:=a.flag0 or ((__is_writeable shl bp_TGIOChannel_is_writeable) and bm_TGIOChannel_is_writeable);
end;

function is_seekable(var a : TGIOChannel) : Tguint;
begin
  is_seekable:=(a.flag0 and bm_TGIOChannel_is_seekable) shr bp_TGIOChannel_is_seekable;
end;

procedure set_is_seekable(var a : TGIOChannel; __is_seekable : Tguint);
begin
  a.flag0:=a.flag0 or ((__is_seekable shl bp_TGIOChannel_is_seekable) and bm_TGIOChannel_is_seekable);
end;


end.
