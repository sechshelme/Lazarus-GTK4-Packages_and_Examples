unit gdbusmethodinvocation;

interface

uses
  common_GLIB, gtypes, gquark, gvariant, gerror, gtype, giotypes, gobject, gioenums, gunixfdlist, gdbusintrospection;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  G_DBUS_METHOD_INVOCATION_HANDLED = not 0;
  G_DBUS_METHOD_INVOCATION_UNHANDLED = 0;

function g_dbus_method_invocation_get_type: TGType; cdecl; external libgio2;
function g_dbus_method_invocation_get_sender(invocation: PGDBusMethodInvocation): Pgchar; cdecl; external libgio2;
function g_dbus_method_invocation_get_object_path(invocation: PGDBusMethodInvocation): Pgchar; cdecl; external libgio2;
function g_dbus_method_invocation_get_interface_name(invocation: PGDBusMethodInvocation): Pgchar; cdecl; external libgio2;
function g_dbus_method_invocation_get_method_name(invocation: PGDBusMethodInvocation): Pgchar; cdecl; external libgio2;
function g_dbus_method_invocation_get_method_info(invocation: PGDBusMethodInvocation): PGDBusMethodInfo; cdecl; external libgio2;
function g_dbus_method_invocation_get_property_info(invocation: PGDBusMethodInvocation): PGDBusPropertyInfo; cdecl; external libgio2;
function g_dbus_method_invocation_get_connection(invocation: PGDBusMethodInvocation): PGDBusConnection; cdecl; external libgio2;
function g_dbus_method_invocation_get_message(invocation: PGDBusMethodInvocation): PGDBusMessage; cdecl; external libgio2;
function g_dbus_method_invocation_get_parameters(invocation: PGDBusMethodInvocation): PGVariant; cdecl; external libgio2;
function g_dbus_method_invocation_get_user_data(invocation: PGDBusMethodInvocation): Tgpointer; cdecl; external libgio2;
procedure g_dbus_method_invocation_return_value(invocation: PGDBusMethodInvocation; parameters: PGVariant); cdecl; external libgio2;
{$ifdef Linux}
procedure g_dbus_method_invocation_return_value_with_unix_fd_list(invocation: PGDBusMethodInvocation; parameters: PGVariant; fd_list: PGUnixFDList); cdecl; external libgio2;
{$endif}

procedure g_dbus_method_invocation_return_error(invocation: PGDBusMethodInvocation; domain: TGQuark; code: Tgint; format: Pgchar; args: array of const); cdecl; external libgio2;
procedure g_dbus_method_invocation_return_error(invocation: PGDBusMethodInvocation; domain: TGQuark; code: Tgint; format: Pgchar); cdecl; external libgio2;
procedure g_dbus_method_invocation_return_error_valist(invocation: PGDBusMethodInvocation; domain: TGQuark; code: Tgint; format: Pgchar; var_args: Tva_list); cdecl; external libgio2;
procedure g_dbus_method_invocation_return_error_literal(invocation: PGDBusMethodInvocation; domain: TGQuark; code: Tgint; message: Pgchar); cdecl; external libgio2;
procedure g_dbus_method_invocation_return_gerror(invocation: PGDBusMethodInvocation; error: PGError); cdecl; external libgio2;
procedure g_dbus_method_invocation_take_error(invocation: PGDBusMethodInvocation; error: PGError); cdecl; external libgio2;
procedure g_dbus_method_invocation_return_dbus_error(invocation: PGDBusMethodInvocation; error_name: Pgchar; error_message: Pgchar); cdecl; external libgio2;

// === Konventiert am: 20-8-24 16:02:16 ===

function G_TYPE_DBUS_METHOD_INVOCATION: TGType;
function G_DBUS_METHOD_INVOCATION(obj: Pointer): PGDBusMethodInvocation;
function G_IS_DBUS_METHOD_INVOCATION(obj: Pointer): Tgboolean;

implementation

function G_TYPE_DBUS_METHOD_INVOCATION: TGType;
begin
  G_TYPE_DBUS_METHOD_INVOCATION := g_dbus_method_invocation_get_type;
end;

function G_DBUS_METHOD_INVOCATION(obj: Pointer): PGDBusMethodInvocation;
begin
  Result := PGDBusMethodInvocation(g_type_check_instance_cast(obj, G_TYPE_DBUS_METHOD_INVOCATION));
end;

function G_IS_DBUS_METHOD_INVOCATION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_DBUS_METHOD_INVOCATION);
end;



end.
