/* -*- Mode: C; c-file-style: "gnu"; tab-width: 8 -*- */
/* GTK - The GIMP Toolkit
 * Copyright (C) 1995-1997 Peter Mattis, Spencer Kimball and Josh MacDonald
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

#include <gtk/gtkwidget.h>




typedef struct _GtkDropTargetAsync GtkDropTargetAsync;
typedef struct _GtkDropTargetAsyncClass GtkDropTargetAsyncClass;


#define GTK_TYPE_DROP_TARGET_ASYNC         (gtk_drop_target_async_get_type ())
#define GTK_DROP_TARGET_ASYNC(o)           (G_TYPE_CHECK_INSTANCE_CAST ((o), GTK_TYPE_DROP_TARGET_ASYNC, GtkDropTargetAsync))
#define GTK_DROP_TARGET_ASYNC_CLASS(k)     (G_TYPE_CHECK_CLASS_CAST ((k), GTK_TYPE_DROP_TARGET_ASYNC, GtkDropTargetAsyncClass))
#define GTK_IS_DROP_TARGET_ASYNC(o)        (G_TYPE_CHECK_INSTANCE_TYPE ((o), GTK_TYPE_DROP_TARGET_ASYNC))
#define GTK_IS_DROP_TARGET_ASYNC_CLASS(k)  (G_TYPE_CHECK_CLASS_TYPE ((k), GTK_TYPE_DROP_TARGET_ASYNC))
#define GTK_DROP_TARGET_ASYNC_GET_CLASS(o) (G_TYPE_INSTANCE_GET_CLASS ((o), GTK_TYPE_DROP_TARGET_ASYNC, GtkDropTargetAsyncClass))



GType                   gtk_drop_target_async_get_type          (void) ;


GtkDropTargetAsync *    gtk_drop_target_async_new               (GdkContentFormats      *formats,
                                                                 GdkDragAction           actions);


void                    gtk_drop_target_async_set_formats       (GtkDropTargetAsync     *self,
                                                                 GdkContentFormats      *formats);

GdkContentFormats *     gtk_drop_target_async_get_formats       (GtkDropTargetAsync     *self);


void                    gtk_drop_target_async_set_actions       (GtkDropTargetAsync     *self,
                                                                 GdkDragAction           actions);

GdkDragAction           gtk_drop_target_async_get_actions       (GtkDropTargetAsync     *self);


void                    gtk_drop_target_async_reject_drop       (GtkDropTargetAsync     *self,
                                                                 GdkDrop                *drop);




