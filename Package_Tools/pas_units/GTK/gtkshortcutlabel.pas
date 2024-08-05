unit gtkshortcutlabel;

interface

uses
  glib2, common_GTK, gtktypes, gtkwidget;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGtkShortcutLabel = record // _GtkShortcutLabel
  end;
  PGtkShortcutLabel = ^TGtkShortcutLabel;

  TGtkShortcutLabelClass = record // _GtkShortcutLabelClass
  end;
  PGtkShortcutLabelClass = ^TGtkShortcutLabelClass;

function gtk_shortcut_label_get_type: TGType; cdecl; external gtklib;
function gtk_shortcut_label_new(accelerator: PChar): PGtkWidget; cdecl; external gtklib;
function gtk_shortcut_label_get_accelerator(self: PGtkShortcutLabel): PChar; cdecl; external gtklib;
procedure gtk_shortcut_label_set_accelerator(self: PGtkShortcutLabel; accelerator: PChar); cdecl; external gtklib;
function gtk_shortcut_label_get_disabled_text(self: PGtkShortcutLabel): PChar; cdecl; external gtklib;
procedure gtk_shortcut_label_set_disabled_text(self: PGtkShortcutLabel; disabled_text: PChar); cdecl; external gtklib;

// === Konventiert am: 21-7-24 13:26:11 ===

function GTK_TYPE_SHORTCUT_LABEL: TGType;
function GTK_SHORTCUT_LABEL(obj: Pointer): PGtkShortcutLabel;
function GTK_IS_SHORTCUT_LABEL(obj: Pointer): Tgboolean;

implementation

function GTK_TYPE_SHORTCUT_LABEL: TGType;
begin
  GTK_TYPE_SHORTCUT_LABEL := gtk_shortcut_label_get_type;
end;

function GTK_SHORTCUT_LABEL(obj: Pointer): PGtkShortcutLabel;
begin
  Result := PGtkShortcutLabel(g_type_check_instance_cast(obj, GTK_TYPE_SHORTCUT_LABEL));
end;

function GTK_IS_SHORTCUT_LABEL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_SHORTCUT_LABEL);
end;



end.
