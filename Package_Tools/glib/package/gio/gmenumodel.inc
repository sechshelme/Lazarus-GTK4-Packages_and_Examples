/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

const
  G_MENU_ATTRIBUTE_ACTION = 'action';
  G_MENU_ATTRIBUTE_ACTION_NAMESPACE = 'action-namespace';
  G_MENU_ATTRIBUTE_TARGET = 'target';
  G_MENU_ATTRIBUTE_LABEL = 'label';
  G_MENU_ATTRIBUTE_ICON = 'icon';
  G_MENU_LINK_SUBMENU = 'submenu';
  G_MENU_LINK_SECTION = 'section';

type
  TGMenuAttributeIterPrivate = record
  end;
  PGMenuAttributeIterPrivate = ^TGMenuAttributeIterPrivate;

  TGMenuAttributeIter = record
    parent_instance: TGObject;
    priv: PGMenuAttributeIterPrivate;
  end;
  PGMenuAttributeIter = ^TGMenuAttributeIter;

  TGMenuAttributeIterClass = record
    parent_class: TGObjectClass;
    get_next: function(iter: PGMenuAttributeIter; out_name: PPgchar; Value: PPGVariant): Tgboolean; cdecl;
  end;
  PGMenuAttributeIterClass = ^TGMenuAttributeIterClass;

  TGMenuModelPrivate = record
  end;
  PGMenuModelPrivate = ^TGMenuModelPrivate;

  TGMenuModel = record
    parent_instance: TGObject;
    priv: PGMenuModelPrivate;
  end;
  PGMenuModel = ^TGMenuModel;
  PPGMenuModel = ^PGMenuModel;

  PGMenuLinkIter = ^TGMenuLinkIter;

  TGMenuModelClass = record
    parent_class: TGObjectClass;
    is_mutable: function(model: PGMenuModel): Tgboolean; cdecl;
    get_n_items: function(model: PGMenuModel): Tgint; cdecl;
    get_item_attributes: procedure(model: PGMenuModel; item_index: Tgint; attributes: PPGHashTable); cdecl;
    iterate_item_attributes: function(model: PGMenuModel; item_index: Tgint): PGMenuAttributeIter; cdecl;
    get_item_attribute_value: function(model: PGMenuModel; item_index: Tgint; attribute: Pgchar; expected_type: PGVariantType): PGVariant; cdecl;
    get_item_links: procedure(model: PGMenuModel; item_index: Tgint; links: PPGHashTable); cdecl;
    iterate_item_links: function(model: PGMenuModel; item_index: Tgint): PGMenuLinkIter; cdecl;
    get_item_link: function(model: PGMenuModel; item_index: Tgint; link: Pgchar): PGMenuModel; cdecl;
  end;
  PGMenuModelClass = ^TGMenuModelClass;

  TGMenuLinkIterPrivate = record
  end;
  PGMenuLinkIterPrivate = ^TGMenuLinkIterPrivate;

  TGMenuLinkIter = record
    parent_instance: TGObject;
    priv: PGMenuLinkIterPrivate;
  end;

  TGMenuLinkIterClass = record
    parent_class: TGObjectClass;
    get_next: function(iter: PGMenuLinkIter; out_link: PPgchar; Value: PPGMenuModel): Tgboolean; cdecl;
  end;
  PGMenuLinkIterClass = ^TGMenuLinkIterClass;

function g_menu_model_get_type: TGType; cdecl; external libgio2;
function g_menu_model_is_mutable(model: PGMenuModel): Tgboolean; cdecl; external libgio2;
function g_menu_model_get_n_items(model: PGMenuModel): Tgint; cdecl; external libgio2;
function g_menu_model_iterate_item_attributes(model: PGMenuModel; item_index: Tgint): PGMenuAttributeIter; cdecl; external libgio2;
function g_menu_model_get_item_attribute_value(model: PGMenuModel; item_index: Tgint; attribute: Pgchar; expected_type: PGVariantType): PGVariant; cdecl; external libgio2;
function g_menu_model_get_item_attribute(model: PGMenuModel; item_index: Tgint; attribute: Pgchar; format_string: Pgchar; args: array of const): Tgboolean; cdecl; external libgio2;
function g_menu_model_get_item_attribute(model: PGMenuModel; item_index: Tgint; attribute: Pgchar; format_string: Pgchar): Tgboolean; cdecl; external libgio2;
function g_menu_model_iterate_item_links(model: PGMenuModel; item_index: Tgint): PGMenuLinkIter; cdecl; external libgio2;
function g_menu_model_get_item_link(model: PGMenuModel; item_index: Tgint; link: Pgchar): PGMenuModel; cdecl; external libgio2;
procedure g_menu_model_items_changed(model: PGMenuModel; position: Tgint; removed: Tgint; added: Tgint); cdecl; external libgio2;

function g_menu_attribute_iter_get_type: TGType; cdecl; external libgio2;
function g_menu_attribute_iter_get_next(iter: PGMenuAttributeIter; out_name: PPgchar; Value: PPGVariant): Tgboolean; cdecl; external libgio2;
function g_menu_attribute_iter_next(iter: PGMenuAttributeIter): Tgboolean; cdecl; external libgio2;
function g_menu_attribute_iter_get_name(iter: PGMenuAttributeIter): Pgchar; cdecl; external libgio2;
function g_menu_attribute_iter_get_value(iter: PGMenuAttributeIter): PGVariant; cdecl; external libgio2;

