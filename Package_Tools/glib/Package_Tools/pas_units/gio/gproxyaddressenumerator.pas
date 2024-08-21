unit gproxyaddressenumerator;

interface

uses
  common_GLIB, gtypes, gerror, gtype, giotypes, gobject, gioenums, gsocketaddressenumerator;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGProxyAddressEnumeratorPrivate = record
  end;
  PGProxyAddressEnumeratorPrivate = ^TGProxyAddressEnumeratorPrivate;

  TGProxyAddressEnumerator = record
    parent_instance: TGSocketAddressEnumerator;
    priv: PGProxyAddressEnumeratorPrivate;
  end;
  PGProxyAddressEnumerator = ^TGProxyAddressEnumerator;

  TGProxyAddressEnumeratorClass = record
    parent_class: TGSocketAddressEnumeratorClass;
    _g_reserved1: procedure; cdecl;
    _g_reserved2: procedure; cdecl;
    _g_reserved3: procedure; cdecl;
    _g_reserved4: procedure; cdecl;
    _g_reserved5: procedure; cdecl;
    _g_reserved6: procedure; cdecl;
    _g_reserved7: procedure; cdecl;
  end;
  PGProxyAddressEnumeratorClass = ^TGProxyAddressEnumeratorClass;

function g_proxy_address_enumerator_get_type: TGType; cdecl; external libgio2;

// === Konventiert am: 21-8-24 15:18:11 ===

function G_TYPE_PROXY_ADDRESS_ENUMERATOR: TGType;
function G_PROXY_ADDRESS_ENUMERATOR(obj: Pointer): PGProxyAddressEnumerator;
function G_PROXY_ADDRESS_ENUMERATOR_CLASS(klass: Pointer): PGProxyAddressEnumeratorClass;
function G_IS_PROXY_ADDRESS_ENUMERATOR(obj: Pointer): Tgboolean;
function G_IS_PROXY_ADDRESS_ENUMERATOR_CLASS(klass: Pointer): Tgboolean;
function G_PROXY_ADDRESS_ENUMERATOR_GET_CLASS(obj: Pointer): PGProxyAddressEnumeratorClass;

implementation

function G_TYPE_PROXY_ADDRESS_ENUMERATOR: TGType;
begin
  G_TYPE_PROXY_ADDRESS_ENUMERATOR := g_proxy_address_enumerator_get_type;
end;

function G_PROXY_ADDRESS_ENUMERATOR(obj: Pointer): PGProxyAddressEnumerator;
begin
  Result := PGProxyAddressEnumerator(g_type_check_instance_cast(obj, G_TYPE_PROXY_ADDRESS_ENUMERATOR));
end;

function G_PROXY_ADDRESS_ENUMERATOR_CLASS(klass: Pointer): PGProxyAddressEnumeratorClass;
begin
  Result := PGProxyAddressEnumeratorClass(g_type_check_class_cast(klass, G_TYPE_PROXY_ADDRESS_ENUMERATOR));
end;

function G_IS_PROXY_ADDRESS_ENUMERATOR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_PROXY_ADDRESS_ENUMERATOR);
end;

function G_IS_PROXY_ADDRESS_ENUMERATOR_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_PROXY_ADDRESS_ENUMERATOR);
end;

function G_PROXY_ADDRESS_ENUMERATOR_GET_CLASS(obj: Pointer): PGProxyAddressEnumeratorClass;
begin
  Result := PGProxyAddressEnumeratorClass(PGTypeInstance(obj)^.g_class);
end;



end.
