/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 09-08-2024   16:12                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

function gdk_pango_layout_line_get_clip_region(line: PPangoLayoutLine; x_origin: longint; y_origin: longint; index_ranges: Plongint; n_ranges: longint): Pcairo_region_t; cdecl; external libgtk4;
function gdk_pango_layout_get_clip_region(layout: PPangoLayout; x_origin: longint; y_origin: longint; index_ranges: Plongint; n_ranges: longint): Pcairo_region_t; cdecl; external libgtk4;

// === Konventiert am: 2-8-24 17:23:28 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
