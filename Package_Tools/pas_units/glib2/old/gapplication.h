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

#ifndef __G_APPLICATION_H__
#define __G_APPLICATION_H__

#if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)
#error "Only <gio/gio.h> can be included directly."
#endif

#include <gio/giotypes.h>


#define G_TYPE_APPLICATION                                  (g_application_get_type ())
#define G_APPLICATION(inst)                                 (G_TYPE_CHECK_INSTANCE_CAST ((inst),                     \
                                                             G_TYPE_APPLICATION, GApplication))
#define G_APPLICATION_CLASS(class)                          (G_TYPE_CHECK_CLASS_CAST ((class),                       \
                                                             G_TYPE_APPLICATION, GApplicationClass))
#define G_IS_APPLICATION(inst)                              (G_TYPE_CHECK_INSTANCE_TYPE ((inst), G_TYPE_APPLICATION))
#define G_IS_APPLICATION_CLASS(class)                       (G_TYPE_CHECK_CLASS_TYPE ((class), G_TYPE_APPLICATION))
#define G_APPLICATION_GET_CLASS(inst)                       (G_TYPE_INSTANCE_GET_CLASS ((inst),                      \
                                                             G_TYPE_APPLICATION, GApplicationClass))

typedef struct _GApplicationPrivate                         GApplicationPrivate;
typedef struct _GApplicationClass                           GApplicationClass;

struct _GApplication
{
  /*< private >*/
  GObject parent_instance;

  GApplicationPrivate *priv;
};

struct _GApplicationClass
{
  /*< private >*/
  GObjectClass parent_class;

  /*< public >*/
  /* signals */
  void                      (* startup)             (GApplication              *application);

  void                      (* activate)            (GApplication              *application);

  void                      (* open)                (GApplication              *application,
                                                     GFile                    **files,
                                                     gint                       n_files,
                                                     const gchar               *hint);

  int                       (* command_line)        (GApplication              *application,
                                                     GApplicationCommandLine   *command_line);

  /* vfuncs */

  /**
   * GApplicationClass::local_command_line:
   * @application: a #GApplication
   * @arguments: (inout) (array zero-terminated=1): array of command line arguments
   * @exit_status: (out): exit status to fill after processing the command line.
   *
   * This virtual function is always invoked in the local instance. It
   * gets passed a pointer to a %NULL-terminated copy of @argv and is
   * expected to remove arguments that it handled (shifting up remaining
   * arguments).
   *
   * The last argument to local_command_line() is a pointer to the @status
   * variable which can used to set the exit status that is returned from
   * g_application_run().
   *
   * See g_application_run() for more details on #GApplication startup.
   *
   * Returns: %TRUE if the commandline has been completely handled
   */
  gboolean                  (* local_command_line)  (GApplication              *application,
                                                     gchar                   ***arguments,
                                                     int                       *exit_status);

  /* @platform_data comes from an external process and is untrusted. All value types
   * must be validated before being used. */
  void                      (* before_emit)         (GApplication              *application,
                                                     GVariant                  *platform_data);
  /* Same as for @before_emit. */
  void                      (* after_emit)          (GApplication              *application,
                                                     GVariant                  *platform_data);
  void                      (* add_platform_data)   (GApplication              *application,
                                                     GVariantBuilder           *builder);
  void                      (* quit_mainloop)       (GApplication              *application);
  void                      (* run_mainloop)        (GApplication              *application);
  void                      (* shutdown)            (GApplication              *application);

  gboolean                  (* dbus_register)       (GApplication              *application,
                                                     GDBusConnection           *connection,
                                                     const gchar               *object_path,
                                                     GError                   **error);
  void                      (* dbus_unregister)     (GApplication              *application,
                                                     GDBusConnection           *connection,
                                                     const gchar               *object_path);
  gint                      (* handle_local_options)(GApplication              *application,
                                                     GVariantDict              *options);
  gboolean                  (* name_lost)           (GApplication              *application);

