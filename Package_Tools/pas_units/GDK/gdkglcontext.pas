unit gdkglcontext;

interface

uses
  glib2, common_GTK, gdktypes, gdkenums;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGdkGLContext = record
  end;
  PGdkGLContext = ^TGdkGLContext;

function gdk_gl_error_quark: TGQuark; cdecl; external libgtk4;
function gdk_gl_context_get_type: TGType; cdecl; external libgtk4;
function gdk_gl_context_get_display(context: PGdkGLContext): PGdkDisplay; cdecl; external libgtk4;
function gdk_gl_context_get_surface(context: PGdkGLContext): PGdkSurface; cdecl; external libgtk4;
function gdk_gl_context_get_shared_context(context: PGdkGLContext): PGdkGLContext; cdecl; external libgtk4;
procedure gdk_gl_context_get_version(context: PGdkGLContext; major: Plongint; minor: Plongint); cdecl; external libgtk4;
function gdk_gl_context_is_legacy(context: PGdkGLContext): Tgboolean; cdecl; external libgtk4;
function gdk_gl_context_is_shared(self: PGdkGLContext; other: PGdkGLContext): Tgboolean; cdecl; external libgtk4;
procedure gdk_gl_context_set_required_version(context: PGdkGLContext; major: longint; minor: longint); cdecl; external libgtk4;
procedure gdk_gl_context_get_required_version(context: PGdkGLContext; major: Plongint; minor: Plongint); cdecl; external libgtk4;
procedure gdk_gl_context_set_debug_enabled(context: PGdkGLContext; Enabled: Tgboolean); cdecl; external libgtk4;
function gdk_gl_context_get_debug_enabled(context: PGdkGLContext): Tgboolean; cdecl; external libgtk4;
procedure gdk_gl_context_set_forward_compatible(context: PGdkGLContext; compatible: Tgboolean); cdecl; external libgtk4;
function gdk_gl_context_get_forward_compatible(context: PGdkGLContext): Tgboolean; cdecl; external libgtk4;
procedure gdk_gl_context_set_allowed_apis(self: PGdkGLContext; apis: TGdkGLAPI); cdecl; external libgtk4;
function gdk_gl_context_get_allowed_apis(self: PGdkGLContext): TGdkGLAPI; cdecl; external libgtk4;
function gdk_gl_context_get_api(self: PGdkGLContext): TGdkGLAPI; cdecl; external libgtk4;
procedure gdk_gl_context_set_use_es(context: PGdkGLContext; use_es: longint); cdecl; external libgtk4;
function gdk_gl_context_get_use_es(context: PGdkGLContext): Tgboolean; cdecl; external libgtk4;
function gdk_gl_context_realize(context: PGdkGLContext; error: PPGError): Tgboolean; cdecl; external libgtk4;
procedure gdk_gl_context_make_current(context: PGdkGLContext); cdecl; external libgtk4;
function gdk_gl_context_get_current: PGdkGLContext; cdecl; external libgtk4;
procedure gdk_gl_context_clear_current; cdecl; external libgtk4;

function GDK_GL_ERROR: TGQuark;

// === Konventiert am: 31-7-24 19:15:27 ===

function GDK_TYPE_GL_CONTEXT: TGType;
function GDK_GL_CONTEXT(obj: Pointer): PGdkGLContext;
function GDK_IS_GL_CONTEXT(obj: Pointer): Tgboolean;

implementation

function GDK_TYPE_GL_CONTEXT: TGType;
begin
  GDK_TYPE_GL_CONTEXT := gdk_gl_context_get_type;
end;

function GDK_GL_CONTEXT(obj: Pointer): PGdkGLContext;
begin
  Result := PGdkGLContext(g_type_check_instance_cast(obj, GDK_TYPE_GL_CONTEXT));
end;

function GDK_IS_GL_CONTEXT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GDK_TYPE_GL_CONTEXT);
end;

// ====

function GDK_GL_ERROR: TGQuark;
begin
  GDK_GL_ERROR := gdk_gl_error_quark;
end;


end.
