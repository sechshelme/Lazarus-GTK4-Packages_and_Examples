/* GLIB - Library of useful routines for C programming
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
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, see <http://www.gnu.org/licenses/>.
 */

/*
 * Modified by the GLib Team and others 1997-2000.  See the AUTHORS
 * file for a list of people on the GLib Team.  See the ChangeLog
 * files for a list of changes.  These files are distributed with
 * GLib at ftp://ftp.gtk.org/pub/gtk/.
 */

#ifndef __G_TREE_H__
#define __G_TREE_H__

#if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)
#error "Only <glib.h> can be included directly."
#endif

#include <glib/gnode.h>



#undef G_TREE_DEBUG

typedef struct _GTree  GTree;

/**
 * GTreeNode:
 *
 * An opaque type which identifies a specific node in a #GTree.
 *
 * Since: 2.68
 */
typedef struct _GTreeNode GTreeNode;

typedef gboolean (*GTraverseFunc) (gpointer  key,
                                   gpointer  value,
                                   gpointer  data);

/**
 * GTraverseNodeFunc:
 * @node: a #GTreeNode
 * @data: user data passed to g_tree_foreach_node()
 *
 * Specifies the type of function passed to g_tree_foreach_node(). It is
 * passed each node, together with the @user_data parameter passed to
 * g_tree_foreach_node(). If the function returns %TRUE, the traversal is
 * stopped.
 *
 * Returns: %TRUE to stop the traversal
 * Since: 2.68
 */
typedef gboolean (*GTraverseNodeFunc) (GTreeNode *node,
                                       gpointer   data);

/* Balanced binary trees
 */

GTree*   g_tree_new             (GCompareFunc      key_compare_func);

GTree*   g_tree_new_with_data   (GCompareDataFunc  key_compare_func,
                                 gpointer          key_compare_data);

GTree*   g_tree_new_full        (GCompareDataFunc  key_compare_func,
                                 gpointer          key_compare_data,
                                 GDestroyNotify    key_destroy_func,
                                 GDestroyNotify    value_destroy_func);

GTreeNode *g_tree_node_first (GTree *tree);

GTreeNode *g_tree_node_last (GTree *tree);

GTreeNode *g_tree_node_previous (GTreeNode *node);

GTreeNode *g_tree_node_next (GTreeNode *node);

GTree*   g_tree_ref             (GTree            *tree);

void     g_tree_unref           (GTree            *tree);

void     g_tree_destroy         (GTree            *tree);

GTreeNode *g_tree_insert_node (GTree *tree,
                               gpointer key,
                               gpointer value);

void     g_tree_insert          (GTree            *tree,
                                 gpointer          key,
                                 gpointer          value);

GTreeNode *g_tree_replace_node (GTree *tree,
                                gpointer key,
                                gpointer value);

void     g_tree_replace         (GTree            *tree,
                                 gpointer          key,
                                 gpointer          value);

gboolean g_tree_remove          (GTree            *tree,
                                 gconstpointer     key);

GLIB_AVAILABLE_IN_2_70
void     g_tree_remove_all      (GTree            *tree);


gboolean g_tree_steal           (GTree            *tree,
                                 gconstpointer     key);

gpointer g_tree_node_key (GTreeNode *node);

gpointer g_tree_node_value (GTreeNode *node);

GTreeNode *g_tree_lookup_node (GTree *tree,
                               gconstpointer key);

gpointer g_tree_lookup          (GTree            *tree,
                                 gconstpointer     key);

gboolean g_tree_lookup_extended (GTree            *tree,
                                 gconstpointer     lookup_key,
                                 gpointer         *orig_key,
                                 gpointer         *value);

void     g_tree_foreach         (GTree            *tree,
                                 GTraverseFunc	   func,
                                 gpointer	   user_data);

void g_tree_foreach_node (GTree *tree,
                          GTraverseNodeFunc func,
                          gpointer user_data);


void     g_tree_traverse        (GTree            *tree,
                                 GTraverseFunc     traverse_func,
                                 GTraverseType     traverse_type,
                                 gpointer          user_data);


GTreeNode *g_tree_search_node (GTree *tree,
                               GCompareFunc search_func,
                               gconstpointer user_data);

gpointer g_tree_search          (GTree            *tree,
                                 GCompareFunc      search_func,
                                 gconstpointer     user_data);

GTreeNode *g_tree_lower_bound (GTree *tree,
                               gconstpointer key);

GTreeNode *g_tree_upper_bound (GTree *tree,
                               gconstpointer key);

gint     g_tree_height          (GTree            *tree);

gint     g_tree_nnodes          (GTree            *tree);

#ifdef G_TREE_DEBUG
/*< private >*/
#ifndef __GTK_DOC_IGNORE__
void g_tree_dump (GTree *tree);
#endif  /* !__GTK_DOC_IGNORE__ */
#endif  /* G_TREE_DEBUG */



#endif /* __G_TREE_H__ */
