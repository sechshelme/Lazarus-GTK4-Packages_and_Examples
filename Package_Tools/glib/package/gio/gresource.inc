/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

function g_resource_error_quark: TGQuark; cdecl; external libgio2;

type
  TGResource = record
  end;
  PGResource = ^TGResource;

  PGStaticResource = ^TGStaticResource;

  TGStaticResource = record
    Data: Pguint8;
    data_len: Tgsize;
    resource: PGResource;
    Next: PGStaticResource;
    padding: Tgpointer;
  end;


function g_resource_get_type: TGType; cdecl; external libgio2;
function g_resource_new_from_data(Data: PGBytes; error: PPGError): PGResource; cdecl; external libgio2;
function g_resource_ref(resource: PGResource): PGResource; cdecl; external libgio2;
procedure g_resource_unref(resource: PGResource); cdecl; external libgio2;
function g_resource_load(filename: Pgchar; error: PPGError): PGResource; cdecl; external libgio2;
function g_resource_open_stream(resource: PGResource; path: PChar; lookup_flags: TGResourceLookupFlags; error: PPGError): PGInputStream; cdecl; external libgio2;
function g_resource_lookup_data(resource: PGResource; path: PChar; lookup_flags: TGResourceLookupFlags; error: PPGError): PGBytes; cdecl; external libgio2;
function g_resource_enumerate_children(resource: PGResource; path: PChar; lookup_flags: TGResourceLookupFlags; error: PPGError): PPchar; cdecl; external libgio2;
function g_resource_get_info(resource: PGResource; path: PChar; lookup_flags: TGResourceLookupFlags; size: Pgsize; flags: Pguint32;
  error: PPGError): Tgboolean; cdecl; external libgio2;
procedure g_resources_register(resource: PGResource); cdecl; external libgio2;
procedure g_resources_unregister(resource: PGResource); cdecl; external libgio2;
function g_resources_open_stream(path: PChar; lookup_flags: TGResourceLookupFlags; error: PPGError): PGInputStream; cdecl; external libgio2;
function g_resources_lookup_data(path: PChar; lookup_flags: TGResourceLookupFlags; error: PPGError): PGBytes; cdecl; external libgio2;
function g_resources_enumerate_children(path: PChar; lookup_flags: TGResourceLookupFlags; error: PPGError): PPchar; cdecl; external libgio2;
function g_resources_get_info(path: PChar; lookup_flags: TGResourceLookupFlags; size: Pgsize; flags: Pguint32; error: PPGError): Tgboolean; cdecl; external libgio2;
procedure g_static_resource_init(static_resource: PGStaticResource); cdecl; external libgio2;
procedure g_static_resource_fini(static_resource: PGStaticResource); cdecl; external libgio2;
function g_static_resource_get_resource(static_resource: PGStaticResource): PGResource; cdecl; external libgio2;

function G_RESOURCE_ERROR: TGQuark;

// === Konventiert am: 20-8-24 17:50:47 ===

function G_TYPE_RESOURCE: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_TYPE_RESOURCE: TGType;
begin
  G_TYPE_RESOURCE := g_resource_get_type;
end;


function G_RESOURCE_ERROR: TGQuark;
begin
  G_RESOURCE_ERROR := g_resource_error_quark;
end;


{$ENDIF read_implementation}
