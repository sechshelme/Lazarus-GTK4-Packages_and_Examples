program project1;

uses
  ctypes,
  Math,
  SysUtils,
  Cairo,
  glib280,
  GDK4,
  GTK4;

  //  https://docs.gtk.org/gtk4/getting_started.html#drawing-in-response-to-input

var
  surface: Pcairo_surface_t = nil;

  procedure clear_surface; cdecl;
  var
    cr: Pcairo_t;
  begin
    cr := cairo_create(surface);
    cairo_set_source_rgb(cr, 1, 1, 1);
    cairo_paint(cr);
    cairo_destroy(cr);
  end;

  procedure resize_cb(widget: PGtkWidget; Width, Height: cint; Data: Tgpointer); cdecl;
  begin
    if surface <> nil then begin
      cairo_surface_destroy(surface);
      surface := nil;
    end;
    if gtk_native_get_surface(gtk_widget_get_native(widget)) <> nil then begin
      surface := gdk_surface_create_similar_surface(gtk_native_get_surface(gtk_widget_get_native(widget)),
        CAIRO_CONTENT_COLOR,
        gtk_widget_get_width(widget),
        gtk_widget_get_height(widget));
      clear_surface;
    end;
  end;

  procedure close_window;
  begin
    if surface <> nil then begin
      cairo_surface_destroy(surface);
    end;
  end;

  procedure draw_cb(drawing_area: PGtkDrawingArea; cr: Pcairo_t;
    Width: longint; Height: longint; user_data: Tgpointer); cdecl;
  begin
    cairo_set_source_surface(cr, surface, 0, 0);
    cairo_paint(cr);
  end;

  procedure draw_brush(widget: PGtkWidget; x, y: double);
  var
    cr: Pcairo_t;
  begin
    cr := cairo_create(surface);

    cairo_rectangle(cr, x - 3, y - 3, 6, 6);
    cairo_fill(cr);

    cairo_destroy(cr);

    gtk_widget_queue_draw(widget);
  end;

var
  startx, starty: double;

  procedure drag_begin(gesture: PGtkGestureDrag; x, y: double; area: PGtkWidget);
  begin
    startx := x;
    starty := y;
  end;

  procedure drag_update(gesture: PGtkGestureDrag; x, y: double; area: PGtkWidget);
  begin
    draw_brush(area, startx + x, starty + y);
  end;

  procedure drag_end(gesture: PGtkGestureDrag; x, y: double; area: PGtkWidget);
  begin
    draw_brush(area, startx + x, starty + y);
  end;

  procedure pressed(gesture: PGtkGestureDrag; n_press: cint; x, y: double; area: PGtkWidget);
  begin
    clear_surface;
    gtk_widget_queue_draw(area);
  end;

  procedure activate(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    window, frame, drawing_area: PGtkWidget;
    drag, press: PGtkGesture;
  begin
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'Drawing Area');

    g_signal_connect(window, 'destroy', G_CALLBACK(@close_window), nil);

    frame := gtk_frame_new(nil);
    gtk_window_set_child(GTK_WINDOW(window), frame);

    drawing_area := gtk_drawing_area_new;
    gtk_widget_set_size_request(drawing_area, 100, 100);

    gtk_frame_set_child(GTK_FRAME(frame), drawing_area);

    gtk_drawing_area_set_draw_func(GTK_DRAWING_AREA(drawing_area), @draw_cb, nil, nil);

    g_signal_connect_after(drawing_area, 'resize', G_CALLBACK(@resize_cb), nil);

    drag := gtk_gesture_drag_new;
    gtk_gesture_single_set_button(GTK_GESTURE_SINGLE(drag), GDK_BUTTON_PRIMARY);
    gtk_widget_add_controller(drawing_area, GTK_EVENT_CONTROLLER(drag));
    g_signal_connect(drag, 'drag-begin', G_CALLBACK(@drag_begin), drawing_area);
    g_signal_connect(drag, 'drag-update', G_CALLBACK(@drag_update), drawing_area);
    g_signal_connect(drag, 'drag-end', G_CALLBACK(@drag_end), drawing_area);

    press := gtk_gesture_click_new;
    gtk_gesture_single_set_button(GTK_GESTURE_SINGLE(press), GDK_BUTTON_SECONDARY);
    gtk_widget_add_controller(drawing_area, GTK_EVENT_CONTROLLER(press));

    g_signal_connect(press, 'pressed', G_CALLBACK(@pressed), drawing_area);

    gtk_window_present(GTK_WINDOW(window));
  end;


  function main(argc: cint; argv: PPChar): cint;
  var
    app: PGtkApplication;
    status: longint;
  begin
    app := gtk_application_new('org.gtk.example', G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, 'activate', G_CALLBACK(@activate), nil);
    status := g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);

    Exit(status);
  end;

begin
  SetExceptionMask([exDenormalized, exInvalidOp, exOverflow, exPrecision, exUnderflow, exZeroDivide]);
  main(argc, argv);
end.
