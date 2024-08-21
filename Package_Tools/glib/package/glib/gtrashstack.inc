/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

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


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
