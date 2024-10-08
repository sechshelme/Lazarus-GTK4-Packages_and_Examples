/* GTK - The GIMP Toolkit
 * Copyright (C) Christian Kellner <gicmo@gnome.org>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
 */

/*
 * Modified by the GTK+ Team and others 1997-2000.  See the AUTHORS
 * file for a list of people on the GTK+ Team.  See the ChangeLog
 * files for a list of changes.  These files are distributed with
 * GTK+ at ftp://ftp.gtk.org/pub/gtk/.
 */

#pragma once

#if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)
#error "Only <gtk/gtk.h> can be included directly."
#endif



#define GTK_TYPE_MOUNT_OPERATION         (gtk_mount_operation_get_type ())
#define GTK_MOUNT_OPERATION(o)           (G_TYPE_CHECK_INSTANCE_CAST ((o), GTK_TYPE_MOUNT_OPERATION, GtkMountOperation))
#define GTK_MOUNT_OPERATION_CLASS(k)     (G_TYPE_CHECK_CLASS_CAST((k), GTK_TYPE_MOUNT_OPERATION, GtkMountOperationClass))
#define GTK_IS_MOUNT_OPERATION(o)        (G_TYPE_CHECK_INSTANCE_TYPE ((o), GTK_TYPE_MOUNT_OPERATION))
#define GTK_IS_MOUNT_OPERATION_CLASS(k)  (G_TYPE_CHECK_CLASS_TYPE ((k), GTK_TYPE_MOUNT_OPERATION))
#define GTK_MOUNT_OPERATION_GET_CLASS(o) (G_TYPE_INSTANCE_GET_CLASS ((o), GTK_TYPE_MOUNT_OPERATION, GtkMountOperationClass))

typedef struct _GtkMountOperation         GtkMountOperation;
typedef struct _GtkMountOperationClass    GtkMountOperationClass;
typedef struct _GtkMountOperationPrivate  GtkMountOperationPrivate;

struct _GtkMountOperation
{
  GMountOperation parent_instance;

  GtkMountOperationPrivate *priv;
};

/**
 * GtkMountOperationClass:
 * @parent_class: The parent class.
 */
struct _GtkMountOperationClass
{
  GMountOperationClass parent_class;

  /*< private >*/

  /* Padding for future expansion */
  void (*_gtk_reserved1) (void);
  void (*_gtk_reserved2) (void);
  void (*_gtk_reserved3) (void);
  void (*_gtk_reserved4) (void);
};



GType            gtk_mount_operation_get_type   (void);

GMountOperation *gtk_mount_operation_new        (GtkWindow         *parent);

gboolean         gtk_mount_operation_is_showing (GtkMountOperation *op);

void             gtk_mount_operation_set_parent (GtkMountOperation *op,
                                                 GtkWindow         *parent);

GtkWindow *      gtk_mount_operation_get_parent (GtkMountOperation *op);

void             gtk_mount_operation_set_display(GtkMountOperation *op,
                                                 GdkDisplay        *display);

GdkDisplay *     gtk_mount_operation_get_display(GtkMountOperation *op);





