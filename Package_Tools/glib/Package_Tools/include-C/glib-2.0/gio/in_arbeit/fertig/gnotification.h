/*
 * Copyright © 2013 Lars Uebernickel
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
 * Authors: Lars Uebernickel <lars@uebernic.de>
 */

#ifndef __G_NOTIFICATION_H__
#define __G_NOTIFICATION_H__

#if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)
#error "Only <gio/gio.h> can be included directly."
#endif

#include <gio/giotypes.h>
#include <gio/gioenums.h>



#define G_TYPE_NOTIFICATION         (g_notification_get_type ())
#define G_NOTIFICATION(o)           (G_TYPE_CHECK_INSTANCE_CAST ((o), G_TYPE_NOTIFICATION, GNotification))
#define G_IS_NOTIFICATION(o)        (G_TYPE_CHECK_INSTANCE_TYPE ((o), G_TYPE_NOTIFICATION))


GType                   g_notification_get_type                         (void) ;


GNotification *         g_notification_new                              (const gchar *title);


void                    g_notification_set_title                        (GNotification *notification,
                                                                         const gchar   *title);


void                    g_notification_set_body                         (GNotification *notification,
                                                                         const gchar   *body);


void                    g_notification_set_icon                         (GNotification *notification,
                                                                         GIcon         *icon);

void                    g_notification_set_urgent                       (GNotification *notification,
                                                                         gboolean       urgent);

void                    g_notification_set_priority                     (GNotification         *notification,
                                                                         GNotificationPriority  priority);

void                    g_notification_set_category                     (GNotification *notification,
                                                                         const gchar   *category);


void                    g_notification_add_button                       (GNotification *notification,
                                                                         const gchar   *label,
                                                                         const gchar   *detailed_action);


void                    g_notification_add_button_with_target           (GNotification *notification,
                                                                         const gchar   *label,
                                                                         const gchar   *action,
                                                                         const gchar   *target_format,
                                                                         ...);


void                    g_notification_add_button_with_target_value     (GNotification *notification,
                                                                         const gchar   *label,
                                                                         const gchar   *action,
                                                                         GVariant      *target);


void                    g_notification_set_default_action               (GNotification *notification,
                                                                         const gchar   *detailed_action);


void                    g_notification_set_default_action_and_target    (GNotification *notification,
                                                                         const gchar   *action,
                                                                         const gchar   *target_format,
                                                                         ...);


void                 g_notification_set_default_action_and_target_value (GNotification *notification,
                                                                         const gchar   *action,
                                                                         GVariant      *target);



#endif
