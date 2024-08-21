  //{%MainUnit sdl3.pas}

    {$include common_glib.inc}


{$include glib/gtypes.inc}                  // Komplizierte Makros entfernt     ( neu übersetzen )
{$include glib/gversion.inc}                // io.
{$include glib/gvarianttype.inc}            // io.
{$include glib/gquark.inc}                  // io.
{$include glib/gerror.inc}                  //      Makros
{$include glib/garray.inc}                  // io.
{$include glib/galloca.inc}                 // nicht auflösbar
{$include glib/gslice.inc}                  // nicht auflösbar
{$include glib/grcbox.inc}                  // nicht auflösbar
{$include glib/gthread.inc}                 //                   doppelter gtheread.h von deprecated
{$include glib/deprecated/gallocator.inc}              // io.
{$include glib/gmem.inc}                    // io. -> gallocator
{$include glib/gchecksum.inc}               // io.
{$include glib/ghmac.inc}                   // io. -> gchecksum
{$include glib/gnode.inc}                   // io.
{$include glib/gtree.inc}                   // io. -> gnode
{$include glib/deprecated/gcache.inc}                  // io.
{$include glib/deprecated/grel.inc}                    // io.
{$include glib/gmappedfile.inc}             // io.
{$include glib/gbase64.inc}                 // io.
{$include glib/ggettext.inc}                // io.
{$include glib/genviron.inc}                // io.
{$include glib/gpathbuf.inc}                // io.
{$include glib/gpattern.inc}                // io.
{$include glib/gstringchunk.inc}            // io.
{$include glib/gsequence.inc}               // io.
{$include glib/gfileutils.inc}              // io.
{$include glib/ghook.inc}                   // io.
{$include glib/gstdio.inc}                  // io.
{$include glib/grefcount.inc}               // io.
{$include glib/gasyncqueue.inc}             // io.
{$include glib/gbitlock.inc}                // io.
{$include glib/gbacktrace.inc}              // io.
{$include glib/gbytes.inc}                  // io.
{$include glib/grand.inc}                   // io.
{$include glib/gthreadpool.inc}             // io.
{$include glib/gconvert.inc}                // io.
{$include glib/gutils.inc}                  // io.
{$include glib/gdate.inc}                   // io.
{$include glib/gdataset.inc}                // io.
{$include glib/gspawn.inc}                  // io.
{$include glib/goption.inc}                 // io.
{$include glib/gprintf.inc}                 // io.
{$include glib/gdir.inc}                    // io.
{$include glib/grefstring.inc}              // io.
{$include glib/gtrashstack.inc}             // io.
{$include glib/gcharset.inc}                // io.
{$include glib/gprimes.inc}                 // io.
{$include glib/gqsort.inc}                  // io.
{$include glib/gshell.inc}                  // io.
{$include glib/ghostutils.inc}              // io.
{$include glib/guuid.inc}                   // io.
{$include glib/gunicode.inc}                // io.
{$include glib/gstring.inc}                 // io. -> unicode
{$include glib/gstrfuncs.inc}               // io.                                Makros entfernt
{$include glib/gstrvbuilder.inc}            // io. -> gstrfuncs
{$include glib/gatomic.inc}                 // io.
{$include glib/gtimezone.inc}               // io.
{$include glib/gdatetime.inc}               // io. -> gtimezone
{$include glib/gbookmarkfile.inc}           // io. -> gdatetime
{$include glib/gtimer.inc}                  // io.
{$include glib/glist.inc}                   // io.
{$include glib/gslist.inc}                  // io.
{$include glib/gqueue.inc}                  // io. -> glist
{$include glib/deprecated/gcompletion.inc}             // io. -> glist
{$include glib/gpoll.inc}                   // io.
{$include glib/gmarkup.inc}                 // io. -> gslist
{$include glib/gmain.inc}                   // io. -> gslist, gthread, gpoll
{$include glib/gvariant.inc}                // io. -> gstring, gvarianttype
{$include glib/gmessages.inc}               // io. -> gvariant                    Makros entfernt
{$include glib/gregex.inc}                  // io. -> gstring
{$include glib/gkeyfile.inc}                // io.
{$include glib/ghash.inc}                   // io. -> glist
{$include glib/guri.inc}                    // io. -> ghash
{$include glib/gscanner.inc}                // io. -> gdataset, ghash
{$include glib/giochannel.inc}              //  -> gmain, gstring, gunicode, gconvert    ( Komischer Record )
{$include glib/deprecated/gthread_deprecated.inc}      // io. -> gmain, gpoll



