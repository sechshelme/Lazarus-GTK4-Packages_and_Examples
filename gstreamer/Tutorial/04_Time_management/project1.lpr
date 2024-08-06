program project1;

uses
  glib2,
  ctypes,
  gst;

  // https://gstreamer.freedesktop.org/documentation/tutorials/basic/dynamic-pipelines.html?gi-language=c

  procedure gst_caps_unref(object_: Tgpointer); cdecl; external gstreamerlib;


const
  GST_CLOCK_TIME_NONE = TGstClockTime(-1);

type
  TCustomData = record
    playbin: PGstElement;
    playing,
    terminate,
    seek_enabled,
    seek_done: gboolean;
    duration: gint64;
  end;
  PCustomData = ^TCustomData;

  function GST_PAD_LINK_FAILED(ret: TGstPadLinkReturn): boolean;
  begin
    Result := longint(ret) < longint(GST_PAD_LINK_OK);
  end;

  function GST_OBJECT(obj: Pointer): PGstObject;
  begin
    Result := PGstObject(g_type_check_instance_cast(obj, gst_object_get_type));
  end;

  function GST_MESSAGE_SRC(msg: PGstMessage): PGstObject;
  begin
    Result := msg^.src;
  end;

  function GST_OBJECT_NAME(obj: PGstObject): Pgchar;
  begin
    Result := obj^.Name;
  end;

const
  G_USEC_PER_SEC = 1000000;

  function GST_SECOND: TGstClockTimeDiff;
  begin
    Result := TGstClockTimeDiff(G_USEC_PER_SEC * 1000);
    ;
  end;

  function GST_MSECOND: TGstClockTimeDiff;
  begin
    Result := TGstClockTimeDiff(GST_SECOND / 1000);
    ;
  end;

  procedure handle_message(Data: PCustomData; msg: PGstMessage);
  var
    err: PGError;
    debug_info: Pgchar;
    old_state, new_state, pending_state: TGstState;
  begin
    case GST_MESSAGE_TYPE(msg) of
      GST_MESSAGE_ERROR: begin
        gst_message_parse_error(msg, @err, @debug_info);
        g_printerr('Error received from elemment %s: %s'#10, GST_OBJECT_NAME(GST_MESSAGE_SRC(msg)), err^.message);
        if debug_info = nil then begin
          g_printerr('Debug Info: none'#10);
        end else begin
          g_printerr('Debug Info: %s'#10, debug_info);
        end;
        g_clear_error(@err);
        g_free(debug_info);
        Data^.terminate := True;
      end;
      GST_MESSAGE_EOS: begin
        g_print('Stream Ende'#10);
        Data^.terminate := True;
      end;
      GST_MESSAGE_DURATION_CHANGED: begin
        Data^.duration:=GST_CLOCK_TIME_NONE;
        Data^.terminate := True;
      end;
      GST_MESSAGE_STATE_CHANGED: begin
        if GST_MESSAGE_SRC(msg) = GST_OBJECT(Data^.playbin) then begin
          gst_message_parse_state_changed(msg, @old_state, @new_state, @pending_state);

          g_print('Pipeline state changed from %s to %s '#10, gst_element_state_get_name(old_state), gst_element_state_get_name(new_state));
          Data^.playing:=new_state=GST_STATE_PLAYING;;
        end;
      end;
      else begin
        g_print('Pipeline state unbekannt'#10);
      end;
    end;
  end;

  function main(argc: cint; argv: PPChar): cint;
  var
    Data: TCustomData;
    ret: TGstStateChangeReturn;
    bus: PGstBus;
    msg: PGstMessage;
  begin
    Data.playing := False;
    Data.terminate := False;
    Data.seek_enabled := False;
    Data.seek_done := False;
    Data.duration := GST_CLOCK_TIME_NONE;

    gst_init(@argc, @argv);

    Data.playbin := gst_element_factory_make('playbin', 'playbin');
    if Data.playbin = nil then begin
      g_printerr('kann playbin nicht erzeugen'#10);
      Exit(-1);
    end;

    g_object_set(Data.playbin, 'uri', 'https://gstreamer.freedesktop.org/data/media/sintel_trailer-480p.webm', nil);

    ret := gst_element_set_state(Data.playbin, GST_STATE_PLAYING);
    if ret = GST_STATE_CHANGE_FAILURE then begin
      g_printerr('Kann playbin nicht abspielen'#10);
      gst_object_unref(Data.playbin);
      Exit(-1);
    end;

    bus := gst_element_get_bus(Data.playbin);
    repeat
      msg := gst_bus_timed_pop_filtered(bus, 100 * GST_MSECOND, TGstMessageType(uint64(GST_MESSAGE_STATE_CHANGED) or uint64(GST_MESSAGE_ERROR) or uint64(GST_MESSAGE_EOS) or uint64(GST_MESSAGE_DURATION_CHANGED)));
      if msg <> nil then  begin
        handle_message(@Data, msg);
        WriteLn('nil');
      end;

    until Data.terminate;


    WriteLn('ende');
    Result := 0;
  end;

begin
  main(argc, argv);
end.
