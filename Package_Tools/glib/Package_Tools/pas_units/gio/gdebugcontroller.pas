unit gdebugcontroller;

interface

uses
  common_GLIB, gtypes, gerror, gtype, giotypes, gobject, gioenums;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

const
  G_DEBUG_CONTROLLER_EXTENSION_POINT_NAME = 'gio-debug-controller';
  {G_DECLARE_INTERFACE (GDebugController, g_debug_controller, g, debug_controller, GObject) }


type
  TGDebugControllerInterface = record
    g_iface: TGTypeInterface;
  end;
  PGDebugControllerInterface = ^TGDebugControllerInterface;

  TGDebugController = record
  end;
  PGDebugController = ^TGDebugController;

function g_debug_controller_get_type: TGType; cdecl; external libgtk4;
function g_debug_controller_get_debug_enabled(self: PGDebugController): Tgboolean; cdecl; external libgio2;
procedure g_debug_controller_set_debug_enabled(self: PGDebugController; debug_enabled: Tgboolean); cdecl; external libgio2;

// === Konventiert am: 21-8-24 15:29:29 ===

function G_TYPE_DEBUG_CONTROLLER: TGType;
function G_DEBUG_CONTROLLER(obj: Pointer): PGDebugController;
function G_IS_DEBUG_CONTROLLER(obj: Pointer): Tgboolean;
function G_DEBUG_CONTROLLER_GET_INTERFACE(obj: Pointer): PGDebugControllerInterface;

function g_debug_controller_GET_IFACE(obj: Pointer): PGDebugControllerInterface;

implementation

function G_TYPE_DEBUG_CONTROLLER: TGType;
begin
  G_TYPE_DEBUG_CONTROLLER := g_debug_controller_get_type;
end;

function G_DEBUG_CONTROLLER(obj: Pointer): PGDebugController;
begin
  Result := PGDebugController(g_type_check_instance_cast(obj, G_TYPE_DEBUG_CONTROLLER));
end;

function G_IS_DEBUG_CONTROLLER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_DEBUG_CONTROLLER);
end;

function G_DEBUG_CONTROLLER_GET_INTERFACE(obj: Pointer): PGDebugControllerInterface;
begin
  Result := g_type_interface_peek(obj, G_TYPE_DEBUG_CONTROLLER);
end;


function g_debug_controller_GET_IFACE(obj: Pointer): PGDebugControllerInterface;
begin
  Result := g_type_interface_peek(obj, g_TYPE_debug_controller);
end;



end.
