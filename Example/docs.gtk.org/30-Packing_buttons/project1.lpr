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
    lab := gtk_button_get_label(GTK_BUTTON(widget));
    g_print('Es wurde geklickt: %s'#10, lab);
  end;


  procedure activate(app: PGtkApplication; user_data: Tgpointer);
  var
    window, button, grid: PGtkWidget;
  begin
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'Window');

    grid := gtk_grid_new;

    gtk_window_set_child(GTK_WINDOW(window), grid);

    button := gtk_button_new_with_label('Button 1');
    g_signal_connect(button, 'clicked', G_CALLBACK(@print_hello), nil);

    gtk_grid_attach(GTK_GRID(grid), button, 0, 0, 1, 1);

    button := gtk_button_new_with_label('Button 2');
    g_signal_connect(button, 'clicked', G_CALLBACK(@print_hello), nil);

    gtk_grid_attach(GTK_GRID(grid), button, 1, 0, 1, 1);

    button := gtk_button_new_with_label('Button 3');
    g_signal_connect(button, 'clicked', G_CALLBACK(@print_hello), nil);

    gtk_grid_attach(GTK_GRID(grid), button, 0, 1, 2, 1);

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
