/* gpathbuf.h: A mutable path builder
 *
 * SPDX-FileCopyrightText: 2023  Emmanuele Bassi
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#pragma once

#if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)
#error "Only <glib.h> can be included directly."
#endif

#include <glib/gtypes.h>



typedef struct _GPathBuf  GPathBuf;

struct _GPathBuf
{
  /*< private >*/
  gpointer dummy[8];
};

/**
 * G_PATH_BUF_INIT:
 *
 * Initializes a #GPathBuf on the stack.
 *
 * A stack-allocated `GPathBuf` must be initialized if it is used
 * together with g_auto() to avoid warnings and crashes if the
 * function returns before calling g_path_buf_init().
 *
 * |[<!-- language="C" -->
 *   g_auto (GPathBuf) buf = G_PATH_BUF_INIT;
 * ]|
 *
 * Since: 2.76
 */
#define G_PATH_BUF_INIT  NULL



GPathBuf *    g_path_buf_new            (void);

GPathBuf *    g_path_buf_new_from_path  (const char *path);

GPathBuf *    g_path_buf_init           (GPathBuf   *buf);

GPathBuf *    g_path_buf_init_from_path (GPathBuf   *buf,
                                         const char *path);

void          g_path_buf_clear          (GPathBuf   *buf);

char *        g_path_buf_clear_to_path  (GPathBuf   *buf) ;

void          g_path_buf_free           (GPathBuf   *buf);

char *        g_path_buf_free_to_path   (GPathBuf   *buf) ;

GPathBuf *    g_path_buf_copy           (GPathBuf   *buf);


GPathBuf *    g_path_buf_push           (GPathBuf   *buf,
                                         const char *path);

gboolean      g_path_buf_pop            (GPathBuf   *buf);


gboolean      g_path_buf_set_filename   (GPathBuf   *buf,
                                         const char *file_name);

gboolean      g_path_buf_set_extension  (GPathBuf   *buf,
                                         const char *extension);


char *        g_path_buf_to_path        (GPathBuf   *buf) ;


gboolean      g_path_buf_equal          (gconstpointer v1,
                                         gconstpointer v2);


