unit gnativesocketaddress;

interface

uses
  common_GLIB, gtypes, gerror, gtype, giotypes, gobject, gioenums, gsocketaddress;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGNativeSocketAddressPrivate = record
  end;
  PGNativeSocketAddressPrivate = ^TGNativeSocketAddressPrivate;

  TGNativeSocketAddress = record
    parent_instance: TGSocketAddress;
    priv: PGNativeSocketAddressPrivate;
  end;
  PGNativeSocketAddress = ^TGNativeSocketAddress;

  TGNativeSocketAddressClass = record
    parent_class: TGSocketAddressClass;
  end;
  PGNativeSocketAddressClass = ^TGNativeSocketAddressClass;


function g_native_socket_address_get_type: TGType; cdecl; external libgio2;
function g_native_socket_address_new(native: Tgpointer; len: Tgsize): PGSocketAddress; cdecl; external libgio2;

// === Konventiert am: 21-8-24 15:29:56 ===

function G_TYPE_NATIVE_SOCKET_ADDRESS: TGType;
function G_NATIVE_SOCKET_ADDRESS(obj: Pointer): PGNativeSocketAddress;
function G_NATIVE_SOCKET_ADDRESS_CLASS(klass: Pointer): PGNativeSocketAddressClass;
function G_IS_NATIVE_SOCKET_ADDRESS(obj: Pointer): Tgboolean;
function G_IS_NATIVE_SOCKET_ADDRESS_CLASS(klass: Pointer): Tgboolean;
function G_NATIVE_SOCKET_ADDRESS_GET_CLASS(obj: Pointer): PGNativeSocketAddressClass;

implementation

function G_TYPE_NATIVE_SOCKET_ADDRESS: TGType;
begin
  G_TYPE_NATIVE_SOCKET_ADDRESS := g_native_socket_address_get_type;
end;

function G_NATIVE_SOCKET_ADDRESS(obj: Pointer): PGNativeSocketAddress;
begin
  Result := PGNativeSocketAddress(g_type_check_instance_cast(obj, G_TYPE_NATIVE_SOCKET_ADDRESS));
end;

function G_NATIVE_SOCKET_ADDRESS_CLASS(klass: Pointer): PGNativeSocketAddressClass;
begin
  Result := PGNativeSocketAddressClass(g_type_check_class_cast(klass, G_TYPE_NATIVE_SOCKET_ADDRESS));
end;

function G_IS_NATIVE_SOCKET_ADDRESS(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_NATIVE_SOCKET_ADDRESS);
end;

function G_IS_NATIVE_SOCKET_ADDRESS_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_NATIVE_SOCKET_ADDRESS);
end;

function G_NATIVE_SOCKET_ADDRESS_GET_CLASS(obj: Pointer): PGNativeSocketAddressClass;
begin
  Result := PGNativeSocketAddressClass(PGTypeInstance(obj)^.g_class);
end;



end.
