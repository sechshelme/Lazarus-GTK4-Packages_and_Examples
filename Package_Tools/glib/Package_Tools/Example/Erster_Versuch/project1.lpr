program project1;

uses
  common_GLIB,

  // --- glib

  gtypes,                  // Komplizierte Makros entfernt
  gvarianttype,            // io.
  gquark,                  // Makros
  gatomic,                 // Komplizierte Makros entfernt
  glist,                   //              const  g_list_free1 = g_list_free_1;
  gslist,                  //              const g_slist_free1 = g_slist_free_1;
  gpoll,                   //   32 / 64bit !
  gthread,                 //                              doppelter gtheread.h von deprecated
  gmain,                   // gslist, gthread, gpoll       Komplizierte Makros entfernt

  garray,                  // Makros
  gstring,                 // -> garray
  gerror,                  //      Makros
  gvariant,                // -> garray, gerror, gstring,  gvarianttype      Makro
  gunicode,                // -> gerror     Makros
  gtimezone,               // io.
  gtimer,                  // io.
  gdatetime,               // io. -> gtimezone
  gbookmarkfile,           // io. -> gerror, gdatetime



  math;

// --- gobject

// --- gio
//gaction;

var
  timer: PGTimer;
  us: Tgulong;
  time: Tgdouble;
begin
  timer:=g_timer_new;
  g_timer_start(timer);
  ReadLn;
  g_timer_stop(timer);


time:= g_timer_elapsed(timer, @us);


  WriteLn(time:4:2, ' - ', us);



end.
