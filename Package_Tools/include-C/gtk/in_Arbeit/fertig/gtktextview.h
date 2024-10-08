/* GTK - The GIMP Toolkit
 * gtktextview.h Copyright (C) 2000 Red Hat, Inc.
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
#include <gtk/gtkimcontext.h>
#include <gtk/gtktextbuffer.h>



#define GTK_TYPE_TEXT_VIEW             (gtk_text_view_get_type ())
#define GTK_TEXT_VIEW(obj)             (G_TYPE_CHECK_INSTANCE_CAST ((obj), GTK_TYPE_TEXT_VIEW, GtkTextView))
#define GTK_TEXT_VIEW_CLASS(klass)     (G_TYPE_CHECK_CLASS_CAST ((klass), GTK_TYPE_TEXT_VIEW, GtkTextViewClass))
#define GTK_IS_TEXT_VIEW(obj)          (G_TYPE_CHECK_INSTANCE_TYPE ((obj), GTK_TYPE_TEXT_VIEW))
#define GTK_IS_TEXT_VIEW_CLASS(klass)  (G_TYPE_CHECK_CLASS_TYPE ((klass), GTK_TYPE_TEXT_VIEW))
#define GTK_TEXT_VIEW_GET_CLASS(obj)   (G_TYPE_INSTANCE_GET_CLASS ((obj), GTK_TYPE_TEXT_VIEW, GtkTextViewClass))

/**
 * GtkTextWindowType:
 * @GTK_TEXT_WINDOW_WIDGET: Window that floats over scrolling areas.
 * @GTK_TEXT_WINDOW_TEXT: Scrollable text window.
 * @GTK_TEXT_WINDOW_LEFT: Left side border window.
 * @GTK_TEXT_WINDOW_RIGHT: Right side border window.
 * @GTK_TEXT_WINDOW_TOP: Top border window.
 * @GTK_TEXT_WINDOW_BOTTOM: Bottom border window.
 *
 * Used to reference the parts of `GtkTextView`.
 */
typedef enum
{
  GTK_TEXT_WINDOW_WIDGET = 1,
  GTK_TEXT_WINDOW_TEXT,
  GTK_TEXT_WINDOW_LEFT,
  GTK_TEXT_WINDOW_RIGHT,
  GTK_TEXT_WINDOW_TOP,
  GTK_TEXT_WINDOW_BOTTOM
} GtkTextWindowType;

/**
 * GtkTextViewLayer:
 * @GTK_TEXT_VIEW_LAYER_BELOW_TEXT: The layer rendered below the text (but above the background).
 * @GTK_TEXT_VIEW_LAYER_ABOVE_TEXT: The layer rendered above the text.
 *
 * Used to reference the layers of `GtkTextView` for the purpose of customized
 * drawing with the ::snapshot_layer vfunc.
 */
typedef enum
{
  GTK_TEXT_VIEW_LAYER_BELOW_TEXT,
  GTK_TEXT_VIEW_LAYER_ABOVE_TEXT
} GtkTextViewLayer;

/**
 * GtkTextExtendSelection:
 * @GTK_TEXT_EXTEND_SELECTION_WORD: Selects the current word. It is triggered by
 *   a double-click for example.
 * @GTK_TEXT_EXTEND_SELECTION_LINE: Selects the current line. It is triggered by
 *   a triple-click for example.
 *
 * Granularity types that extend the text selection. Use the
 * `GtkTextView::extend-selection` signal to customize the selection.
 */
typedef enum
{
  GTK_TEXT_EXTEND_SELECTION_WORD,
  GTK_TEXT_EXTEND_SELECTION_LINE
} GtkTextExtendSelection;

/**
 * GTK_TEXT_VIEW_PRIORITY_VALIDATE: (value 125)
 *
 * The priority at which the text view validates onscreen lines
 * in an idle job in the background.
 */
#define GTK_TEXT_VIEW_PRIORITY_VALIDATE (GDK_PRIORITY_REDRAW + 5)

typedef struct _GtkTextView        GtkTextView;
typedef struct _GtkTextViewPrivate GtkTextViewPrivate;
typedef struct _GtkTextViewClass   GtkTextViewClass;

