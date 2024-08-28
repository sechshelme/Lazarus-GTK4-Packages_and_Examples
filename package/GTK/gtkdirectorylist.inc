/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 28-08-2024   15:47                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}


  {G_DECLARE_FINAL_TYPE (GtkDirectoryList, gtk_directory_list, GTK, DIRECTORY_LIST, GObject) }
type
  TGtkDirectoryList = record
  end;
  PGtkDirectoryList = ^TGtkDirectoryList;

  TGtkDirectoryListClass = record
    parent_class: TGObjectClass;
  end;
  PGtkDirectoryListClass = ^TGtkDirectoryListClass;

function gtk_directory_list_get_type: TGType; cdecl; external libgtk4;
function gtk_directory_list_new(attributes: PChar; _file: PGFile): PGtkDirectoryList; cdecl; external libgtk4;
procedure gtk_directory_list_set_file(self: PGtkDirectoryList; _file: PGFile); cdecl; external libgtk4;
function gtk_directory_list_get_file(self: PGtkDirectoryList): PGFile; cdecl; external libgtk4;
procedure gtk_directory_list_set_attributes(self: PGtkDirectoryList; attributes: PChar); cdecl; external libgtk4;
function gtk_directory_list_get_attributes(self: PGtkDirectoryList): PChar; cdecl; external libgtk4;
procedure gtk_directory_list_set_io_priority(self: PGtkDirectoryList; io_priority: longint); cdecl; external libgtk4;
function gtk_directory_list_get_io_priority(self: PGtkDirectoryList): longint; cdecl; external libgtk4;
function gtk_directory_list_is_loading(self: PGtkDirectoryList): Tgboolean; cdecl; external libgtk4;
function gtk_directory_list_get_error(self: PGtkDirectoryList): PGError; cdecl; external libgtk4;
procedure gtk_directory_list_set_monitored(self: PGtkDirectoryList; monitored: Tgboolean); cdecl; external libgtk4;
function gtk_directory_list_get_monitored(self: PGtkDirectoryList): Tgboolean; cdecl; external libgtk4;

// === Konventiert am: 24-7-24 19:52:49 ===

function GTK_TYPE_DIRECTORY_LIST: TGType;
function GTK_DIRECTORY_LIST(obj: Pointer): PGtkDirectoryList;
function GTK_IS_DIRECTORY_LIST(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GTK_TYPE_DIRECTORY_LIST: TGType;
begin
  Result := gtk_directory_list_get_type;
end;

function GTK_DIRECTORY_LIST(obj: Pointer): PGtkDirectoryList;
begin
  Result := PGtkDirectoryList(g_type_check_instance_cast(obj, GTK_TYPE_DIRECTORY_LIST));
end;

function GTK_IS_DIRECTORY_LIST(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_DIRECTORY_LIST);
end;




{$ENDIF read_implementation}
