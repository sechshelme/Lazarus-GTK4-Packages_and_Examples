unit gslice;

interface

uses
  common_GLIB, gtypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


function g_slice_alloc(block_size:Tgsize):Tgpointer;cdecl;external libglib2;
function g_slice_alloc0(block_size:Tgsize):Tgpointer;cdecl;external libglib2;
function g_slice_copy(block_size:Tgsize; mem_block:Tgconstpointer):Tgpointer;cdecl;external libglib2;
procedure g_slice_free1(block_size:Tgsize; mem_block:Tgpointer);cdecl;external libglib2;
procedure g_slice_free_chain_with_offset(block_size:Tgsize; mem_chain:Tgpointer; next_offset:Tgsize);cdecl;external libglib2;

//function g_slice_new(_type : longint) : Tgpointer;

{
#if defined (__GNUC__) && (__GNUC__ >= 2) && defined (__OPTIMIZE__)
#  define g_slice_new0(type)                                    \
  (type *) (G_GNUC_EXTENSION (                                 \
    gsize __s = sizeof (type);                                  \
    gpointer __p;                                               \
    __p = g_slice_alloc (__s);                                  \
    memset (__p, 0, __s);                                       \
    __p;                                                        \
  ))
#else
#  define g_slice_new0(type)    ((type*) g_slice_alloc0 (sizeof (type)))
#endif
 }
{ MemoryBlockType *
 *       g_slice_dup                    (MemoryBlockType,
 *	                                 MemoryBlockType *mem_block);
 *       g_slice_free                   (MemoryBlockType,
 *	                                 MemoryBlockType *mem_block);
 *       g_slice_free_chain             (MemoryBlockType,
 *                                       MemoryBlockType *first_chain_block,
 *                                       memory_block_next_field);
 * pseudo prototypes for the macro
 * definitions following below.
  }
{
#define g_slice_dup(type, mem)                                  \
  (1 ? (type*) g_slice_copy (sizeof (type), (mem))              \
     : ((void) ((type*) 0 == (mem)), (type*) 0))
#define g_slice_free(type, mem)                                 \
G_STMT_START                                                   \
  if (1) g_slice_free1 (sizeof (type), (mem));			\
  else   (void) ((type*) 0 == (mem)); 				\
 G_STMT_END
#define g_slice_free_chain(type, mem_chain, next)               \
G_STMT_START                                                   \
  if (1) g_slice_free_chain_with_offset (sizeof (type),		\
                 (mem_chain), G_STRUCT_OFFSET (type, next)); 	\
  else   (void) ((type*) 0 == (mem_chain));			\
 G_STMT_END
 }
{ --- internal debugging API ---  }
type
  PGSliceConfig = ^TGSliceConfig;
  TGSliceConfig =  Longint;
  Const
    G_SLICE_CONFIG_ALWAYS_MALLOC = 1;
    G_SLICE_CONFIG_BYPASS_MAGAZINES = 2;
    G_SLICE_CONFIG_WORKING_SET_MSECS = 3;
    G_SLICE_CONFIG_COLOR_INCREMENT = 4;
    G_SLICE_CONFIG_CHUNK_SIZES = 5;
    G_SLICE_CONFIG_CONTENTION_COUNTER = 6;

procedure g_slice_set_config(ckey:TGSliceConfig; value:Tgint64);cdecl;external libglib2;
function g_slice_get_config(ckey:TGSliceConfig):Tgint64;cdecl;external libglib2;
function g_slice_get_config_state(ckey:TGSliceConfig; address:Tgint64; n_values:Pguint):Pgint64;cdecl;external libglib2;

procedure g_slice_debug_tree_statistics;cdecl;external libglib2;

// === Konventiert am: 10-8-24 20:03:32 ===


implementation


//function g_slice_new(_type : longint) : Ptype;
//begin
//  g_slice_new:=Ptype(g_slice_alloc(sizeof(_type)));
//end;


end.
