/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGTypeModule = record
    parent_instance: TGObject;
    use_count: Tguint;
    type_infos: PGSList;
    interface_infos: PGSList;
    Name: Pgchar;
  end;
  PGTypeModule = ^TGTypeModule;

  TGTypeModuleClass = record
    parent_class: TGObjectClass;
    load: function(module: PGTypeModule): Tgboolean; cdecl;
    unload: procedure(module: PGTypeModule); cdecl;
    reserved1: procedure; cdecl;
    reserved2: procedure; cdecl;
    reserved3: procedure; cdecl;
    reserved4: procedure; cdecl;
  end;
  PGTypeModuleClass = ^TGTypeModuleClass;

function g_type_module_get_type: TGType; cdecl; external libgobject2_0;
function g_type_module_use(module: PGTypeModule): Tgboolean; cdecl; external libgobject2_0;
procedure g_type_module_unuse(module: PGTypeModule); cdecl; external libgobject2_0;
procedure g_type_module_set_name(module: PGTypeModule; Name: Pgchar); cdecl; external libgobject2_0;
function g_type_module_register_type(module: PGTypeModule; parent_type: TGType; type_name: Pgchar; type_info: PGTypeInfo; flags: TGTypeFlags): TGType; cdecl; external libgobject2_0;
procedure g_type_module_add_interface(module: PGTypeModule; instance_type: TGType; interface_type: TGType; interface_info: PGInterfaceInfo); cdecl; external libgobject2_0;
function g_type_module_register_enum(module: PGTypeModule; Name: Pgchar; const_static_values: PGEnumValue): TGType; cdecl; external libgobject2_0;
function g_type_module_register_flags(module: PGTypeModule; Name: Pgchar; const_static_values: PGFlagsValue): TGType; cdecl; external libgobject2_0;

// === Konventiert am: 14-8-24 19:14:29 ===

function G_TYPE_TYPE_MODULE: TGType;
function G_TYPE_MODULE(obj: Pointer): PGTypeModule;
function G_TYPE_MODULE_CLASS(klass: Pointer): PGTypeModuleClass;
function G_IS_TYPE_MODULE(obj: Pointer): Tgboolean;
function G_IS_TYPE_MODULE_CLASS(klass: Pointer): Tgboolean;
function G_TYPE_MODULE_GET_CLASS(obj: Pointer): PGTypeModuleClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_TYPE_TYPE_MODULE: TGType;
begin
  G_TYPE_TYPE_MODULE := g_type_module_get_type;
end;

function G_TYPE_MODULE(obj: Pointer): PGTypeModule;
begin
  Result := PGTypeModule(g_type_check_instance_cast(obj, G_TYPE_TYPE_MODULE));
end;

function G_TYPE_MODULE_CLASS(klass: Pointer): PGTypeModuleClass;
begin
  Result := PGTypeModuleClass(g_type_check_class_cast(klass, G_TYPE_TYPE_MODULE));
end;

function G_IS_TYPE_MODULE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_TYPE_MODULE);
end;

function G_IS_TYPE_MODULE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_TYPE_MODULE);
end;

function G_TYPE_MODULE_GET_CLASS(obj: Pointer): PGTypeModuleClass;
begin
  Result := PGTypeModuleClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
