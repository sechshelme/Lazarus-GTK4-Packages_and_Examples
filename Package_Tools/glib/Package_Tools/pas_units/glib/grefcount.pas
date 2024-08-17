unit grefcount;

interface

uses
  common_GLIB, gtypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


procedure g_ref_count_init(rc: Pgrefcount); cdecl; external libglib2;
procedure g_ref_count_inc(rc: Pgrefcount); cdecl; external libglib2;
function g_ref_count_dec(rc: Pgrefcount): Tgboolean; cdecl; external libglib2;
function g_ref_count_compare(rc: Pgrefcount; val: Tgint): Tgboolean; cdecl; external libglib2;
procedure g_atomic_ref_count_init(arc: Pgatomicrefcount); cdecl; external libglib2;
procedure g_atomic_ref_count_inc(arc: Pgatomicrefcount); cdecl; external libglib2;
function g_atomic_ref_count_dec(arc: Pgatomicrefcount): Tgboolean; cdecl; external libglib2;
function g_atomic_ref_count_compare(arc: Pgatomicrefcount; val: Tgint): Tgboolean; cdecl; external libglib2;

const
  G_REF_COUNT_INIT_ = -(1);
  G_ATOMIC_REF_COUNT_INIT_ = 1;

  // === Konventiert am: 10-8-24 19:52:32 ===


implementation



end.
