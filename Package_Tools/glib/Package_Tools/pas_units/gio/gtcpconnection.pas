unit gtcpconnection;

interface

uses
  common_GLIB, gtypes, gerror, gtype, giotypes, gobject, gioenums, gsocketconnection;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGTcpConnectionPrivate = record
  end;
  PGTcpConnectionPrivate = ^TGTcpConnectionPrivate;

  TGTcpConnectionClass = record
    parent_class: TGSocketConnectionClass;
  end;
  PGTcpConnectionClass = ^TGTcpConnectionClass;

  TGTcpConnection = record
    parent_instance: TGSocketConnection;
    priv: PGTcpConnectionPrivate;
  end;
  PGTcpConnection = ^TGTcpConnection;

function g_tcp_connection_get_type: TGType; cdecl; external libgio2;
procedure g_tcp_connection_set_graceful_disconnect(connection: PGTcpConnection; graceful_disconnect: Tgboolean); cdecl; external libgio2;
function g_tcp_connection_get_graceful_disconnect(connection: PGTcpConnection): Tgboolean; cdecl; external libgio2;

// === Konventiert am: 21-8-24 13:57:18 ===

function G_TYPE_TCP_CONNECTION: TGType;
function G_TCP_CONNECTION(obj: Pointer): PGTcpConnection;
function G_TCP_CONNECTION_CLASS(klass: Pointer): PGTcpConnectionClass;
function G_IS_TCP_CONNECTION(obj: Pointer): Tgboolean;
function G_IS_TCP_CONNECTION_CLASS(klass: Pointer): Tgboolean;
function G_TCP_CONNECTION_GET_CLASS(obj: Pointer): PGTcpConnectionClass;

implementation

function G_TYPE_TCP_CONNECTION: TGType;
begin
  G_TYPE_TCP_CONNECTION := g_tcp_connection_get_type;
end;

function G_TCP_CONNECTION(obj: Pointer): PGTcpConnection;
begin
  Result := PGTcpConnection(g_type_check_instance_cast(obj, G_TYPE_TCP_CONNECTION));
end;

function G_TCP_CONNECTION_CLASS(klass: Pointer): PGTcpConnectionClass;
begin
  Result := PGTcpConnectionClass(g_type_check_class_cast(klass, G_TYPE_TCP_CONNECTION));
end;

function G_IS_TCP_CONNECTION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_TCP_CONNECTION);
end;

function G_IS_TCP_CONNECTION_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_TCP_CONNECTION);
end;

function G_TCP_CONNECTION_GET_CLASS(obj: Pointer): PGTcpConnectionClass;
begin
  Result := PGTcpConnectionClass(PGTypeInstance(obj)^.g_class);
end;



end.
