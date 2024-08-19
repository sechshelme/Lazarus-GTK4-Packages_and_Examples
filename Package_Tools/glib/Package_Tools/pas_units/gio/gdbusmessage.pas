unit gdbusmessage;

interface

uses
  common_GLIB, gtypes, gerror, gvariant, gtype, giotypes, gobject, gioenums, gunixfdlist;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

function g_dbus_message_get_type: TGType; cdecl; external libgio2;
function g_dbus_message_new: PGDBusMessage; cdecl; external libgio2;
function g_dbus_message_new_signal(path: Pgchar; interface_: Pgchar; signal: Pgchar): PGDBusMessage; cdecl; external libgio2;
function g_dbus_message_new_method_call(Name: Pgchar; path: Pgchar; interface_: Pgchar; method: Pgchar): PGDBusMessage; cdecl; external libgio2;
function g_dbus_message_new_method_reply(method_call_message: PGDBusMessage): PGDBusMessage; cdecl; external libgio2;
function g_dbus_message_new_method_error(method_call_message: PGDBusMessage; error_name: Pgchar; error_message_format: Pgchar; args: array of const): PGDBusMessage; cdecl; external libgio2;
function g_dbus_message_new_method_error(method_call_message: PGDBusMessage; error_name: Pgchar; error_message_format: Pgchar): PGDBusMessage; cdecl; external libgio2;
function g_dbus_message_new_method_error_valist(method_call_message: PGDBusMessage; error_name: Pgchar; error_message_format: Pgchar; var_args: Tva_list): PGDBusMessage; cdecl; external libgio2;
function g_dbus_message_new_method_error_literal(method_call_message: PGDBusMessage; error_name: Pgchar; error_message: Pgchar): PGDBusMessage; cdecl; external libgio2;
function g_dbus_message_print(message: PGDBusMessage; indent: Tguint): Pgchar; cdecl; external libgio2;
function g_dbus_message_get_locked(message: PGDBusMessage): Tgboolean; cdecl; external libgio2;
procedure g_dbus_message_lock(message: PGDBusMessage); cdecl; external libgio2;
function g_dbus_message_copy(message: PGDBusMessage; error: PPGError): PGDBusMessage; cdecl; external libgio2;
function g_dbus_message_get_byte_order(message: PGDBusMessage): TGDBusMessageByteOrder; cdecl; external libgio2;
procedure g_dbus_message_set_byte_order(message: PGDBusMessage; byte_order: TGDBusMessageByteOrder); cdecl; external libgio2;
function g_dbus_message_get_message_type(message: PGDBusMessage): TGDBusMessageType; cdecl; external libgio2;
procedure g_dbus_message_set_message_type(message: PGDBusMessage; _type: TGDBusMessageType); cdecl; external libgio2;
function g_dbus_message_get_flags(message: PGDBusMessage): TGDBusMessageFlags; cdecl; external libgio2;
procedure g_dbus_message_set_flags(message: PGDBusMessage; flags: TGDBusMessageFlags); cdecl; external libgio2;
function g_dbus_message_get_serial(message: PGDBusMessage): Tguint32; cdecl; external libgio2;
procedure g_dbus_message_set_serial(message: PGDBusMessage; serial: Tguint32); cdecl; external libgio2;
function g_dbus_message_get_header(message: PGDBusMessage; header_field: TGDBusMessageHeaderField): PGVariant; cdecl; external libgio2;
procedure g_dbus_message_set_header(message: PGDBusMessage; header_field: TGDBusMessageHeaderField; Value: PGVariant); cdecl; external libgio2;
function g_dbus_message_get_header_fields(message: PGDBusMessage): Pguchar; cdecl; external libgio2;
function g_dbus_message_get_body(message: PGDBusMessage): PGVariant; cdecl; external libgio2;
procedure g_dbus_message_set_body(message: PGDBusMessage; body: PGVariant); cdecl; external libgio2;
{$ifdef Linux}
function g_dbus_message_get_unix_fd_list(message: PGDBusMessage): PGUnixFDList; cdecl; external libgio2;
procedure g_dbus_message_set_unix_fd_list(message: PGDBusMessage; fd_list: PGUnixFDList); cdecl; external libgio2;
{$endif}