struct _GtkTextView
{
  GtkWidget parent_instance;

  /*< private >*/

  GtkTextViewPrivate *priv;
};

/**
 * GtkTextViewClass:
 * @parent_class: The object class structure needs to be the first
 * @move_cursor: The class handler for the `GtkTextView::move-cursor`
 *   keybinding signal.
 * @set_anchor: The class handler for the `GtkTextView::set-anchor`
 *   keybinding signal.
 * @insert_at_cursor: The class handler for the `GtkTextView::insert-at-cursor`
 *   keybinding signal.
 * @delete_from_cursor: The class handler for the `GtkTextView::delete-from-cursor`
 *   keybinding signal.
 * @backspace: The class handler for the `GtkTextView::backspace`
 *   keybinding signal.
 * @cut_clipboard: The class handler for the `GtkTextView::cut-clipboard`
 *   keybinding signal
 * @copy_clipboard: The class handler for the `GtkTextView::copy-clipboard`
 *   keybinding signal.
 * @paste_clipboard: The class handler for the `GtkTextView::paste-clipboard`
 *   keybinding signal.
 * @toggle_overwrite: The class handler for the `GtkTextView::toggle-overwrite`
 *   keybinding signal.
 * @create_buffer: The create_buffer vfunc is called to create a `GtkTextBuffer`
 *   for the text view. The default implementation is to just call
 *   gtk_text_buffer_new().
 * @snapshot_layer: The snapshot_layer vfunc is called before and after the text
 *   view is drawing its own text. Applications can override this vfunc
 *   in a subclass to draw customized content underneath or above the
 *   text. In the %GTK_TEXT_VIEW_LAYER_BELOW_TEXT and %GTK_TEXT_VIEW_LAYER_ABOVE_TEXT
 *   layers the drawing is done in the buffer coordinate space.
 * @extend_selection: The class handler for the `GtkTextView::extend-selection` signal.
 * @insert_emoji: The class handler for the `GtkTextView::insert-emoji` signal.
 */
struct _GtkTextViewClass
{
  GtkWidgetClass parent_class;

  /*< public >*/

  void (* move_cursor)           (GtkTextView      *text_view,
                                  GtkMovementStep   step,
                                  int               count,
                                  gboolean          extend_selection);
  void (* set_anchor)            (GtkTextView      *text_view);
  void (* insert_at_cursor)      (GtkTextView      *text_view,
                                  const char       *str);
  void (* delete_from_cursor)    (GtkTextView      *text_view,
                                  GtkDeleteType     type,
                                  int               count);
  void (* backspace)             (GtkTextView      *text_view);
  void (* cut_clipboard)         (GtkTextView      *text_view);
  void (* copy_clipboard)        (GtkTextView      *text_view);
  void (* paste_clipboard)       (GtkTextView      *text_view);
  void (* toggle_overwrite)      (GtkTextView      *text_view);
  GtkTextBuffer * (* create_buffer) (GtkTextView   *text_view);
  void (* snapshot_layer)        (GtkTextView      *text_view,
			          GtkTextViewLayer  layer,
			          GtkSnapshot      *snapshot);
  gboolean (* extend_selection)  (GtkTextView            *text_view,
                                  GtkTextExtendSelection  granularity,
                                  const GtkTextIter      *location,
                                  GtkTextIter            *start,
                                  GtkTextIter            *end);
  void (* insert_emoji)          (GtkTextView      *text_view);

  /*< private >*/

  gpointer padding[8];
};


GType          gtk_text_view_get_type              (void) ;

GtkWidget *    gtk_text_view_new                   (void);

GtkWidget *    gtk_text_view_new_with_buffer       (GtkTextBuffer *buffer);

void           gtk_text_view_set_buffer            (GtkTextView   *text_view,
                                                    GtkTextBuffer *buffer);

GtkTextBuffer *gtk_text_view_get_buffer            (GtkTextView   *text_view);

gboolean       gtk_text_view_scroll_to_iter        (GtkTextView   *text_view,
                                                    GtkTextIter   *iter,
                                                    double         within_margin,
                                                    gboolean       use_align,
                                                    double         xalign,
                                                    double         yalign);

