/*
 * Copyright © 2011 Canonical Ltd.
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, see <http://www.gnu.org/licenses/>.
 *
 * Author: Ryan Lortie <desrt@desrt.ca>
 */

#ifndef __G_MENU_H__
#define __G_MENU_H__

#include <gio/gmenumodel.h>



#define G_TYPE_MENU          (g_menu_get_type ())
#define G_MENU(inst)         (G_TYPE_CHECK_INSTANCE_CAST ((inst), \
                              G_TYPE_MENU, GMenu))
#define G_IS_MENU(inst)      (G_TYPE_CHECK_INSTANCE_TYPE ((inst), \
                              G_TYPE_MENU))

#define G_TYPE_MENU_ITEM     (g_menu_item_get_type ())
#define G_MENU_ITEM(inst)    (G_TYPE_CHECK_INSTANCE_CAST ((inst), \
                              G_TYPE_MENU_ITEM, GMenuItem))
#define G_IS_MENU_ITEM(inst) (G_TYPE_CHECK_INSTANCE_TYPE ((inst), \
                              G_TYPE_MENU_ITEM))

typedef struct _GMenuItem GMenuItem;
typedef struct _GMenu     GMenu;


GType       g_menu_get_type                         (void) ;

GMenu *     g_menu_new                              (void);


void        g_menu_freeze                           (GMenu       *menu);


void        g_menu_insert_item                      (GMenu       *menu,
                                                     gint         position,
                                                     GMenuItem   *item);

void        g_menu_prepend_item                     (GMenu       *menu,
                                                     GMenuItem   *item);

void        g_menu_append_item                      (GMenu       *menu,
                                                     GMenuItem   *item);

void        g_menu_remove                           (GMenu       *menu,
                                                     gint         position);


void        g_menu_remove_all                       (GMenu       *menu);


void        g_menu_insert                           (GMenu       *menu,
                                                     gint         position,
                                                     const gchar *label,
                                                     const gchar *detailed_action);

void        g_menu_prepend                          (GMenu       *menu,
                                                     const gchar *label,
                                                     const gchar *detailed_action);

void        g_menu_append                           (GMenu       *menu,
                                                     const gchar *label,
                                                     const gchar *detailed_action);


void        g_menu_insert_section                   (GMenu       *menu,
                                                     gint         position,
                                                     const gchar *label,
                                                     GMenuModel  *section);

void        g_menu_prepend_section                  (GMenu       *menu,
                                                     const gchar *label,
                                                     GMenuModel  *section);

void        g_menu_append_section                   (GMenu       *menu,
                                                     const gchar *label,
                                                     GMenuModel  *section);


void        g_menu_insert_submenu                   (GMenu       *menu,
                                                     gint        position,
                                                     const gchar *label,
                                                     GMenuModel  *submenu);

void        g_menu_prepend_submenu                  (GMenu       *menu,
                                                     const gchar *label,
                                                     GMenuModel  *submenu);

void        g_menu_append_submenu                   (GMenu       *menu,
                                                     const gchar *label,
                                                     GMenuModel  *submenu);



GType       g_menu_item_get_type                    (void) ;

GMenuItem * g_menu_item_new                         (const gchar *label,
                                                     const gchar *detailed_action);


GMenuItem * g_menu_item_new_from_model              (GMenuModel  *model,
                                                     gint         item_index);


GMenuItem * g_menu_item_new_submenu                 (const gchar *label,
                                                     GMenuModel  *submenu);


GMenuItem * g_menu_item_new_section                 (const gchar *label,
                                                     GMenuModel  *section);


GVariant *  g_menu_item_get_attribute_value         (GMenuItem   *menu_item,
                                                     const gchar *attribute,
                                                     const GVariantType *expected_type);

gboolean    g_menu_item_get_attribute               (GMenuItem   *menu_item,
                                                     const gchar *attribute,
                                                     const gchar *format_string,
                                                     ...);

GMenuModel *g_menu_item_get_link                    (GMenuItem   *menu_item,
                                                     const gchar *link);


void        g_menu_item_set_attribute_value         (GMenuItem   *menu_item,
                                                     const gchar *attribute,
                                                     GVariant    *value);

void        g_menu_item_set_attribute               (GMenuItem   *menu_item,
                                                     const gchar *attribute,
                                                     const gchar *format_string,
                                                     ...);

void        g_menu_item_set_link                    (GMenuItem   *menu_item,
                                                     const gchar *link,
                                                     GMenuModel  *model);

void        g_menu_item_set_label                   (GMenuItem   *menu_item,
                                                     const gchar *label);

void        g_menu_item_set_submenu                 (GMenuItem   *menu_item,
                                                     GMenuModel  *submenu);

void        g_menu_item_set_section                 (GMenuItem   *menu_item,
                                                     GMenuModel  *section);

void        g_menu_item_set_action_and_target_value (GMenuItem   *menu_item,
                                                     const gchar *action,
                                                     GVariant    *target_value);

void        g_menu_item_set_action_and_target       (GMenuItem   *menu_item,
                                                     const gchar *action,
                                                     const gchar *format_string,
                                                     ...);

void        g_menu_item_set_detailed_action         (GMenuItem   *menu_item,
                                                     const gchar *detailed_action);


void        g_menu_item_set_icon                    (GMenuItem   *menu_item,
                                                     GIcon       *icon);



#endif /* __G_MENU_H__ */
