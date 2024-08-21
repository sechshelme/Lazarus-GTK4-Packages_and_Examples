/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  PPGObject = ^PGObject;
  PGObject = ^TGObject;

  TGObject = record
    g_type_instance: TGTypeInstance;
    ref_count: Tguint;
    qdata: PGData;
  end;

  PGObjectConstructParam = ^TGObjectConstructParam;

  TGObjectConstructParam = record
    pspec: PGParamSpec;
    Value: PGValue;
  end;


  TGObjectGetPropertyFunc = procedure(object_: PGObject; property_id: Tguint; Value: PGValue; pspec: PGParamSpec); cdecl;
  TGObjectSetPropertyFunc = procedure(object_: PGObject; property_id: Tguint; Value: PGValue; pspec: PGParamSpec); cdecl;
  TGObjectFinalizeFunc = procedure(object_: PGObject); cdecl;
  TGWeakNotify = procedure(Data: Tgpointer; where_the_object_was: PGObject); cdecl;
  PGObjectClass = ^TGObjectClass;

  TGObjectClass = record
    g_type_class: TGTypeClass;
    construct_properties: PGSList;
    constructor_: function(_type: TGType; n_construct_properties: Tguint; construct_properties: PGObjectConstructParam): PGObject; cdecl;
    set_property: procedure(object_: PGObject; property_id: Tguint; Value: PGValue; pspec: PGParamSpec); cdecl;
    get_property: procedure(object_: PGObject; property_id: Tguint; Value: PGValue; pspec: PGParamSpec); cdecl;
    _dispose: procedure(object_: PGObject); cdecl;
    finalize: procedure(object_: PGObject); cdecl;
    dispatch_properties_changed: procedure(object_: PGObject; n_pspecs: Tguint; pspecs: PPGParamSpec); cdecl;
    notify: procedure(object_: PGObject; pspec: PGParamSpec); cdecl;
    constructed: procedure(object_: PGObject); cdecl;
    flags: Tgsize;
    n_construct_properties: Tgsize;
    pspecs: Tgpointer;
    n_pspecs: Tgsize;
    pdummy: array[0..2] of Tgpointer;
  end;

  TGInitiallyUnowned = TGObject;
  PGInitiallyUnowned = ^TGInitiallyUnowned;

  TGInitiallyUnownedClass = TGObjectClass;
  PGInitiallyUnownedClass = ^TGInitiallyUnownedClass;


