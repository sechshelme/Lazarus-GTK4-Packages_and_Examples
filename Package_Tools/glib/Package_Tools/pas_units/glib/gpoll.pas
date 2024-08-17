unit gpoll;

interface

uses
  common_GLIB, gtypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGPollFD = record
    fd: Tgint64;
//     fd: Tgint;  32bit OS
    events: Tgushort;
    revents: Tgushort;
  end;
  PGPollFD = ^TGPollFD;

type
  TGPollFunc = function(ufds: PGPollFD; nfsd: Tguint; timeout_: Tgint): Tgint; cdecl;

function g_poll(fds: PGPollFD; nfds: Tguint; timeout: Tgint): Tgint; cdecl; external libglib2;

// === Konventiert am: 7-8-24 17:17:52 ===


implementation



end.
