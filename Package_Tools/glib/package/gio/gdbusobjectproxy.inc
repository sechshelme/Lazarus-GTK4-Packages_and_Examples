/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGDBusObjectProxyPrivate = record
  end;
  PGDBusObjectProxyPrivate = ^tGDBusObjectProxyPrivate;

  TGDBusObjectProxy = record
    parent_instance: TGObject;
    priv: PGDBusObjectProxyPrivate;
  end;
  PGDBusObjectProxy = ^TGDBusObjectProxy;

  TGDBusObjectProxyClass = record
    parent_class: TGObjectClass;
    padding: array[0..7] of Tgpointer;
  end;
  PGDBusObjectProxyClass = ^TGDBusObjectProxyClass;


function g_dbus_object_proxy_get_type: TGType; cdecl; external libgio2;
function g_dbus_object_proxy_new(connection: PGDBusConnection; object_path: Pgchar): PGDBusObjectProxy; cdecl; external libgio2;
function g_dbus_object_proxy_get_connection(proxy: PGDBusObjectProxy): PGDBusConnection; cdecl; external libgio2;

// === Konventiert am: 16-8-24 20:13:37 ===

function G_TYPE_DBUS_OBJECT_PROXY: TGType;
function G_DBUS_OBJECT_PROXY(obj: Pointer): PGDBusObjectProxy;
function G_DBUS_OBJECT_PROXY_CLASS(klass: Pointer): PGDBusObjectProxyClass;
function G_IS_DBUS_OBJECT_PROXY(obj: Pointer): Tgboolean;
function G_IS_DBUS_OBJECT_PROXY_CLASS(klass: Pointer): Tgboolean;
function G_DBUS_OBJECT_PROXY_GET_CLASS(obj: Pointer): PGDBusObjectProxyClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_TYPE_DBUS_OBJECT_PROXY: TGType;
begin
  G_TYPE_DBUS_OBJECT_PROXY := g_dbus_object_proxy_get_type;
end;

function G_DBUS_OBJECT_PROXY(obj: Pointer): PGDBusObjectProxy;
begin
  Result := PGDBusObjectProxy(g_type_check_instance_cast(obj, G_TYPE_DBUS_OBJECT_PROXY));
end;

function G_DBUS_OBJECT_PROXY_CLASS(klass: Pointer): PGDBusObjectProxyClass;
begin
  Result := PGDBusObjectProxyClass(g_type_check_class_cast(klass, G_TYPE_DBUS_OBJECT_PROXY));
end;

function G_IS_DBUS_OBJECT_PROXY(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_DBUS_OBJECT_PROXY);
end;

function G_IS_DBUS_OBJECT_PROXY_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_DBUS_OBJECT_PROXY);
end;

function G_DBUS_OBJECT_PROXY_GET_CLASS(obj: Pointer): PGDBusObjectProxyClass;
begin
  Result := PGDBusObjectProxyClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
