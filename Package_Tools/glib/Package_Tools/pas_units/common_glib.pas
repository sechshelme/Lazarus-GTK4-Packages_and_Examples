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

type
  Tgint8=Int8;
  Tguint8=UInt8;
  Pgint8=^Int8;
  Pguint8=^UInt8;

  Tgint16=Int16;
  Tguint16=UInt16;
  Pgint16=^Int16;
  Pguint16=^UInt16;

  Tgint32=Int32;
  Tguint32=UInt32;
  Pgint32=^Int32;
  Pguint32=^UInt32;

  Tgint64=Int64;
  Tguint64=UInt64;
  Pgint64=^Int64;
  Pguint64=^UInt64;

  Tgssize= SizeInt;
  Pgssize=PSizeInt;
  Tgsize= SizeUInt;
  Pgsize=PSizeUInt;


  Tgintptr=IntPtr;
  Pgintptr=PIntPtr;
  Tguintptr=PtrUInt;
  Pguintptr=PPtrUInt;

  // no GLIB

  Tdouble=Double;

  Tsize_t=SizeUInt;
  Ttime_t=clong; // types.h
  Ptime_t=^Ttime_t;

  TGPid=cint;
  PGPid=^TGPid;


  Tva_list=Pointer;
  Pva_list=^Tva_list;

implementation

end.

