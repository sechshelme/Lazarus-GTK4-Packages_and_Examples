unit gdataset;

interface

uses
  common_GLIB, gtypes, gquark;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type

  TGDataForeachFunc = procedure(key_id: TGQuark; Data: Tgpointer; user_data: Tgpointer); cdecl;

  TGData = record
  end;
  PGData = ^TGData;
  PPGData = ^PGData;

procedure g_datalist_init(datalist: PPGData); cdecl; external libglib2;
procedure g_datalist_clear(datalist: PPGData); cdecl; external libglib2;
function g_datalist_id_get_data(datalist: PPGData; key_id: TGQuark): Tgpointer; cdecl; external libglib2;
procedure g_datalist_id_set_data_full(datalist: PPGData; key_id: TGQuark; Data: Tgpointer; destroy_func: TGDestroyNotify); cdecl; external libglib2;
procedure g_datalist_id_remove_multiple(datalist: PPGData; keys: PGQuark; n_keys: Tgsize); cdecl; external libglib2;

type
  TGDuplicateFunc = function(Data: Tgpointer; user_data: Tgpointer): Tgpointer; cdecl;

function g_datalist_id_dup_data(datalist: PPGData; key_id: TGQuark; dup_func: TGDuplicateFunc; user_data: Tgpointer): Tgpointer; cdecl; external libglib2;
function g_datalist_id_replace_data(datalist: PPGData; key_id: TGQuark; oldval: Tgpointer; newval: Tgpointer; Destroy: TGDestroyNotify;
  old_destroy: PGDestroyNotify): Tgboolean; cdecl; external libglib2;
function g_datalist_id_remove_no_notify(datalist: PPGData; key_id: TGQuark): Tgpointer; cdecl; external libglib2;
procedure g_datalist_foreach(datalist: PPGData; func: TGDataForeachFunc; user_data: Tgpointer); cdecl; external libglib2;

const
  G_DATALIST_FLAGS_MASK = $3;

procedure g_datalist_set_flags(datalist: PPGData; flags: Tguint); cdecl; external libglib2;
procedure g_datalist_unset_flags(datalist: PPGData; flags: Tguint); cdecl; external libglib2;
function g_datalist_get_flags(datalist: PPGData): Tguint; cdecl; external libglib2;

procedure g_dataset_destroy(dataset_location: Tgconstpointer); cdecl; external libglib2;
function g_dataset_id_get_data(dataset_location: Tgconstpointer; key_id: TGQuark): Tgpointer; cdecl; external libglib2;
function g_datalist_get_data(datalist: PPGData; key: Pgchar): Tgpointer; cdecl; external libglib2;
procedure g_dataset_id_set_data_full(dataset_location: Tgconstpointer; key_id: TGQuark; Data: Tgpointer; destroy_func: TGDestroyNotify); cdecl; external libglib2;
function g_dataset_id_remove_no_notify(dataset_location: Tgconstpointer; key_id: TGQuark): Tgpointer; cdecl; external libglib2;
procedure g_dataset_foreach(dataset_location: Tgconstpointer; func: TGDataForeachFunc; user_data: Tgpointer); cdecl; external libglib2;

procedure g_datalist_id_set_data(datalist: PPGData; key_id: TGQuark; Data: Tgpointer);
procedure g_datalist_id_remove_data(datalist: PPGData; key_id: TGQuark);
procedure g_datalist_set_data_full(datalist: PPGData; key_str: PGChar; Data: Tgpointer; destroy_func: TGDestroyNotify);
procedure g_datalist_set_data(datalist: PPGData; key_str: PGChar; Data: Tgpointer);
procedure g_datalist_remove_no_notify(datalist: PPGData; key_str: PGChar);
procedure g_datalist_remove_data(datalist: PPGData; key_str: PGChar);
procedure g_dataset_id_set_data(location: Tgconstpointer; key_id: TGQuark; Data: Tgpointer);
procedure g_dataset_id_remove_data(location: Tgconstpointer; key_id: TGQuark);
function g_dataset_get_data(location: Tgconstpointer; key_str: PGChar): Tgpointer;
procedure g_dataset_set_data_full(location: Tgconstpointer; key_str: PGChar; Data: Tgpointer; destroy_func: TGDestroyNotify);
procedure g_dataset_remove_no_notify(location: Tgconstpointer; key_str: PGChar);
procedure g_dataset_set_data(location: Tgconstpointer; key_str: PGChar; Data: Tgpointer);
procedure g_dataset_remove_data(location: Tgconstpointer; key_str: PGChar);

// === Konventiert am: 9-8-24 17:04:59 ===


implementation

procedure g_datalist_id_set_data(datalist: PPGData; key_id: TGQuark;
  Data: Tgpointer);
begin
  g_datalist_id_set_data_full(datalist, key_id, Data, nil);
end;

procedure g_datalist_id_remove_data(datalist: PPGData; key_id: TGQuark);
begin
  g_datalist_id_set_data(datalist, key_id, nil);
end;

procedure g_datalist_set_data_full(datalist: PPGData; key_str: PGChar;
  Data: Tgpointer; destroy_func: TGDestroyNotify);
begin
  g_datalist_id_set_data_full(datalist, g_quark_from_string(key_str), Data, destroy_func);
end;

procedure g_datalist_set_data(datalist: PPGData; key_str: PGChar;
  Data: Tgpointer);
begin
  g_datalist_set_data_full(datalist, key_str, Data, nil);
end;

procedure g_datalist_remove_no_notify(datalist: PPGData; key_str: PGChar);
begin
  g_datalist_id_remove_no_notify(datalist, g_quark_try_string(key_str));
end;

procedure g_datalist_remove_data(datalist: PPGData; key_str: PGChar);
begin
  g_datalist_id_set_data(datalist, g_quark_try_string(key_str), nil);
end;

procedure g_dataset_id_set_data(location: Tgconstpointer; key_id: TGQuark;
  Data: Tgpointer);
begin
  g_dataset_id_set_data_full(location, key_id, Data, nil);
end;

procedure g_dataset_id_remove_data(location: Tgconstpointer; key_id: TGQuark);
begin
  g_dataset_id_set_data(location, key_id, nil);
end;

function g_dataset_get_data(location: Tgconstpointer; key_str: PGChar
  ): Tgpointer;
begin
  g_dataset_get_data := g_dataset_id_get_data(location, g_quark_try_string(key_str));
end;

procedure g_dataset_set_data_full(location: Tgconstpointer; key_str: PGChar;
  Data: Tgpointer; destroy_func: TGDestroyNotify);
begin
  g_dataset_id_set_data_full(location, g_quark_from_string(key_str), Data, destroy_func);
end;

procedure g_dataset_remove_no_notify(location: Tgconstpointer; key_str: PGChar);
begin
  g_dataset_id_remove_no_notify(location, g_quark_try_string(key_str));
end;

procedure g_dataset_set_data(location: Tgconstpointer; key_str: PGChar;
  Data: Tgpointer);
begin
  g_dataset_set_data_full(location, key_str, Data, nil);
end;

procedure g_dataset_remove_data(location: Tgconstpointer; key_str: PGChar);
begin
  g_dataset_id_set_data(location, g_quark_try_string(key_str), nil);
end;

end.
