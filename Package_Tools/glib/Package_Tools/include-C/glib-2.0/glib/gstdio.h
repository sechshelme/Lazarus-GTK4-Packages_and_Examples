/* gstdio.h - GFilename wrappers for C library functions
 *
 * Copyright 2004 Tor Lillqvist
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

#ifndef __G_STDIO_H__
#define __G_STDIO_H__

#include <glib/gprintf.h>

#include <errno.h>
#include <sys/stat.h>



#if (defined (__MINGW64_VERSION_MAJOR) || defined (_MSC_VER)) && !defined(_WIN64)

/* Make it clear that we mean the struct with 32-bit st_size and
 * 32-bit st_*time fields as that is how the 32-bit GLib DLL normally
 * has been compiled. If you get a compiler warning when calling
 * g_stat(), do take it seriously and make sure that the type of
 * struct stat the code in GLib fills in matches the struct the type
 * of struct stat you pass to g_stat(). To avoid hassle, to get file
 * attributes just use the GIO API instead which doesn't use struct
 * stat.
 *
 * Sure, it would be nicer to use a struct with 64-bit st_size and
 * 64-bit st_*time fields, but changing that now would break ABI. And
 * in MinGW, a plain "struct stat" is the one with 32-bit st_size and
 * st_*time fields.
 */

typedef struct _stat32 GStatBuf;

#elif defined(__MINGW64_VERSION_MAJOR) && defined(_WIN64)

typedef struct _stat64 GStatBuf;

#else

typedef struct stat GStatBuf;

#endif

#if defined(G_OS_UNIX) && !defined(G_STDIO_WRAP_ON_UNIX) && !defined(__GI_SCANNER__)

/* Just pass on to the system functions, so there's no potential for data
 * format mismatches, especially with large file interfaces. 
 * A few functions can't be handled in this way, since they are not defined
 * in a portable system header that we could include here.
 *
 * G_STDIO_WRAP_ON_UNIX is not public API and its behaviour is not guaranteed
 * in future.
 */

#ifndef __GTK_DOC_IGNORE__
#define g_chmod   chmod
#define g_open    open
#define g_creat   creat
#define g_rename  rename
#define g_mkdir   mkdir
#define g_stat    stat
#define g_lstat   lstat
#define g_remove  remove
#define g_fopen   fopen
#define g_freopen freopen
#define g_fsync   fsync
#define g_utime   utime
#endif


int g_access (const gchar *filename,
	      int          mode);


int g_chdir  (const gchar *path);


int g_unlink (const gchar *filename);


int g_rmdir  (const gchar *filename);

#else /* ! G_OS_UNIX */

/* Wrappers for C library functions that take pathname arguments. On
 * Unix, the pathname is a file name as it literally is in the file
 * system. On well-maintained systems with consistent users who know
 * what they are doing and no exchange of files with others this would
 * be a well-defined encoding, preferably UTF-8. On Windows, the
 * pathname is always in UTF-8, even if that is not the on-disk
 * encoding, and not the encoding accepted by the C library or Win32
 * API.
 */


int g_access    (const gchar *filename,
		 int          mode);


int g_chmod     (const gchar *filename,
		 int          mode);


int g_open      (const gchar *filename,
                 int          flags,
                 int          mode);


int g_creat     (const gchar *filename,
                 int          mode);


int g_rename    (const gchar *oldfilename,
                 const gchar *newfilename);


int g_mkdir     (const gchar *filename,
                 int          mode);


int g_chdir     (const gchar *path);


int g_stat      (const gchar *filename,
                 GStatBuf    *buf);


int g_lstat     (const gchar *filename,
                 GStatBuf    *buf);


int g_unlink    (const gchar *filename);


int g_remove    (const gchar *filename);


int g_rmdir     (const gchar *filename);


FILE *g_fopen   (const gchar *filename,
                 const gchar *mode);


FILE *g_freopen (const gchar *filename,
                 const gchar *mode,
                 FILE        *stream);


gint g_fsync    (gint fd);

struct utimbuf;			/* Don't need the real definition of struct utimbuf when just
				 * including this header.
				 */


int g_utime     (const gchar    *filename,
		 struct utimbuf *utb);

#endif /* G_OS_UNIX */


gboolean g_close (gint       fd,
                  GError   **error);

GLIB_AVAILABLE_STATIC_INLINE_IN_2_76
static inline gboolean
g_clear_fd (int     *fd_ptr,
            GError **error)
{
  int fd = *fd_ptr;

  *fd_ptr = -1;

  if (fd < 0)
    return TRUE;

  /* Suppress "Not available before" warning */
  
  return g_close (fd, error);
  
}

/* g_autofd should be defined on the same compilers where g_autofree is
 * This avoids duplicating the feature-detection here. */
#ifdef g_autofree
#ifndef __GTK_DOC_IGNORE__
/* Not public API */
static inline void
_g_clear_fd_ignore_error (int *fd_ptr)
{
  /* Don't overwrite thread-local errno if closing the fd fails */
  int errsv = errno;

  /* Suppress "Not available before" warning */
  

  if (!g_clear_fd (fd_ptr, NULL))
    {
      /* Do nothing: we ignore all errors, except for EBADF which
       * is a programming error, checked for by g_close(). */
    }

  

  errno = errsv;
}
#endif

#define g_autofd _GLIB_CLEANUP(_g_clear_fd_ignore_error) GLIB_AVAILABLE_MACRO_IN_2_76
#endif



#endif /* __G_STDIO_H__ */
