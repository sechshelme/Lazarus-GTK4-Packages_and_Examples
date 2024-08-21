/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGNetworkServicePrivate = record
  end;
  PGNetworkServicePrivate = ^TGNetworkServicePrivate;

  TGNetworkService = record
    parent_instance: TGObject;
    priv: PGNetworkServicePrivate;
  end;
  PGNetworkService = ^TGNetworkService;

  TGNetworkServiceClass = record
    parent_class: TGObjectClass;
  end;
  PGNetworkServiceClass = ^TGNetworkServiceClass;

function g_network_service_get_type: TGType; cdecl; external libgio2;
function g_network_service_new(service: Pgchar; protocol: Pgchar; domain: Pgchar): PGSocketConnectable; cdecl; external libgio2;
function g_network_service_get_service(srv: PGNetworkService): Pgchar; cdecl; external libgio2;
function g_network_service_get_protocol(srv: PGNetworkService): Pgchar; cdecl; external libgio2;
function g_network_service_get_domain(srv: PGNetworkService): Pgchar; cdecl; external libgio2;
function g_network_service_get_scheme(srv: PGNetworkService): Pgchar; cdecl; external libgio2;
procedure g_network_service_set_scheme(srv: PGNetworkService; scheme: Pgchar); cdecl; external libgio2;

// === Konventiert am: 21-8-24 15:18:05 ===

function G_TYPE_NETWORK_SERVICE: TGType;
function G_NETWORK_SERVICE(obj: Pointer): PGNetworkService;
function G_NETWORK_SERVICE_CLASS(klass: Pointer): PGNetworkServiceClass;
function G_IS_NETWORK_SERVICE(obj: Pointer): Tgboolean;
function G_IS_NETWORK_SERVICE_CLASS(klass: Pointer): Tgboolean;
function G_NETWORK_SERVICE_GET_CLASS(obj: Pointer): PGNetworkServiceClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_TYPE_NETWORK_SERVICE: TGType;
begin
  G_TYPE_NETWORK_SERVICE := g_network_service_get_type;
end;

function G_NETWORK_SERVICE(obj: Pointer): PGNetworkService;
begin
  Result := PGNetworkService(g_type_check_instance_cast(obj, G_TYPE_NETWORK_SERVICE));
end;

function G_NETWORK_SERVICE_CLASS(klass: Pointer): PGNetworkServiceClass;
begin
  Result := PGNetworkServiceClass(g_type_check_class_cast(klass, G_TYPE_NETWORK_SERVICE));
end;

function G_IS_NETWORK_SERVICE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_NETWORK_SERVICE);
end;

function G_IS_NETWORK_SERVICE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_NETWORK_SERVICE);
end;

function G_NETWORK_SERVICE_GET_CLASS(obj: Pointer): PGNetworkServiceClass;
begin
  Result := PGNetworkServiceClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
