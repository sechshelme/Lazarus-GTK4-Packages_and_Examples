/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 28-08-2024   15:47                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

function gtk_accelerator_valid(keyval: Tguint; modifiers: TGdkModifierType): Tgboolean; cdecl; external libgtk4;
function gtk_accelerator_parse(accelerator: PChar; accelerator_key: Pguint; accelerator_mods: PGdkModifierType): Tgboolean; cdecl; external libgtk4;
function gtk_accelerator_parse_with_keycode(accelerator: PChar; display: PGdkDisplay; accelerator_key: Pguint; accelerator_codes: PPguint; accelerator_mods: PGdkModifierType): Tgboolean; cdecl; external libgtk4;
function gtk_accelerator_name(accelerator_key: Tguint; accelerator_mods: TGdkModifierType): PChar; cdecl; external libgtk4;
function gtk_accelerator_name_with_keycode(display: PGdkDisplay; accelerator_key: Tguint; keycode: Tguint; accelerator_mods: TGdkModifierType): PChar; cdecl; external libgtk4;
function gtk_accelerator_get_label(accelerator_key: Tguint; accelerator_mods: TGdkModifierType): PChar; cdecl; external libgtk4;
function gtk_accelerator_get_label_with_keycode(display: PGdkDisplay; accelerator_key: Tguint; keycode: Tguint; accelerator_mods: TGdkModifierType): PChar; cdecl; external libgtk4;
function gtk_accelerator_get_default_mod_mask: TGdkModifierType; cdecl; external libgtk4;

{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
