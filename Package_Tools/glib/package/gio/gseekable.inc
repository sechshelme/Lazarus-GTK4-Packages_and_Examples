/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGSeekable = record
  end;
  PGSeekable = ^TGSeekable;

  TGSeekableIface = record
    g_iface: TGTypeInterface;
    tell: function(seekable: PGSeekable): Tgoffset; cdecl;
    can_seek: function(seekable: PGSeekable): Tgboolean; cdecl;
    seek: function(seekable: PGSeekable; offset: Tgoffset; _type: TGSeekType; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl;
    can_truncate: function(seekable: PGSeekable): Tgboolean; cdecl;
    truncate_fn: function(seekable: PGSeekable; offset: Tgoffset; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl;
  end;
  PGSeekableIface = ^TGSeekableIface;

function g_seekable_get_type: TGType; cdecl; external libgio2;
function g_seekable_tell(seekable: PGSeekable): Tgoffset; cdecl; external libgio2;
function g_seekable_can_seek(seekable: PGSeekable): Tgboolean; cdecl; external libgio2;
function g_seekable_seek(seekable: PGSeekable; offset: Tgoffset; _type: TGSeekType; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_seekable_can_truncate(seekable: PGSeekable): Tgboolean; cdecl; external libgio2;
function g_seekable_truncate(seekable: PGSeekable; offset: Tgoffset; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libgio2;

// === Konventiert am: 21-8-24 13:54:15 ===

function G_TYPE_SEEKABLE: TGType;
function G_SEEKABLE(obj: Pointer): PGSeekable;
function G_IS_SEEKABLE(obj: Pointer): Tgboolean;
function G_SEEKABLE_GET_IFACE(obj: Pointer): PGSeekableIface;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_TYPE_SEEKABLE: TGType;
begin
  G_TYPE_SEEKABLE := g_seekable_get_type;
end;

function G_SEEKABLE(obj: Pointer): PGSeekable;
begin
  Result := PGSeekable(g_type_check_instance_cast(obj, G_TYPE_SEEKABLE));
end;

function G_IS_SEEKABLE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_SEEKABLE);
end;

function G_SEEKABLE_GET_IFACE(obj: Pointer): PGSeekableIface;
begin
  Result := g_type_interface_peek(obj, G_TYPE_SEEKABLE);
end;



{$ENDIF read_implementation}
