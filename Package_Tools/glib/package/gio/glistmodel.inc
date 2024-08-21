/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}


  { G_DECLARE_INTERFACE(GListModel, g_list_model, G, LIST_MODEL, GObject) }
type
  TGListModel = record
  end;
  PGListModel = ^TGListModel;

  TGListModelInterface = record
    g_iface: TGTypeInterface;
    get_item_type: function(list: PGListModel): TGType; cdecl;
    get_n_items: function(list: PGListModel): Tguint; cdecl;
    get_item: function(list: PGListModel; position: Tguint): Tgpointer; cdecl;
  end;
  PGListModelInterface = ^TGListModelInterface;

function g_list_model_get_type: TGType; cdecl; external libgtk4;
function g_list_model_get_item_type(list: PGListModel): TGType; cdecl; external libgio2;
function g_list_model_get_n_items(list: PGListModel): Tguint; cdecl; external libgio2;
function g_list_model_get_item(list: PGListModel; position: Tguint): Tgpointer; cdecl; external libgio2;
function g_list_model_get_object(list: PGListModel; position: Tguint): PGObject; cdecl; external libgio2;
procedure g_list_model_items_changed(list: PGListModel; position: Tguint; removed: Tguint; added: Tguint); cdecl; external libgio2;

// === Konventiert am: 21-8-24 15:17:47 ===

function G_TYPE_LIST_MODEL: TGType;
function G_LIST_MODEL(obj: Pointer): PGListModel;
function G_IS_LIST_MODEL(obj: Pointer): Tgboolean;
function G_LIST_MODEL_GET_IFACE(obj: Pointer): PGListModelInterface;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_TYPE_LIST_MODEL: TGType;
begin
  Result := g_list_model_get_type;
end;

function G_LIST_MODEL(obj: Pointer): PGListModel;
begin
  Result := PGListModel(g_type_check_instance_cast(obj, G_TYPE_LIST_MODEL));
end;

function G_IS_LIST_MODEL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_LIST_MODEL);
end;

function G_LIST_MODEL_GET_IFACE(obj: Pointer): PGListModelInterface;
begin
  Result := g_type_interface_peek(obj, G_TYPE_LIST_MODEL);
end;




{$ENDIF read_implementation}
