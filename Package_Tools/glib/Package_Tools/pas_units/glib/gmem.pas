unit gmem;

interface

uses
  common_GLIB, gtypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

procedure g_free(mem: Tgpointer); cdecl; external libglib2;
procedure g_free_sized(mem: Tgpointer; size: Tsize_t); cdecl; external libglib2;
procedure g_clear_pointer(pp: Pgpointer; Destroy: TGDestroyNotify); cdecl; external libglib2;
function g_malloc(n_bytes: Tgsize): Tgpointer; cdecl; external libglib2;
function g_malloc0(n_bytes: Tgsize): Tgpointer; cdecl; external libglib2;
function g_realloc(mem: Tgpointer; n_bytes: Tgsize): Tgpointer; cdecl; external libglib2;
function g_try_malloc(n_bytes: Tgsize): Tgpointer; cdecl; external libglib2;
function g_try_malloc0(n_bytes: Tgsize): Tgpointer; cdecl; external libglib2;
function g_try_realloc(mem: Tgpointer; n_bytes: Tgsize): Tgpointer; cdecl; external libglib2;
function g_malloc_n(n_blocks: Tgsize; n_block_bytes: Tgsize): Tgpointer; cdecl; external libglib2;
function g_malloc0_n(n_blocks: Tgsize; n_block_bytes: Tgsize): Tgpointer; cdecl; external libglib2;
function g_realloc_n(mem: Tgpointer; n_blocks: Tgsize; n_block_bytes: Tgsize): Tgpointer; cdecl; external libglib2;
function g_try_malloc_n(n_blocks: Tgsize; n_block_bytes: Tgsize): Tgpointer; cdecl; external libglib2;
function g_try_malloc0_n(n_blocks: Tgsize; n_block_bytes: Tgsize): Tgpointer; cdecl; external libglib2;
function g_try_realloc_n(mem: Tgpointer; n_blocks: Tgsize; n_block_bytes: Tgsize): Tgpointer; cdecl; external libglib2;
function g_aligned_alloc(n_blocks: Tgsize; n_block_bytes: Tgsize; alignment: Tgsize): Tgpointer; cdecl; external libglib2;
function g_aligned_alloc0(n_blocks: Tgsize; n_block_bytes: Tgsize; alignment: Tgsize): Tgpointer; cdecl; external libglib2;
procedure g_aligned_free(mem: Tgpointer); cdecl; external libglib2;
procedure g_aligned_free_sized(mem: Tgpointer; alignment: Tsize_t; size: Tsize_t); cdecl; external libglib2;

type
  TGMemVTable = record
    malloc: function(n_bytes: Tgsize): Tgpointer; cdecl;
    realloc: function(mem: Tgpointer; n_bytes: Tgsize): Tgpointer; cdecl;
    Free: procedure(mem: Tgpointer); cdecl;
    calloc: function(n_blocks: Tgsize; n_block_bytes: Tgsize): Tgpointer; cdecl;
    try_malloc: function(n_bytes: Tgsize): Tgpointer; cdecl;
    try_realloc: function(mem: Tgpointer; n_bytes: Tgsize): Tgpointer; cdecl;
  end;
  PGMemVTable = ^TGMemVTable;

procedure g_mem_set_vtable(vtable: PGMemVTable); cdecl; external libglib2;
function g_mem_is_system_malloc: Tgboolean; cdecl; external libglib2;

var
  g_mem_gc_friendly: Tgboolean; cvar;external libglib2;
  glib_mem_profiler_table: PGMemVTable; cvar;external libglib2;

procedure g_mem_profile; cdecl; external libglib2;

// === Konventiert am: 8-8-24 17:20:52 ===


implementation



end.
