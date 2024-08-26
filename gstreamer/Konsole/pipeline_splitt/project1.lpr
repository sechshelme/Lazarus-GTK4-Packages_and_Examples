program project1;

uses
  Crt,
  glib2,
  ctypes,
  gst;

  procedure TestIO(element: Pointer; const s: string);
  begin
    if element = nil then begin
      WriteLn(s, ': error !');
    end else begin
      WriteLn(s, ': io.');
    end;
  end;

  procedure tutorial_main(argc: cint; argv: PPChar);
  var
    filesrc, waveparse, audoconvert, sink, pipeline, volume: PGstElement;
    quit: boolean = False;
    ch: ansichar;
    vol: single = 1.0;
  begin
    gst_init(@argc, @argv);

//    pipeline := gst_pipeline_new('audio-player');
    pipeline:= g_object_new(GST_TYPE_BIN, 'name', 'audio-player', nil);

    TestIO(pipeline, 'pipeline');

    filesrc := gst_element_factory_make('filesrc', 'source');
    TestIO(filesrc, 'source');

    waveparse := gst_element_factory_make('wavparse', 'parser');
    TestIO(waveparse, 'parser');

    audoconvert := gst_element_factory_make('audioconvert', 'converter');
    TestIO(audoconvert, 'converter');

    volume := gst_element_factory_make('volume', 'volume');
    TestIO(volume, 'volume');

    sink := gst_element_factory_make('autoaudiosink', 'sink');
    TestIO(sink, 'sink');

    g_object_set(filesrc, 'location', '/n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/test.wav', nil);

    gst_bin_add_many(GST_BIN(pipeline), filesrc, [waveparse, audoconvert, volume, sink, nil]);

    WriteLn(#10);
    WriteLn('Source    -> parser   : ', gst_element_link(filesrc, waveparse));
    WriteLn('parser    -> converter: ', gst_element_link(waveparse, audoconvert));
    WriteLn('converter -> volume   : ', gst_element_link(audoconvert, volume));
    WriteLn('volume    -> sink     : ', gst_element_link(volume, sink));

    gst_element_set_state(pipeline, GST_STATE_PLAYING);

    repeat
      g_object_set(volume, 'volume', vol, nil);
      if KeyPressed then begin
        ch := ReadKey;
        case ch of
          #27: begin
            quit := True;
          end;
          '+': begin
            vol += 0.1;
            if vol >= 1.0 then begin
              vol := 1.0;
            end;
            WriteLn('volume: ', vol: 4: 2);
          end;
          '-': begin
            vol -= 0.1;
            if vol <= 0.0 then begin
              vol := 0.0;
            end;
            WriteLn('volume: ', vol: 4: 2);
          end;
          'm':begin
            g_object_set(volume, 'mute', gTRUE, nil);
          end;
          'M':begin
            g_object_set(volume, 'mute', gFALSE, nil);
          end;
        end;
      end;
    until quit;

    gst_object_unref(filesrc);
    gst_object_unref(waveparse);
    gst_object_unref(audoconvert);
    gst_object_unref(volume);
    gst_object_unref(sink);
    gst_object_unref(pipeline);

    gst_object_unref(pipeline);
  end;

begin
  tutorial_main(argc, argv);
end.