function g_initially_unowned_get_type: TGType; cdecl; external libgobject2_0;
procedure g_object_class_install_property(oclass: PGObjectClass; property_id: Tguint; pspec: PGParamSpec); cdecl; external libgobject2_0;
function g_object_class_find_property(oclass: PGObjectClass; property_name: Pgchar): PGParamSpec; cdecl; external libgobject2_0;
function g_object_class_list_properties(oclass: PGObjectClass; n_properties: Pguint): PPGParamSpec; cdecl; external libgobject2_0;
procedure g_object_class_override_property(oclass: PGObjectClass; property_id: Tguint; Name: Pgchar); cdecl; external libgobject2_0;
procedure g_object_class_install_properties(oclass: PGObjectClass; n_pspecs: Tguint; pspecs: PPGParamSpec); cdecl; external libgobject2_0;
procedure g_object_interface_install_property(g_iface: Tgpointer; pspec: PGParamSpec); cdecl; external libgobject2_0;
function g_object_interface_find_property(g_iface: Tgpointer; property_name: Pgchar): PGParamSpec; cdecl; external libgobject2_0;
function g_object_interface_list_properties(g_iface: Tgpointer; n_properties_p: Pguint): PPGParamSpec; cdecl; external libgobject2_0;
function g_object_get_type: TGType; cdecl; external libgobject2_0;
function g_object_new(object_type: TGType; first_property_name: Pgchar; args: array of const): Tgpointer; cdecl; external libgobject2_0;
function g_object_new(object_type: TGType; first_property_name: Pgchar): Tgpointer; cdecl; external libgobject2_0;
function g_object_new_with_properties(object_type: TGType; n_properties: Tguint; names: PPchar; values: PGValue): PGObject; cdecl; external libgobject2_0;
function g_object_newv(object_type: TGType; n_parameters: Tguint; parameters: PGParameter): Tgpointer; cdecl; external libgobject2_0;
function g_object_new_valist(object_type: TGType; first_property_name: Pgchar; var_args: Tva_list): PGObject; cdecl; external libgobject2_0;
procedure g_object_set(_object: Tgpointer; first_property_name: Pgchar; args: array of const); cdecl; external libgobject2_0;
procedure g_object_set(_object: Tgpointer; first_property_name: Pgchar); cdecl; external libgobject2_0;
procedure g_object_get(_object: Tgpointer; first_property_name: Pgchar; args: array of const); cdecl; external libgobject2_0;
procedure g_object_get(_object: Tgpointer; first_property_name: Pgchar); cdecl; external libgobject2_0;
function g_object_connect(_object: Tgpointer; signal_spec: Pgchar; args: array of const): Tgpointer; cdecl; external libgobject2_0;
function g_object_connect(_object: Tgpointer; signal_spec: Pgchar): Tgpointer; cdecl; external libgobject2_0;
procedure g_object_disconnect(_object: Tgpointer; signal_spec: Pgchar; args: array of const); cdecl; external libgobject2_0;
procedure g_object_disconnect(_object: Tgpointer; signal_spec: Pgchar); cdecl; external libgobject2_0;
procedure g_object_setv(_object: PGObject; n_properties: Tguint; names: PPgchar; values: PGValue); cdecl; external libgobject2_0;
procedure g_object_set_valist(_object: PGObject; first_property_name: Pgchar; var_args: Tva_list); cdecl; external libgobject2_0;
procedure g_object_getv(_object: PGObject; n_properties: Tguint; names: PPgchar; values: PGValue); cdecl; external libgobject2_0;
procedure g_object_get_valist(_object: PGObject; first_property_name: Pgchar; var_args: Tva_list); cdecl; external libgobject2_0;
procedure g_object_set_property(_object: PGObject; property_name: Pgchar; Value: PGValue); cdecl; external libgobject2_0;
procedure g_object_get_property(_object: PGObject; property_name: Pgchar; Value: PGValue); cdecl; external libgobject2_0;
procedure g_object_freeze_notify(_object: PGObject); cdecl; external libgobject2_0;
procedure g_object_notify(_object: PGObject; property_name: Pgchar); cdecl; external libgobject2_0;
procedure g_object_notify_by_pspec(_object: PGObject; pspec: PGParamSpec); cdecl; external libgobject2_0;
procedure g_object_thaw_notify(_object: PGObject); cdecl; external libgobject2_0;
function g_object_is_floating(_object: Tgpointer): Tgboolean; cdecl; external libgobject2_0;
function g_object_ref_sink(_object: Tgpointer): Tgpointer; cdecl; external libgobject2_0;
function g_object_take_ref(_object: Tgpointer): Tgpointer; cdecl; external libgobject2_0;
function g_object_ref(_object: Tgpointer): Tgpointer; cdecl; external libgobject2_0;
procedure g_object_unref(_object: Tgpointer); cdecl; external libgobject2_0;
procedure g_object_weak_ref(_object: PGObject; notify: TGWeakNotify; Data: Tgpointer); cdecl; external libgobject2_0;
procedure g_object_weak_unref(_object: PGObject; notify: TGWeakNotify; Data: Tgpointer); cdecl; external libgobject2_0;
procedure g_object_add_weak_pointer(_object: PGObject; weak_pointer_location: Pgpointer); cdecl; external libgobject2_0;
procedure g_object_remove_weak_pointer(_object: PGObject; weak_pointer_location: Pgpointer); cdecl; external libgobject2_0;

type
  TGToggleNotify = procedure(Data: Tgpointer; _object: PGObject; is_last_ref: Tgboolean); cdecl;

procedure g_object_add_toggle_ref(_object: PGObject; notify: TGToggleNotify; Data: Tgpointer); cdecl; external libgobject2_0;
procedure g_object_remove_toggle_ref(_object: PGObject; notify: TGToggleNotify; Data: Tgpointer); cdecl; external libgobject2_0;
function g_object_get_qdata(_object: PGObject; quark: TGQuark): Tgpointer; cdecl; external libgobject2_0;
procedure g_object_set_qdata(_object: PGObject; quark: TGQuark; Data: Tgpointer); cdecl; external libgobject2_0;
procedure g_object_set_qdata_full(_object: PGObject; quark: TGQuark; Data: Tgpointer; Destroy: TGDestroyNotify); cdecl; external libgobject2_0;
function g_object_steal_qdata(_object: PGObject; quark: TGQuark): Tgpointer; cdecl; external libgobject2_0;
function g_object_dup_qdata(_object: PGObject; quark: TGQuark; dup_func: TGDuplicateFunc; user_data: Tgpointer): Tgpointer; cdecl; external libgobject2_0;
function g_object_replace_qdata(_object: PGObject; quark: TGQuark; oldval: Tgpointer; newval: Tgpointer; Destroy: TGDestroyNotify;
  old_destroy: PGDestroyNotify): Tgboolean; cdecl; external libgobject2_0;
