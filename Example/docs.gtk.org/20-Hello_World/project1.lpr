program project1;

uses
  ctypes,
  Math,
  SysUtils,
  glib280,
  GTK4;

  procedure print_hello(widget: PGtkWidget; Data: Tgpointer);
  const
    counter: cint = 0;
  begin
    g_print('Hello World'#10);

    Inc(counter);
    gtk_button_set_label(GTK_BUTTON(widget), PChar('Ich wurde ' + IntToStr(counter) + ' gelickt'));
  end;


  procedure activate(app: PGtkApplication; user_data: Tgpointer);
  var
    window, box, button: PGtkWidget;
  begin
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'Window');
    gtk_window_set_default_size(GTK_WINDOW(window), 200, 200);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 0);
    gtk_widget_set_halign(box, GTK_ALIGN_CENTER);
    gtk_widget_set_valign(box, GTK_ALIGN_CENTER);

    gtk_window_set_child(GTK_WINDOW(window), box);

    button := gtk_button_new_with_label('Hello World');

    g_signal_connect(button, 'clicked', G_CALLBACK(@print_hello), nil);
    //    g_signal_connect_swapped(button, 'clicked', G_CALLBACK(@gtk_window_destroy), window);

    gtk_box_append(GTK_BOX(box), button);

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
