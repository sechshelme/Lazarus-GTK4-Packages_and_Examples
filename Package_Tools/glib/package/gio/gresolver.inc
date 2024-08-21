/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGResolverPrivate = record
  end;
  PGResolverPrivate = ^TGResolverPrivate;

  TGResolver = record
    parent_instance: TGObject;
    priv: PGResolverPrivate;
  end;
  PGResolver = ^TGResolver;

  PGResolverNameLookupFlags = ^TGResolverNameLookupFlags;
  TGResolverNameLookupFlags = longint;

const
  G_RESOLVER_NAME_LOOKUP_FLAGS_DEFAULT = 0;
  G_RESOLVER_NAME_LOOKUP_FLAGS_IPV4_ONLY = 1 shl 0;
  G_RESOLVER_NAME_LOOKUP_FLAGS_IPV6_ONLY = 1 shl 1;

type
  PGResolverClass = ^TGResolverClass;

  TGResolverClass = record
    parent_class: TGObjectClass;
    reload: procedure(resolver: PGResolver); cdecl;
    lookup_by_name: function(resolver: PGResolver; hostname: Pgchar; cancellable: PGCancellable; error: PPGError): PGList; cdecl;
    lookup_by_name_async: procedure(resolver: PGResolver; hostname: Pgchar; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl;
    lookup_by_name_finish: function(resolver: PGResolver; Result: PGAsyncResult; error: PPGError): PGList; cdecl;
    lookup_by_address: function(resolver: PGResolver; address: PGInetAddress; cancellable: PGCancellable; error: PPGError): Pgchar; cdecl;
    lookup_by_address_async: procedure(resolver: PGResolver; address: PGInetAddress; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl;
    lookup_by_address_finish: function(resolver: PGResolver; Result: PGAsyncResult; error: PPGError): Pgchar; cdecl;
    lookup_service: function(resolver: PGResolver; rrname: Pgchar; cancellable: PGCancellable; error: PPGError): PGList; cdecl;
    lookup_service_async: procedure(resolver: PGResolver; rrname: Pgchar; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl;
    lookup_service_finish: function(resolver: PGResolver; Result: PGAsyncResult; error: PPGError): PGList; cdecl;
    lookup_records: function(resolver: PGResolver; rrname: Pgchar; record_type: TGResolverRecordType; cancellable: PGCancellable; error: PPGError): PGList; cdecl;
    lookup_records_async: procedure(resolver: PGResolver; rrname: Pgchar; record_type: TGResolverRecordType; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
      user_data: Tgpointer); cdecl;
    lookup_records_finish: function(resolver: PGResolver; Result: PGAsyncResult; error: PPGError): PGList; cdecl;
    lookup_by_name_with_flags_async: procedure(resolver: PGResolver; hostname: Pgchar; flags: TGResolverNameLookupFlags; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
      user_data: Tgpointer); cdecl;
    lookup_by_name_with_flags_finish: function(resolver: PGResolver; Result: PGAsyncResult; error: PPGError): PGList; cdecl;
    lookup_by_name_with_flags: function(resolver: PGResolver; hostname: Pgchar; flags: TGResolverNameLookupFlags; cancellable: PGCancellable; error: PPGError): PGList; cdecl;
  end;


function g_resolver_get_type: TGType; cdecl; external libgio2;
function g_resolver_get_default: PGResolver; cdecl; external libgio2;
procedure g_resolver_set_default(resolver: PGResolver); cdecl; external libgio2;
function g_resolver_lookup_by_name(resolver: PGResolver; hostname: Pgchar; cancellable: PGCancellable; error: PPGError): PGList; cdecl; external libgio2;
procedure g_resolver_lookup_by_name_async(resolver: PGResolver; hostname: Pgchar; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_resolver_lookup_by_name_finish(resolver: PGResolver; Result: PGAsyncResult; error: PPGError): PGList; cdecl; external libgio2;
procedure g_resolver_lookup_by_name_with_flags_async(resolver: PGResolver; hostname: Pgchar; flags: TGResolverNameLookupFlags; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
  user_data: Tgpointer); cdecl; external libgio2;
function g_resolver_lookup_by_name_with_flags_finish(resolver: PGResolver; Result: PGAsyncResult; error: PPGError): PGList; cdecl; external libgio2;
function g_resolver_lookup_by_name_with_flags(resolver: PGResolver; hostname: Pgchar; flags: TGResolverNameLookupFlags; cancellable: PGCancellable; error: PPGError): PGList; cdecl; external libgio2;
procedure g_resolver_free_addresses(addresses: PGList); cdecl; external libgio2;
function g_resolver_lookup_by_address(resolver: PGResolver; address: PGInetAddress; cancellable: PGCancellable; error: PPGError): Pgchar; cdecl; external libgio2;
procedure g_resolver_lookup_by_address_async(resolver: PGResolver; address: PGInetAddress; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_resolver_lookup_by_address_finish(resolver: PGResolver; Result: PGAsyncResult; error: PPGError): Pgchar; cdecl; external libgio2;
function g_resolver_lookup_service(resolver: PGResolver; service: Pgchar; protocol: Pgchar; domain: Pgchar; cancellable: PGCancellable;
  error: PPGError): PGList; cdecl; external libgio2;
procedure g_resolver_lookup_service_async(resolver: PGResolver; service: Pgchar; protocol: Pgchar; domain: Pgchar; cancellable: PGCancellable;
  callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_resolver_lookup_service_finish(resolver: PGResolver; Result: PGAsyncResult; error: PPGError): PGList; cdecl; external libgio2;
function g_resolver_lookup_records(resolver: PGResolver; rrname: Pgchar; record_type: TGResolverRecordType; cancellable: PGCancellable; error: PPGError): PGList; cdecl; external libgio2;
procedure g_resolver_lookup_records_async(resolver: PGResolver; rrname: Pgchar; record_type: TGResolverRecordType; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
  user_data: Tgpointer); cdecl; external libgio2;
function g_resolver_lookup_records_finish(resolver: PGResolver; Result: PGAsyncResult; error: PPGError): PGList; cdecl; external libgio2;
procedure g_resolver_free_targets(targets: PGList); cdecl; external libgio2;
function g_resolver_get_timeout(resolver: PGResolver): dword; cdecl; external libgio2;
procedure g_resolver_set_timeout(resolver: PGResolver; timeout_ms: dword); cdecl; external libgio2;

function g_resolver_error_quark: TGQuark; cdecl; external libgio2;
function G_RESOLVER_ERROR: TGQuark;

// === Konventiert am: 19-8-24 17:43:25 ===

function G_TYPE_RESOLVER: TGType;
function G_RESOLVER(obj: Pointer): PGResolver;
function G_RESOLVER_CLASS(klass: Pointer): PGResolverClass;
function G_IS_RESOLVER(obj: Pointer): Tgboolean;
function G_IS_RESOLVER_CLASS(klass: Pointer): Tgboolean;
function G_RESOLVER_GET_CLASS(obj: Pointer): PGResolverClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_TYPE_RESOLVER: TGType;
begin
  G_TYPE_RESOLVER := g_resolver_get_type;
end;

function G_RESOLVER(obj: Pointer): PGResolver;
begin
  Result := PGResolver(g_type_check_instance_cast(obj, G_TYPE_RESOLVER));
end;

function G_RESOLVER_CLASS(klass: Pointer): PGResolverClass;
begin
  Result := PGResolverClass(g_type_check_class_cast(klass, G_TYPE_RESOLVER));
end;

function G_IS_RESOLVER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_RESOLVER);
end;

function G_IS_RESOLVER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_RESOLVER);
end;

function G_RESOLVER_GET_CLASS(obj: Pointer): PGResolverClass;
begin
  Result := PGResolverClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function G_RESOLVER_ERROR: TGQuark;
begin
  G_RESOLVER_ERROR := g_resolver_error_quark;
end;


{$ENDIF read_implementation}
