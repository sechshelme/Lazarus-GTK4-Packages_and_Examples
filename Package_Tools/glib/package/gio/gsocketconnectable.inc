/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGSocketConnectableIface = record
    g_iface: TGTypeInterface;
    enumerate: function(connectable: PGSocketConnectable): PGSocketAddressEnumerator; cdecl;
    proxy_enumerate: function(connectable: PGSocketConnectable): PGSocketAddressEnumerator; cdecl;
    to_string: function(connectable: PGSocketConnectable): Pgchar; cdecl;
  end;
  PGSocketConnectableIface = ^TGSocketConnectableIface;

function g_socket_connectable_get_type: TGType; cdecl; external libgio2;
function g_socket_connectable_enumerate(connectable: PGSocketConnectable): PGSocketAddressEnumerator; cdecl; external libgio2;
function g_socket_connectable_proxy_enumerate(connectable: PGSocketConnectable): PGSocketAddressEnumerator; cdecl; external libgio2;
function g_socket_connectable_to_string(connectable: PGSocketConnectable): Pgchar; cdecl; external libgio2;

// === Konventiert am: 21-8-24 15:08:50 ===

function G_TYPE_SOCKET_CONNECTABLE: TGType;
function G_SOCKET_CONNECTABLE(obj: Pointer): PGSocketConnectable;
function G_IS_SOCKET_CONNECTABLE(obj: Pointer): Tgboolean;
function G_SOCKET_CONNECTABLE_GET_IFACE(obj: Pointer): PGSocketConnectableIface;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_TYPE_SOCKET_CONNECTABLE: TGType;
begin
  G_TYPE_SOCKET_CONNECTABLE := g_socket_connectable_get_type;
end;

function G_SOCKET_CONNECTABLE(obj: Pointer): PGSocketConnectable;
begin
  Result := PGSocketConnectable(g_type_check_instance_cast(obj, G_TYPE_SOCKET_CONNECTABLE));
end;

function G_IS_SOCKET_CONNECTABLE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_SOCKET_CONNECTABLE);
end;

function G_SOCKET_CONNECTABLE_GET_IFACE(obj: Pointer): PGSocketConnectableIface;
begin
  Result := g_type_interface_peek(obj, G_TYPE_SOCKET_CONNECTABLE);
end;



{$ENDIF read_implementation}
