/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGInetAddressPrivate = record
  end;
  PGInetAddressPrivate = ^TGInetAddressPrivate;

  TGInetAddress = record
    parent_instance: TGObject;
    priv: PGInetAddressPrivate;
  end;
  PGInetAddress = ^TGInetAddress;

  TGInetAddressClass = record
    parent_class: TGObjectClass;
    to_string: function(address: PGInetAddress): Pgchar; cdecl;
    to_bytes: function(address: PGInetAddress): Pguint8; cdecl;
  end;
  PGInetAddressClass = ^TGInetAddressClass;


function g_inet_address_get_type: TGType; cdecl; external libgio2;
function g_inet_address_new_from_string(_string: Pgchar): PGInetAddress; cdecl; external libgio2;
function g_inet_address_new_from_bytes(bytes: Pguint8; family: TGSocketFamily): PGInetAddress; cdecl; external libgio2;
function g_inet_address_new_loopback(family: TGSocketFamily): PGInetAddress; cdecl; external libgio2;
function g_inet_address_new_any(family: TGSocketFamily): PGInetAddress; cdecl; external libgio2;
function g_inet_address_equal(address: PGInetAddress; other_address: PGInetAddress): Tgboolean; cdecl; external libgio2;
function g_inet_address_to_string(address: PGInetAddress): Pgchar; cdecl; external libgio2;
function g_inet_address_to_bytes(address: PGInetAddress): Pguint8; cdecl; external libgio2;
function g_inet_address_get_native_size(address: PGInetAddress): Tgsize; cdecl; external libgio2;
function g_inet_address_get_family(address: PGInetAddress): TGSocketFamily; cdecl; external libgio2;
function g_inet_address_get_is_any(address: PGInetAddress): Tgboolean; cdecl; external libgio2;
function g_inet_address_get_is_loopback(address: PGInetAddress): Tgboolean; cdecl; external libgio2;
function g_inet_address_get_is_link_local(address: PGInetAddress): Tgboolean; cdecl; external libgio2;
function g_inet_address_get_is_site_local(address: PGInetAddress): Tgboolean; cdecl; external libgio2;
function g_inet_address_get_is_multicast(address: PGInetAddress): Tgboolean; cdecl; external libgio2;
function g_inet_address_get_is_mc_global(address: PGInetAddress): Tgboolean; cdecl; external libgio2;
function g_inet_address_get_is_mc_link_local(address: PGInetAddress): Tgboolean; cdecl; external libgio2;
function g_inet_address_get_is_mc_node_local(address: PGInetAddress): Tgboolean; cdecl; external libgio2;
function g_inet_address_get_is_mc_org_local(address: PGInetAddress): Tgboolean; cdecl; external libgio2;
function g_inet_address_get_is_mc_site_local(address: PGInetAddress): Tgboolean; cdecl; external libgio2;

// === Konventiert am: 16-8-24 19:54:48 ===

function G_TYPE_INET_ADDRESS: TGType;
function G_INET_ADDRESS(obj: Pointer): PGInetAddress;
function G_INET_ADDRESS_CLASS(klass: Pointer): PGInetAddressClass;
function G_IS_INET_ADDRESS(obj: Pointer): Tgboolean;
function G_IS_INET_ADDRESS_CLASS(klass: Pointer): Tgboolean;
function G_INET_ADDRESS_GET_CLASS(obj: Pointer): PGInetAddressClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_TYPE_INET_ADDRESS: TGType;
begin
  G_TYPE_INET_ADDRESS := g_inet_address_get_type;
end;

function G_INET_ADDRESS(obj: Pointer): PGInetAddress;
begin
  Result := PGInetAddress(g_type_check_instance_cast(obj, G_TYPE_INET_ADDRESS));
end;

function G_INET_ADDRESS_CLASS(klass: Pointer): PGInetAddressClass;
begin
  Result := PGInetAddressClass(g_type_check_class_cast(klass, G_TYPE_INET_ADDRESS));
end;

function G_IS_INET_ADDRESS(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_INET_ADDRESS);
end;

function G_IS_INET_ADDRESS_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_INET_ADDRESS);
end;

function G_INET_ADDRESS_GET_CLASS(obj: Pointer): PGInetAddressClass;
begin
  Result := PGInetAddressClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
