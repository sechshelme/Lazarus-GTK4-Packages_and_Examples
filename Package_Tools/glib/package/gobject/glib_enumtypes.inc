/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

function g_unicode_type_get_type: TGType; cdecl; external libgobject2_0;
function g_unicode_break_type_get_type: TGType; cdecl; external libgobject2_0;
function g_unicode_script_get_type: TGType; cdecl; external libgobject2_0;
function g_normalize_mode_get_type: TGType; cdecl; external libgobject2_0;

function G_TYPE_UNICODE_TYPE: TGType;
function G_TYPE_UNICODE_BREAK_TYPE: TGType;
function G_TYPE_UNICODE_SCRIPT: TGType;
function G_TYPE_NORMALIZE_MODE: TGType;


// === Konventiert am: 15-8-24 19:51:21 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function G_TYPE_UNICODE_TYPE: TGType;
begin
  G_TYPE_UNICODE_TYPE := g_unicode_type_get_type;
end;

function G_TYPE_UNICODE_BREAK_TYPE: TGType;
begin
  G_TYPE_UNICODE_BREAK_TYPE := g_unicode_break_type_get_type;
end;

function G_TYPE_UNICODE_SCRIPT: TGType;
begin
  G_TYPE_UNICODE_SCRIPT := g_unicode_script_get_type;
end;

function G_TYPE_NORMALIZE_MODE: TGType;
begin
  G_TYPE_NORMALIZE_MODE := g_normalize_mode_get_type;
end;


{$ENDIF read_implementation}
