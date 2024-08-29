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

  const
  path = '/home/tux/Schreibtisch/sound/test.wav';

   function gst_volume_get_type():GType;cdecl;external 'gstaudio-1.0';


  procedure tutorial_main(argc: cint; argv: PPChar);
  var
    Source, parser, converter, sink, pipeline, volume: PGstElement;
    quit: boolean = False;
    ch: ansichar;
    vol: single = 1.0;
  begin
    gst_init(@argc, @argv);

    pipeline := gst_pipeline_new('audio-player');
    TestIO(pipeline, 'pipeline');

    Source := gst_element_factory_make('filesrc', 'source');
    TestIO(Source, 'source');

    parser := gst_element_factory_make('wavparse', 'parser');
    TestIO(parser, 'parser');

    converter := gst_element_factory_make('audioconvert', 'converter');
    TestIO(converter, 'converter');

    volume := gst_element_factory_make('volume', 'volume');
//    volume:=g_object_new(gst_volume_get_type, 'name', 'volume',nil);
    TestIO(volume, 'volume');

    sink := gst_element_factory_make('autoaudiosink', 'sink');
    TestIO(sink, 'sink');

    g_object_set(Source, 'location', path, nil);

    gst_bin_add_many(GST_BIN(pipeline), Source, [parser, converter, volume, sink, nil]);

    gst_element_link_many(Source, parser, [converter, volume, sink, nil]);

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

    gst_object_unref(Source);
    gst_object_unref(parser);
    gst_object_unref(converter);
    gst_object_unref(volume);
    gst_object_unref(sink);
    gst_object_unref(pipeline);

    gst_object_unref(pipeline);
  end;

begin
  tutorial_main(argc, argv);
end.
