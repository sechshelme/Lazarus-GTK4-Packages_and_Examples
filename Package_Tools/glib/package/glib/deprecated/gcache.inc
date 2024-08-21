/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGCacheNewFunc = function(key: Tgpointer): Tgpointer; cdecl;
  TGCacheDupFunc = function(Value: Tgpointer): Tgpointer; cdecl;
  TGCacheDestroyFunc = procedure(Value: Tgpointer); cdecl;

  TGCache = record
  end;
  PGCache = ^TGCache;

function g_cache_new(value_new_func: TGCacheNewFunc; value_destroy_func: TGCacheDestroyFunc; key_dup_func: TGCacheDupFunc; key_destroy_func: TGCacheDestroyFunc; hash_key_func: TGHashFunc;
  hash_value_func: TGHashFunc; key_equal_func: TGEqualFunc): PGCache; cdecl; external libglib2;
procedure g_cache_destroy(cache: PGCache); cdecl; external libglib2;
function g_cache_insert(cache: PGCache; key: Tgpointer): Tgpointer; cdecl; external libglib2;
procedure g_cache_remove(cache: PGCache; Value: Tgconstpointer); cdecl; external libglib2;
procedure g_cache_key_foreach(cache: PGCache; func: TGHFunc; user_data: Tgpointer); cdecl; external libglib2;
procedure g_cache_value_foreach(cache: PGCache; func: TGHFunc; user_data: Tgpointer); cdecl; external libglib2;

// === Konventiert am: 11-8-24 20:08:17 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
