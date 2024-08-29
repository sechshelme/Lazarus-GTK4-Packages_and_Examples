program project1;

uses
  crt,
  glib2,
  ctypes,
  gst;

const
//  path = '/home/tux/Schreibtisch/sound/test.wav';
   path:string = '/n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/test.wav';
  //   path = '/n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/test.mp3';
  //  path = '/n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/test.flac';

  procedure test_cb(bus: PGstBus; msg: PGstMessage; Data: Pointer); cdecl;
  begin
    WriteLn('Message: ', gst_message_type_get_name(msg^._type));
    case GST_MESSAGE_TYPE(msg) of
      GST_MESSAGE_DURATION_CHANGED: begin
//        WriteLn('Duration');
      end;
    end;
  end;

  procedure main(argc: cint; argv: PPChar);
  var
    pipeline: PGstElement;
    bus: PGstBus;
    main_loop: PGMainLoop;
  begin
    gst_init(@argc, @argv);
    path:=ParamStr(1);

    pipeline := gst_parse_launch(PChar('filesrc location="' + path + '" ! decodebin ! audioconvert  ! autoaudiosink'), nil);
    bus := gst_element_get_bus(pipeline);
    gst_bus_add_signal_watch(bus);
    g_signal_connect(G_OBJECT(bus), 'message', TGCallback(@test_cb), nil);
    gst_object_unref(bus);

    gst_element_set_state(pipeline, GST_STATE_PLAYING);

    main_loop:=g_main_loop_new(nil, False);

    g_main_loop_run(main_loop);
    //while not KeyPressed do begin
    //  gst_bus_poll(bus, GST_MESSAGE_DURATION_CHANGED, -1);
    //  g_main_context_iteration(nil,False);
    //end;
  end;

begin
  main(argc, argv);
end.
