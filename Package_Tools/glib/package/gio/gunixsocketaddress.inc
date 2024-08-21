/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGUnixSocketAddressPrivate = record
  end;
  PGUnixSocketAddressPrivate = ^TGUnixSocketAddressPrivate;

  TGUnixSocketAddress = record
    parent_instance: TGSocketAddress;
    priv: PGUnixSocketAddressPrivate;
  end;
  PGUnixSocketAddress = ^TGUnixSocketAddress;

  TGUnixSocketAddressClass = record
    parent_class: TGSocketAddressClass;
  end;
  PGUnixSocketAddressClass = ^TGUnixSocketAddressClass;


function g_unix_socket_address_get_type: TGType; cdecl; external libgio2;
function g_unix_socket_address_new(path: Pgchar): PGSocketAddress; cdecl; external libgio2;
function g_unix_socket_address_new_abstract(path: Pgchar; path_len: Tgint): PGSocketAddress; cdecl; external libgio2;
function g_unix_socket_address_new_with_type(path: Pgchar; path_len: Tgint; _type: TGUnixSocketAddressType): PGSocketAddress; cdecl; external libgio2;
function g_unix_socket_address_get_path(address: PGUnixSocketAddress): PChar; cdecl; external libgio2;
function g_unix_socket_address_get_path_len(address: PGUnixSocketAddress): Tgsize; cdecl; external libgio2;
function g_unix_socket_address_get_address_type(address: PGUnixSocketAddress): TGUnixSocketAddressType; cdecl; external libgio2;
function g_unix_socket_address_get_is_abstract(address: PGUnixSocketAddress): Tgboolean; cdecl; external libgio2;
function g_unix_socket_address_abstract_names_supported: Tgboolean; cdecl; external libgio2;

// === Konventiert am: 21-8-24 13:43:04 ===

function G_TYPE_UNIX_SOCKET_ADDRESS: TGType;
function G_UNIX_SOCKET_ADDRESS(obj: Pointer): PGUnixSocketAddress;
function G_UNIX_SOCKET_ADDRESS_CLASS(klass: Pointer): PGUnixSocketAddressClass;
function G_IS_UNIX_SOCKET_ADDRESS(obj: Pointer): Tgboolean;
function G_IS_UNIX_SOCKET_ADDRESS_CLASS(klass: Pointer): Tgboolean;
function G_UNIX_SOCKET_ADDRESS_GET_CLASS(obj: Pointer): PGUnixSocketAddressClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_TYPE_UNIX_SOCKET_ADDRESS: TGType;
begin
  G_TYPE_UNIX_SOCKET_ADDRESS := g_unix_socket_address_get_type;
end;

function G_UNIX_SOCKET_ADDRESS(obj: Pointer): PGUnixSocketAddress;
begin
  Result := PGUnixSocketAddress(g_type_check_instance_cast(obj, G_TYPE_UNIX_SOCKET_ADDRESS));
end;

function G_UNIX_SOCKET_ADDRESS_CLASS(klass: Pointer): PGUnixSocketAddressClass;
begin
  Result := PGUnixSocketAddressClass(g_type_check_class_cast(klass, G_TYPE_UNIX_SOCKET_ADDRESS));
end;

function G_IS_UNIX_SOCKET_ADDRESS(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_UNIX_SOCKET_ADDRESS);
end;

function G_IS_UNIX_SOCKET_ADDRESS_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_UNIX_SOCKET_ADDRESS);
end;

function G_UNIX_SOCKET_ADDRESS_GET_CLASS(obj: Pointer): PGUnixSocketAddressClass;
begin
  Result := PGUnixSocketAddressClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
