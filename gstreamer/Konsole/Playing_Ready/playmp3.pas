
program project1;

{$mode ObjFPC}{$H+}

uses
  Crt,
  SysUtils,
  glib2,
  ctypes,
  gst;

const
  path = '/home/tux/Schreibtisch/sound/test.wav';

type
  TPipelineElement = record
    pipeline: PGstElement;
    Duration: Tgint64;
  end;
  PPipelineElement = ^TPipelineElement;

  procedure test_cb(bus: PGstBus; msg: PGstMessage; Data: Pointer); cdecl;
  begin
    WriteLn(GST_MESSAGE_TYPE(msg));
    case GST_MESSAGE_TYPE(msg) of
      GST_MESSAGE_ERROR: begin
        WriteLn('Fehler');
      end;
      GST_MESSAGE_DURATION_CHANGED: begin
        WriteLn('Duration');
      end;
    end;
  end;

  procedure duration_cb(bus: PGstBus; msg: PGstMessage; Data: Pointer); cdecl;
  var
    pE: PPipelineElement absolute Data;
    stat: TGboolean;
    ct: integer = 0;
  begin
    WriteLn('duration_cb');
    repeat
      sleep(1);
      stat := gst_element_query_duration(pE^.pipeline, GST_FORMAT_TIME, @pE^.Duration);
      WriteLn(ct: 4, ' stat:', stat, '  duration: ', pE^.Duration / G_USEC_PER_SEC / 1000: 4: 2);
      Inc(ct);
    until stat or (ct > 100);
  end;

  function LoadMusic(const path: string): PGstElement;
  var
    bus: PGstBus;
  begin
//    Result := gst_parse_launch(PChar('filesrc location="' + path + '" ! wavparse ! audioconvert ! autoaudiosink'), nil);
        Result := gst_parse_launch(PChar('filesrc location="' + path + '" ! decodebin ! audioconvert  ! autoaudiosink'), nil);
    if Result = nil then begin
      WriteLn('Fehler beim laden');
    end;

    bus := gst_element_get_bus(Result);
    if bus = nil then begin
      WriteLn('Fehler beim Bus');
    end;
    gst_bus_add_signal_watch(bus);
    g_signal_connect(G_OBJECT(bus), 'message', TGCallback(@test_cb), nil);
    g_signal_connect(G_OBJECT(bus), 'message::duration-changed', TGCallback(@duration_cb), @Result);
    gst_object_unref(bus);
  end;

  procedure main(argc: cint; argv: PPChar);
  var
    pipeline: TPipelineElement;
    quit: boolean = False;
    ch: ansichar;
  begin
    gst_init(@argc, @argv);
    ClrScr;

    pipeline.pipeline := LoadMusic(path);

    gst_element_set_state(pipeline.pipeline, GST_STATE_PLAYING);

    //    GotoXY(1, 1);
    WriteLn('<1> = stop;  <2> = play;  <3> = pause');

    repeat
      g_main_iteration(False);
      if KeyPressed then begin
        ch := ReadKey;
        case ch of
          #27: begin
            quit := True;
          end;
          '1': begin
            gst_element_set_state(pipeline.pipeline, GST_STATE_READY);
          end;
          '2': begin
            gst_element_set_state(pipeline.pipeline, GST_STATE_PLAYING);
          end;
          '3': begin
            gst_element_set_state(pipeline.pipeline, GST_STATE_PAUSED);
          end;
        end;
      end;
    until quit;

    gst_object_unref(pipeline.pipeline);
  end;

begin
  main(argc, argv);
end.
