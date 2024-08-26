program project1;

uses
  ctypes,
  Math,
  SysUtils,
  glib280,
  GTK4;

  procedure print_hello(widget: PGtkWidget; Data: Tgpointer);
  var
    lab: PChar;
  begin
    g_object_get( widget, 'label', @lab, nil);

//    lab := gtk_button_get_label(GTK_BUTTON(widget));
    g_print('Es wurde geklickt: %s'#10, lab);
    g_free(lab);
  end;


  procedure activate(app: PGtkApplication; user_data: Tgpointer);
  var
    window, button, grid: PGtkWidget;
    label1: Tgpointer;
  begin
    window := g_object_new(GTK_TYPE_APPLICATION_WINDOW,
      'application', app,
      'height-request', 300,
      'width-request', 300,
      'title', 'Hello GTK',
      nil);

//        grid := gtk_grid_new;
        grid:=g_object_new(GTK_TYPE_GRID, nil);

    gtk_window_set_child(GTK_WINDOW(window), grid);

    button := g_object_new(GTK_TYPE_BUTTON, 'label', 'Button 1', nil);
    g_signal_connect(button, 'clicked', G_CALLBACK(@print_hello), nil);
    gtk_grid_attach(GTK_GRID(grid), button, 0, 0, 1, 1);

    button := g_object_new(GTK_TYPE_BUTTON, 'label', 'Button 2', nil);
    g_signal_connect(button, 'clicked', G_CALLBACK(@print_hello), nil);
    gtk_grid_attach(GTK_GRID(grid), button, 1, 0, 1, 1);

    button := g_object_new(GTK_TYPE_BUTTON, 'label', 'Button 3', nil);

    g_signal_connect(button, 'clicked', G_CALLBACK(@print_hello), nil);
    gtk_grid_attach(GTK_GRID(grid), button, 0, 1, 2, 1);

    label1:=g_object_new(GTK_TYPE_LABEL,'label', 'Hello <b>World</b>!', 'use-markup', 1, nil);
    gtk_grid_attach(GTK_GRID(grid), label1, 0, 2, 1, 1);

    gtk_window_present(GTK_WINDOW(window));
  end;


  function main(argc: cint; argv: PPChar): cint;
  var
    app: PGtkApplication;
    status: longint;
  begin
//    app := gtk_application_new('org.gtk.example', G_APPLICATION_DEFAULT_FLAGS);
    app:=g_object_new(GTK_TYPE_APPLICATION, nil);

    g_signal_connect(app, 'activate', G_CALLBACK(@activate), nil);
    status := g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);

    Exit(status);
  end;

begin
  SetExceptionMask([exDenormalized, exInvalidOp, exOverflow, exPrecision, exUnderflow, exZeroDivide]);
  main(argc, argv);
end.
