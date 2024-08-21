/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  PGHook = ^TGHook;

  TGHook = record
    Data: Tgpointer;
    Next: PGHook;
    prev: PGHook;
    ref_count: Tguint;
    hook_id: Tgulong;
    flags: Tguint;
    func: Tgpointer;
    Destroy: TGDestroyNotify;
  end;

  PGHookList = ^TGHookList;
  TGHookCompareFunc = function(new_hook: PGHook; sibling: PGHook): Tgint; cdecl;
  TGHookFindFunc = function(hook: PGHook; Data: Tgpointer): Tgboolean; cdecl;
  TGHookMarshaller = procedure(hook: PGHook; marshal_data: Tgpointer); cdecl;
  TGHookCheckMarshaller = function(hook: PGHook; marshal_data: Tgpointer): Tgboolean; cdecl;
  TGHookFunc = procedure(Data: Tgpointer); cdecl;
  TGHookCheckFunc = function(Data: Tgpointer): Tgboolean; cdecl;
  TGHookFinalizeFunc = procedure(hook_list: PGHookList; hook: PGHook); cdecl;

  (*
  struct _GHookList
  {
    gulong      seq_id;
    guint        hook_size : 16;
    guint        is_setup : 1;
    GHook       *hooks;
    gpointer      dummy3;
    GHookFinalizeFunc finalize_hook;
    gpointer      dummy[2];
  };
  *)

  TGHookList = record
    seq_id: Tgulong;
    hook_size: 0..65535;
    is_setup: 0..1;
    hooks: PGHook;
    dummy3: Tgpointer;
    finalize_hook: TGHookFinalizeFunc;
    dummy: array[0..1] of Tgpointer;
  end;


  PGHookFlagMask = ^TGHookFlagMask;
  TGHookFlagMask = longint;

const
  G_HOOK_FLAG_ACTIVE = 1 shl 0;
  G_HOOK_FLAG_IN_CALL = 1 shl 1;
  G_HOOK_FLAG_MASK = $0f;

  G_HOOK_FLAG_USER_SHIFT = 4;


const
  bm_TGHookList_hook_size = $FFFF;
  bp_TGHookList_hook_size = 0;
  bm_TGHookList_is_setup = $10000;
  bp_TGHookList_is_setup = 16;

procedure g_hook_list_init(hook_list: PGHookList; hook_size: Tguint); cdecl; external libglib2;
procedure g_hook_list_clear(hook_list: PGHookList); cdecl; external libglib2;
function g_hook_alloc(hook_list: PGHookList): PGHook; cdecl; external libglib2;
procedure g_hook_free(hook_list: PGHookList; hook: PGHook); cdecl; external libglib2;
function g_hook_ref(hook_list: PGHookList; hook: PGHook): PGHook; cdecl; external libglib2;
procedure g_hook_unref(hook_list: PGHookList; hook: PGHook); cdecl; external libglib2;
function g_hook_destroy(hook_list: PGHookList; hook_id: Tgulong): Tgboolean; cdecl; external libglib2;
procedure g_hook_destroy_link(hook_list: PGHookList; hook: PGHook); cdecl; external libglib2;
procedure g_hook_prepend(hook_list: PGHookList; hook: PGHook); cdecl; external libglib2;
procedure g_hook_insert_before(hook_list: PGHookList; sibling: PGHook; hook: PGHook); cdecl; external libglib2;
procedure g_hook_insert_sorted(hook_list: PGHookList; hook: PGHook; func: TGHookCompareFunc); cdecl; external libglib2;
function g_hook_get(hook_list: PGHookList; hook_id: Tgulong): PGHook; cdecl; external libglib2;
function g_hook_find(hook_list: PGHookList; need_valids: Tgboolean; func: TGHookFindFunc; Data: Tgpointer): PGHook; cdecl; external libglib2;
function g_hook_find_data(hook_list: PGHookList; need_valids: Tgboolean; Data: Tgpointer): PGHook; cdecl; external libglib2;
function g_hook_find_func(hook_list: PGHookList; need_valids: Tgboolean; func: Tgpointer): PGHook; cdecl; external libglib2;
function g_hook_find_func_data(hook_list: PGHookList; need_valids: Tgboolean; func: Tgpointer; Data: Tgpointer): PGHook; cdecl; external libglib2;
function g_hook_first_valid(hook_list: PGHookList; may_be_in_call: Tgboolean): PGHook; cdecl; external libglib2;
function g_hook_next_valid(hook_list: PGHookList; hook: PGHook; may_be_in_call: Tgboolean): PGHook; cdecl; external libglib2;
function g_hook_compare_ids(new_hook: PGHook; sibling: PGHook): Tgint; cdecl; external libglib2;
procedure g_hook_list_invoke(hook_list: PGHookList; may_recurse: Tgboolean); cdecl; external libglib2;
procedure g_hook_list_invoke_check(hook_list: PGHookList; may_recurse: Tgboolean); cdecl; external libglib2;
procedure g_hook_list_marshal(hook_list: PGHookList; may_recurse: Tgboolean; marshaller: TGHookMarshaller; marshal_data: Tgpointer); cdecl; external libglib2;
procedure g_hook_list_marshal_check(hook_list: PGHookList; may_recurse: Tgboolean; marshaller: TGHookCheckMarshaller; marshal_data: Tgpointer); cdecl; external libglib2;


function G_HOOK(hook: pointer): PGHook;
function G_HOOK_FLAGS(hook: PGHook): Tguint;
function G_HOOK_ACTIVE(hook: PGHook): boolean;
function G_HOOK_IN_CALL(hook: PGHook): boolean;
function G_HOOK_IS_VALID(hook: PGHook): boolean;
function G_HOOK_IS_UNLINKED(hook: PGHook): boolean;

procedure g_hook_append(hook_list: PGHookList; hook: PGHook);


// === Konventiert am: 10-8-24 17:31:02 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function G_HOOK(hook: pointer): PGHook;
begin
  G_HOOK := PGHook(hook);
end;

function G_HOOK_FLAGS(hook: PGHook): Tguint;
begin
  G_HOOK_FLAGS := hook^.flags;
end;
{ from the old glib}
function G_HOOK_ACTIVE(hook: PGHook): boolean;
begin
  G_HOOK_ACTIVE := (((PGHook(hook))^.flags) and cardinal(G_HOOK_FLAG_ACTIVE)) <> 0;
end;

function G_HOOK_IN_CALL(hook: PGHook): boolean;
begin
  G_HOOK_IN_CALL := (((PGHook(hook))^.flags) and cardinal(G_HOOK_FLAG_IN_CALL)) <> 0;
end;

function G_HOOK_IS_VALID(hook: PGHook): boolean;
begin
  G_HOOK_IS_VALID := (hook^.hook_id <> 0) and G_HOOK_ACTIVE(hook);
end;

function G_HOOK_IS_UNLINKED(hook: PGHook): boolean;
begin
  G_HOOK_IS_UNLINKED := (hook^.Next = nil) and (hook^.prev = nil) and (hook^.hook_id = 0) and (hook^.ref_count = 0);
end;

procedure g_hook_append(hook_list: PGHookList; hook: PGHook);
begin
  g_hook_insert_before(hook_list, nil, hook);
end;

{$ENDIF read_implementation}
