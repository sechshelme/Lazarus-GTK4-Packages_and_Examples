unit gsocketaddress;

interface

uses
  common_GLIB, gtypes, gobject, gtype, gerror, giotypes, gioenums;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGSocketAddressClass = record
    parent_class: TGObjectClass;
    get_family: function(address: PGSocketAddress): TGSocketFamily; cdecl;
    get_native_size: function(address: PGSocketAddress): Tgssize; cdecl;
    to_native: function(address: PGSocketAddress; dest: Tgpointer; destlen: Tgsize; error: PPGError): Tgboolean; cdecl;
  end;
  PGSocketAddressClass = ^TGSocketAddressClass;


function g_socket_address_get_type: TGType; cdecl; external libgio2;
function g_socket_address_get_family(address: PGSocketAddress): TGSocketFamily; cdecl; external libgio2;
function g_socket_address_new_from_native(native: Tgpointer; len: Tgsize): PGSocketAddress; cdecl; external libgio2;
function g_socket_address_to_native(address: PGSocketAddress; dest: Tgpointer; destlen: Tgsize; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_socket_address_get_native_size(address: PGSocketAddress): Tgssize; cdecl; external libgio2;

// === Konventiert am: 16-8-24 19:48:25 ===

function G_TYPE_SOCKET_ADDRESS: TGType;
function G_SOCKET_ADDRESS(obj: Pointer): PGSocketAddress;
function G_SOCKET_ADDRESS_CLASS(klass: Pointer): PGSocketAddressClass;
function G_IS_SOCKET_ADDRESS(obj: Pointer): Tgboolean;
function G_IS_SOCKET_ADDRESS_CLASS(klass: Pointer): Tgboolean;
function G_SOCKET_ADDRESS_GET_CLASS(obj: Pointer): PGSocketAddressClass;

implementation

function G_TYPE_SOCKET_ADDRESS: TGType;
begin
  G_TYPE_SOCKET_ADDRESS := g_socket_address_get_type;
end;

function G_SOCKET_ADDRESS(obj: Pointer): PGSocketAddress;
begin
  Result := PGSocketAddress(g_type_check_instance_cast(obj, G_TYPE_SOCKET_ADDRESS));
end;

function G_SOCKET_ADDRESS_CLASS(klass: Pointer): PGSocketAddressClass;
begin
  Result := PGSocketAddressClass(g_type_check_class_cast(klass, G_TYPE_SOCKET_ADDRESS));
end;

function G_IS_SOCKET_ADDRESS(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_SOCKET_ADDRESS);
end;

function G_IS_SOCKET_ADDRESS_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_SOCKET_ADDRESS);
end;

function G_SOCKET_ADDRESS_GET_CLASS(obj: Pointer): PGSocketAddressClass;
begin
  Result := PGSocketAddressClass(PGTypeInstance(obj)^.g_class);
end;



end.
