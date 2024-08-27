
program project1;

uses
  Crt,
  glib2,
  ctypes,
  gst;

  procedure main(argc: cint; argv: PPChar);
  var
    pipeline: PGstElement;
    quit: boolean = False;
    ch: ansichar;
  begin
    gst_init(@argc, @argv);
    ClrScr;

//    pipeline := gst_parse_launch('filesrc location=/n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/test.wav ! wavparse ! audioconvert ! autoaudiosink', nil);
      pipeline := gst_parse_launch('filesrc location=/n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/test.wav ! decodebin ! audioconvert  ! autoaudiosink', nil);

//    gst_element_set_state(pipeline, GST_STATE_PLAYING);

    GotoXY(1,1);
    WriteLn('<1> = stop;  <2> = play;  <3> = pause');

    repeat
      if KeyPressed then begin
        ch := ReadKey;
        case ch of
          #27: begin
            quit := True;
          end;
          '1':begin
            gst_element_set_state(pipeline, GST_STATE_READY);
            end;
          '2':begin
            gst_element_set_state(pipeline, GST_STATE_PLAYING);
            end;
          '3':begin
            gst_element_set_state(pipeline, GST_STATE_PAUSED);
            end;
        end;
      end;
    until quit;

    gst_object_unref(pipeline);
  end;

begin
  main(argc, argv);
end.
