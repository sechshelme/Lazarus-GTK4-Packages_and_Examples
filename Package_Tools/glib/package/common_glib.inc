/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

const
  {$IFDEF Linux}
  libglib2 = 'libglib-2.0';
  libgobject2_0 = 'libgobject-2.0';
  libgio2 = 'libgio-2.0';
  libgtk4 = 'libgtk-4';
  {$ENDIF}

  {$IFDEF Windows}
  libgtk4 = 'libgtk-4.dll';
  libgio2 = 'libgio-2.0.dll';
  libglib2 = 'libglib-2.0,dll';
  glibgobject2_0 = 'libgobject-2.0.dll';
  {$ENDIF}

  // === Externes
type
  Ttm = record  //  /usr/include/x86_64-linux-gnu/bits/types/struct_tm.h
    tm_sec: cint;
    tm_min: cint;
    tm_hour: cint;
    tm_mday: cint;
    tm_mon: cint;
    tm_year: cint;
    tm_wday: cint;
    tm_yday: cint;
    tm_isdst: cint;
    tm_gmtoff: cint;
    tm_zone: PChar;
  end;
  Ptm = ^Ttm;

  // ====

const
//  GLIB_MAJOR_VERSION = 2;
//  GLIB_MINOR_VERSION = 80;
//  GLIB_MICRO_VERSION = 0;


  {$IFDEF Linux}
  G_DIR_SEPARATOR = '/';
  {$ENDIF}
  {$IFDEF Windows}
  G_DIR_SEPARATOR = '';
  {$ENDIF}


type
  Tgint8 = int8;
  Tguint8 = uint8;
  Pgint8 = ^int8;
  Pguint8 = ^uint8;

  Tgint16 = int16;
  Tguint16 = uint16;
  Pgint16 = ^int16;
  Pguint16 = ^uint16;

  Tgint32 = int32;
  Tguint32 = uint32;
  Pgint32 = ^int32;
  Pguint32 = ^uint32;

  Tgint64 = int64;
  Tguint64 = uint64;
  Pgint64 = ^int64;
  Pguint64 = ^uint64;

  Tgssize = SizeInt;
  Pgssize = PSizeInt;
  Tgsize = SizeUInt;
  Pgsize = PSizeUInt;


  Tgintptr = IntPtr;
  Pgintptr = PIntPtr;
  Tguintptr = PtrUInt;
  Pguintptr = PPtrUInt;

  Tgoffset = SizeInt;

  // no GLIB

  TFILE = record //  /usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h
  end;
  PFILE = ^TFILE;

  Tdouble = double;

  Tsize_t = SizeUInt;
  Ttime_t = clong; // types.h
  Ptime_t = ^Ttime_t;

  TGPid = cint;
  PGPid = ^TGPid;


  Tva_list = Pointer;
  Pva_list = ^Tva_list;

  Tstat = record  // /usr/include/x86_64-linux-gnu/bits/struct_stat.h
  end;
  PTstat = ^Tstat;

const         // nur Linux    /usr/lib/x86_64-linux-gnu/glib-2.0/include/glibconfig.h
  GLIB_SYSDEF_AF_UNIX = 1;
  GLIB_SYSDEF_AF_INET = 2;
  GLIB_SYSDEF_AF_INET6 = 10;

  GLIB_SYSDEF_MSG_OOB = 1;
  GLIB_SYSDEF_MSG_PEEK = 2;
  GLIB_SYSDEF_MSG_DONTROUTE = 4;


  type
    Tpid_t=cint;    // /usr/include/x86_64-linux-gnu/bits/types.h
    Tuid_t=cuint;

const
  __SIZEOF_PTHREAD_MUTEX_T = 40;

type
  Ppthread_mutex_t = ^Tpthread_mutex_t;   // /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h
  Tpthread_mutex_t = record
    case longint of
      //        0 : ( __data : T_pthread_mutex_s );
      1: (__size: array[0..__SIZEOF_PTHREAD_MUTEX_T - 1] of char);
      2: (__align: culong);
  end;

  Tpthread_t = culong;  // /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h

{$ENDIF read_interface}


{$IFDEF read_implementation}

{$ENDIF read_implementation}
