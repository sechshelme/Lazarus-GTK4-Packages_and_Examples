/*
 * Copyright © 2010 Codethink Limited
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
 * Authors: Ryan Lortie <desrt@desrt.ca>
 */

#ifndef __G_SIMPLE_ACTION_GROUP_H__
#define __G_SIMPLE_ACTION_GROUP_H__

#if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)
#error "Only <gio/gio.h> can be included directly."
#endif

#include "gactiongroup.h"
#include "gactionmap.h"



#define G_TYPE_SIMPLE_ACTION_GROUP                          (g_simple_action_group_get_type ())
#define G_SIMPLE_ACTION_GROUP(inst)                         (G_TYPE_CHECK_INSTANCE_CAST ((inst),                     \
                                                             G_TYPE_SIMPLE_ACTION_GROUP, GSimpleActionGroup))
#define G_SIMPLE_ACTION_GROUP_CLASS(class)                  (G_TYPE_CHECK_CLASS_CAST ((class),                       \
                                                             G_TYPE_SIMPLE_ACTION_GROUP, GSimpleActionGroupClass))
#define G_IS_SIMPLE_ACTION_GROUP(inst)                      (G_TYPE_CHECK_INSTANCE_TYPE ((inst),                     \
                                                             G_TYPE_SIMPLE_ACTION_GROUP))
#define G_IS_SIMPLE_ACTION_GROUP_CLASS(class)               (G_TYPE_CHECK_CLASS_TYPE ((class),                       \
                                                             G_TYPE_SIMPLE_ACTION_GROUP))
#define G_SIMPLE_ACTION_GROUP_GET_CLASS(inst)               (G_TYPE_INSTANCE_GET_CLASS ((inst),                      \
                                                             G_TYPE_SIMPLE_ACTION_GROUP, GSimpleActionGroupClass))

typedef struct _GSimpleActionGroupPrivate                   GSimpleActionGroupPrivate;
typedef struct _GSimpleActionGroupClass                     GSimpleActionGroupClass;

struct _GSimpleActionGroup
{
  /*< private >*/
  GObject parent_instance;

  GSimpleActionGroupPrivate *priv;
};

struct _GSimpleActionGroupClass
{
  /*< private >*/
  GObjectClass parent_class;

  /*< private >*/
  gpointer padding[12];
};


GType                   g_simple_action_group_get_type                  (void) ;


GSimpleActionGroup *    g_simple_action_group_new                       (void);

GAction *               g_simple_action_group_lookup                    (GSimpleActionGroup *simple,
                                                                         const gchar        *action_name);

void                    g_simple_action_group_insert                    (GSimpleActionGroup *simple,
                                                                         GAction            *action);

void                    g_simple_action_group_remove                    (GSimpleActionGroup *simple,
                                                                         const gchar        *action_name);

void                    g_simple_action_group_add_entries               (GSimpleActionGroup *simple,
                                                                         const GActionEntry *entries,
                                                                         gint                n_entries,
                                                                         gpointer            user_data);



#endif /* __G_SIMPLE_ACTION_GROUP_H__ */