  /*< private >*/
  gpointer padding[7];
};

GType                   g_application_get_type                          (void);

gboolean                g_application_id_is_valid                       (const gchar              *application_id);

GApplication *          g_application_new                               (const gchar              *application_id,
                                                                         GApplicationFlags         flags);

const gchar *           g_application_get_application_id                (GApplication             *application);
void                    g_application_set_application_id                (GApplication             *application,
                                                                         const gchar              *application_id);

const gchar *           g_application_get_version                       (GApplication             *application);
void                    g_application_set_version                       (GApplication             *application,
                                                                         const gchar              *version);

GDBusConnection *       g_application_get_dbus_connection               (GApplication             *application);
const gchar *           g_application_get_dbus_object_path              (GApplication             *application);

guint                   g_application_get_inactivity_timeout            (GApplication             *application);
void                    g_application_set_inactivity_timeout            (GApplication             *application,
                                                                         guint                     inactivity_timeout);

GApplicationFlags       g_application_get_flags                         (GApplication             *application);
void                    g_application_set_flags                         (GApplication             *application,
                                                                         GApplicationFlags         flags);

const gchar *           g_application_get_resource_base_path            (GApplication             *application);
void                    g_application_set_resource_base_path            (GApplication             *application,
                                                                         const gchar              *resource_path);

void                    g_application_set_action_group                  (GApplication             *application,
                                                                         GActionGroup             *action_group);

void                    g_application_add_main_option_entries           (GApplication             *application,
                                                                         const GOptionEntry       *entries);

void                    g_application_add_main_option                   (GApplication             *application,
                                                                         const char               *long_name,
                                                                         char                      short_name,
                                                                         GOptionFlags              flags,
                                                                         GOptionArg                arg,
                                                                         const char               *description,
                                                                         const char               *arg_description);
void                    g_application_add_option_group                  (GApplication             *application,
                                                                         GOptionGroup             *group);
void                    g_application_set_option_context_parameter_string (GApplication             *application,
                                                                           const gchar              *parameter_string);
void                    g_application_set_option_context_summary        (GApplication             *application,
                                                                         const gchar              *summary);
void                    g_application_set_option_context_description    (GApplication             *application,
                                                                         const gchar              *description);
gboolean                g_application_get_is_registered                 (GApplication             *application);
gboolean                g_application_get_is_remote                     (GApplication             *application);

gboolean                g_application_register                          (GApplication             *application,
                                                                         GCancellable             *cancellable,
                                                                         GError                  **error);

void                    g_application_hold                              (GApplication             *application);
void                    g_application_release                           (GApplication             *application);

void                    g_application_activate                          (GApplication             *application);

void                    g_application_open                              (GApplication             *application,
                                                                         GFile                   **files,
                                                                         gint                      n_files,
                                                                         const gchar              *hint);

int                     g_application_run                               (GApplication             *application,
                                                                         int                       argc,
                                                                         char                    **argv);

void                    g_application_quit                              (GApplication             *application);

GApplication *          g_application_get_default                       (void);
void                    g_application_set_default                       (GApplication             *application);

void                    g_application_mark_busy                         (GApplication             *application);
void                    g_application_unmark_busy                       (GApplication             *application);
gboolean                g_application_get_is_busy                       (GApplication             *application);

void                    g_application_send_notification                 (GApplication             *application,
                                                                         const gchar              *id,
                                                                         GNotification            *notification);
void                    g_application_withdraw_notification             (GApplication             *application,
                                                                         const gchar              *id);

void                    g_application_bind_busy_property                (GApplication             *application,
                                                                         gpointer                  object,
                                                                         const gchar              *property);

void                    g_application_unbind_busy_property              (GApplication             *application,
                                                                         gpointer                  object,
                                                                         const gchar              *property);


#endif /* __G_APPLICATION_H__ */
