/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 09-08-2024   16:12                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGdkRGBA = record
    red: single;
    green: single;
    blue: single;
    alpha: single;
  end;
  PGdkRGBA = ^TGdkRGBA;

function gdk_rgba_get_type: TGType; cdecl; external libgtk4;
function gdk_rgba_copy(rgba: PGdkRGBA): PGdkRGBA; cdecl; external libgtk4;
procedure gdk_rgba_free(rgba: PGdkRGBA); cdecl; external libgtk4;
function gdk_rgba_is_clear(rgba: PGdkRGBA): Tgboolean; cdecl; external libgtk4;
function gdk_rgba_is_opaque(rgba: PGdkRGBA): Tgboolean; cdecl; external libgtk4;
function gdk_rgba_hash(p: Tgconstpointer): Tguint; cdecl; external libgtk4;
function gdk_rgba_equal(p1: Tgconstpointer; p2: Tgconstpointer): Tgboolean; cdecl; external libgtk4;
function gdk_rgba_parse(rgba: PGdkRGBA; spec: PChar): Tgboolean; cdecl; external libgtk4;
function gdk_rgba_to_string(rgba: PGdkRGBA): PChar; cdecl; external libgtk4;

// === Konventiert am: 2-8-24 15:28:34 ===

function GDK_TYPE_RGBA: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GDK_TYPE_RGBA: TGType;
begin
  GDK_TYPE_RGBA := gdk_rgba_get_type;
end;



{$ENDIF read_implementation}
