/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 28-08-2024   15:47                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}


const
  GTK_PRIORITY_RESIZE = G_PRIORITY_HIGH_IDLE + 10;

{$ifdef linux}
procedure gtk_init; cdecl; external libgtk4;
function gtk_init_check: Tgboolean; cdecl; external libgtk4;
{$endif}

function gtk_is_initialized: Tgboolean; cdecl; external libgtk4;

//{$ifdef G_OS_WIN32}
{$ifdef windows}
procedure gtk_init_abi_check(num_checks: longint; sizeof_GtkWindow: Tsize_t; sizeof_GtkBox: Tsize_t); cdecl; external libgtk4;
function gtk_init_check_abi_check(num_checks: longint; sizeof_GtkWindow: Tsize_t; sizeof_GtkBox: Tsize_t): Tgboolean; cdecl; external libgtk4;

procedure gtk_init;
function gtk_init_check: Tgboolean;
{$endif}

procedure gtk_disable_setlocale; cdecl; external libgtk4;
function gtk_get_default_language: PPangoLanguage; cdecl; external libgtk4;
function gtk_get_locale_direction: TGtkTextDirection; cdecl; external libgtk4;

{$ENDIF read_interface}


{$IFDEF read_implementation}

{$ifdef windows}
procedure gtk_init;
begin
  gtk_init_abi_check(2, sizeof(TGtkWindow), sizeof(TGtkBox));
end;

function gtk_init_check: Tgboolean;
begin
  gtk_init_check := gtk_init_check_abi_check(2, sizeof(TGtkWindow), sizeof(TGtkBox));
end;
{$endif}


{$ENDIF read_implementation}
