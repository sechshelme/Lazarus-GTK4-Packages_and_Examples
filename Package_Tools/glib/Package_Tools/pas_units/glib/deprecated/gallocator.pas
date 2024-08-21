unit gallocator;

interface

uses
  common_GLIB, gtypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGMemChunk = record
  end;
  PGMemChunk = ^TGMemChunk;

  TGAllocator = record
  end;
  PGAllocator = ^TGAllocator;

const
  G_ALLOC_ONLY = 1;
  G_ALLOC_AND_FREE = 2;
  G_ALLOCATOR_LIST = 1;
  G_ALLOCATOR_SLIST = 2;
  G_ALLOCATOR_NODE = 3;


function g_mem_chunk_new(Name: Pgchar; atom_size: Tgint; area_size: Tgsize; _type: Tgint): PGMemChunk; cdecl; external libglib2;
procedure g_mem_chunk_destroy(mem_chunk: PGMemChunk); cdecl; external libglib2;
function g_mem_chunk_alloc(mem_chunk: PGMemChunk): Tgpointer; cdecl; external libglib2;
function g_mem_chunk_alloc0(mem_chunk: PGMemChunk): Tgpointer; cdecl; external libglib2;
procedure g_mem_chunk_free(mem_chunk: PGMemChunk; mem: Tgpointer); cdecl; external libglib2;
procedure g_mem_chunk_clean(mem_chunk: PGMemChunk); cdecl; external libglib2;
procedure g_mem_chunk_reset(mem_chunk: PGMemChunk); cdecl; external libglib2;
procedure g_mem_chunk_print(mem_chunk: PGMemChunk); cdecl; external libglib2;
procedure g_mem_chunk_info; cdecl; external libglib2;
procedure g_blow_chunks; cdecl; external libglib2;
function g_allocator_new(Name: Pgchar; n_preallocs: Tguint): PGAllocator; cdecl; external libglib2;
procedure g_allocator_free(allocator: PGAllocator); cdecl; external libglib2;
procedure g_list_push_allocator(allocator: PGAllocator); cdecl; external libglib2;
procedure g_list_pop_allocator; cdecl; external libglib2;
procedure g_slist_push_allocator(allocator: PGAllocator); cdecl; external libglib2;
procedure g_slist_pop_allocator; cdecl; external libglib2;
procedure g_node_push_allocator(allocator: PGAllocator); cdecl; external libglib2;
procedure g_node_pop_allocator; cdecl; external libglib2;

function g_chunk_new(_type, chunk: Pointer): Pointer;
function g_chunk_new0(_type, chunk: Pointer): Pointer;
function g_mem_chunk_create(_type, x, y: Pointer): PGMemChunk;


// === Konventiert am: 9-8-24 19:21:56 ===


implementation


function g_chunk_new(_type, chunk: Pointer): Pointer;
begin
  g_chunk_new:=g_mem_chunk_alloc(chunk);
end;

function g_chunk_new0(_type, chunk: Pointer): Pointer;
begin
  g_chunk_new0:=g_mem_chunk_alloc0(chunk);
end;

function g_mem_chunk_create(_type, x, y: Pointer): PGMemChunk;
begin
  g_mem_chunk_create := g_mem_chunk_new(nil, sizeof(_type), 0, 0);
end;


end.