void           gtk_text_view_scroll_to_mark        (GtkTextView   *text_view,
                                                    GtkTextMark   *mark,
                                                    double         within_margin,
                                                    gboolean       use_align,
                                                    double         xalign,
                                                    double         yalign);

void           gtk_text_view_scroll_mark_onscreen  (GtkTextView   *text_view,
                                                    GtkTextMark   *mark);

gboolean       gtk_text_view_move_mark_onscreen    (GtkTextView   *text_view,
                                                    GtkTextMark   *mark);

gboolean       gtk_text_view_place_cursor_onscreen (GtkTextView   *text_view);


void           gtk_text_view_get_visible_rect      (GtkTextView   *text_view,
                                                    GdkRectangle  *visible_rect);

void           gtk_text_view_set_cursor_visible    (GtkTextView   *text_view,
                                                    gboolean       setting);

gboolean       gtk_text_view_get_cursor_visible    (GtkTextView   *text_view);


void           gtk_text_view_reset_cursor_blink    (GtkTextView   *text_view);


void           gtk_text_view_get_cursor_locations  (GtkTextView       *text_view,
                                                    const GtkTextIter *iter,
                                                    GdkRectangle      *strong,
                                                    GdkRectangle      *weak);

void           gtk_text_view_get_iter_location     (GtkTextView   *text_view,
                                                    const GtkTextIter *iter,
                                                    GdkRectangle  *location);

gboolean       gtk_text_view_get_iter_at_location  (GtkTextView   *text_view,
                                                    GtkTextIter   *iter,
                                                    int            x,
                                                    int            y);

gboolean       gtk_text_view_get_iter_at_position  (GtkTextView   *text_view,
                                                    GtkTextIter   *iter,
						    int           *trailing,
                                                    int            x,
                                                    int            y);

void           gtk_text_view_get_line_yrange       (GtkTextView       *text_view,
                                                    const GtkTextIter *iter,
                                                    int               *y,
                                                    int               *height);


void           gtk_text_view_get_line_at_y         (GtkTextView       *text_view,
                                                    GtkTextIter       *target_iter,
                                                    int                y,
                                                    int               *line_top);


void gtk_text_view_buffer_to_window_coords (GtkTextView       *text_view,
                                            GtkTextWindowType  win,
                                            int                buffer_x,
                                            int                buffer_y,
                                            int               *window_x,
                                            int               *window_y);

void gtk_text_view_window_to_buffer_coords (GtkTextView       *text_view,
                                            GtkTextWindowType  win,
                                            int                window_x,
                                            int                window_y,
                                            int               *buffer_x,
                                            int               *buffer_y);


gboolean gtk_text_view_forward_display_line           (GtkTextView       *text_view,
                                                       GtkTextIter       *iter);

gboolean gtk_text_view_backward_display_line          (GtkTextView       *text_view,
                                                       GtkTextIter       *iter);

gboolean gtk_text_view_forward_display_line_end       (GtkTextView       *text_view,
                                                       GtkTextIter       *iter);

gboolean gtk_text_view_backward_display_line_start    (GtkTextView       *text_view,
                                                       GtkTextIter       *iter);

gboolean gtk_text_view_starts_display_line            (GtkTextView       *text_view,
                                                       const GtkTextIter *iter);

gboolean gtk_text_view_move_visually                  (GtkTextView       *text_view,
                                                       GtkTextIter       *iter,
                                                       int                count);


gboolean        gtk_text_view_im_context_filter_keypress (GtkTextView    *text_view,
                                                          GdkEvent       *event);

void            gtk_text_view_reset_im_context           (GtkTextView    *text_view);

/* Adding child widgets */

GtkWidget *gtk_text_view_get_gutter          (GtkTextView          *text_view,
                                              GtkTextWindowType     win);

void       gtk_text_view_set_gutter          (GtkTextView          *text_view,
                                              GtkTextWindowType     win,
                                              GtkWidget            *widget);

void       gtk_text_view_add_child_at_anchor (GtkTextView          *text_view,
                                              GtkWidget            *child,
                                              GtkTextChildAnchor   *anchor);


void       gtk_text_view_add_overlay         (GtkTextView          *text_view,
                                              GtkWidget            *child,
                                              int                   xpos,
                                              int                   ypos);


