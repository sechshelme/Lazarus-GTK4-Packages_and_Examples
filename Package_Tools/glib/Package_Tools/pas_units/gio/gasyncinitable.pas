unit gasyncinitable;

interface

uses
  common_GLIB, gtypes, gerror, gtype, gparam, giotypes, gobject, gioenums;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TGAsyncInitable = record
  end;
  PGAsyncInitable = ^TGAsyncInitable;

  TGAsyncInitableIface = record
    g_iface: TGTypeInterface;
    init_async: procedure(initable: PGAsyncInitable; io_priority: longint; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl;
    init_finish: function(initable: PGAsyncInitable; res: PGAsyncResult; error: PPGError): Tgboolean; cdecl;
  end;
  PGAsyncInitableIface = ^TGAsyncInitableIface;


function g_async_initable_get_type: TGType; cdecl; external libgio2;
procedure g_async_initable_init_async(initable: PGAsyncInitable; io_priority: longint; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_async_initable_init_finish(initable: PGAsyncInitable; res: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libgio2;
procedure g_async_initable_new_async(object_type: TGType; io_priority: longint; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer;
  first_property_name: Pgchar; args: array of const); cdecl; external libgio2;
procedure g_async_initable_new_async(object_type: TGType; io_priority: longint; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer;
  first_property_name: Pgchar); cdecl; external libgio2;
procedure g_async_initable_newv_async(object_type: TGType; n_parameters: Tguint; parameters: PGParameter; io_priority: longint; cancellable: PGCancellable;
  callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
procedure g_async_initable_new_valist_async(object_type: TGType; first_property_name: Pgchar; var_args: Tva_list; io_priority: longint; cancellable: PGCancellable;
  callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_async_initable_new_finish(initable: PGAsyncInitable; res: PGAsyncResult; error: PPGError): PGObject; cdecl; external libgio2;

function G_TYPE_IS_ASYNC_INITABLE(_type: TGType): Tgboolean;


// === Konventiert am: 20-8-24 15:49:58 ===

function G_TYPE_ASYNC_INITABLE: TGType;
function G_ASYNC_INITABLE(obj: Pointer): PGAsyncInitable;
function G_IS_ASYNC_INITABLE(obj: Pointer): Tgboolean;
function G_ASYNC_INITABLE_GET_IFACE(obj: Pointer): PGAsyncInitableIface;

implementation

function G_TYPE_ASYNC_INITABLE: TGType;
begin
  G_TYPE_ASYNC_INITABLE := g_async_initable_get_type;
end;

function G_ASYNC_INITABLE(obj: Pointer): PGAsyncInitable;
begin
  Result := PGAsyncInitable(g_type_check_instance_cast(obj, G_TYPE_ASYNC_INITABLE));
end;

function G_IS_ASYNC_INITABLE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_ASYNC_INITABLE);
end;

function G_ASYNC_INITABLE_GET_IFACE(obj: Pointer): PGAsyncInitableIface;
begin
  Result := g_type_interface_peek(obj, G_TYPE_ASYNC_INITABLE);
end;

// ====

function G_TYPE_IS_ASYNC_INITABLE(_type: TGType): Tgboolean;
begin
  G_TYPE_IS_ASYNC_INITABLE := g_type_is_a(_type, G_TYPE_ASYNC_INITABLE);
end;


end.
