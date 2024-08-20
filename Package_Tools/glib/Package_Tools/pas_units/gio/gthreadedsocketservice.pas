unit gthreadedsocketservice;

interface

uses
  common_GLIB, gtypes, gtype, giotypes, gobject, gioenums, gsocketservice, gsocketconnection;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TGThreadedSocketServicePrivate = record
  end;
  PGThreadedSocketServicePrivate = ^TGThreadedSocketServicePrivate;

  TGThreadedSocketService = record
    parent_instance: TGSocketService;
    priv: PGThreadedSocketServicePrivate;
  end;
  PGThreadedSocketService = ^TGThreadedSocketService;

  TGThreadedSocketServiceClass = record
    parent_class: TGSocketServiceClass;
    run: function(service: PGThreadedSocketService; connection: PGSocketConnection; source_object: PGObject): Tgboolean; cdecl;
    _g_reserved1: procedure; cdecl;
    _g_reserved2: procedure; cdecl;
    _g_reserved3: procedure; cdecl;
    _g_reserved4: procedure; cdecl;
    _g_reserved5: procedure; cdecl;
  end;
  PGThreadedSocketServiceClass = ^TGThreadedSocketServiceClass;


function g_threaded_socket_service_get_type: TGType; cdecl; external libgio2;
function g_threaded_socket_service_new(max_threads: longint): PGSocketService; cdecl; external libgio2;

// === Konventiert am: 20-8-24 19:32:46 ===

function G_TYPE_THREADED_SOCKET_SERVICE: TGType;
function G_THREADED_SOCKET_SERVICE(obj: Pointer): PGThreadedSocketService;
function G_THREADED_SOCKET_SERVICE_CLASS(klass: Pointer): PGThreadedSocketServiceClass;
function G_IS_THREADED_SOCKET_SERVICE(obj: Pointer): Tgboolean;
function G_IS_THREADED_SOCKET_SERVICE_CLASS(klass: Pointer): Tgboolean;
function G_THREADED_SOCKET_SERVICE_GET_CLASS(obj: Pointer): PGThreadedSocketServiceClass;

implementation

function G_TYPE_THREADED_SOCKET_SERVICE: TGType;
begin
  G_TYPE_THREADED_SOCKET_SERVICE := g_threaded_socket_service_get_type;
end;

function G_THREADED_SOCKET_SERVICE(obj: Pointer): PGThreadedSocketService;
begin
  Result := PGThreadedSocketService(g_type_check_instance_cast(obj, G_TYPE_THREADED_SOCKET_SERVICE));
end;

function G_THREADED_SOCKET_SERVICE_CLASS(klass: Pointer): PGThreadedSocketServiceClass;
begin
  Result := PGThreadedSocketServiceClass(g_type_check_class_cast(klass, G_TYPE_THREADED_SOCKET_SERVICE));
end;

function G_IS_THREADED_SOCKET_SERVICE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_THREADED_SOCKET_SERVICE);
end;

function G_IS_THREADED_SOCKET_SERVICE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_THREADED_SOCKET_SERVICE);
end;

function G_THREADED_SOCKET_SERVICE_GET_CLASS(obj: Pointer): PGThreadedSocketServiceClass;
begin
  Result := PGThreadedSocketServiceClass(PGTypeInstance(obj)^.g_class);
end;



end.
