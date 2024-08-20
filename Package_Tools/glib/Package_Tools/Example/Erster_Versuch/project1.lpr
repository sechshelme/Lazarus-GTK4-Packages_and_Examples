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
  gtypeplugin,             // io.
  genums,                  // io.
  gvalue,                  // io.
  gvaluetypes,             // io. -> gvalue
  gboxed,                  // io.
  glib_enumtypes,          // io.
  gvaluearray,             // io.
  glib_types,              // io.
  gparam,                  // io.
  gparamspecs,             // io. -> gparam
  gclosure,                // io.
  gsourceclosure,          // io. -> gclosure
  gsignal,                 // io. -> gclosure
  gsignalgroup,            // io. -> gclosure, gsignal
  gmarshal,                // io. -> gclosure
  gobject,                 // io. -> gsignal, gclosure, gparam
  gbinding,                // io. -> gobject, gclosure
  gbindinggroup,           // io. -> gbinding, gclosure
  gtypemodule,             // io. -> gobject


  // --- gio

  giotypes,
  gioenums,                // io.
  gioenumtypes,            // io.

  gaction,                 // io.
  gactionmap,              // io. -> gaction
  giomodule,               // io.
  gsimpleasyncresult,      // io.
  gactiongroup,            // io.
  gactiongroupexporter,    // io. -> gactiongroup
  gvolumemonitor,          // io.
  gdatagrambased,          // io.
  gasyncinitable,          // io.
  gasyncresult,            // io.
  gcancellable,            // io. -> gclosure
  ginetaddress,            // io.
  ginetaddressmask,        // io. -> ginetaddress
  gsocket,                 // io. -> ginetaddress
  gresolver,               // io. -> ginetaddress
  gsocketaddress,          // io.
  gsocketcontrolmessage,   // io.
  gdbusobjectproxy,        // io.
  gdbusintrospection,      // io.
  gunixfdlist,             // io.
  gdbusmessage,            // io. -> gunixfdlist
  gdbusproxy,              // io. -> gdbusintrospection, gunixfdlist
  gdbusobjectmanagerclient,// io. -> gdbusobjectproxy, gdbusproxy
  gdbusmethodinvocation,   // io. -> gunixfdlist, gdbusintrospection
  gioerror,                // io.
  gbytesicon,              // io.
  gappinfo,                // io.
  gsettingsschema,         // io.
  gpermission,             // io.
  gsettingsbackend,        // io. -> gpermission
  gsettings,               // io. -> gsettingsschema, gaction, gsettingsbackend
  gtask,                   // io.
  gfileinfo,               // io.
  gfileenumerator,         // io.
  gfileattribute,          // io.
  gvfs,                    // io. -> gfileattribute
  gmountoperation,         // io.
  gdrive,                  // io. -> gmountoperation
  gvolume,                 // io. -> gmountoperation
  gmount,                  // io. -> gvolume, gmountoperation
  gfilemonitor,            // io.
  ginputstream,            // io.
  goutputstream,           // io. -> ginputstream
  gsubprocess,             // io. -> goutputstream, ginputstream
  gsubprocesslauncher,     // io. -> gsubprocess
  gfilteroutputstream,     // io. -> goutputstream
  gfileinputstream,        // io. -> ginputstream
  gfilterinputstream,      // io. -> ginputstream
  giostream,               // io. -> ginputstream, goutputstream
  gbufferedinputstream,    // io. -> gfilterinputstream, ginputstream
  gbufferedoutputstream,   // io. -> gfilteroutputstream, goutputstream
  gdatainputstream,        // io. -> gbufferedinputstream, ginputstream
  gsocketconnection,       // io. -> giostream
  gunixconnection,         // io. -> gsocketconnection
  gsocketlistener,         // io. -> gsocketconnection
  gsocketclient,           // io. -> giostream, gsocketconnection
  gapplicationcommandline, // io. -> ginputstream
  gapplication,            // io. -> gapplicationcommandline, gactiongroup
  gfileiostream,           // io. -> giostream
  gfileoutputstream,       // io. -> goutputstream
  gfile,                   // io. -> gfileenumerator, gfileattribute, gfileinputstream, gfileoutputstream, gfilemonitor, gmountoperation, gfileiostream
  gdbusconnection,         // io. -> giostream, gunixfdlist, gdbusintrospection
  gtlscertificate,         // io.
  gtlsdatabase,            // io. -> gtlscertificate
  gtlsconnection,          // io. -> gtlscertificate
  gdtlsconnection,         // io. -> gtlscertificate
  gtlspassword,            // io.
  gtlsinteraction,         // io. -> gtlsconnection, gtlspassword
  gmenumodel,              // io.
  gmenu,                   // io. -> gmenumodel






  // ----

  Math;

var
  timer: PGTimer;
  us: Tgulong;
  time: Tgdouble;
begin

  WriteLn(g_ascii_isalnum('1'));
  WriteLn(g_ascii_isalnum('a'));
  WriteLn(g_ascii_isalnum(#10));

//  g_signal_connect(nil, nil, nil, nil);


  timer := g_timer_new;
  g_timer_start(timer);
  ReadLn;


  g_timer_stop(timer);


  time := g_timer_elapsed(timer, @us);




  WriteLn(time: 4: 2, ' - ', us);

end.
