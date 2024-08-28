/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 28-08-2024   15:47                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGtkVolumeButton = record
    parent: TGtkScaleButton;
  end;
  PGtkVolumeButton = ^TGtkVolumeButton;


function gtk_volume_button_get_type: TGType; cdecl; external libgtk4;
function gtk_volume_button_new: PGtkWidget; cdecl; external libgtk4;

// === Konventiert am: 30-7-24 16:18:11 ===

function GTK_TYPE_VOLUME_BUTTON: TGType;
function GTK_VOLUME_BUTTON(obj: Pointer): PGtkVolumeButton;
function GTK_IS_VOLUME_BUTTON(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GTK_TYPE_VOLUME_BUTTON: TGType;
begin
  GTK_TYPE_VOLUME_BUTTON := gtk_volume_button_get_type;
end;

function GTK_VOLUME_BUTTON(obj: Pointer): PGtkVolumeButton;
begin
  Result := PGtkVolumeButton(g_type_check_instance_cast(obj, GTK_TYPE_VOLUME_BUTTON));
end;

function GTK_IS_VOLUME_BUTTON(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_VOLUME_BUTTON);
end;



{$ENDIF read_implementation}