function g_menu_link_iter_get_type: TGType; cdecl; external libgio2;
function g_menu_link_iter_get_next(iter: PGMenuLinkIter; out_link: PPgchar; Value: PPGMenuModel): Tgboolean; cdecl; external libgio2;
function g_menu_link_iter_next(iter: PGMenuLinkIter): Tgboolean; cdecl; external libgio2;
function g_menu_link_iter_get_name(iter: PGMenuLinkIter): Pgchar; cdecl; external libgio2;
function g_menu_link_iter_get_value(iter: PGMenuLinkIter): PGMenuModel; cdecl; external libgio2;

// === Konventiert am: 19-8-24 18:01:27 ===

function G_TYPE_MENU_MODEL: TGType;
function G_MENU_MODEL(obj: Pointer): PGMenuModel;
function G_MENU_MODEL_CLASS(klass: Pointer): PGMenuModelClass;
function G_IS_MENU_MODEL(obj: Pointer): Tgboolean;
function G_IS_MENU_MODEL_CLASS(klass: Pointer): Tgboolean;
function G_MENU_MODEL_GET_CLASS(obj: Pointer): PGMenuModelClass;

function G_TYPE_MENU_ATTRIBUTE_ITER: TGType;
function G_MENU_ATTRIBUTE_ITER(obj: Pointer): PGMenuAttributeIter;
function G_MENU_ATTRIBUTE_ITER_CLASS(klass: Pointer): PGMenuAttributeIterClass;
function G_IS_MENU_ATTRIBUTE_ITER(obj: Pointer): Tgboolean;
function G_IS_MENU_ATTRIBUTE_ITER_CLASS(klass: Pointer): Tgboolean;
function G_MENU_ATTRIBUTE_ITER_GET_CLASS(obj: Pointer): PGMenuAttributeIterClass;

function G_TYPE_MENU_LINK_ITER: TGType;
function G_MENU_LINK_ITER(obj: Pointer): PGMenuLinkIter;
function G_MENU_LINK_ITER_CLASS(klass: Pointer): PGMenuLinkIterClass;
function G_IS_MENU_LINK_ITER(obj: Pointer): Tgboolean;
function G_IS_MENU_LINK_ITER_CLASS(klass: Pointer): Tgboolean;
function G_MENU_LINK_ITER_GET_CLASS(obj: Pointer): PGMenuLinkIterClass;


{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_TYPE_MENU_MODEL: TGType;
begin
  G_TYPE_MENU_MODEL := g_menu_model_get_type;
end;

function G_MENU_MODEL(obj: Pointer): PGMenuModel;
begin
  Result := PGMenuModel(g_type_check_instance_cast(obj, G_TYPE_MENU_MODEL));
end;

function G_MENU_MODEL_CLASS(klass: Pointer): PGMenuModelClass;
begin
  Result := PGMenuModelClass(g_type_check_class_cast(klass, G_TYPE_MENU_MODEL));
end;

function G_IS_MENU_MODEL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_MENU_MODEL);
end;

function G_IS_MENU_MODEL_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_MENU_MODEL);
end;

function G_MENU_MODEL_GET_CLASS(obj: Pointer): PGMenuModelClass;
begin
  Result := PGMenuModelClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function G_TYPE_MENU_ATTRIBUTE_ITER: TGType;
begin
  G_TYPE_MENU_ATTRIBUTE_ITER := g_menu_attribute_iter_get_type;
end;

function G_MENU_ATTRIBUTE_ITER(obj: Pointer): PGMenuAttributeIter;
begin
  Result := PGMenuAttributeIter(g_type_check_instance_cast(obj, G_TYPE_MENU_ATTRIBUTE_ITER));
end;

function G_MENU_ATTRIBUTE_ITER_CLASS(klass: Pointer): PGMenuAttributeIterClass;
begin
  Result := PGMenuAttributeIterClass(g_type_check_class_cast(klass, G_TYPE_MENU_ATTRIBUTE_ITER));
end;

function G_IS_MENU_ATTRIBUTE_ITER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_MENU_ATTRIBUTE_ITER);
end;

function G_IS_MENU_ATTRIBUTE_ITER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_MENU_ATTRIBUTE_ITER);
end;

function G_MENU_ATTRIBUTE_ITER_GET_CLASS(obj: Pointer): PGMenuAttributeIterClass;
begin
  Result := PGMenuAttributeIterClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function G_TYPE_MENU_LINK_ITER: TGType;
begin
  G_TYPE_MENU_LINK_ITER := g_menu_link_iter_get_type;
end;

function G_MENU_LINK_ITER(obj: Pointer): PGMenuLinkIter;
begin
  Result := PGMenuLinkIter(g_type_check_instance_cast(obj, G_TYPE_MENU_LINK_ITER));
end;

function G_MENU_LINK_ITER_CLASS(klass: Pointer): PGMenuLinkIterClass;
begin
  Result := PGMenuLinkIterClass(g_type_check_class_cast(klass, G_TYPE_MENU_LINK_ITER));
end;

function G_IS_MENU_LINK_ITER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_MENU_LINK_ITER);
end;

function G_IS_MENU_LINK_ITER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_MENU_LINK_ITER);
end;

function G_MENU_LINK_ITER_GET_CLASS(obj: Pointer): PGMenuLinkIterClass;
begin
  Result := PGMenuLinkIterClass(PGTypeInstance(obj)^.g_class);
end;


{$ENDIF read_implementation}
