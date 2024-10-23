program project1;

uses
  ctypes,
  Math,
  glib280,
  GTK4;

// sudo apt install libwebkitgtk-6.0-dev

// pkg-config --cflags --libs gtk+-3.0 webkit2gtk-4.1
// -I/usr/include/gtk-3.0 -I/usr/include/pango-1.0 -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/harfbuzz -I/usr/local/include/freetype2 -I/usr/local/include -I/usr/include/libmount -I/usr/include/blkid -I/usr/include/fribidi -I/usr/include/cairo -I/usr/local/include/libpng16 -I/usr/include/pixman-1 -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/x86_64-linux-gnu -I/usr/include/webp -I/usr/include/gio-unix-2.0 -I/usr/include/atk-1.0 -I/usr/include/at-spi2-atk/2.0 -I/usr/include/at-spi-2.0 -I/usr/include/dbus-1.0 -I/usr/lib/x86_64-linux-gnu/dbus-1.0/include -I/usr/include/webkitgtk-4.1 -I/usr/include/libsoup-3.0 -I/usr/include/sysprof-6 -pthread -lwebkit2gtk-4.1 -lgtk-3 -lgdk-3 -lz -lpangocairo-1.0 -lpango-1.0 -lharfbuzz -latk-1.0 -lcairo-gobject -lcairo -lgdk_pixbuf-2.0 -lsoup-3.0 -Wl,--export-dynamic -lgmodule-2.0 -pthread -lglib-2.0 -lgio-2.0 -ljavascriptcoregtk-4.1 -lgobject-2.0 -lglib-2.0

// -lwebkit2gtk-4.1 -lgtk-3 -lgdk-3 -lz -lpangocairo-1.0 -lpango-1.0 -lharfbuzz -latk-1.0 -lcairo-gobject -lcairo -lgdk_pixbuf-2.0 -lsoup-3.0 -Wl,--export-dynamic -lgmodule-2.0 -pthread -lglib-2.0 -lgio-2.0 -ljavascriptcoregtk-4.1 -lgobject-2.0 -lglib-2.0


// pkg-config --cflags --libs webkitgtk-6.0


const
  libwebkit = 'webkitgtk-6.0';

function webkit_web_view_new:  PGtkWidget; cdecl; external libwebkit;
procedure webkit_web_view_load_uri(web_view: Pointer; uri:Pgchar); cdecl; external libwebkit;



  procedure activate(app: PGtkApplication; user_data: Tgpointer);
  var
    window, webView, box: PGtkWidget;
  begin

    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'Window');
    gtk_window_set_default_size(GTK_WINDOW(window), 640, 480);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 0);
    gtk_widget_set_halign(box, GTK_ALIGN_CENTER);
    gtk_widget_set_valign(box, GTK_ALIGN_CENTER);

    gtk_window_set_child(GTK_WINDOW(window), box);

//    webView := gtk_button_new_with_label('Hello World');
//    webView := gtk_list_box_new;
    webView:=webkit_web_view_new;
    webkit_web_view_load_uri(webView,'http://www.google.ch');

    gtk_widget_set_size_request(GTK_WIDGET(webView), 640,480);

    gtk_widget_grab_focus(GTK_WIDGET(webView));


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
