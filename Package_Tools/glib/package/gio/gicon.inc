/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  PGIconIface = ^TGIconIface;

  TGIconIface = record
    g_iface: TGTypeInterface;
    hash: function(icon: PGIcon): Tguint; cdecl;
    equal: function(icon1: PGIcon; icon2: PGIcon): Tgboolean; cdecl;
    to_tokens: function(icon: PGIcon; tokens: PGPtrArray; out_version: Pgint): Tgboolean; cdecl;
    from_tokens: function(tokens: PPgchar; num_tokens: Tgint; version: Tgint; error: PPGError): PGIcon; cdecl;
    serialize: function(icon: PGIcon): PGVariant; cdecl;
  end;

function g_icon_get_type: TGType; cdecl; external libgio2;
function g_icon_hash(icon: Tgconstpointer): Tguint; cdecl; external libgio2;
function g_icon_equal(icon1: PGIcon; icon2: PGIcon): Tgboolean; cdecl; external libgio2;
function g_icon_to_string(icon: PGIcon): Pgchar; cdecl; external libgio2;
function g_icon_new_for_string(str: Pgchar; error: PPGError): PGIcon; cdecl; external libgio2;
function g_icon_serialize(icon: PGIcon): PGVariant; cdecl; external libgio2;
function g_icon_deserialize(Value: PGVariant): PGIcon; cdecl; external libgio2;

// === Konventiert am: 20-8-24 18:13:08 ===

function G_TYPE_ICON: TGType;
function G_ICON(obj: Pointer): PGIcon;
function G_IS_ICON(obj: Pointer): Tgboolean;
function G_ICON_GET_IFACE(obj: Pointer): PGIconIface;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_TYPE_ICON: TGType;
begin
  G_TYPE_ICON := g_icon_get_type;
end;

function G_ICON(obj: Pointer): PGIcon;
begin
  Result := PGIcon(g_type_check_instance_cast(obj, G_TYPE_ICON));
end;

function G_IS_ICON(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_ICON);
end;

function G_ICON_GET_IFACE(obj: Pointer): PGIconIface;
begin
  Result := g_type_interface_peek(obj, G_TYPE_ICON);
end;



{$ENDIF read_implementation}
