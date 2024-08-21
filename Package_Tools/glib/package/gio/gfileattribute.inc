/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGFileAttributeInfo = record
    Name: PChar;
    _type: TGFileAttributeType;
    flags: TGFileAttributeInfoFlags;
  end;
  PGFileAttributeInfo = ^TGFileAttributeInfo;

  TGFileAttributeInfoList = record
    infos: PGFileAttributeInfo;
    n_infos: longint;
  end;
  PGFileAttributeInfoList = ^TGFileAttributeInfoList;


function g_file_attribute_info_list_get_type: TGType; cdecl; external libgio2;
function g_file_attribute_info_list_new: PGFileAttributeInfoList; cdecl; external libgio2;
function g_file_attribute_info_list_ref(list: PGFileAttributeInfoList): PGFileAttributeInfoList; cdecl; external libgio2;
procedure g_file_attribute_info_list_unref(list: PGFileAttributeInfoList); cdecl; external libgio2;
function g_file_attribute_info_list_dup(list: PGFileAttributeInfoList): PGFileAttributeInfoList; cdecl; external libgio2;
function g_file_attribute_info_list_lookup(list: PGFileAttributeInfoList; Name: PChar): PGFileAttributeInfo; cdecl; external libgio2;
procedure g_file_attribute_info_list_add(list: PGFileAttributeInfoList; Name: PChar; _type: TGFileAttributeType; flags: TGFileAttributeInfoFlags); cdecl; external libgio2;

// === Konventiert am: 18-8-24 15:16:52 ===

function G_TYPE_FILE_ATTRIBUTE_INFO_LIST: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_TYPE_FILE_ATTRIBUTE_INFO_LIST: TGType;
begin
  G_TYPE_FILE_ATTRIBUTE_INFO_LIST := g_file_attribute_info_list_get_type;
end;



{$ENDIF read_implementation}
