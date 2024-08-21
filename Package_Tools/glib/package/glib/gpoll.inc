/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

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


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
