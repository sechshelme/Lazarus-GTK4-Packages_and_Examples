unit ghostutils;

interface

uses
  common_GLIB, gtypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function g_hostname_is_non_ascii(hostname: Pgchar): Tgboolean; cdecl; external libglib2;
function g_hostname_is_ascii_encoded(hostname: Pgchar): Tgboolean; cdecl; external libglib2;
function g_hostname_is_ip_address(hostname: Pgchar): Tgboolean; cdecl; external libglib2;
function g_hostname_to_ascii(hostname: Pgchar): Pgchar; cdecl; external libglib2;
function g_hostname_to_unicode(hostname: Pgchar): Pgchar; cdecl; external libglib2;

// === Konventiert am: 11-8-24 19:40:19 ===


implementation



end.
