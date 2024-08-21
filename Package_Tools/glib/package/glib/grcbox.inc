/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

function g_rc_box_alloc(block_size: Tgsize): Tgpointer; cdecl; external libglib2;
function g_rc_box_alloc0(block_size: Tgsize): Tgpointer; cdecl; external libglib2;
function g_rc_box_dup(block_size: Tgsize; mem_block: Tgconstpointer): Tgpointer; cdecl; external libglib2;
function g_rc_box_acquire(mem_block: Tgpointer): Tgpointer; cdecl; external libglib2;
procedure g_rc_box_release(mem_block: Tgpointer); cdecl; external libglib2;
procedure g_rc_box_release_full(mem_block: Tgpointer; clear_func: TGDestroyNotify); cdecl; external libglib2;
function g_rc_box_get_size(mem_block: Tgpointer): Tgsize; cdecl; external libglib2;
function g_atomic_rc_box_alloc(block_size: Tgsize): Tgpointer; cdecl; external libglib2;
function g_atomic_rc_box_alloc0(block_size: Tgsize): Tgpointer; cdecl; external libglib2;
function g_atomic_rc_box_dup(block_size: Tgsize; mem_block: Tgconstpointer): Tgpointer; cdecl; external libglib2;
function g_atomic_rc_box_acquire(mem_block: Tgpointer): Tgpointer; cdecl; external libglib2;
procedure g_atomic_rc_box_release(mem_block: Tgpointer); cdecl; external libglib2;
procedure g_atomic_rc_box_release_full(mem_block: Tgpointer; clear_func: TGDestroyNotify); cdecl; external libglib2;
function g_atomic_rc_box_get_size(mem_block: Tgpointer): Tgsize; cdecl; external libglib2;

//function g_rc_box_new(_type : longint) : Ptype;
//function g_rc_box_new0(_type : longint) : Ptype;
//function g_atomic_rc_box_new(_type : longint) : Ptype;
//function g_atomic_rc_box_new0(_type : longint) : Ptype;


// === Konventiert am: 11-8-24 15:21:19 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//function g_rc_box_new(_type : longint) : Ptype;
//begin
//  g_rc_box_new:=Ptype(g_rc_box_alloc(sizeof(_type)));
//end;
//
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//function g_rc_box_new0(_type : longint) : Ptype;
//begin
//  g_rc_box_new0:=Ptype(g_rc_box_alloc0(sizeof(_type)));
//end;
//
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//function g_atomic_rc_box_new(_type : longint) : Ptype;
//begin
//  g_atomic_rc_box_new:=Ptype(g_atomic_rc_box_alloc(sizeof(_type)));
//end;
//
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//function g_atomic_rc_box_new0(_type : longint) : Ptype;
//begin
//  g_atomic_rc_box_new0:=Ptype(g_atomic_rc_box_alloc0(sizeof(_type)));
//end;


{$ENDIF read_implementation}