function g_dbus_message_get_reply_serial(message: PGDBusMessage): Tguint32; cdecl; external libgio2;
procedure g_dbus_message_set_reply_serial(message: PGDBusMessage; Value: Tguint32); cdecl; external libgio2;
function g_dbus_message_get_interface(message: PGDBusMessage): Pgchar; cdecl; external libgio2;
procedure g_dbus_message_set_interface(message: PGDBusMessage; Value: Pgchar); cdecl; external libgio2;
function g_dbus_message_get_member(message: PGDBusMessage): Pgchar; cdecl; external libgio2;
procedure g_dbus_message_set_member(message: PGDBusMessage; Value: Pgchar); cdecl; external libgio2;
function g_dbus_message_get_path(message: PGDBusMessage): Pgchar; cdecl; external libgio2;
procedure g_dbus_message_set_path(message: PGDBusMessage; Value: Pgchar); cdecl; external libgio2;
function g_dbus_message_get_sender(message: PGDBusMessage): Pgchar; cdecl; external libgio2;
procedure g_dbus_message_set_sender(message: PGDBusMessage; Value: Pgchar); cdecl; external libgio2;
function g_dbus_message_get_destination(message: PGDBusMessage): Pgchar; cdecl; external libgio2;
procedure g_dbus_message_set_destination(message: PGDBusMessage; Value: Pgchar); cdecl; external libgio2;
function g_dbus_message_get_error_name(message: PGDBusMessage): Pgchar; cdecl; external libgio2;
procedure g_dbus_message_set_error_name(message: PGDBusMessage; Value: Pgchar); cdecl; external libgio2;
function g_dbus_message_get_signature(message: PGDBusMessage): Pgchar; cdecl; external libgio2;
procedure g_dbus_message_set_signature(message: PGDBusMessage; Value: Pgchar); cdecl; external libgio2;
function g_dbus_message_get_num_unix_fds(message: PGDBusMessage): Tguint32; cdecl; external libgio2;
procedure g_dbus_message_set_num_unix_fds(message: PGDBusMessage; Value: Tguint32); cdecl; external libgio2;
function g_dbus_message_get_arg0(message: PGDBusMessage): Pgchar; cdecl; external libgio2;
function g_dbus_message_get_arg0_path(message: PGDBusMessage): Pgchar; cdecl; external libgio2;
function g_dbus_message_new_from_blob(blob: Pguchar; blob_len: Tgsize; capabilities: TGDBusCapabilityFlags; error: PPGError): PGDBusMessage; cdecl; external libgio2;
function g_dbus_message_bytes_needed(blob: Pguchar; blob_len: Tgsize; error: PPGError): Tgssize; cdecl; external libgio2;
function g_dbus_message_to_blob(message: PGDBusMessage; out_size: Pgsize; capabilities: TGDBusCapabilityFlags; error: PPGError): Pguchar; cdecl; external libgio2;
function g_dbus_message_to_gerror(message: PGDBusMessage; error: PPGError): Tgboolean; cdecl; external libgio2;

// === Konventiert am: 19-8-24 19:35:31 ===

function G_TYPE_DBUS_MESSAGE: TGType;
function G_DBUS_MESSAGE(obj: Pointer): PGDBusMessage;
function G_IS_DBUS_MESSAGE(obj: Pointer): Tgboolean;

implementation

function G_TYPE_DBUS_MESSAGE: TGType;
begin
  G_TYPE_DBUS_MESSAGE := g_dbus_message_get_type;
end;

function G_DBUS_MESSAGE(obj: Pointer): PGDBusMessage;
begin
  Result := PGDBusMessage(g_type_check_instance_cast(obj, G_TYPE_DBUS_MESSAGE));
end;

function G_IS_DBUS_MESSAGE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_DBUS_MESSAGE);
end;



end.
