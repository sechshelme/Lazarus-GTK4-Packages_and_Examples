unit grel;

interface

uses
  common_GLIB, gtypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGTuples = record
    len: Tguint;
  end;
  PGTuples = ^TGTuples;

  TGRelation = record
  end;
  PGRelation = ^TGRelation;

function g_relation_new(fields: Tgint): PGRelation; cdecl; external libglib2;
procedure g_relation_destroy(relation: PGRelation); cdecl; external libglib2;
procedure g_relation_index(relation: PGRelation; field: Tgint; hash_func: TGHashFunc; key_equal_func: TGEqualFunc); cdecl; external libglib2;
procedure g_relation_insert(relation: PGRelation; args: array of const); cdecl; external libglib2;
procedure g_relation_insert(relation: PGRelation); cdecl; external libglib2;
function g_relation_delete(relation: PGRelation; key: Tgconstpointer; field: Tgint): Tgint; cdecl; external libglib2;
function g_relation_select(relation: PGRelation; key: Tgconstpointer; field: Tgint): PGTuples; cdecl; external libglib2;
function g_relation_count(relation: PGRelation; key: Tgconstpointer; field: Tgint): Tgint; cdecl; external libglib2;
function g_relation_exists(relation: PGRelation; args: array of const): Tgboolean; cdecl; external libglib2;
function g_relation_exists(relation: PGRelation): Tgboolean; cdecl; external libglib2;
procedure g_relation_print(relation: PGRelation); cdecl; external libglib2;
procedure g_tuples_destroy(tuples: PGTuples); cdecl; external libglib2;
function g_tuples_index(tuples: PGTuples; index_: Tgint; field: Tgint): Tgpointer; cdecl; external libglib2;

// === Konventiert am: 11-8-24 20:08:56 ===


implementation



end.
