unit gsequence;

interface

uses
  common_GLIB, gtypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGSequence = record
  end;
  PGSequence = ^TGSequence;

  TGSequenceIter = record
  end;
  PGSequenceIter = ^TGSequenceIter;

  TGSequenceNode = TGSequenceIter;

  TGSequenceIterCompareFunc = function(a: PGSequenceIter; b: PGSequenceIter; Data: Tgpointer): Tgint; cdecl;

function g_sequence_new(data_destroy: TGDestroyNotify): PGSequence; cdecl; external libglib2;
procedure g_sequence_free(seq: PGSequence); cdecl; external libglib2;
function g_sequence_get_length(seq: PGSequence): Tgint; cdecl; external libglib2;
procedure g_sequence_foreach(seq: PGSequence; func: TGFunc; user_data: Tgpointer); cdecl; external libglib2;
procedure g_sequence_foreach_range(_begin: PGSequenceIter; _end: PGSequenceIter; func: TGFunc; user_data: Tgpointer); cdecl; external libglib2;
procedure g_sequence_sort(seq: PGSequence; cmp_func: TGCompareDataFunc; cmp_data: Tgpointer); cdecl; external libglib2;
procedure g_sequence_sort_iter(seq: PGSequence; cmp_func: TGSequenceIterCompareFunc; cmp_data: Tgpointer); cdecl; external libglib2;
function g_sequence_is_empty(seq: PGSequence): Tgboolean; cdecl; external libglib2;
function g_sequence_get_begin_iter(seq: PGSequence): PGSequenceIter; cdecl; external libglib2;
function g_sequence_get_end_iter(seq: PGSequence): PGSequenceIter; cdecl; external libglib2;
function g_sequence_get_iter_at_pos(seq: PGSequence; pos: Tgint): PGSequenceIter; cdecl; external libglib2;
function g_sequence_append(seq: PGSequence; Data: Tgpointer): PGSequenceIter; cdecl; external libglib2;
function g_sequence_prepend(seq: PGSequence; Data: Tgpointer): PGSequenceIter; cdecl; external libglib2;
function g_sequence_insert_before(iter: PGSequenceIter; Data: Tgpointer): PGSequenceIter; cdecl; external libglib2;
procedure g_sequence_move(src: PGSequenceIter; dest: PGSequenceIter); cdecl; external libglib2;
procedure g_sequence_swap(a: PGSequenceIter; b: PGSequenceIter); cdecl; external libglib2;
function g_sequence_insert_sorted(seq: PGSequence; Data: Tgpointer; cmp_func: TGCompareDataFunc; cmp_data: Tgpointer): PGSequenceIter; cdecl; external libglib2;
function g_sequence_insert_sorted_iter(seq: PGSequence; Data: Tgpointer; iter_cmp: TGSequenceIterCompareFunc; cmp_data: Tgpointer): PGSequenceIter; cdecl; external libglib2;
procedure g_sequence_sort_changed(iter: PGSequenceIter; cmp_func: TGCompareDataFunc; cmp_data: Tgpointer); cdecl; external libglib2;
procedure g_sequence_sort_changed_iter(iter: PGSequenceIter; iter_cmp: TGSequenceIterCompareFunc; cmp_data: Tgpointer); cdecl; external libglib2;
procedure g_sequence_remove(iter: PGSequenceIter); cdecl; external libglib2;
procedure g_sequence_remove_range(_begin: PGSequenceIter; _end: PGSequenceIter); cdecl; external libglib2;
procedure g_sequence_move_range(dest: PGSequenceIter; _begin: PGSequenceIter; _end: PGSequenceIter); cdecl; external libglib2;
function g_sequence_search(seq: PGSequence; Data: Tgpointer; cmp_func: TGCompareDataFunc; cmp_data: Tgpointer): PGSequenceIter; cdecl; external libglib2;
function g_sequence_search_iter(seq: PGSequence; Data: Tgpointer; iter_cmp: TGSequenceIterCompareFunc; cmp_data: Tgpointer): PGSequenceIter; cdecl; external libglib2;
function g_sequence_lookup(seq: PGSequence; Data: Tgpointer; cmp_func: TGCompareDataFunc; cmp_data: Tgpointer): PGSequenceIter; cdecl; external libglib2;
function g_sequence_lookup_iter(seq: PGSequence; Data: Tgpointer; iter_cmp: TGSequenceIterCompareFunc; cmp_data: Tgpointer): PGSequenceIter; cdecl; external libglib2;
function g_sequence_get(iter: PGSequenceIter): Tgpointer; cdecl; external libglib2;
procedure g_sequence_set(iter: PGSequenceIter; Data: Tgpointer); cdecl; external libglib2;
function g_sequence_iter_is_begin(iter: PGSequenceIter): Tgboolean; cdecl; external libglib2;
function g_sequence_iter_is_end(iter: PGSequenceIter): Tgboolean; cdecl; external libglib2;
function g_sequence_iter_next(iter: PGSequenceIter): PGSequenceIter; cdecl; external libglib2;
function g_sequence_iter_prev(iter: PGSequenceIter): PGSequenceIter; cdecl; external libglib2;
function g_sequence_iter_get_position(iter: PGSequenceIter): Tgint; cdecl; external libglib2;
function g_sequence_iter_move(iter: PGSequenceIter; delta: Tgint): PGSequenceIter; cdecl; external libglib2;
function g_sequence_iter_get_sequence(iter: PGSequenceIter): PGSequence; cdecl; external libglib2;
function g_sequence_iter_compare(a: PGSequenceIter; b: PGSequenceIter): Tgint; cdecl; external libglib2;
function g_sequence_range_get_midpoint(_begin: PGSequenceIter; _end: PGSequenceIter): PGSequenceIter; cdecl; external libglib2;

// === Konventiert am: 10-8-24 16:59:20 ===


implementation



end.
