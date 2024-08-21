/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGSocketControlMessageClass = record
    parent_class: TGObjectClass;
    get_size: function(message: PGSocketControlMessage): Tgsize; cdecl;
    get_level: function(message: PGSocketControlMessage): longint; cdecl;
    get_type: function(message: PGSocketControlMessage): longint; cdecl;
    serialize: procedure(message: PGSocketControlMessage; Data: Tgpointer); cdecl;
    deserialize: function(level: longint; _type: longint; size: Tgsize; Data: Tgpointer): PGSocketControlMessage; cdecl;
    _g_reserved1: procedure; cdecl;
    _g_reserved2: procedure; cdecl;
    _g_reserved3: procedure; cdecl;
    _g_reserved4: procedure; cdecl;
    _g_reserved5: procedure; cdecl;
  end;
  PGSocketControlMessageClass = ^TGSocketControlMessageClass;


function g_socket_control_message_get_type: TGType; cdecl; external libgio2;
function g_socket_control_message_get_size(message: PGSocketControlMessage): Tgsize; cdecl; external libgio2;
function g_socket_control_message_get_level(message: PGSocketControlMessage): longint; cdecl; external libgio2;
function g_socket_control_message_get_msg_type(message: PGSocketControlMessage): longint; cdecl; external libgio2;
procedure g_socket_control_message_serialize(message: PGSocketControlMessage; Data: Tgpointer); cdecl; external libgio2;
function g_socket_control_message_deserialize(level: longint; _type: longint; size: Tgsize; Data: Tgpointer): PGSocketControlMessage; cdecl; external libgio2;

// === Konventiert am: 16-8-24 20:04:46 ===

function G_TYPE_SOCKET_CONTROL_MESSAGE: TGType;
function G_SOCKET_CONTROL_MESSAGE(obj: Pointer): PGSocketControlMessage;
function G_SOCKET_CONTROL_MESSAGE_CLASS(klass: Pointer): PGSocketControlMessageClass;
function G_IS_SOCKET_CONTROL_MESSAGE(obj: Pointer): Tgboolean;
function G_IS_SOCKET_CONTROL_MESSAGE_CLASS(klass: Pointer): Tgboolean;
function G_SOCKET_CONTROL_MESSAGE_GET_CLASS(obj: Pointer): PGSocketControlMessageClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_TYPE_SOCKET_CONTROL_MESSAGE: TGType;
begin
  G_TYPE_SOCKET_CONTROL_MESSAGE := g_socket_control_message_get_type;
end;

function G_SOCKET_CONTROL_MESSAGE(obj: Pointer): PGSocketControlMessage;
begin
  Result := PGSocketControlMessage(g_type_check_instance_cast(obj, G_TYPE_SOCKET_CONTROL_MESSAGE));
end;

function G_SOCKET_CONTROL_MESSAGE_CLASS(klass: Pointer): PGSocketControlMessageClass;
begin
  Result := PGSocketControlMessageClass(g_type_check_class_cast(klass, G_TYPE_SOCKET_CONTROL_MESSAGE));
end;

function G_IS_SOCKET_CONTROL_MESSAGE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_SOCKET_CONTROL_MESSAGE);
end;

function G_IS_SOCKET_CONTROL_MESSAGE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_SOCKET_CONTROL_MESSAGE);
end;

function G_SOCKET_CONTROL_MESSAGE_GET_CLASS(obj: Pointer): PGSocketControlMessageClass;
begin
  Result := PGSocketControlMessageClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
