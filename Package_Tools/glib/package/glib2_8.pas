unit glib2_8;

interface

uses
  Strings,
  ctypes;


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include glib2_8_includes.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
{$include glib2_8_includes.inc}
{$UNDEF read_implementation}

end.

