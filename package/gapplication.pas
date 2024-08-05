unit gapplication;

interface

uses
  glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

type
{< private > }
  PGApplication = ^TGApplication;
  TGApplication = record
    end;

{< private > }
{< public > }
{ signals  }
{ vfuncs  }
  PGApplicationClass = ^TGApplicationClass;
  TGApplicationClass = record
    end;

  const   G_APPLICATION_DEFAULT_FLAGS=0; // gioenums.h



function g_application_get_type:GType;cdecl;external ;
function g_application_id_is_valid(application_id:Pgchar):gboolean;cdecl;external ;
function g_application_new(application_id:Pgchar; flags:LongBool):PGApplication;cdecl;external ;
function g_application_get_application_id(application:PGApplication):Pgchar;cdecl;external ;
procedure g_application_set_application_id(application:PGApplication; application_id:Pgchar);cdecl;external ;
function g_application_get_version(application:PGApplication):Pgchar;cdecl;external ;
procedure g_application_set_version(application:PGApplication; version:Pgchar);cdecl;external ;
function g_application_get_dbus_connection(application:PGApplication):Pointer;cdecl;external ;
function g_application_get_dbus_object_path(application:PGApplication):Pgchar;cdecl;external ;
function g_application_get_inactivity_timeout(application:PGApplication):guint;cdecl;external ;
procedure g_application_set_inactivity_timeout(application:PGApplication; inactivity_timeout:guint);cdecl;external ;
function g_application_get_flags(application:PGApplication):LongInt;cdecl;external ;
procedure g_application_set_flags(application:PGApplication; flags:LongInt);cdecl;external ;
function g_application_get_resource_base_path(application:PGApplication):Pgchar;cdecl;external ;
procedure g_application_set_resource_base_path(application:PGApplication; resource_path:Pgchar);cdecl;external ;
procedure g_application_set_action_group(application:PGApplication; action_group:Pointer);cdecl;external ;
procedure g_application_add_main_option_entries(application:PGApplication; entries:PGOptionEntry);cdecl;external ;
procedure g_application_add_main_option(application:PGApplication; long_name:Pchar; short_name:char; flags:TGOptionFlags; arg:TGOptionArg; 
            description:Pchar; arg_description:Pchar);cdecl;external ;
procedure g_application_add_option_group(application:PGApplication; group:PGOptionGroup);cdecl;external ;
procedure g_application_set_option_context_parameter_string(application:PGApplication; parameter_string:Pgchar);cdecl;external ;
procedure g_application_set_option_context_summary(application:PGApplication; summary:Pgchar);cdecl;external ;
procedure g_application_set_option_context_description(application:PGApplication; description:Pgchar);cdecl;external ;
function g_application_get_is_registered(application:PGApplication):gboolean;cdecl;external ;
function g_application_get_is_remote(application:PGApplication):gboolean;cdecl;external ;
function g_application_register(application:PGApplication; cancellable:Pointer; error:PPGError):gboolean;cdecl;external ;
procedure g_application_hold(application:PGApplication);cdecl;external ;
procedure g_application_release(application:PGApplication);cdecl;external ;
procedure g_application_activate(application:PGApplication);cdecl;external ;
procedure g_application_open(application:PGApplication; files:PPointer; n_files:gint; hint:Pgchar);cdecl;external ;
function g_application_run(application:PGApplication; argc:longint; argv:PPchar):longint;cdecl;external ;
procedure g_application_quit(application:PGApplication);cdecl;external ;
function g_application_get_default:PGApplication;cdecl;external ;
procedure g_application_set_default(application:PGApplication);cdecl;external ;
procedure g_application_mark_busy(application:PGApplication);cdecl;external ;
procedure g_application_unmark_busy(application:PGApplication);cdecl;external ;
function g_application_get_is_busy(application:PGApplication):gboolean;cdecl;external ;
procedure g_application_send_notification(application:PGApplication; id:Pgchar; notification:Pointer);cdecl;external ;
procedure g_application_withdraw_notification(application:PGApplication; id:Pgchar);cdecl;external ;
procedure g_application_bind_busy_property(application:PGApplication; object_:gpointer; _property:Pgchar);cdecl;external ;
procedure g_application_unbind_busy_property(application:PGApplication; object_:gpointer; _property:Pgchar);cdecl;external ;

// === Konventiert am: 5-8-24 17:18:28 ===

function G_TYPE_APPLICATION : GType;
function G_APPLICATION(obj : Pointer) : PGApplication;
function G_APPLICATION_CLASS(_class : Pointer) : PGApplicationClass;
function G_IS_APPLICATION(obj : Pointer) : gboolean;
function G_IS_APPLICATION_CLASS(_class : Pointer) : gboolean;
function G_APPLICATION_GET_CLASS(obj : Pointer) : PGApplicationClass;

implementation

function g_type_check_instance_is_a(instance: PGTypeInstance; iface_type: GType): gboolean; cdecl; external gobjectlib;
function g_type_check_class_is_a(instance: PGTypeClass; is_a_type: GType): gboolean; cdecl; external gobjectlib;


function G_TYPE_APPLICATION: GType;
  begin
    G_TYPE_APPLICATION:=g_application_get_type;
  end;

function G_APPLICATION(obj : Pointer) : PGApplication;
begin
  Result := PGApplication(g_type_check_instance_cast(obj, G_TYPE_APPLICATION));
end;

function G_APPLICATION_CLASS(_class: Pointer): PGApplicationClass;
begin
  Result := PGApplicationClass(g_type_check_class_cast(_class, G_TYPE_APPLICATION));
end;

function G_IS_APPLICATION(obj: Pointer): gboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_APPLICATION);
end;

function G_IS_APPLICATION_CLASS(_class: Pointer): gboolean;
begin
  Result := g_type_check_class_is_a(_class,  G_TYPE_APPLICATION);
end;

function G_APPLICATION_GET_CLASS(obj : Pointer) : PGApplicationClass;
begin
  Result := PGApplicationClass(PGTypeInstance(obj)^.g_class);
end;



end.
