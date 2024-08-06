unit gtkglarea;

interface

uses
  glib2, GDK4, common_GTK, gtktypes, gtkwidget;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGtkGLArea = record
    parent_instance: TGtkWidget;
  end;
  PGtkGLArea = ^TGtkGLArea;

  TGtkGLAreaClass = record
    parent_class: TGtkWidgetClass;
    render: function(area: PGtkGLArea; context: PGdkGLContext): Tgboolean; cdecl;
    resize: procedure(area: PGtkGLArea; Width: longint; Height: longint); cdecl;
    create_context: function(area: PGtkGLArea): PGdkGLContext; cdecl;
    _padding: array[0..7] of Tgpointer;
  end;
  PGtkGLAreaClass = ^TGtkGLAreaClass;


function gtk_gl_area_get_type: TGType; cdecl; external libgtk4;
function gtk_gl_area_new: PGtkWidget; cdecl; external libgtk4;
procedure gtk_gl_area_set_allowed_apis(area: PGtkGLArea; apis: TGdkGLAPI); cdecl; external libgtk4;
function gtk_gl_area_get_allowed_apis(area: PGtkGLArea): TGdkGLAPI; cdecl; external libgtk4;
function gtk_gl_area_get_api(area: PGtkGLArea): TGdkGLAPI; cdecl; external libgtk4;
procedure gtk_gl_area_set_use_es(area: PGtkGLArea; use_es: Tgboolean); cdecl; external libgtk4;
function gtk_gl_area_get_use_es(area: PGtkGLArea): Tgboolean; cdecl; external libgtk4;
procedure gtk_gl_area_set_required_version(area: PGtkGLArea; major: longint; minor: longint); cdecl; external libgtk4;
procedure gtk_gl_area_get_required_version(area: PGtkGLArea; major: Plongint; minor: Plongint); cdecl; external libgtk4;
function gtk_gl_area_get_has_depth_buffer(area: PGtkGLArea): Tgboolean; cdecl; external libgtk4;
procedure gtk_gl_area_set_has_depth_buffer(area: PGtkGLArea; has_depth_buffer: Tgboolean); cdecl; external libgtk4;
function gtk_gl_area_get_has_stencil_buffer(area: PGtkGLArea): Tgboolean; cdecl; external libgtk4;
procedure gtk_gl_area_set_has_stencil_buffer(area: PGtkGLArea; has_stencil_buffer: Tgboolean); cdecl; external libgtk4;
function gtk_gl_area_get_auto_render(area: PGtkGLArea): Tgboolean; cdecl; external libgtk4;
procedure gtk_gl_area_set_auto_render(area: PGtkGLArea; auto_render: Tgboolean); cdecl; external libgtk4;
procedure gtk_gl_area_queue_render(area: PGtkGLArea); cdecl; external libgtk4;
function gtk_gl_area_get_context(area: PGtkGLArea): PGdkGLContext; cdecl; external libgtk4;
procedure gtk_gl_area_make_current(area: PGtkGLArea); cdecl; external libgtk4;
procedure gtk_gl_area_attach_buffers(area: PGtkGLArea); cdecl; external libgtk4;
procedure gtk_gl_area_set_error(area: PGtkGLArea; error: PGError); cdecl; external libgtk4;
function gtk_gl_area_get_error(area: PGtkGLArea): PGError; cdecl; external libgtk4;

// === Konventiert am: 27-7-24 19:03:11 ===

function GTK_TYPE_GL_AREA: TGType;
function GTK_GL_AREA(obj: Pointer): PGtkGLArea;
function GTK_GL_AREA_CLASS(klass: Pointer): PGtkGLAreaClass;
function GTK_IS_GL_AREA(obj: Pointer): Tgboolean;
function GTK_IS_GL_AREA_CLASS(klass: Pointer): Tgboolean;
function GTK_GL_AREA_GET_CLASS(obj: Pointer): PGtkGLAreaClass;

implementation

function GTK_TYPE_GL_AREA: TGType;
begin
  GTK_TYPE_GL_AREA := gtk_gl_area_get_type;
end;

function GTK_GL_AREA(obj: Pointer): PGtkGLArea;
begin
  Result := PGtkGLArea(g_type_check_instance_cast(obj, GTK_TYPE_GL_AREA));
end;

function GTK_GL_AREA_CLASS(klass: Pointer): PGtkGLAreaClass;
begin
  Result := PGtkGLAreaClass(g_type_check_class_cast(klass, GTK_TYPE_GL_AREA));
end;

function GTK_IS_GL_AREA(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_GL_AREA);
end;

function GTK_IS_GL_AREA_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_GL_AREA);
end;

function GTK_GL_AREA_GET_CLASS(obj: Pointer): PGtkGLAreaClass;
begin
  Result := PGtkGLAreaClass(PGTypeInstance(obj)^.g_class);
end;



end.
