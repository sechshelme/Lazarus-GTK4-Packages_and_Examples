/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

function g_atomic_int_get(atomic: Pgint): Tgint; cdecl; external libglib2;
procedure g_atomic_int_set(atomic: Pgint; newval: Tgint); cdecl; external libglib2;
procedure g_atomic_int_inc(atomic: Pgint); cdecl; external libglib2;
function g_atomic_int_dec_and_test(atomic: Pgint): Tgboolean; cdecl; external libglib2;
function g_atomic_int_compare_and_exchange(atomic: Pgint; oldval: Tgint; newval: Tgint): Tgboolean; cdecl; external libglib2;
function g_atomic_int_compare_and_exchange_full(atomic: Pgint; oldval: Tgint; newval: Tgint; preval: Pgint): Tgboolean; cdecl; external libglib2;
function g_atomic_int_exchange(atomic: Pgint; newval: Tgint): Tgint; cdecl; external libglib2;
function g_atomic_int_add(atomic: Pgint; val: Tgint): Tgint; cdecl; external libglib2;
function g_atomic_int_and(atomic: Pguint; val: Tguint): Tguint; cdecl; external libglib2;
function g_atomic_int_or(atomic: Pguint; val: Tguint): Tguint; cdecl; external libglib2;
function g_atomic_int_xor(atomic: Pguint; val: Tguint): Tguint; cdecl; external libglib2;
function g_atomic_pointer_get(atomic: pointer): Tgpointer; cdecl; external libglib2;
procedure g_atomic_pointer_set(atomic: pointer; newval: Tgpointer); cdecl; external libglib2;
function g_atomic_pointer_compare_and_exchange(atomic: pointer; oldval: Tgpointer; newval: Tgpointer): Tgboolean; cdecl; external libglib2;
function g_atomic_pointer_compare_and_exchange_full(atomic: pointer; oldval: Tgpointer; newval: Tgpointer; preval: pointer): Tgboolean; cdecl; external libglib2;
function g_atomic_pointer_exchange(atomic: pointer; newval: Tgpointer): Tgpointer; cdecl; external libglib2;
function g_atomic_pointer_add(atomic: pointer; val: Tgssize): Tgintptr; cdecl; external libglib2;
function g_atomic_pointer_and(atomic: pointer; val: Tgsize): Tguintptr; cdecl; external libglib2;
function g_atomic_pointer_or(atomic: pointer; val: Tgsize): Tguintptr; cdecl; external libglib2;
function g_atomic_pointer_xor(atomic: pointer; val: Tgsize): Tguintptr; cdecl; external libglib2;
function g_atomic_int_exchange_and_add(atomic: Pgint; val: Tgint): Tgint; cdecl; external libglib2;

// === Konventiert am: 7-8-24 15:20:43 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
