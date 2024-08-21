unit gsrvtarget;

interface

uses
  common_GLIB, gtypes, gerror, glist, gtype, giotypes, gobject, gioenums;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGSrvTarget = record
  end;
  PGSrvTarget = ^TGSrvTarget;

function g_srv_target_get_type: TGType; cdecl; external libgio2;
function g_srv_target_new(hostname: Pgchar; port: Tguint16; priority: Tguint16; weight: Tguint16): PGSrvTarget; cdecl; external libgio2;
function g_srv_target_copy(target: PGSrvTarget): PGSrvTarget; cdecl; external libgio2;
procedure g_srv_target_free(target: PGSrvTarget); cdecl; external libgio2;
function g_srv_target_get_hostname(target: PGSrvTarget): Pgchar; cdecl; external libgio2;
function g_srv_target_get_port(target: PGSrvTarget): Tguint16; cdecl; external libgio2;
function g_srv_target_get_priority(target: PGSrvTarget): Tguint16; cdecl; external libgio2;
function g_srv_target_get_weight(target: PGSrvTarget): Tguint16; cdecl; external libgio2;
function g_srv_target_list_sort(targets: PGList): PGList; cdecl; external libgio2;

// === Konventiert am: 21-8-24 16:28:54 ===

function G_TYPE_SRV_TARGET: TGType;

implementation

function G_TYPE_SRV_TARGET: TGType;
begin
  G_TYPE_SRV_TARGET := g_srv_target_get_type;
end;



end.
