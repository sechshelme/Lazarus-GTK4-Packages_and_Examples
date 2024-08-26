program playmp3;
{$mode objfpc}
{$h+}

uses
  crt,
  SysUtils,
  glib2,
  gst;

var
  pipeline: PGstElement = nil;
  volume, equalizer: PGstElement;

  quit: boolean = False;
  vol: gdouble = 0.5;
  mute:gboolean=False;
  equ: array [0..2] of gdouble = (0.0, 0.0, 0.0);
  ch: ansichar;

const
  path = '/n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/test.mp3';

  function gst_stream_volume_get_type(): GType; cdecl; external 'gstaudio-1.0';

begin
  gst_init(@argc, @argv);

  pipeline := gst_parse_launch(PChar('filesrc location="' + path + '" ! decodebin ! audioconvert ! audioresample ! equalizer-3bands name=equ ! volume name=vol ! autoaudiosink'), nil);

  //  volume := gst_bin_get_by_interface(GST_BIN(pipeline), gst_stream_volume_get_type());
  volume := gst_bin_get_by_name(GST_BIN(pipeline), 'vol');
  if volume = nil then begin
    WriteLn('Volume Error');
  end;

  equalizer := gst_bin_get_by_name(GST_BIN(pipeline), 'equ');
  if equalizer = nil then begin
    WriteLn('Equalizer Error');
  end;


  gst_element_set_state(pipeline, GST_STATE_PLAYING);

  repeat
    g_object_set(volume, 'volume', vol, 'mute', mute, nil);
    g_object_set(equalizer, 'band0', equ[0], 'band1', equ[1], 'band2', equ[2], nil);
    if KeyPressed then begin
      ch := ReadKey;
      case ch of
        #27: begin
          quit := True;
        end;
        #32: begin
          mute:=not mute;
          WriteLn('Mute: ', mute);
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
        't': begin
          equ[2] -= 1.0;
          if equ[2] <= -24.0 then begin
            equ[2] := -24.0;
          end;
          WriteLn('Treble: ', equ[2]: 4: 2);
        end;
        'T': begin
          equ[2] += 1.0;
          if equ[2] >= 12.0 then begin
            equ[2] := 12.0;
          end;
          WriteLn('Treble: ', equ[2]: 4: 2);
        end;
        'm': begin
          equ[1] -= 1.0;
          if equ[1] <= -24.0 then begin
            equ[1] := -24.0;
          end;
          WriteLn('Middle: ', equ[1]: 4: 2);
        end;
        'M': begin
          equ[1] += 1.0;
          if equ[1] >= 12.0 then begin
            equ[1] := 12.0;
          end;
          WriteLn('Middle: ', equ[1]: 4: 2);
        end;
        'b': begin
          equ[0] -= 1.0;
          if equ[0] <= -24.0 then begin
            equ[0] := -24.0;
          end;
          WriteLn('Bass: ', equ[0]: 4: 2);
        end;
        'B': begin
          equ[0] += 1.0;
          if equ[0] >= 12.0 then begin
            equ[0] := 12.0;
          end;
          WriteLn('Bass: ', equ[0]: 4: 2);
        end;

      end;
    end;
  until quit;

  gst_object_unref(pipeline);
end.
