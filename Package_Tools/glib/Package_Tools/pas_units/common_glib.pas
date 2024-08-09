unit common_GLIB;

interface

uses
  ctypes;

const
  {$IFDEF Linux}
  libgtk4 = 'libgtk-4';
  //  libgio2 = 'libgio-2.0';
  libglib2 = 'libglib-2.0';
  libgobject2_0 = 'libgobject-2.0';
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

  Tdouble = double;

  Tsize_t = SizeUInt;
  Ttime_t = clong; // types.h
  Ptime_t = ^Ttime_t;

  TGPid = cint;
  PGPid = ^TGPid;


  Tva_list = Pointer;
  Pva_list = ^Tva_list;

implementation

end.
