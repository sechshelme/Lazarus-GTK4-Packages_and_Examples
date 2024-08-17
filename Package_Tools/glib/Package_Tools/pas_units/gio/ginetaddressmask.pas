unit ginetaddressmask;

interface

uses
  common_GLIB, gtypes, gtype, gobject, gerror, gioenums, ginetaddress;


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGInetAddressMaskPrivate = record
  end;
  PGInetAddressMaskPrivate = ^TGInetAddressMaskPrivate;

  TGInetAddressMask = record
    parent_instance: TGObject;
    priv: PGInetAddressMaskPrivate;
  end;
  PGInetAddressMask = ^TGInetAddressMask;

  TGInetAddressMaskClass = record
    parent_class: TGObjectClass;
  end;
  PGInetAddressMaskClass = ^TGInetAddressMaskClass;

function g_inet_address_mask_get_type: TGType; cdecl; external libgio2;
function g_inet_address_mask_new(addr: PGInetAddress; length: Tguint; error: PPGError): PGInetAddressMask; cdecl; external libgio2;
function g_inet_address_mask_new_from_string(mask_string: Pgchar; error: PPGError): PGInetAddressMask; cdecl; external libgio2;
function g_inet_address_mask_to_string(mask: PGInetAddressMask): Pgchar; cdecl; external libgio2;
function g_inet_address_mask_get_family(mask: PGInetAddressMask): TGSocketFamily; cdecl; external libgio2;
function g_inet_address_mask_get_address(mask: PGInetAddressMask): PGInetAddress; cdecl; external libgio2;
function g_inet_address_mask_get_length(mask: PGInetAddressMask): Tguint; cdecl; external libgio2;
function g_inet_address_mask_matches(mask: PGInetAddressMask; address: PGInetAddress): Tgboolean; cdecl; external libgio2;
function g_inet_address_mask_equal(mask: PGInetAddressMask; mask2: PGInetAddressMask): Tgboolean; cdecl; external libgio2;

// === Konventiert am: 16-8-24 19:51:07 ===

function G_TYPE_INET_ADDRESS_MASK: TGType;
function G_INET_ADDRESS_MASK(obj: Pointer): PGInetAddressMask;
function G_INET_ADDRESS_MASK_CLASS(klass: Pointer): PGInetAddressMaskClass;
function G_IS_INET_ADDRESS_MASK(obj: Pointer): Tgboolean;
function G_IS_INET_ADDRESS_MASK_CLASS(klass: Pointer): Tgboolean;
function G_INET_ADDRESS_MASK_GET_CLASS(obj: Pointer): PGInetAddressMaskClass;

implementation

function G_TYPE_INET_ADDRESS_MASK: TGType;
begin
  G_TYPE_INET_ADDRESS_MASK := g_inet_address_mask_get_type;
end;

function G_INET_ADDRESS_MASK(obj: Pointer): PGInetAddressMask;
begin
  Result := PGInetAddressMask(g_type_check_instance_cast(obj, G_TYPE_INET_ADDRESS_MASK));
end;

function G_INET_ADDRESS_MASK_CLASS(klass: Pointer): PGInetAddressMaskClass;
begin
  Result := PGInetAddressMaskClass(g_type_check_class_cast(klass, G_TYPE_INET_ADDRESS_MASK));
end;

function G_IS_INET_ADDRESS_MASK(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_INET_ADDRESS_MASK);
end;

function G_IS_INET_ADDRESS_MASK_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_INET_ADDRESS_MASK);
end;

function G_INET_ADDRESS_MASK_GET_CLASS(obj: Pointer): PGInetAddressMaskClass;
begin
  Result := PGInetAddressMaskClass(PGTypeInstance(obj)^.g_class);
end;



end.
