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

#ifndef __G_TIME_ZONE_H__
#define __G_TIME_ZONE_H__

#if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)
#error "Only <glib.h> can be included directly."
#endif

#include <glib/gerror.h>
#include <glib/gtypes.h>



typedef struct _GTimeZone GTimeZone;

/**
 * GTimeType:
 * @G_TIME_TYPE_STANDARD: the time is in local standard time
 * @G_TIME_TYPE_DAYLIGHT: the time is in local daylight time
 * @G_TIME_TYPE_UNIVERSAL: the time is in UTC
 *
 * Disambiguates a given time in two ways.
 *
 * First, specifies if the given time is in universal or local time.
 *
 * Second, if the time is in local time, specifies if it is local
 * standard time or local daylight time.  This is important for the case
 * where the same local time occurs twice (during daylight savings time
 * transitions, for example).
 */
typedef enum
{
  G_TIME_TYPE_STANDARD,
  G_TIME_TYPE_DAYLIGHT,
  G_TIME_TYPE_UNIVERSAL
} GTimeType;

GTimeZone *             g_time_zone_new                                 (const gchar *identifier);

GTimeZone *             g_time_zone_new_identifier                      (const gchar *identifier);

GTimeZone *             g_time_zone_new_utc                             (void);

GTimeZone *             g_time_zone_new_local                           (void);

GTimeZone *             g_time_zone_new_offset                          (gint32       seconds);


GTimeZone *             g_time_zone_ref                                 (GTimeZone   *tz);

void                    g_time_zone_unref                               (GTimeZone   *tz);


gint                    g_time_zone_find_interval                       (GTimeZone   *tz,
                                                                         GTimeType    type,
                                                                         gint64       time_);


gint                    g_time_zone_adjust_time                         (GTimeZone   *tz,
                                                                         GTimeType    type,
                                                                         gint64      *time_);


const gchar *           g_time_zone_get_abbreviation                    (GTimeZone   *tz,
                                                                         gint         interval);

gint32                  g_time_zone_get_offset                          (GTimeZone   *tz,
                                                                         gint         interval);

gboolean                g_time_zone_is_dst                              (GTimeZone   *tz,
                                                                         gint         interval);

const gchar *           g_time_zone_get_identifier                      (GTimeZone   *tz);



#endif /* __G_TIME_ZONE_H__ */
