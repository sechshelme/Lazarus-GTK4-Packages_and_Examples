unit gtkeventcontrollerscroll;

interface

uses
  glib2, common_GTK, GDK4, gtktypes, gtkwidget;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TGtkEventControllerScroll = record // _GtkEventControllerScroll
  end;
  PGtkEventControllerScroll = ^TGtkEventControllerScroll;

  TGtkEventControllerScrollClass = record // _GtkEventControllerScrollClass
  end;
  PGtkEventControllerScrollClass = ^TGtkEventControllerScrollClass;

  PGtkEventControllerScrollFlags = ^TGtkEventControllerScrollFlags;
  TGtkEventControllerScrollFlags = longint;

const
  GTK_EVENT_CONTROLLER_SCROLL_NONE = 0;
  GTK_EVENT_CONTROLLER_SCROLL_VERTICAL = 1 shl 0;
  GTK_EVENT_CONTROLLER_SCROLL_HORIZONTAL = 1 shl 1;
  GTK_EVENT_CONTROLLER_SCROLL_DISCRETE = 1 shl 2;
  GTK_EVENT_CONTROLLER_SCROLL_KINETIC = 1 shl 3;
  GTK_EVENT_CONTROLLER_SCROLL_BOTH_AXES = GTK_EVENT_CONTROLLER_SCROLL_VERTICAL or GTK_EVENT_CONTROLLER_SCROLL_HORIZONTAL;


function gtk_event_controller_scroll_get_type: TGType; cdecl; external libgtk4;
function gtk_event_controller_scroll_new(flags: TGtkEventControllerScrollFlags): PGtkEventController; cdecl; external libgtk4;
procedure gtk_event_controller_scroll_set_flags(scroll: PGtkEventControllerScroll; flags: TGtkEventControllerScrollFlags); cdecl; external libgtk4;
function gtk_event_controller_scroll_get_flags(scroll: PGtkEventControllerScroll): TGtkEventControllerScrollFlags; cdecl; external libgtk4;
function gtk_event_controller_scroll_get_unit(scroll: PGtkEventControllerScroll): TGdkScrollUnit; cdecl; external libgtk4;

// === Konventiert am: 25-7-24 19:23:07 ===

function GTK_TYPE_EVENT_CONTROLLER_SCROLL: TGType;
function GTK_EVENT_CONTROLLER_SCROLL(obj: Pointer): PGtkEventControllerScroll;
function GTK_EVENT_CONTROLLER_SCROLL_CLASS(klass: Pointer): PGtkEventControllerScrollClass;
function GTK_IS_EVENT_CONTROLLER_SCROLL(obj: Pointer): Tgboolean;
function GTK_IS_EVENT_CONTROLLER_SCROLL_CLASS(klass: Pointer): Tgboolean;
function GTK_EVENT_CONTROLLER_SCROLL_GET_CLASS(obj: Pointer): PGtkEventControllerScrollClass;

implementation

function GTK_TYPE_EVENT_CONTROLLER_SCROLL: TGType;
begin
  GTK_TYPE_EVENT_CONTROLLER_SCROLL := gtk_event_controller_scroll_get_type;
end;

function GTK_EVENT_CONTROLLER_SCROLL(obj: Pointer): PGtkEventControllerScroll;
begin
  Result := PGtkEventControllerScroll(g_type_check_instance_cast(obj, GTK_TYPE_EVENT_CONTROLLER_SCROLL));
end;

function GTK_EVENT_CONTROLLER_SCROLL_CLASS(klass: Pointer): PGtkEventControllerScrollClass;
begin
  Result := PGtkEventControllerScrollClass(g_type_check_class_cast(klass, GTK_TYPE_EVENT_CONTROLLER_SCROLL));
end;

function GTK_IS_EVENT_CONTROLLER_SCROLL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_EVENT_CONTROLLER_SCROLL);
end;

function GTK_IS_EVENT_CONTROLLER_SCROLL_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_EVENT_CONTROLLER_SCROLL);
end;

function GTK_EVENT_CONTROLLER_SCROLL_GET_CLASS(obj: Pointer): PGtkEventControllerScrollClass;
begin
  Result := PGtkEventControllerScrollClass(PGTypeInstance(obj)^.g_class);
end;



end.
