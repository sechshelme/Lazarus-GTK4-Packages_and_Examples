/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}


type
  TGSocketConnectionPrivate = record
  end;
  PGSocketConnectionPrivate = ^TGSocketConnectionPrivate;

  TGSocketConnectionClass = record
    parent_class: TGIOStreamClass;
    _g_reserved1: procedure; cdecl;
    _g_reserved2: procedure; cdecl;
    _g_reserved3: procedure; cdecl;
    _g_reserved4: procedure; cdecl;
    _g_reserved5: procedure; cdecl;
    _g_reserved6: procedure; cdecl;
  end;
  PGSocketConnectionClass = ^TGSocketConnectionClass;

  TGSocketConnection = record
    parent_instance: TGIOStream;
    priv: PGSocketConnectionPrivate;
  end;
  PGSocketConnection = ^TGSocketConnection;


function g_socket_connection_get_type: TGType; cdecl; external libgio2;
function g_socket_connection_is_connected(connection: PGSocketConnection): Tgboolean; cdecl; external libgio2;
function g_socket_connection_connect(connection: PGSocketConnection; address: PGSocketAddress; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libgio2;
procedure g_socket_connection_connect_async(connection: PGSocketConnection; address: PGSocketAddress; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_socket_connection_connect_finish(connection: PGSocketConnection; Result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_socket_connection_get_socket(connection: PGSocketConnection): PGSocket; cdecl; external libgio2;
function g_socket_connection_get_local_address(connection: PGSocketConnection; error: PPGError): PGSocketAddress; cdecl; external libgio2;
function g_socket_connection_get_remote_address(connection: PGSocketConnection; error: PPGError): PGSocketAddress; cdecl; external libgio2;
procedure g_socket_connection_factory_register_type(g_type: TGType; family: TGSocketFamily; _type: TGSocketType; protocol: Tgint); cdecl; external libgio2;
function g_socket_connection_factory_lookup_type(family: TGSocketFamily; _type: TGSocketType; protocol_id: Tgint): TGType; cdecl; external libgio2;
function g_socket_connection_factory_create_connection(socket: PGSocket): PGSocketConnection; cdecl; external libgio2;

// === Konventiert am: 19-8-24 19:27:05 ===

function G_TYPE_SOCKET_CONNECTION: TGType;
function G_SOCKET_CONNECTION(obj: Pointer): PGSocketConnection;
function G_SOCKET_CONNECTION_CLASS(klass: Pointer): PGSocketConnectionClass;
function G_IS_SOCKET_CONNECTION(obj: Pointer): Tgboolean;
function G_IS_SOCKET_CONNECTION_CLASS(klass: Pointer): Tgboolean;
function G_SOCKET_CONNECTION_GET_CLASS(obj: Pointer): PGSocketConnectionClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_TYPE_SOCKET_CONNECTION: TGType;
begin
  G_TYPE_SOCKET_CONNECTION := g_socket_connection_get_type;
end;

function G_SOCKET_CONNECTION(obj: Pointer): PGSocketConnection;
begin
  Result := PGSocketConnection(g_type_check_instance_cast(obj, G_TYPE_SOCKET_CONNECTION));
end;

function G_SOCKET_CONNECTION_CLASS(klass: Pointer): PGSocketConnectionClass;
begin
  Result := PGSocketConnectionClass(g_type_check_class_cast(klass, G_TYPE_SOCKET_CONNECTION));
end;

function G_IS_SOCKET_CONNECTION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_SOCKET_CONNECTION);
end;

function G_IS_SOCKET_CONNECTION_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_SOCKET_CONNECTION);
end;

function G_SOCKET_CONNECTION_GET_CLASS(obj: Pointer): PGSocketConnectionClass;
begin
  Result := PGSocketConnectionClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
