/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGTypePluginUse = procedure(plugin: PGTypePlugin); cdecl;
  TGTypePluginUnuse = procedure(plugin: PGTypePlugin); cdecl;
  TGTypePluginCompleteTypeInfo = procedure(plugin: PGTypePlugin; g_type: TGType; info: PGTypeInfo; value_table: PGTypeValueTable); cdecl;
  TGTypePluginCompleteInterfaceInfo = procedure(plugin: PGTypePlugin; instance_type: TGType; interface_type: TGType; info: PGInterfaceInfo); cdecl;
  PGTypePluginClass = ^TGTypePluginClass;

  TGTypePluginClass = record
    base_iface: TGTypeInterface;
    use_plugin: TGTypePluginUse;
    unuse_plugin: TGTypePluginUnuse;
    complete_type_info: TGTypePluginCompleteTypeInfo;
    complete_interface_info: TGTypePluginCompleteInterfaceInfo;
  end;

function g_type_plugin_get_type: TGType; cdecl; external libgobject2_0;
procedure g_type_plugin_use(plugin: PGTypePlugin); cdecl; external libgobject2_0;
procedure g_type_plugin_unuse(plugin: PGTypePlugin); cdecl; external libgobject2_0;
procedure g_type_plugin_complete_type_info(plugin: PGTypePlugin; g_type: TGType; info: PGTypeInfo; value_table: PGTypeValueTable); cdecl; external libgobject2_0;
procedure g_type_plugin_complete_interface_info(plugin: PGTypePlugin; instance_type: TGType; interface_type: TGType; info: PGInterfaceInfo); cdecl; external libgobject2_0;

// === Konventiert am: 15-8-24 19:41:21 ===

function G_TYPE_TYPE_PLUGIN: TGType;
function G_TYPE_PLUGIN(obj: Pointer): PGTypePlugin;
function G_TYPE_PLUGIN_CLASS(klass: Pointer): PGTypePluginClass;
function G_IS_TYPE_PLUGIN(obj: Pointer): Tgboolean;
function G_IS_TYPE_PLUGIN_CLASS(klass: Pointer): Tgboolean;
function G_TYPE_PLUGIN_GET_CLASS(obj: Pointer): PGTypePluginClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_TYPE_TYPE_PLUGIN: TGType;
begin
  G_TYPE_TYPE_PLUGIN := g_type_plugin_get_type;
end;

function G_TYPE_PLUGIN(obj: Pointer): PGTypePlugin;
begin
  Result := PGTypePlugin(g_type_check_instance_cast(obj, G_TYPE_TYPE_PLUGIN));
end;

function G_TYPE_PLUGIN_CLASS(klass: Pointer): PGTypePluginClass;
begin
  Result := PGTypePluginClass(g_type_check_class_cast(klass, G_TYPE_TYPE_PLUGIN));
end;

function G_IS_TYPE_PLUGIN(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_TYPE_PLUGIN);
end;

function G_IS_TYPE_PLUGIN_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_TYPE_PLUGIN);
end;

function G_TYPE_PLUGIN_GET_CLASS(obj: Pointer): PGTypePluginClass;
begin
  Result := PGTypePluginClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
