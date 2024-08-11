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
  gunicode,                // io.
  gstring,                 // io. -> unicode
  gstrfuncs,               // io.                                Makros entfernt
  gatomic,                 // io.
  gtimezone,               // io.
  gdatetime,               // io. -> gtimezone
  gbookmarkfile,           // io. -> gdatetime
  gtimer,                  // io.
  glist,                   // io.
  gqueue,                  // io. -> glist
  gslist,                  // io.
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





  math;

// --- gobject

// --- gio
//gaction;

var
  timer: PGTimer;
  us: Tgulong;
  time: Tgdouble;

  t:TGScannerConfig;
begin

  WriteLn('TGScannerConfig: ', SizeOf(  TGScannerConfig));
  WriteLn('TGScannerConfig: ', PtrUInt(@t.padding_dummy)- PtrUInt(@t));

  WriteLn(g_ascii_isalnum('1'));
  WriteLn(g_ascii_isalnum('a'));
  WriteLn(g_ascii_isalnum(#10));


timer:=g_timer_new;
  g_timer_start(timer);
  ReadLn;
  g_timer_stop(timer);

  glib2.g_rc_box_alloc


time:= g_timer_elapsed(timer, @us);




  WriteLn(time:4:2, ' - ', us);



end.
