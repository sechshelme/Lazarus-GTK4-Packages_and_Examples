program project1;

uses
  glib2,
  common_GLIB,

  // --- glib

  gtypes,                  // Komplizierte Makros entfernt     ( neu übersetzen )
  gvarianttype,            // io.
  gquark,                  // io.
  gerror,                  //      Makros
  garray,                  // io.

  galloca,                 // nicht auflösbar
  gslice,                  // nicht auflösbar
  grcbox,                  // nicht auflösbar
  gthread,                 //                   doppelter gtheread.h von deprecated
  gallocator,
  gmem,                    // io. -> gallocator
  gchecksum,               // io.
  ghmac,                   // io. -> gchecksum
  gnode,                   // io.
  gtree,                   // io. -> gnode
  gcache,                  // io.
  grel,                    // io.
  gmappedfile,             // io.
  gbase64,                 // io.
  ggettext,                // io.
  genviron,                // io.
  gpathbuf,                // io.
  gpattern,                // io.
  gstringchunk,            // io.
  gsequence,               // io.
  gfileutils,              // io.
  ghook,                   // io.
  gstdio,                  // io.
  grefcount,               // io.
  gasyncqueue,             // io.
  gbitlock,                // io.
  gbacktrace,              // io.
  gbytes,                  // io.
  grand,                   // io.
  gthreadpool,             // io.
  gconvert,                // io.
  gutils,                  // io.
  gdate,                   // io.
  gdataset,                // io.
  gspawn,                  // io.
  goption,                 // io.
  gprintf,                 // io.
  gversion,                // io.
  gdir,                    // io.
  grefstring,              // io.
  gtrashstack,             // io.
  gcharset,                // io.
  gprimes,                 // io.
  gqsort,                  // io.
  gshell,                  // io.
  ghostutils,              // io.
  guuid,                   // io.
  gunicode,                // io.
  gstring,                 // io. -> unicode
  gstrfuncs,               // io.                                Makros entfernt
  gstrvbuilder,            // io. -> gstrfuncs
  gatomic,                 // io.
  gtimezone,               // io.
  gdatetime,               // io. -> gtimezone
  gbookmarkfile,           // io. -> gdatetime
  gtimer,                  // io.
  glist,                   // io.
  gslist,                  // io.
  gqueue,                  // io. -> glist
  gcompletion,             // io. -> glist
  gpoll,                   // io.
  gmarkup,                 // io. -> gslist
  gmain,                   // io. -> gslist, gthread, gpoll
  gvariant,                // io. -> gstring, gvarianttype
  gmessages,               // io. -> gvariant                    Makros entfernt
  gregex,                  // io. -> gstring
  gkeyfile,                // io.
  ghash,                   // io. -> glist
  guri,                    // io. -> ghash
  gscanner,                // io. -> gdataset, ghash
  giochannel,              //  -> gmain, gstring, gunicode, gconvert    ( Komischer Record )

  gthread_deprecated,      // io. -> gmain, gpoll
  gmain_deprecated,        // io.


  // --- gobject

  gtype,                   // io.
  genums,                  // io.
  gvalue,                  // io.

  gparam,                  // io.
  gparamspecs,             // io. -> gparam
  gclosure,                // io.
  gsignal,                 // io. -> gclosure
  gobject,                 // io. -> gsignal, gclosure, gparam




// --- gio
//gaction.

  math;

var
  timer: PGTimer;
  us: Tgulong;
  time: Tgdouble;
begin

  WriteLn(g_ascii_isalnum('1'));
  WriteLn(g_ascii_isalnum('a'));
  WriteLn(g_ascii_isalnum(#10));


timer:=g_timer_new;
  g_timer_start(timer);
  ReadLn;


  g_timer_stop(timer);


//glib2.G_OBJECT_WARN_INVALID_PROPERTY_ID;
//glib2.private_g_type_check_class_is_a;
// private_g_type_check_instance_cast


time:= g_timer_elapsed(timer, @us);




  WriteLn(time:4:2, ' - ', us);



end.
