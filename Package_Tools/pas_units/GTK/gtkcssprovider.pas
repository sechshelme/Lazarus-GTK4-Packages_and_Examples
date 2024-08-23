unit gtkcssprovider;

interface

uses
  glib2, common_GTK;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGtkCssProvider = record
    parent_instance: TGObject;
  end;
  PGtkCssProvider = ^TGtkCssProvider;


function gtk_css_provider_get_type: TGType; cdecl; external libgtk4;
function gtk_css_provider_new: PGtkCssProvider; cdecl; external libgtk4;
function gtk_css_provider_to_string(provider: PGtkCssProvider): PChar; cdecl; external libgtk4;
procedure gtk_css_provider_load_from_data(css_provider: PGtkCssProvider; Data: PChar; length: Tgssize); cdecl; external libgtk4;
procedure gtk_css_provider_load_from_string(css_provider: PGtkCssProvider; _string: PChar); cdecl; external libgtk4;
procedure gtk_css_provider_load_from_bytes(css_provider: PGtkCssProvider; Data: PGBytes); cdecl; external libgtk4;
procedure gtk_css_provider_load_from_file(css_provider: PGtkCssProvider; _file: PGFile); cdecl; external libgtk4;
procedure gtk_css_provider_load_from_path(css_provider: PGtkCssProvider; path: PChar); cdecl; external libgtk4;
procedure gtk_css_provider_load_from_resource(css_provider: PGtkCssProvider; resource_path: PChar); cdecl; external libgtk4;
procedure gtk_css_provider_load_named(provider: PGtkCssProvider; Name: PChar; variant: PChar); cdecl; external libgtk4;

// === Konventiert am: 24-7-24 19:46:13 ===

function GTK_TYPE_CSS_PROVIDER: TGType;
function GTK_CSS_PROVIDER(obj: Pointer): PGtkCssProvider;
function GTK_IS_CSS_PROVIDER(obj: Pointer): Tgboolean;

implementation

function GTK_TYPE_CSS_PROVIDER: TGType;
begin
  GTK_TYPE_CSS_PROVIDER := gtk_css_provider_get_type;
end;

function GTK_CSS_PROVIDER(obj: Pointer): PGtkCssProvider;
begin
  Result := PGtkCssProvider(g_type_check_instance_cast(obj, GTK_TYPE_CSS_PROVIDER));
end;

function GTK_IS_CSS_PROVIDER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_CSS_PROVIDER);
end;



end.
