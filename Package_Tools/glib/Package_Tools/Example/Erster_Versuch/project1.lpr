program project1;

uses
  common_GLIB,

  // --- glib

  gtypes,                  // Komplizierte Makros entfernt     ( neu übersetzen )
  gvarianttype,            // io.
  gquark,                  // io.
  gerror,                  //      Makros

  gthread,                 //                   doppelter gtheread.h von deprecated
  gunicode,                // io.
  garray,                  // io.
  gstring,                 // io. -> garray, gunicode
  gstrfuncs,               // io.                        Makros entfernt
  gatomic,                 // io.
  gtimezone,               // io.
  gdatetime,               // io. -> gtimezone
  gbookmarkfile,           // io. -> gdatetime
  gtimer,                  // io.
  glist,                   // io.
  gslist,                  // io.
  gpoll,                   // io.
  gmain,                   // io. gslist, gthread, gpoll
  gvariant,                // io. -> garray,  gstring, gvarianttype
  gmessages,               // io. -> gvariant            Makros entfernt
  gregex,                  // io. -> gstring

  goption,



  math;

// --- gobject

// --- gio
//gaction;

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


time:= g_timer_elapsed(timer, @us);


  WriteLn(time:4:2, ' - ', us);



end.
