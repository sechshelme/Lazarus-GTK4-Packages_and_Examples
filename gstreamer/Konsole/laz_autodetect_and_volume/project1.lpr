
program project1;

uses
  Crt,
  glib2,
  ctypes,
  gst;

  // https://forums.developer.nvidia.com/t/pipeline-ends-after-4-seconds-with-gst-message-eos/253486

const
  GST_CLOCK_TIME_NONE = TGstClockTime(-1);

  function gst_stream_volume_get_type():GType;cdecl;external 'gstaudio-1.0';


  procedure tutorial_main(argc: cint; argv: PPChar);
  var
    pipeline, filesrc, volume: PGstElement;
    quit: boolean = False;
    ch: ansichar;
    vol: single = 1.0;
  begin
    gst_init(@argc, @argv);

 //  pipeline := gst_parse_launch('playbin uri=file:/n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/test.wav ! volume', nil);

 // /n4800/Multimedia/Music/Disco/Boney M/1981 - Boonoonoonoos/01 - Boonoonoonoos.flac

// pipeline := gst_parse_launch('filesrc location="test.flac" ! decodebin2 ! audioconvert ! volume ! autoaudiosink', nil);
 pipeline := gst_parse_launch('filesrc location="/n4800/Multimedia/Music/Disco/Boney M/1981 - Boonoonoonoos/01 - Boonoonoonoos.flac" ! decodebin3 ! audioconvert ! volume ! autoaudiosink', nil);
    if pipeline = nil then begin
      WriteLn('pipeline error');
    end else begin
      WriteLn('pipeline io.');
    end;

    //filesrc := gst_bin_get_by_name(GST_BIN(pipeline), 'filesrc0');
    //if filesrc = nil then begin
    //  WriteLn('filesrc error');
    //end else begin
    //  WriteLn('filesrc io.');
    //end;

//    filesrc := gst_bin_get_by_name(GST_BIN(pipeline), 'location');
    //filesrc := gst_bin_get_by_interface(GST_BIN( pipeline),  gst_filesrc_get_type());
    // if filesrc = nil then begin
    //   WriteLn('filesource error');
    // end else begin
    //   WriteLn('filesource io.');
    // end;
    //    g_object_set(filesrc, 'location', 'test.wav');

   volume := gst_bin_get_by_interface(GST_BIN( pipeline), gst_stream_volume_get_type());
    if volume = nil then begin
      WriteLn('volume error');
    end else begin
      WriteLn('volume io.');
    end;

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

    gst_object_unref(pipeline);
    gst_object_unref(filesrc);
  end;

begin
  tutorial_main(argc, argv);
end.
