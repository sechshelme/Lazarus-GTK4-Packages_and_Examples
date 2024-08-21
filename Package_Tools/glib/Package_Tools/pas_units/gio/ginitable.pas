unit ginitable;

interface

uses
  common_GLIB, gtypes, gerror, gtype, gparam, giotypes, gobject, gioenums;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TGInitable = record
  end;
  PGInitable = ^TGInitable;

  TGInitableIface = record
    g_iface: TGTypeInterface;
    init: function(initable: PGInitable; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl;
  end;
  PGInitableIface = ^TGInitableIface;

function g_initable_get_type: TGType; cdecl; external libgio2;
function g_initable_init(initable: PGInitable; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_initable_new(object_type: TGType; cancellable: PGCancellable; error: PPGError; first_property_name: Pgchar; args: array of const): Tgpointer; cdecl; external libgio2;
function g_initable_new(object_type: TGType; cancellable: PGCancellable; error: PPGError; first_property_name: Pgchar): Tgpointer; cdecl; external libgio2;
function g_initable_newv(object_type: TGType; n_parameters: Tguint; parameters: PGParameter; cancellable: PGCancellable; error: PPGError): Tgpointer; cdecl; external libgio2;
function g_initable_new_valist(object_type: TGType; first_property_name: Pgchar; var_args: Tva_list; cancellable: PGCancellable; error: PPGError): PGObject; cdecl; external libgio2;

function G_TYPE_IS_INITABLE(_type: TGType): Tgboolean;

// === Konventiert am: 21-8-24 15:08:23 ===

function G_TYPE_INITABLE: TGType;
function G_INITABLE(obj: Pointer): PGInitable;
function G_IS_INITABLE(obj: Pointer): Tgboolean;
function G_INITABLE_GET_IFACE(obj: Pointer): PGInitableIface;

implementation

function G_TYPE_INITABLE: TGType;
begin
  G_TYPE_INITABLE := g_initable_get_type;
end;

function G_INITABLE(obj: Pointer): PGInitable;
begin
  Result := PGInitable(g_type_check_instance_cast(obj, G_TYPE_INITABLE));
end;

function G_IS_INITABLE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_INITABLE);
end;

function G_INITABLE_GET_IFACE(obj: Pointer): PGInitableIface;
begin
  Result := g_type_interface_peek(obj, G_TYPE_INITABLE);
end;

// ====

function G_TYPE_IS_INITABLE(_type: TGType): Tgboolean;
begin
  G_TYPE_IS_INITABLE := g_type_is_a(_type, G_TYPE_INITABLE);
end;


end.
