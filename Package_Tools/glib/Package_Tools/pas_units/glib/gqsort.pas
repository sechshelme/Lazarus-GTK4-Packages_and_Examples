unit gqsort;

interface

uses
  common_GLIB, gtypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


procedure g_qsort_with_data(pbase: Tgconstpointer; total_elems: Tgint; size: Tgsize; compare_func: TGCompareDataFunc; user_data: Tgpointer); cdecl; external libglib2;

// === Konventiert am: 11-8-24 19:32:59 ===


implementation



end.
