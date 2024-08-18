unit gfilemonitor;

interface

uses
  common_GLIB, gtypes, gobject, giotypes, gioenums, gtype;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGFileMonitorPrivate = record
  end;
  PGFileMonitorPrivate = ^TGFileMonitorPrivate;

  TGFileMonitor = record
    parent_instance: TGObject;
    priv: PGFileMonitorPrivate;
  end;
  PGFileMonitor = ^TGFileMonitor;

  TGFileMonitorClass = record
    parent_class: TGObjectClass;
    changed: procedure(monitor: PGFileMonitor; file_: PGFile; other_file: PGFile; event_type: TGFileMonitorEvent); cdecl;
    cancel: function(monitor: PGFileMonitor): Tgboolean; cdecl;
    _g_reserved1: procedure; cdecl;
    _g_reserved2: procedure; cdecl;
    _g_reserved3: procedure; cdecl;
    _g_reserved4: procedure; cdecl;
    _g_reserved5: procedure; cdecl;
  end;
  PGFileMonitorClass = ^TGFileMonitorClass;

function g_file_monitor_get_type: TGType; cdecl; external libgio2;
function g_file_monitor_cancel(monitor: PGFileMonitor): Tgboolean; cdecl; external libgio2;
function g_file_monitor_is_cancelled(monitor: PGFileMonitor): Tgboolean; cdecl; external libgio2;
procedure g_file_monitor_set_rate_limit(monitor: PGFileMonitor; limit_msecs: Tgint); cdecl; external libgio2;
procedure g_file_monitor_emit_event(monitor: PGFileMonitor; child: PGFile; other_file: PGFile; event_type: TGFileMonitorEvent); cdecl; external libgio2;

// === Konventiert am: 18-8-24 15:42:43 ===

function G_TYPE_FILE_MONITOR: TGType;
function G_FILE_MONITOR(obj: Pointer): PGFileMonitor;
function G_FILE_MONITOR_CLASS(klass: Pointer): PGFileMonitorClass;
function G_IS_FILE_MONITOR(obj: Pointer): Tgboolean;
function G_IS_FILE_MONITOR_CLASS(klass: Pointer): Tgboolean;
function G_FILE_MONITOR_GET_CLASS(obj: Pointer): PGFileMonitorClass;

implementation

function G_TYPE_FILE_MONITOR: TGType;
begin
  G_TYPE_FILE_MONITOR := g_file_monitor_get_type;
end;

function G_FILE_MONITOR(obj: Pointer): PGFileMonitor;
begin
  Result := PGFileMonitor(g_type_check_instance_cast(obj, G_TYPE_FILE_MONITOR));
end;

function G_FILE_MONITOR_CLASS(klass: Pointer): PGFileMonitorClass;
begin
  Result := PGFileMonitorClass(g_type_check_class_cast(klass, G_TYPE_FILE_MONITOR));
end;

function G_IS_FILE_MONITOR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_FILE_MONITOR);
end;

function G_IS_FILE_MONITOR_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_FILE_MONITOR);
end;

function G_FILE_MONITOR_GET_CLASS(obj: Pointer): PGFileMonitorClass;
begin
  Result := PGFileMonitorClass(PGTypeInstance(obj)^.g_class);
end;



end.