function g_object_get_data(_object: PGObject; key: Pgchar): Tgpointer; cdecl; external libgobject2_0;
procedure g_object_set_data(_object: PGObject; key: Pgchar; Data: Tgpointer); cdecl; external libgobject2_0;
procedure g_object_set_data_full(_object: PGObject; key: Pgchar; Data: Tgpointer; Destroy: TGDestroyNotify); cdecl; external libgobject2_0;
function g_object_steal_data(_object: PGObject; key: Pgchar): Tgpointer; cdecl; external libgobject2_0;
function g_object_dup_data(_object: PGObject; key: Pgchar; dup_func: TGDuplicateFunc; user_data: Tgpointer): Tgpointer; cdecl; external libgobject2_0;
function g_object_replace_data(_object: PGObject; key: Pgchar; oldval: Tgpointer; newval: Tgpointer; Destroy: TGDestroyNotify;
  old_destroy: PGDestroyNotify): Tgboolean; cdecl; external libgobject2_0;
procedure g_object_watch_closure(_object: PGObject; closure: PGClosure); cdecl; external libgobject2_0;
function g_cclosure_new_object(callback_func: TGCallback; _object: PGObject): PGClosure; cdecl; external libgobject2_0;
function g_cclosure_new_object_swap(callback_func: TGCallback; _object: PGObject): PGClosure; cdecl; external libgobject2_0;
function g_closure_new_object(sizeof_closure: Tguint; _object: PGObject): PGClosure; cdecl; external libgobject2_0;
procedure g_value_set_object(Value: PGValue; v_object: Tgpointer); cdecl; external libgobject2_0;
function g_value_get_object(Value: PGValue): Tgpointer; cdecl; external libgobject2_0;
function g_value_dup_object(Value: PGValue): Tgpointer; cdecl; external libgobject2_0;
function g_signal_connect_object(instance: Tgpointer; detailed_signal: Pgchar; c_handler: TGCallback; gobject: Tgpointer; connect_flags: TGConnectFlags): Tgulong; cdecl; external libgobject2_0;
procedure g_object_force_floating(_object: PGObject); cdecl; external libgobject2_0;
procedure g_object_run_dispose(_object: PGObject); cdecl; external libgobject2_0;
procedure g_value_take_object(Value: PGValue; v_object: Tgpointer); cdecl; external libgobject2_0;
procedure g_value_set_object_take_ownership(Value: PGValue; v_object: Tgpointer); cdecl; external libgobject2_0;
function g_object_compat_control(what: Tgsize; Data: Tgpointer): Tgsize; cdecl; external libgobject2_0;
procedure g_clear_object(object_ptr: PPGObject); cdecl; external libgobject2_0;

type
  PGWeakRef = ^TGWeakRef;

  TGWeakRef = record
    priv: record
      case longint of
        0: (p: Tgpointer);
      end;
  end;

procedure g_weak_ref_init(weak_ref: PGWeakRef; _object: Tgpointer); cdecl; external libgobject2_0;
procedure g_weak_ref_clear(weak_ref: PGWeakRef); cdecl; external libgobject2_0;
function g_weak_ref_get(weak_ref: PGWeakRef): Tgpointer; cdecl; external libgobject2_0;
procedure g_weak_ref_set(weak_ref: PGWeakRef; _object: Tgpointer); cdecl; external libgobject2_0;


function G_TYPE_IS_OBJECT(_type: TGType): Tgboolean;
function G_OBJECT(obj: Tgpointer): PGObject;
function G_OBJECT_CLASS(klass: Tgpointer): PGObjectClass;
function G_IS_OBJECT(obj: Tgpointer): Tgboolean;
function G_IS_OBJECT_CLASS(klass: Tgpointer): Tgboolean;
function G_OBJECT_GET_CLASS(obj: Tgpointer): PGObjectClass;
function G_OBJECT_TYPE(inst: Tgpointer): TGType;
function G_OBJECT_TYPE_NAME(obj: Tgpointer): Pgchar;
function G_OBJECT_CLASS_TYPE(klass: Tgpointer): TGType;
function G_OBJECT_CLASS_NAME(klass: Tgpointer): Pgchar;
function G_VALUE_HOLDS_OBJECT(Value: Tgpointer): Tgboolean;


function G_TYPE_INITIALLY_UNOWNED: TGType;
function G_INITIALLY_UNOWNED(obj: Tgpointer): PGInitiallyUnowned;
function G_INITIALLY_UNOWNED_CLASS(klass: PGTypeClass): PGInitiallyUnownedClass;
function G_IS_INITIALLY_UNOWNED(obj: Tgpointer): Tgboolean;
function G_IS_INITIALLY_UNOWNED_CLASS(klass: Tgpointer): Tgboolean;
function G_INITIALLY_UNOWNED_GET_CLASS(obj: Tgpointer): PGInitiallyUnownedClass;

