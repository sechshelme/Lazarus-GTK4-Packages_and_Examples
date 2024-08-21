unit gloadableicon;

interface

uses
  common_GLIB, gtypes, gerror, gtype, giotypes, gobject, gioenums, ginputstream;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGLoadableIcon = record
  end;
  PGLoadableIcon = ^TGLoadableIcon;

  TGLoadableIconIface = record
    g_iface: TGTypeInterface;
    load: function(icon: PGLoadableIcon; size: longint; _type: PPchar; cancellable: PGCancellable; error: PPGError): PGInputStream; cdecl;
    load_async: procedure(icon: PGLoadableIcon; size: longint; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl;
    load_finish: function(icon: PGLoadableIcon; res: PGAsyncResult; _type: PPchar; error: PPGError): PGInputStream; cdecl;
  end;
  PGLoadableIconIface = ^TGLoadableIconIface;


function g_loadable_icon_get_type: TGType; cdecl; external libgio2;
function g_loadable_icon_load(icon: PGLoadableIcon; size: longint; _type: PPchar; cancellable: PGCancellable; error: PPGError): PGInputStream; cdecl; external libgio2;
procedure g_loadable_icon_load_async(icon: PGLoadableIcon; size: longint; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_loadable_icon_load_finish(icon: PGLoadableIcon; res: PGAsyncResult; _type: PPchar; error: PPGError): PGInputStream; cdecl; external libgio2;

// === Konventiert am: 21-8-24 13:30:47 ===

function G_TYPE_LOADABLE_ICON: TGType;
function G_LOADABLE_ICON(obj: Pointer): PGLoadableIcon;
function G_IS_LOADABLE_ICON(obj: Pointer): Tgboolean;
function G_LOADABLE_ICON_GET_IFACE(obj: Pointer): PGLoadableIconIface;

implementation

function G_TYPE_LOADABLE_ICON: TGType;
begin
  G_TYPE_LOADABLE_ICON := g_loadable_icon_get_type;
end;

function G_LOADABLE_ICON(obj: Pointer): PGLoadableIcon;
begin
  Result := PGLoadableIcon(g_type_check_instance_cast(obj, G_TYPE_LOADABLE_ICON));
end;

function G_IS_LOADABLE_ICON(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_LOADABLE_ICON);
end;

function G_LOADABLE_ICON_GET_IFACE(obj: Pointer): PGLoadableIconIface;
begin
  Result := g_type_interface_peek(obj, G_TYPE_LOADABLE_ICON);
end;



end.