void       gtk_text_view_move_overlay        (GtkTextView          *text_view,
                                              GtkWidget            *child,
                                              int                   xpos,
                                              int                   ypos);


void       gtk_text_view_remove              (GtkTextView          *text_view,
                                              GtkWidget            *child);

/* Default style settings (fallbacks if no tag affects the property) */


void             gtk_text_view_set_wrap_mode          (GtkTextView      *text_view,
                                                       GtkWrapMode       wrap_mode);

GtkWrapMode      gtk_text_view_get_wrap_mode          (GtkTextView      *text_view);

void             gtk_text_view_set_editable           (GtkTextView      *text_view,
                                                       gboolean          setting);

gboolean         gtk_text_view_get_editable           (GtkTextView      *text_view);

void             gtk_text_view_set_overwrite          (GtkTextView      *text_view,
						       gboolean          overwrite);

gboolean         gtk_text_view_get_overwrite          (GtkTextView      *text_view);

void		 gtk_text_view_set_accepts_tab        (GtkTextView	*text_view,
						       gboolean		 accepts_tab);

gboolean	 gtk_text_view_get_accepts_tab        (GtkTextView	*text_view);

void             gtk_text_view_set_pixels_above_lines (GtkTextView      *text_view,
                                                       int               pixels_above_lines);

int              gtk_text_view_get_pixels_above_lines (GtkTextView      *text_view);

void             gtk_text_view_set_pixels_below_lines (GtkTextView      *text_view,
                                                       int               pixels_below_lines);

int              gtk_text_view_get_pixels_below_lines (GtkTextView      *text_view);

void             gtk_text_view_set_pixels_inside_wrap (GtkTextView      *text_view,
                                                       int               pixels_inside_wrap);

int              gtk_text_view_get_pixels_inside_wrap (GtkTextView      *text_view);

void             gtk_text_view_set_justification      (GtkTextView      *text_view,
                                                       GtkJustification  justification);

GtkJustification gtk_text_view_get_justification      (GtkTextView      *text_view);

void             gtk_text_view_set_left_margin        (GtkTextView      *text_view,
                                                       int               left_margin);

int              gtk_text_view_get_left_margin        (GtkTextView      *text_view);

void             gtk_text_view_set_right_margin       (GtkTextView      *text_view,
                                                       int               right_margin);

int              gtk_text_view_get_right_margin       (GtkTextView      *text_view);

void             gtk_text_view_set_top_margin         (GtkTextView      *text_view,
                                                       int               top_margin);

int              gtk_text_view_get_top_margin         (GtkTextView      *text_view);

void             gtk_text_view_set_bottom_margin      (GtkTextView      *text_view,
                                                       int               bottom_margin);

int              gtk_text_view_get_bottom_margin       (GtkTextView      *text_view);

void             gtk_text_view_set_indent             (GtkTextView      *text_view,
                                                       int               indent);

int              gtk_text_view_get_indent             (GtkTextView      *text_view);

void             gtk_text_view_set_tabs               (GtkTextView      *text_view,
                                                       PangoTabArray    *tabs);

PangoTabArray*   gtk_text_view_get_tabs               (GtkTextView      *text_view);


void             gtk_text_view_set_input_purpose      (GtkTextView      *text_view,
                                                       GtkInputPurpose   purpose);

GtkInputPurpose  gtk_text_view_get_input_purpose      (GtkTextView      *text_view);


void             gtk_text_view_set_input_hints        (GtkTextView      *text_view,
                                                       GtkInputHints     hints);

GtkInputHints    gtk_text_view_get_input_hints        (GtkTextView      *text_view);


void             gtk_text_view_set_monospace          (GtkTextView      *text_view,
                                                       gboolean          monospace);

gboolean         gtk_text_view_get_monospace          (GtkTextView      *text_view);


void             gtk_text_view_set_extra_menu         (GtkTextView      *text_view,
                                                       GMenuModel       *model);

GMenuModel *     gtk_text_view_get_extra_menu         (GtkTextView      *text_view);

PangoContext    *gtk_text_view_get_rtl_context        (GtkTextView      *text_view);

PangoContext    *gtk_text_view_get_ltr_context        (GtkTextView      *text_view);





