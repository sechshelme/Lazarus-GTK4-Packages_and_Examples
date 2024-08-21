/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGCancellableClass = record
    parent_class: TGObjectClass;
    cancelled: procedure(cancellable: PGCancellable); cdecl;
    _g_reserved1: procedure; cdecl;
    _g_reserved2: procedure; cdecl;
    _g_reserved3: procedure; cdecl;
    _g_reserved4: procedure; cdecl;
    _g_reserved5: procedure; cdecl;
  end;
  PGCancellableClass = ^TGCancellableClass;


function g_cancellable_get_type: TGType; cdecl; external libgio2;
function g_cancellable_new: PGCancellable; cdecl; external libgio2;
function g_cancellable_is_cancelled(cancellable: PGCancellable): Tgboolean; cdecl; external libgio2;
function g_cancellable_set_error_if_cancelled(cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_cancellable_get_fd(cancellable: PGCancellable): longint; cdecl; external libgio2;
function g_cancellable_make_pollfd(cancellable: PGCancellable; pollfd: PGPollFD): Tgboolean; cdecl; external libgio2;
procedure g_cancellable_release_fd(cancellable: PGCancellable); cdecl; external libgio2;
function g_cancellable_source_new(cancellable: PGCancellable): PGSource; cdecl; external libgio2;
function g_cancellable_get_current: PGCancellable; cdecl; external libgio2;
procedure g_cancellable_push_current(cancellable: PGCancellable); cdecl; external libgio2;
procedure g_cancellable_pop_current(cancellable: PGCancellable); cdecl; external libgio2;
procedure g_cancellable_reset(cancellable: PGCancellable); cdecl; external libgio2;
function g_cancellable_connect(cancellable: PGCancellable; callback: TGCallback; Data: Tgpointer; data_destroy_func: TGDestroyNotify): Tgulong; cdecl; external libgio2;
procedure g_cancellable_disconnect(cancellable: PGCancellable; handler_id: Tgulong); cdecl; external libgio2;
procedure g_cancellable_cancel(cancellable: PGCancellable); cdecl; external libgio2;

// === Konventiert am: 16-8-24 19:37:50 ===

function G_TYPE_CANCELLABLE: TGType;
function G_CANCELLABLE(obj: Pointer): PGCancellable;
function G_CANCELLABLE_CLASS(klass: Pointer): PGCancellableClass;
function G_IS_CANCELLABLE(obj: Pointer): Tgboolean;
function G_IS_CANCELLABLE_CLASS(klass: Pointer): Tgboolean;
function G_CANCELLABLE_GET_CLASS(obj: Pointer): PGCancellableClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_TYPE_CANCELLABLE: TGType;
begin
  G_TYPE_CANCELLABLE := g_cancellable_get_type;
end;

function G_CANCELLABLE(obj: Pointer): PGCancellable;
begin
  Result := PGCancellable(g_type_check_instance_cast(obj, G_TYPE_CANCELLABLE));
end;

function G_CANCELLABLE_CLASS(klass: Pointer): PGCancellableClass;
begin
  Result := PGCancellableClass(g_type_check_class_cast(klass, G_TYPE_CANCELLABLE));
end;

function G_IS_CANCELLABLE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_CANCELLABLE);
end;

function G_IS_CANCELLABLE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_CANCELLABLE);
end;

function G_CANCELLABLE_GET_CLASS(obj: Pointer): PGCancellableClass;
begin
  Result := PGCancellableClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
