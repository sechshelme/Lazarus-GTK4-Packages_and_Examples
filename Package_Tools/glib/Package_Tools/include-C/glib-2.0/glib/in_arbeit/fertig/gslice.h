/* GLIB sliced memory - fast threaded memory chunk allocator
 * Copyright (C) 2005 Tim Janik
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

#ifndef __G_SLICE_H__
#define __G_SLICE_H__

#if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)
#error "Only <glib.h> can be included directly."
#endif

#include <glib/gtypes.h>
#include <string.h>



/* slices - fast allocation/release of small memory blocks
 */

gpointer g_slice_alloc          	(gsize	       block_size)  ;

gpointer g_slice_alloc0         	(gsize         block_size)  ;

gpointer g_slice_copy                   (gsize         block_size,
                                         gconstpointer mem_block) ;

void     g_slice_free1          	(gsize         block_size,
					 gpointer      mem_block);

void     g_slice_free_chain_with_offset (gsize         block_size,
					 gpointer      mem_chain,
					 gsize         next_offset);
#define  g_slice_new(type)      ((type*) g_slice_alloc (sizeof (type)))

/*
#if defined (__GNUC__) && (__GNUC__ >= 2) && defined (__OPTIMIZE__)
#  define g_slice_new0(type)                                    \
  (type *) (G_GNUC_EXTENSION ({                                 \
    gsize __s = sizeof (type);                                  \
    gpointer __p;                                               \
    __p = g_slice_alloc (__s);                                  \
    memset (__p, 0, __s);                                       \
    __p;                                                        \
  }))
#else
#  define g_slice_new0(type)    ((type*) g_slice_alloc0 (sizeof (type)))
#endif
*/

/* MemoryBlockType *
 *       g_slice_dup                    (MemoryBlockType,
 *	                                 MemoryBlockType *mem_block);
 *       g_slice_free                   (MemoryBlockType,
 *	                                 MemoryBlockType *mem_block);
 *       g_slice_free_chain             (MemoryBlockType,
 *                                       MemoryBlockType *first_chain_block,
 *                                       memory_block_next_field);
 * pseudo prototypes for the macro
 * definitions following below.
 */

/*
#define g_slice_dup(type, mem)                                  \
  (1 ? (type*) g_slice_copy (sizeof (type), (mem))              \
     : ((void) ((type*) 0 == (mem)), (type*) 0))
#define g_slice_free(type, mem)                                 \
G_STMT_START {                                                  \
  if (1) g_slice_free1 (sizeof (type), (mem));			\
  else   (void) ((type*) 0 == (mem)); 				\
} G_STMT_END
#define g_slice_free_chain(type, mem_chain, next)               \
G_STMT_START {                                                  \
  if (1) g_slice_free_chain_with_offset (sizeof (type),		\
                 (mem_chain), G_STRUCT_OFFSET (type, next)); 	\
  else   (void) ((type*) 0 == (mem_chain));			\
} G_STMT_END
*/

/* --- internal debugging API --- */
typedef enum {
  G_SLICE_CONFIG_ALWAYS_MALLOC = 1,
  G_SLICE_CONFIG_BYPASS_MAGAZINES,
  G_SLICE_CONFIG_WORKING_SET_MSECS,
  G_SLICE_CONFIG_COLOR_INCREMENT,
  G_SLICE_CONFIG_CHUNK_SIZES,
  G_SLICE_CONFIG_CONTENTION_COUNTER
} GSliceConfig;

void     g_slice_set_config	   (GSliceConfig ckey, gint64 value);
gint64   g_slice_get_config	   (GSliceConfig ckey);
gint64*  g_slice_get_config_state  (GSliceConfig ckey, gint64 address, guint *n_values);

#ifndef __GI_SCANNER__
#ifdef G_ENABLE_DEBUG

void     g_slice_debug_tree_statistics (void);
#endif
#endif



#endif /* __G_SLICE_H__ */
