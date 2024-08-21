unit ghash;

interface

uses
  Strings, common_GLIB, gtypes, garray, glist;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGHashTable = record
  end;
  PGHashTable = ^TGHashTable;
  PPGHashTable = ^PGHashTable;

  TGHRFunc = function(key: Tgpointer; Value: Tgpointer; user_data: Tgpointer): Tgboolean; cdecl;

  TGHashTableIter = record
    dummy1: Tgpointer;
    dummy2: Tgpointer;
    dummy3: Tgpointer;
    dummy4: longint;
    dummy5: Tgboolean;
    dummy6: Tgpointer;
  end;
  PGHashTableIter = ^TGHashTableIter;


function g_hash_table_new(hash_func: TGHashFunc; key_equal_func: TGEqualFunc): PGHashTable; cdecl; external libglib2;
function g_hash_table_new_full(hash_func: TGHashFunc; key_equal_func: TGEqualFunc; key_destroy_func: TGDestroyNotify; value_destroy_func: TGDestroyNotify): PGHashTable; cdecl; external libglib2;
function g_hash_table_new_similar(other_hash_table: PGHashTable): PGHashTable; cdecl; external libglib2;
procedure g_hash_table_destroy(hash_table: PGHashTable); cdecl; external libglib2;
function g_hash_table_insert(hash_table: PGHashTable; key: Tgpointer; Value: Tgpointer): Tgboolean; cdecl; external libglib2;
function g_hash_table_replace(hash_table: PGHashTable; key: Tgpointer; Value: Tgpointer): Tgboolean; cdecl; external libglib2;
function g_hash_table_add(hash_table: PGHashTable; key: Tgpointer): Tgboolean; cdecl; external libglib2;
function g_hash_table_remove(hash_table: PGHashTable; key: Tgconstpointer): Tgboolean; cdecl; external libglib2;
procedure g_hash_table_remove_all(hash_table: PGHashTable); cdecl; external libglib2;
function g_hash_table_steal(hash_table: PGHashTable; key: Tgconstpointer): Tgboolean; cdecl; external libglib2;
function g_hash_table_steal_extended(hash_table: PGHashTable; lookup_key: Tgconstpointer; stolen_key: Pgpointer; stolen_value: Pgpointer): Tgboolean; cdecl; external libglib2;
procedure g_hash_table_steal_all(hash_table: PGHashTable); cdecl; external libglib2;
function g_hash_table_steal_all_keys(hash_table: PGHashTable): PGPtrArray; cdecl; external libglib2;
function g_hash_table_steal_all_values(hash_table: PGHashTable): PGPtrArray; cdecl; external libglib2;
function g_hash_table_lookup(hash_table: PGHashTable; key: Tgconstpointer): Tgpointer; cdecl; external libglib2;
function g_hash_table_contains(hash_table: PGHashTable; key: Tgconstpointer): Tgboolean; cdecl; external libglib2;
function g_hash_table_lookup_extended(hash_table: PGHashTable; lookup_key: Tgconstpointer; orig_key: Pgpointer; Value: Pgpointer): Tgboolean; cdecl; external libglib2;
procedure g_hash_table_foreach(hash_table: PGHashTable; func: TGHFunc; user_data: Tgpointer); cdecl; external libglib2;
function g_hash_table_find(hash_table: PGHashTable; predicate: TGHRFunc; user_data: Tgpointer): Tgpointer; cdecl; external libglib2;
function g_hash_table_foreach_remove(hash_table: PGHashTable; func: TGHRFunc; user_data: Tgpointer): Tguint; cdecl; external libglib2;
function g_hash_table_foreach_steal(hash_table: PGHashTable; func: TGHRFunc; user_data: Tgpointer): Tguint; cdecl; external libglib2;
function g_hash_table_size(hash_table: PGHashTable): Tguint; cdecl; external libglib2;
function g_hash_table_get_keys(hash_table: PGHashTable): PGList; cdecl; external libglib2;
function g_hash_table_get_values(hash_table: PGHashTable): PGList; cdecl; external libglib2;
function g_hash_table_get_keys_as_array(hash_table: PGHashTable; length: Pguint): Pgpointer; cdecl; external libglib2;
function g_hash_table_get_keys_as_ptr_array(hash_table: PGHashTable): PGPtrArray; cdecl; external libglib2;
function g_hash_table_get_values_as_ptr_array(hash_table: PGHashTable): PGPtrArray; cdecl; external libglib2;
procedure g_hash_table_iter_init(iter: PGHashTableIter; hash_table: PGHashTable); cdecl; external libglib2;
function g_hash_table_iter_next(iter: PGHashTableIter; key: Pgpointer; Value: Pgpointer): Tgboolean; cdecl; external libglib2;
function g_hash_table_iter_get_hash_table(iter: PGHashTableIter): PGHashTable; cdecl; external libglib2;
procedure g_hash_table_iter_remove(iter: PGHashTableIter); cdecl; external libglib2;
procedure g_hash_table_iter_replace(iter: PGHashTableIter; Value: Tgpointer); cdecl; external libglib2;
procedure g_hash_table_iter_steal(iter: PGHashTableIter); cdecl; external libglib2;
function g_hash_table_ref(hash_table: PGHashTable): PGHashTable; cdecl; external libglib2;
procedure g_hash_table_unref(hash_table: PGHashTable); cdecl; external libglib2;

function g_str_equal(v1: Tgconstpointer; v2: Tgconstpointer): Tgboolean; cdecl; external libglib2;

function g_str_hash(v: Tgconstpointer): Tguint; cdecl; external libglib2;
function g_int_equal(v1: Tgconstpointer; v2: Tgconstpointer): Tgboolean; cdecl; external libglib2;
function g_int_hash(v: Tgconstpointer): Tguint; cdecl; external libglib2;
function g_int64_equal(v1: Tgconstpointer; v2: Tgconstpointer): Tgboolean; cdecl; external libglib2;
function g_int64_hash(v: Tgconstpointer): Tguint; cdecl; external libglib2;
function g_double_equal(v1: Tgconstpointer; v2: Tgconstpointer): Tgboolean; cdecl; external libglib2;
function g_double_hash(v: Tgconstpointer): Tguint; cdecl; external libglib2;
function g_direct_hash(v: Tgconstpointer): Tguint; cdecl; external libglib2;
function g_direct_equal(v1: Tgconstpointer; v2: Tgconstpointer): Tgboolean; cdecl; external libglib2;

function g_hash_table_freeze(hash_table: TGHashTable): pointer;
function g_hash_table_thaw(hash_table: TGHashTable): pointer;

// === Konventiert am: 8-8-24 17:05:56 ===


implementation

function g_hash_table_freeze(hash_table: TGHashTable): pointer;
begin
  g_hash_table_freeze := pointer(0);
end;

function g_hash_table_thaw(hash_table: TGHashTable): pointer;
begin
  g_hash_table_thaw := pointer(0);
end;


end.
