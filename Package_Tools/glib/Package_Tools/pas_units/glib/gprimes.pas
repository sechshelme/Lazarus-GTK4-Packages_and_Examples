unit gprimes;

interface

uses
  common_GLIB, gtypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

function g_spaced_primes_closest(num: Tguint): Tguint; cdecl; external libglib2;

// === Konventiert am: 11-8-24 19:32:56 ===


implementation



end.
