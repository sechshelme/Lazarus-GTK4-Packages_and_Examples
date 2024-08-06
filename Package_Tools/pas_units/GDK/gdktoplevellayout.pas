unit gdktoplevellayout;

interface

uses
  glib2, common_GTK, gdkmonitor;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGdkToplevelLayout = record
  end;
  PGdkToplevelLayout = ^TGdkToplevelLayout;

function gdk_toplevel_layout_get_type: TGType; cdecl; external libgtk4;
function gdk_toplevel_layout_new: PGdkToplevelLayout; cdecl; external libgtk4;
function gdk_toplevel_layout_ref(layout: PGdkToplevelLayout): PGdkToplevelLayout; cdecl; external libgtk4;
procedure gdk_toplevel_layout_unref(layout: PGdkToplevelLayout); cdecl; external libgtk4;
function gdk_toplevel_layout_copy(layout: PGdkToplevelLayout): PGdkToplevelLayout; cdecl; external libgtk4;
function gdk_toplevel_layout_equal(layout: PGdkToplevelLayout; other: PGdkToplevelLayout): Tgboolean; cdecl; external libgtk4;
procedure gdk_toplevel_layout_set_maximized(layout: PGdkToplevelLayout; maximized: Tgboolean); cdecl; external libgtk4;
procedure gdk_toplevel_layout_set_fullscreen(layout: PGdkToplevelLayout; fullscreen: Tgboolean; monitor: PGdkMonitor); cdecl; external libgtk4;
function gdk_toplevel_layout_get_maximized(layout: PGdkToplevelLayout; maximized: Pgboolean): Tgboolean; cdecl; external libgtk4;
function gdk_toplevel_layout_get_fullscreen(layout: PGdkToplevelLayout; fullscreen: Pgboolean): Tgboolean; cdecl; external libgtk4;
function gdk_toplevel_layout_get_fullscreen_monitor(layout: PGdkToplevelLayout): PGdkMonitor; cdecl; external libgtk4;
procedure gdk_toplevel_layout_set_resizable(layout: PGdkToplevelLayout; resizable: Tgboolean); cdecl; external libgtk4;
function gdk_toplevel_layout_get_resizable(layout: PGdkToplevelLayout): Tgboolean; cdecl; external libgtk4;

// === Konventiert am: 30-7-24 19:36:03 ===

function GDK_TYPE_TOPLEVEL_LAYOUT: TGType;

implementation

function GDK_TYPE_TOPLEVEL_LAYOUT: TGType;
begin
  GDK_TYPE_TOPLEVEL_LAYOUT := gdk_toplevel_layout_get_type;
end;



end.