procedure G_OBJECT_WARN_INVALID_PSPEC(anObject: Tgpointer; pname: PGChar; property_id: Tgint; pspec: Tgpointer);


// === Konventiert am: 13-8-24 13:48:38 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function G_TYPE_IS_OBJECT(_type: TGType): Tgboolean;
begin
  G_TYPE_IS_OBJECT := G_TYPE_FUNDAMENTAL(_type) = G_TYPE_OBJECT;
end;

function G_OBJECT(obj: Tgpointer): PGObject;
begin
  G_OBJECT := PGObject(G_TYPE_CHECK_INSTANCE_CAST(obj, G_TYPE_OBJECT));
end;

function G_OBJECT_CLASS(klass: Tgpointer): PGObjectClass;
begin
  G_OBJECT_CLASS := PGObjectClass(G_TYPE_CHECK_CLASS_CAST(klass, G_TYPE_OBJECT));
end;

function G_IS_OBJECT(obj: Tgpointer): Tgboolean;
begin
  G_IS_OBJECT := g_type_check_instance_is_a(obj, G_TYPE_OBJECT);
end;

function G_IS_OBJECT_CLASS(klass: Tgpointer): Tgboolean;
begin
  G_IS_OBJECT_CLASS := g_type_check_class_is_a(klass, G_TYPE_OBJECT);
end;

function G_OBJECT_GET_CLASS(obj: Tgpointer): PGObjectClass;
begin
  G_OBJECT_GET_CLASS := PGObjectClass(G_TYPE_INSTANCE_GET_CLASS(obj, G_TYPE_OBJECT));
end;

function G_OBJECT_TYPE(inst: Tgpointer): TGType;
begin
  G_OBJECT_TYPE := G_TYPE_FROM_INSTANCE(inst);
end;

function G_OBJECT_TYPE_NAME(obj: Tgpointer): Pgchar;
begin
  G_OBJECT_TYPE_NAME := g_type_name(G_OBJECT_TYPE(obj));
end;

function G_OBJECT_CLASS_TYPE(klass: Tgpointer): TGType;
begin
  G_OBJECT_CLASS_TYPE := G_TYPE_FROM_CLASS(klass);
end;

function G_OBJECT_CLASS_NAME(klass: Tgpointer): Pgchar;
begin
  G_OBJECT_CLASS_NAME := g_type_name(G_OBJECT_CLASS_TYPE(klass));
end;

function G_VALUE_HOLDS_OBJECT(Value: Tgpointer): Tgboolean;
begin
  G_VALUE_HOLDS_OBJECT := G_TYPE_CHECK_VALUE_TYPE(Value, G_TYPE_OBJECT);
end;

function G_TYPE_INITIALLY_UNOWNED: TGType;
begin
  G_TYPE_INITIALLY_UNOWNED := g_initially_unowned_get_type;
end;

function G_INITIALLY_UNOWNED(obj: Tgpointer): PGInitiallyUnowned;
begin
  Result := PGInitiallyUnowned(g_type_check_instance_cast(obj, G_TYPE_INITIALLY_UNOWNED));
end;

function G_INITIALLY_UNOWNED_CLASS(klass: PGTypeClass): PGInitiallyUnownedClass;
begin
  Result := PGInitiallyUnownedClass(g_type_check_class_cast(klass, G_TYPE_INITIALLY_UNOWNED));
end;

function G_IS_INITIALLY_UNOWNED(obj: Tgpointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_INITIALLY_UNOWNED);
end;

function G_IS_INITIALLY_UNOWNED_CLASS(klass: Tgpointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_INITIALLY_UNOWNED);
end;

function G_INITIALLY_UNOWNED_GET_CLASS(obj: Tgpointer): PGInitiallyUnownedClass;
begin
  Result := PGInitiallyUnownedClass(PGTypeInstance(obj)^.g_class);
end;

procedure G_OBJECT_WARN_INVALID_PSPEC(anObject: Tgpointer; pname: PGChar; property_id: Tgint; pspec: Tgpointer);
var
  _object: PGObject;
  _pspec: PGParamSpec;
  _property_id: Tguint;
begin
  //_object := PGObject (anObject);
  //_pspec := PGParamSpec (pspec);
  //_property_id := (property_id);
  //g_error ('%s: invalid %s id %u for "%s" of type `%s'' in `%s''',
  //           ['',
  //           pname,
  //           _property_id,
  //           _pspec^.name,
  //           g_type_name (G_PARAM_SPEC_TYPE (_pspec)),
  //           G_OBJECT_TYPE_NAME (_object)]);
end;


{$ENDIF read_implementation}
