/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

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

function g_new(bytes_per_struct, n_structs: Tgsize): Tgpointer;
function g_new0(bytes_per_struct, n_structs: Tgsize): Tgpointer;
function g_renew(struct_size: Tgsize; OldMem: Tgpointer; n_structs : Tgsize) : Tgpointer;
function g_chunk_new(chunk : Pointer) : Pointer;
function g_chunk_new0(chunk : Pointer) : Pointer;
procedure g_chunk_free(mem_chunk:PGMemChunk; mem:Tgpointer);


// === Konventiert am: 8-8-24 17:20:52 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function g_new(bytes_per_struct, n_structs: Tgsize): Tgpointer;
begin
   g_new:=g_malloc(n_structs*bytes_per_struct);
end;

function g_new0(bytes_per_struct, n_structs: Tgsize): Tgpointer;
begin
   g_new0:=g_malloc0(n_structs*bytes_per_struct);
end;

function g_renew(struct_size: Tgsize; OldMem: Tgpointer; n_structs: Tgsize
  ): Tgpointer;
begin
   g_renew:=g_realloc(OldMem,struct_size*n_structs);
end;

function g_chunk_new(chunk : Pointer) : Pointer;
begin
   g_chunk_new:=g_mem_chunk_alloc(chunk);
end;

function g_chunk_new0(chunk : Pointer) : Pointer;
begin
   g_chunk_new0:=g_mem_chunk_alloc0(chunk);
end;

procedure g_chunk_free(mem_chunk: PGMemChunk; mem: Tgpointer);
begin
   g_mem_chunk_free(mem_chunk,mem);
end;


{$ENDIF read_implementation}
