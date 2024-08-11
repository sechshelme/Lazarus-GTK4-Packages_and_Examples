unit gtrashstack;

interface

uses
  common_GLIB, gtypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PGTrashStack = ^TGTrashStack;
  TGTrashStack = record
    Next: PGTrashStack;
  end;
  PPGTrashStack = ^PGTrashStack;

procedure g_trash_stack_push(stack_p: PPGTrashStack; data_p: Tgpointer); cdecl; external libglib2;
function g_trash_stack_pop(stack_p: PPGTrashStack): Tgpointer; cdecl; external libglib2;
function g_trash_stack_peek(stack_p: PPGTrashStack): Tgpointer; cdecl; external libglib2;
function g_trash_stack_height(stack_p: PPGTrashStack): Tguint; cdecl; external libglib2;

// === Konventiert am: 11-8-24 19:28:44 ===


implementation



end.
