unit gbitlock;

interface

uses
  common_GLIB, gtypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


procedure g_bit_lock(address: Pgint; lock_bit: Tgint); cdecl; external libgobject2_0;
function g_bit_trylock(address: Pgint; lock_bit: Tgint): Tgboolean; cdecl; external libgobject2_0;
procedure g_bit_unlock(address: Pgint; lock_bit: Tgint); cdecl; external libgobject2_0;
procedure g_pointer_bit_lock(address: pointer; lock_bit: Tgint); cdecl; external libgobject2_0;
procedure g_pointer_bit_lock_and_get(address: Tgpointer; lock_bit: Tguint; out_ptr: Pguintptr); cdecl; external libgobject2_0;
function g_pointer_bit_trylock(address: pointer; lock_bit: Tgint): Tgboolean; cdecl; external libgobject2_0;
procedure g_pointer_bit_unlock(address: pointer; lock_bit: Tgint); cdecl; external libgobject2_0;
function g_pointer_bit_lock_mask_ptr(ptr: Tgpointer; lock_bit: Tguint; _set: Tgboolean; preserve_mask: Tguintptr; preserve_ptr: Tgpointer): Tgpointer; cdecl; external libgobject2_0;
procedure g_pointer_bit_unlock_and_set(address: pointer; lock_bit: Tguint; ptr: Tgpointer; preserve_mask: Tguintptr); cdecl; external libgobject2_0;

// === Konventiert am: 10-8-24 20:03:29 ===


implementation



end.
