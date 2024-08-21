  //{%MainUnit sdl3.pas}

//    {$include common_glib.inc}


{$include gobject/gtype.inc}                   // io.
{$include gobject/gtypeplugin.inc}             // io.
{$include gobject/genums.inc}                  // io.
{$include gobject/gvalue.inc}                  // io.
{$include gobject/gvaluetypes.inc}             // io. -> gvalue
{$include gobject/gboxed.inc}                  // io.
{$include gobject/glib_enumtypes.inc}          // io.
{$include gobject/gvaluearray.inc}             // io.
{$include gobject/glib_types.inc}              // io.
{$include gobject/gparam.inc}                  // io.
{$include gobject/gparamspecs.inc}             // io. -> gparam
{$include gobject/gclosure.inc}                // io.
{$include gobject/gsourceclosure.inc}          // io. -> gclosure
{$include gobject/gsignal.inc}                 // io. -> gclosure
{$include gobject/gsignalgroup.inc}            // io. -> gclosure, gsignal
{$include gobject/gmarshal.inc}                // io. -> gclosure
{$include gobject/gobject.inc}                 // io. -> gsignal, gclosure, gparam
{$include gobject/gbinding.inc}                // io. -> gobject, gclosure
{$include gobject/gbindinggroup.inc}           // io. -> gbinding, gclosure
{$include gobject/gtypemodule.inc}             // io. -> gobject






//{$include glib/giochannel.inc}              //  -> gmain, gstring, gunicode, gconvert    ( Komischer Record )



