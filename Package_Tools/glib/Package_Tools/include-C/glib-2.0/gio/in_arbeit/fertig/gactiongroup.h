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

#ifndef __G_ACTION_GROUP_H__
#define __G_ACTION_GROUP_H__

#if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)
#error "Only <gio/gio.h> can be included directly."
#endif

#include <gio/giotypes.h>




#define G_TYPE_ACTION_GROUP                                 (g_action_group_get_type ())
#define G_ACTION_GROUP(inst)                                (G_TYPE_CHECK_INSTANCE_CAST ((inst),                     \
                                                             G_TYPE_ACTION_GROUP, GActionGroup))
#define G_IS_ACTION_GROUP(inst)                             (G_TYPE_CHECK_INSTANCE_TYPE ((inst),                     \
                                                             G_TYPE_ACTION_GROUP))
#define G_ACTION_GROUP_GET_IFACE(inst)                      (G_TYPE_INSTANCE_GET_INTERFACE ((inst),                  \
                                                             G_TYPE_ACTION_GROUP, GActionGroupInterface))

typedef struct _GActionGroupInterface                       GActionGroupInterface;

struct _GActionGroupInterface
{
  GTypeInterface g_iface;

  /* virtual functions */
  gboolean              (* has_action)                 (GActionGroup  *action_group,
                                                        const gchar   *action_name);

  gchar **              (* list_actions)               (GActionGroup  *action_group);

  gboolean              (* get_action_enabled)         (GActionGroup  *action_group,
                                                        const gchar   *action_name);

  const GVariantType *  (* get_action_parameter_type)  (GActionGroup  *action_group,
                                                        const gchar   *action_name);

  const GVariantType *  (* get_action_state_type)      (GActionGroup  *action_group,
                                                        const gchar   *action_name);

  GVariant *            (* get_action_state_hint)      (GActionGroup  *action_group,
                                                        const gchar   *action_name);

  GVariant *            (* get_action_state)           (GActionGroup  *action_group,
                                                        const gchar   *action_name);

  void                  (* change_action_state)        (GActionGroup  *action_group,
                                                        const gchar   *action_name,
                                                        GVariant      *value);

  void                  (* activate_action)            (GActionGroup  *action_group,
                                                        const gchar   *action_name,
                                                        GVariant      *parameter);

  /* signals */
  void                  (* action_added)               (GActionGroup  *action_group,
                                                        const gchar   *action_name);
  void                  (* action_removed)             (GActionGroup  *action_group,
                                                        const gchar   *action_name);
  void                  (* action_enabled_changed)     (GActionGroup  *action_group,
                                                        const gchar   *action_name,
                                                        gboolean       enabled);
  void                  (* action_state_changed)       (GActionGroup   *action_group,
                                                        const gchar    *action_name,
                                                        GVariant       *state);

  /* more virtual functions */
  gboolean              (* query_action)               (GActionGroup        *action_group,
                                                        const gchar         *action_name,
                                                        gboolean            *enabled,
                                                        const GVariantType **parameter_type,
                                                        const GVariantType **state_type,
                                                        GVariant           **state_hint,
                                                        GVariant           **state);
};


GType                   g_action_group_get_type                         (void) ;


gboolean                g_action_group_has_action                       (GActionGroup *action_group,
                                                                         const gchar  *action_name);

gchar **                g_action_group_list_actions                     (GActionGroup *action_group);


const GVariantType *    g_action_group_get_action_parameter_type        (GActionGroup *action_group,
                                                                         const gchar  *action_name);

const GVariantType *    g_action_group_get_action_state_type            (GActionGroup *action_group,
                                                                         const gchar  *action_name);

GVariant *              g_action_group_get_action_state_hint            (GActionGroup *action_group,
                                                                         const gchar  *action_name);


gboolean                g_action_group_get_action_enabled               (GActionGroup *action_group,
                                                                         const gchar  *action_name);


GVariant *              g_action_group_get_action_state                 (GActionGroup *action_group,
                                                                         const gchar  *action_name);

void                    g_action_group_change_action_state              (GActionGroup *action_group,
                                                                         const gchar  *action_name,
                                                                         GVariant     *value);


void                    g_action_group_activate_action                  (GActionGroup *action_group,
                                                                         const gchar  *action_name,
                                                                         GVariant     *parameter);

/* signals */

void                    g_action_group_action_added                     (GActionGroup *action_group,
                                                                         const gchar  *action_name);

void                    g_action_group_action_removed                   (GActionGroup *action_group,
                                                                         const gchar  *action_name);

void                    g_action_group_action_enabled_changed           (GActionGroup *action_group,
                                                                         const gchar  *action_name,
                                                                         gboolean      enabled);


void                    g_action_group_action_state_changed             (GActionGroup *action_group,
                                                                         const gchar  *action_name,
                                                                         GVariant     *state);

gboolean                g_action_group_query_action                     (GActionGroup        *action_group,
                                                                         const gchar         *action_name,
                                                                         gboolean            *enabled,
                                                                         const GVariantType **parameter_type,
                                                                         const GVariantType **state_type,
                                                                         GVariant           **state_hint,
                                                                         GVariant           **state) ;



#endif /* __G_ACTION_GROUP_H__ */
