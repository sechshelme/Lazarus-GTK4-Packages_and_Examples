/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}


type
  TGSocketClass = record
    parent_class: TGObjectClass;
    _g_reserved1: procedure; cdecl;
    _g_reserved2: procedure; cdecl;
    _g_reserved3: procedure; cdecl;
    _g_reserved4: procedure; cdecl;
    _g_reserved5: procedure; cdecl;
    _g_reserved6: procedure; cdecl;
    _g_reserved7: procedure; cdecl;
    _g_reserved8: procedure; cdecl;
    _g_reserved9: procedure; cdecl;
    _g_reserved10: procedure; cdecl;
  end;
  PGSocketClass = ^TGSocketClass;



function g_socket_get_type: TGType; cdecl; external libgio2;
function g_socket_new(family: TGSocketFamily; _type: TGSocketType; protocol: TGSocketProtocol; error: PPGError): PGSocket; cdecl; external libgio2;
function g_socket_new_from_fd(fd: Tgint; error: PPGError): PGSocket; cdecl; external libgio2;
function g_socket_get_fd(socket: PGSocket): longint; cdecl; external libgio2;
function g_socket_get_family(socket: PGSocket): TGSocketFamily; cdecl; external libgio2;
function g_socket_get_socket_type(socket: PGSocket): TGSocketType; cdecl; external libgio2;
function g_socket_get_protocol(socket: PGSocket): TGSocketProtocol; cdecl; external libgio2;
function g_socket_get_local_address(socket: PGSocket; error: PPGError): PGSocketAddress; cdecl; external libgio2;
function g_socket_get_remote_address(socket: PGSocket; error: PPGError): PGSocketAddress; cdecl; external libgio2;
procedure g_socket_set_blocking(socket: PGSocket; blocking: Tgboolean); cdecl; external libgio2;
function g_socket_get_blocking(socket: PGSocket): Tgboolean; cdecl; external libgio2;
procedure g_socket_set_keepalive(socket: PGSocket; keepalive: Tgboolean); cdecl; external libgio2;
function g_socket_get_keepalive(socket: PGSocket): Tgboolean; cdecl; external libgio2;
function g_socket_get_listen_backlog(socket: PGSocket): Tgint; cdecl; external libgio2;
procedure g_socket_set_listen_backlog(socket: PGSocket; backlog: Tgint); cdecl; external libgio2;
function g_socket_get_timeout(socket: PGSocket): Tguint; cdecl; external libgio2;
procedure g_socket_set_timeout(socket: PGSocket; timeout: Tguint); cdecl; external libgio2;
function g_socket_get_ttl(socket: PGSocket): Tguint; cdecl; external libgio2;
procedure g_socket_set_ttl(socket: PGSocket; ttl: Tguint); cdecl; external libgio2;
function g_socket_get_broadcast(socket: PGSocket): Tgboolean; cdecl; external libgio2;
procedure g_socket_set_broadcast(socket: PGSocket; broadcast: Tgboolean); cdecl; external libgio2;
function g_socket_get_multicast_loopback(socket: PGSocket): Tgboolean; cdecl; external libgio2;
procedure g_socket_set_multicast_loopback(socket: PGSocket; loopback: Tgboolean); cdecl; external libgio2;
function g_socket_get_multicast_ttl(socket: PGSocket): Tguint; cdecl; external libgio2;
procedure g_socket_set_multicast_ttl(socket: PGSocket; ttl: Tguint); cdecl; external libgio2;
function g_socket_is_connected(socket: PGSocket): Tgboolean; cdecl; external libgio2;
function g_socket_bind(socket: PGSocket; address: PGSocketAddress; allow_reuse: Tgboolean; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_socket_join_multicast_group(socket: PGSocket; group: PGInetAddress; source_specific: Tgboolean; iface: Pgchar; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_socket_leave_multicast_group(socket: PGSocket; group: PGInetAddress; source_specific: Tgboolean; iface: Pgchar; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_socket_join_multicast_group_ssm(socket: PGSocket; group: PGInetAddress; source_specific: PGInetAddress; iface: Pgchar; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_socket_leave_multicast_group_ssm(socket: PGSocket; group: PGInetAddress; source_specific: PGInetAddress; iface: Pgchar; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_socket_connect(socket: PGSocket; address: PGSocketAddress; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_socket_check_connect_result(socket: PGSocket; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_socket_get_available_bytes(socket: PGSocket): Tgssize; cdecl; external libgio2;
function g_socket_condition_check(socket: PGSocket; condition: TGIOCondition): TGIOCondition; cdecl; external libgio2;
function g_socket_condition_wait(socket: PGSocket; condition: TGIOCondition; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_socket_condition_timed_wait(socket: PGSocket; condition: TGIOCondition; timeout_us: Tgint64; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_socket_accept(socket: PGSocket; cancellable: PGCancellable; error: PPGError): PGSocket; cdecl; external libgio2;
function g_socket_listen(socket: PGSocket; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_socket_receive(socket: PGSocket; buffer: Pgchar; size: Tgsize; cancellable: PGCancellable; error: PPGError): Tgssize; cdecl; external libgio2;
function g_socket_receive_bytes(socket: PGSocket; size: Tgsize; timeout_us: Tgint64; cancellable: PGCancellable; error: PPGError): PGBytes; cdecl; external libgio2;
function g_socket_receive_from(socket: PGSocket; address: PPGSocketAddress; buffer: Pgchar; size: Tgsize; cancellable: PGCancellable;
  error: PPGError): Tgssize; cdecl; external libgio2;
function g_socket_receive_bytes_from(socket: PGSocket; address: PPGSocketAddress; size: Tgsize; timeout_us: Tgint64; cancellable: PGCancellable;
  error: PPGError): PGBytes; cdecl; external libgio2;
function g_socket_send(socket: PGSocket; buffer: Pgchar; size: Tgsize; cancellable: PGCancellable; error: PPGError): Tgssize; cdecl; external libgio2;
function g_socket_send_to(socket: PGSocket; address: PGSocketAddress; buffer: Pgchar; size: Tgsize; cancellable: PGCancellable;
  error: PPGError): Tgssize; cdecl; external libgio2;
function g_socket_receive_message(socket: PGSocket; address: PPGSocketAddress; vectors: PGInputVector; num_vectors: Tgint; Messages: PPPGSocketControlMessage;
  num_messages: Pgint; flags: Pgint; cancellable: PGCancellable; error: PPGError): Tgssize; cdecl; external libgio2;
function g_socket_send_message(socket: PGSocket; address: PGSocketAddress; vectors: PGOutputVector; num_vectors: Tgint; Messages: PPGSocketControlMessage;
  num_messages: Tgint; flags: Tgint; cancellable: PGCancellable; error: PPGError): Tgssize; cdecl; external libgio2;
function g_socket_receive_messages(socket: PGSocket; Messages: PGInputMessage; num_messages: Tguint; flags: Tgint; cancellable: PGCancellable;
  error: PPGError): Tgint; cdecl; external libgio2;
function g_socket_send_messages(socket: PGSocket; Messages: PGOutputMessage; num_messages: Tguint; flags: Tgint; cancellable: PGCancellable;
  error: PPGError): Tgint; cdecl; external libgio2;
function g_socket_close(socket: PGSocket; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_socket_shutdown(socket: PGSocket; shutdown_read: Tgboolean; shutdown_write: Tgboolean; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_socket_is_closed(socket: PGSocket): Tgboolean; cdecl; external libgio2;
function g_socket_create_source(socket: PGSocket; condition: TGIOCondition; cancellable: PGCancellable): PGSource; cdecl; external libgio2;
function g_socket_speaks_ipv4(socket: PGSocket): Tgboolean; cdecl; external libgio2;
function g_socket_get_credentials(socket: PGSocket; error: PPGError): PGCredentials; cdecl; external libgio2;
function g_socket_receive_with_blocking(socket: PGSocket; buffer: Pgchar; size: Tgsize; blocking: Tgboolean; cancellable: PGCancellable;
  error: PPGError): Tgssize; cdecl; external libgio2;
function g_socket_send_with_blocking(socket: PGSocket; buffer: Pgchar; size: Tgsize; blocking: Tgboolean; cancellable: PGCancellable;
  error: PPGError): Tgssize; cdecl; external libgio2;
function g_socket_send_message_with_timeout(socket: PGSocket; address: PGSocketAddress; vectors: PGOutputVector; num_vectors: Tgint; Messages: PPGSocketControlMessage;
  num_messages: Tgint; flags: Tgint; timeout_us: Tgint64; bytes_written: Pgsize; cancellable: PGCancellable;
  error: PPGError): TGPollableReturn; cdecl; external libgio2;
function g_socket_get_option(socket: PGSocket; level: Tgint; optname: Tgint; Value: Pgint; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_socket_set_option(socket: PGSocket; level: Tgint; optname: Tgint; Value: Tgint; error: PPGError): Tgboolean; cdecl; external libgio2;

// === Konventiert am: 16-8-24 19:45:20 ===

function G_TYPE_SOCKET: TGType;
function G_SOCKET(obj: Pointer): PGSocket;
function G_SOCKET_CLASS(klass: Pointer): PGSocketClass;
function G_IS_SOCKET(obj: Pointer): Tgboolean;
function G_IS_SOCKET_CLASS(klass: Pointer): Tgboolean;
function G_SOCKET_GET_CLASS(obj: Pointer): PGSocketClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_TYPE_SOCKET: TGType;
begin
  G_TYPE_SOCKET := g_socket_get_type;
end;

function G_SOCKET(obj: Pointer): PGSocket;
begin
  Result := PGSocket(g_type_check_instance_cast(obj, G_TYPE_SOCKET));
end;

function G_SOCKET_CLASS(klass: Pointer): PGSocketClass;
begin
  Result := PGSocketClass(g_type_check_class_cast(klass, G_TYPE_SOCKET));
end;

function G_IS_SOCKET(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_SOCKET);
end;

function G_IS_SOCKET_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_SOCKET);
end;

function G_SOCKET_GET_CLASS(obj: Pointer): PGSocketClass;
begin
  Result := PGSocketClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
