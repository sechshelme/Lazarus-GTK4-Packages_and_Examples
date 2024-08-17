unit gversion;

interface

uses
  common_GLIB, gtypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

var
  glib_major_version: Tguint; cvar;external libglib2;
  glib_minor_version: Tguint; cvar;external libglib2;
  glib_micro_version: Tguint; cvar;external libglib2;
  glib_interface_age: Tguint; cvar;external libglib2;
  glib_binary_age: Tguint; cvar;external libglib2;

function glib_check_version(required_major: Tguint; required_minor: Tguint; required_micro: Tguint): Pgchar; cdecl; external libglib2;
{
#define GLIB_CHECK_VERSION(major,minor,micro)    \
    (GLIB_MAJOR_VERSION > (major) || \
     (GLIB_MAJOR_VERSION == (major) && GLIB_MINOR_VERSION > (minor)) || \
     (GLIB_MAJOR_VERSION == (major) && GLIB_MINOR_VERSION == (minor) && \
      GLIB_MICRO_VERSION >= (micro)))
 }

function GLIB_CHECK_VERSION_(major, minor, micro: Tguint): boolean;


// === Konventiert am: 11-8-24 19:18:44 ===


implementation

function GLIB_CHECK_VERSION_(major, minor, micro: Tguint): boolean;
begin
  Result := ((GLIB_MAJOR_VERSION > major) or
    ((GLIB_MAJOR_VERSION = major) and (GLIB_MINOR_VERSION > minor)) or
    ((GLIB_MAJOR_VERSION = major) and (GLIB_MINOR_VERSION = minor) and (GLIB_MICRO_VERSION >= micro)));
end;


end.
