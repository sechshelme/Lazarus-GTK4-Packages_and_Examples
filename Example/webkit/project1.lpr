program project1;

uses
  ctypes,
  Math,
  glib280,
  GTK4;

  // sudo apt install libwebkitgtk-6.0-dev
  // pkg-config --cflags --libs webkitgtk-6.0

const
  libwebkit = 'webkitgtk-6.0';

  function webkit_web_view_new: PGtkWidget; cdecl; external libwebkit;
  procedure webkit_web_view_load_uri(web_view: Pointer; uri: Pgchar); cdecl; external libwebkit;


  procedure activate(app: PGtkApplication; user_data: Tgpointer);
  var
    window, webView, box: PGtkWidget;
  begin

    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'Window');
    gtk_window_set_default_size(GTK_WINDOW(window), 640, 480);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 20);
    gtk_widget_set_halign(box, GTK_ALIGN_CENTER);
    gtk_widget_set_valign(box, GTK_ALIGN_CENTER);

    gtk_window_set_child(GTK_WINDOW(window), box);

    webView := webkit_web_view_new;
    webkit_web_view_load_uri(webView, 'http://www.google.ch');

    gtk_widget_set_size_request(GTK_WIDGET(webView), 640, 480);

    gtk_box_append(GTK_BOX(box), webView);

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
