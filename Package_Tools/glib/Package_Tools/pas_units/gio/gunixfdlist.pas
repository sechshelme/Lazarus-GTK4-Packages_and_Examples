unit gunixfdlist;

interface

uses
  common_GLIB, gtypes, gerror, gtype, gobject;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGUnixFDListPrivate = record
  end;
  PGUnixFDListPrivate = ^TGUnixFDListPrivate;

  TGUnixFDListClass = record
    parent_class: TGObjectClass;
    _g_reserved1: procedure; cdecl;
    _g_reserved2: procedure; cdecl;
    _g_reserved3: procedure; cdecl;
    _g_reserved4: procedure; cdecl;
    _g_reserved5: procedure; cdecl;
  end;
  PGUnixFDListClass = ^TGUnixFDListClass;

  TGUnixFDList = record
    parent_instance: TGObject;
    priv: PGUnixFDListPrivate;
  end;
  PGUnixFDList = ^TGUnixFDList;
  PPGUnixFDList = ^PGUnixFDList;

function g_unix_fd_list_get_type: TGType; cdecl; external libgio2;
function g_unix_fd_list_new: PGUnixFDList; cdecl; external libgio2;
function g_unix_fd_list_new_from_array(fds: Pgint; n_fds: Tgint): PGUnixFDList; cdecl; external libgio2;
function g_unix_fd_list_append(list: PGUnixFDList; fd: Tgint; error: PPGError): Tgint; cdecl; external libgio2;
function g_unix_fd_list_get_length(list: PGUnixFDList): Tgint; cdecl; external libgio2;
function g_unix_fd_list_get(list: PGUnixFDList; index_: Tgint; error: PPGError): Tgint; cdecl; external libgio2;
function g_unix_fd_list_peek_fds(list: PGUnixFDList; length: Pgint): Pgint; cdecl; external libgio2;
function g_unix_fd_list_steal_fds(list: PGUnixFDList; length: Pgint): Pgint; cdecl; external libgio2;

// === Konventiert am: 17-8-24 13:16:35 ===

function G_TYPE_UNIX_FD_LIST: TGType;
function G_UNIX_FD_LIST(obj: Pointer): PGUnixFDList;
function G_UNIX_FD_LIST_CLASS(klass: Pointer): PGUnixFDListClass;
function G_IS_UNIX_FD_LIST(obj: Pointer): Tgboolean;
function G_IS_UNIX_FD_LIST_CLASS(klass: Pointer): Tgboolean;
function G_UNIX_FD_LIST_GET_CLASS(obj: Pointer): PGUnixFDListClass;

implementation

function G_TYPE_UNIX_FD_LIST: TGType;
begin
  G_TYPE_UNIX_FD_LIST := g_unix_fd_list_get_type;
end;

function G_UNIX_FD_LIST(obj: Pointer): PGUnixFDList;
begin
  Result := PGUnixFDList(g_type_check_instance_cast(obj, G_TYPE_UNIX_FD_LIST));
end;

function G_UNIX_FD_LIST_CLASS(klass: Pointer): PGUnixFDListClass;
begin
  Result := PGUnixFDListClass(g_type_check_class_cast(klass, G_TYPE_UNIX_FD_LIST));
end;

function G_IS_UNIX_FD_LIST(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_UNIX_FD_LIST);
end;

function G_IS_UNIX_FD_LIST_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_UNIX_FD_LIST);
end;

function G_UNIX_FD_LIST_GET_CLASS(obj: Pointer): PGUnixFDListClass;
begin
  Result := PGUnixFDListClass(PGTypeInstance(obj)^.g_class);
end;



end.
