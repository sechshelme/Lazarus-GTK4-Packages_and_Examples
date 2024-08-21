/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}


type
  PGDatagramBasedInterface = ^TGDatagramBasedInterface;

  TGDatagramBasedInterface = record
    g_iface: TGTypeInterface;
    receive_messages: function(datagram_based: PGDatagramBased; Messages: PGInputMessage; num_messages: Tguint; flags: Tgint; timeout: Tgint64;
      cancellable: PGCancellable; error: PPGError): Tgint; cdecl;
    send_messages: function(datagram_based: PGDatagramBased; Messages: PGOutputMessage; num_messages: Tguint; flags: Tgint; timeout: Tgint64;
      cancellable: PGCancellable; error: PPGError): Tgint; cdecl;
    create_source: function(datagram_based: PGDatagramBased; condition: TGIOCondition; cancellable: PGCancellable): PGSource; cdecl;
    condition_check: function(datagram_based: PGDatagramBased; condition: TGIOCondition): TGIOCondition; cdecl;
    condition_wait: function(datagram_based: PGDatagramBased; condition: TGIOCondition; timeout: Tgint64; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl;
  end;


function g_datagram_based_get_type: TGType; cdecl; external libgio2;
function g_datagram_based_receive_messages(datagram_based: PGDatagramBased; Messages: PGInputMessage; num_messages: Tguint; flags: Tgint; timeout: Tgint64;
  cancellable: PGCancellable; error: PPGError): Tgint; cdecl; external libgio2;
function g_datagram_based_send_messages(datagram_based: PGDatagramBased; Messages: PGOutputMessage; num_messages: Tguint; flags: Tgint; timeout: Tgint64;
  cancellable: PGCancellable; error: PPGError): Tgint; cdecl; external libgio2;
function g_datagram_based_create_source(datagram_based: PGDatagramBased; condition: TGIOCondition; cancellable: PGCancellable): PGSource; cdecl; external libgio2;
function g_datagram_based_condition_check(datagram_based: PGDatagramBased; condition: TGIOCondition): TGIOCondition; cdecl; external libgio2;
function g_datagram_based_condition_wait(datagram_based: PGDatagramBased; condition: TGIOCondition; timeout: Tgint64; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libgio2;

function G_TYPE_IS_DATAGRAM_BASED(_type: TGType): Tgboolean;


// === Konventiert am: 20-8-24 16:02:05 ===

function G_TYPE_DATAGRAM_BASED: TGType;
function G_DATAGRAM_BASED(obj: Pointer): PGDatagramBased;
function G_IS_DATAGRAM_BASED(obj: Pointer): Tgboolean;
function G_DATAGRAM_BASED_GET_IFACE(obj: Pointer): PGDatagramBasedInterface;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_TYPE_DATAGRAM_BASED: TGType;
begin
  G_TYPE_DATAGRAM_BASED := g_datagram_based_get_type;
end;

function G_DATAGRAM_BASED(obj: Pointer): PGDatagramBased;
begin
  Result := PGDatagramBased(g_type_check_instance_cast(obj, G_TYPE_DATAGRAM_BASED));
end;

function G_IS_DATAGRAM_BASED(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_DATAGRAM_BASED);
end;

function G_DATAGRAM_BASED_GET_IFACE(obj: Pointer): PGDatagramBasedInterface;
begin
  Result := g_type_interface_peek(obj, G_TYPE_DATAGRAM_BASED);
end;

// ====

function G_TYPE_IS_DATAGRAM_BASED(_type: TGType): Tgboolean;
begin
  G_TYPE_IS_DATAGRAM_BASED := g_type_is_a(_type, G_TYPE_DATAGRAM_BASED);
end;


{$ENDIF read_implementation}
