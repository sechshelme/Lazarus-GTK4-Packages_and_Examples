/* GLIB - Library of useful routines for C programming
 * Copyright (C) 2002, 2003, 2004, 2005, 2006, 2007
 * Soeren Sandmann (sandmann@daimi.au.dk)
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
 */

#ifndef __G_SEQUENCE_H__
#define __G_SEQUENCE_H__

#if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)
#error "Only <glib.h> can be included directly."
#endif

#include <glib/gtypes.h>



typedef struct _GSequence      GSequence;
typedef struct _GSequenceNode  GSequenceIter;

typedef gint (* GSequenceIterCompareFunc) (GSequenceIter *a,
                                           GSequenceIter *b,
                                           gpointer       data);


/* GSequence */

GSequence *    g_sequence_new                (GDestroyNotify            data_destroy);

void           g_sequence_free               (GSequence                *seq);

gint           g_sequence_get_length         (GSequence                *seq);

void           g_sequence_foreach            (GSequence                *seq,
                                              GFunc                     func,
                                              gpointer                  user_data);

void           g_sequence_foreach_range      (GSequenceIter            *begin,
                                              GSequenceIter            *end,
                                              GFunc                     func,
                                              gpointer                  user_data);

void           g_sequence_sort               (GSequence                *seq,
                                              GCompareDataFunc          cmp_func,
                                              gpointer                  cmp_data);

void           g_sequence_sort_iter          (GSequence                *seq,
                                              GSequenceIterCompareFunc  cmp_func,
                                              gpointer                  cmp_data);

gboolean       g_sequence_is_empty           (GSequence                *seq);


/* Getting iters */

GSequenceIter *g_sequence_get_begin_iter     (GSequence                *seq);

GSequenceIter *g_sequence_get_end_iter       (GSequence                *seq);

GSequenceIter *g_sequence_get_iter_at_pos    (GSequence                *seq,
                                              gint                      pos);

GSequenceIter *g_sequence_append             (GSequence                *seq,
                                              gpointer                  data);

GSequenceIter *g_sequence_prepend            (GSequence                *seq,
                                              gpointer                  data);

GSequenceIter *g_sequence_insert_before      (GSequenceIter            *iter,
                                              gpointer                  data);

void           g_sequence_move               (GSequenceIter            *src,
                                              GSequenceIter            *dest);

void           g_sequence_swap               (GSequenceIter            *a,
                                              GSequenceIter            *b);

GSequenceIter *g_sequence_insert_sorted      (GSequence                *seq,
                                              gpointer                  data,
                                              GCompareDataFunc          cmp_func,
                                              gpointer                  cmp_data);

GSequenceIter *g_sequence_insert_sorted_iter (GSequence                *seq,
                                              gpointer                  data,
                                              GSequenceIterCompareFunc  iter_cmp,
                                              gpointer                  cmp_data);

void           g_sequence_sort_changed       (GSequenceIter            *iter,
                                              GCompareDataFunc          cmp_func,
                                              gpointer                  cmp_data);

void           g_sequence_sort_changed_iter  (GSequenceIter            *iter,
                                              GSequenceIterCompareFunc  iter_cmp,
                                              gpointer                  cmp_data);

void           g_sequence_remove             (GSequenceIter            *iter);

void           g_sequence_remove_range       (GSequenceIter            *begin,
                                              GSequenceIter            *end);

void           g_sequence_move_range         (GSequenceIter            *dest,
                                              GSequenceIter            *begin,
                                              GSequenceIter            *end);

GSequenceIter *g_sequence_search             (GSequence                *seq,
                                              gpointer                  data,
                                              GCompareDataFunc          cmp_func,
                                              gpointer                  cmp_data);

GSequenceIter *g_sequence_search_iter        (GSequence                *seq,
                                              gpointer                  data,
                                              GSequenceIterCompareFunc  iter_cmp,
                                              gpointer                  cmp_data);

GSequenceIter *g_sequence_lookup             (GSequence                *seq,
                                              gpointer                  data,
                                              GCompareDataFunc          cmp_func,
                                              gpointer                  cmp_data);

GSequenceIter *g_sequence_lookup_iter        (GSequence                *seq,
                                              gpointer                  data,
                                              GSequenceIterCompareFunc  iter_cmp,
                                              gpointer                  cmp_data);


/* Dereferencing */

gpointer       g_sequence_get                (GSequenceIter            *iter);

void           g_sequence_set                (GSequenceIter            *iter,
                                              gpointer                  data);

/* Operations on GSequenceIter * */

gboolean       g_sequence_iter_is_begin      (GSequenceIter            *iter);

gboolean       g_sequence_iter_is_end        (GSequenceIter            *iter);

GSequenceIter *g_sequence_iter_next          (GSequenceIter            *iter);

GSequenceIter *g_sequence_iter_prev          (GSequenceIter            *iter);

gint           g_sequence_iter_get_position  (GSequenceIter            *iter);

GSequenceIter *g_sequence_iter_move          (GSequenceIter            *iter,
                                              gint                      delta);

GSequence *    g_sequence_iter_get_sequence  (GSequenceIter            *iter);


/* Search */

gint           g_sequence_iter_compare       (GSequenceIter            *a,
                                              GSequenceIter            *b);

GSequenceIter *g_sequence_range_get_midpoint (GSequenceIter            *begin,
                                              GSequenceIter            *end);



#endif /* __G_SEQUENCE_H__ */
