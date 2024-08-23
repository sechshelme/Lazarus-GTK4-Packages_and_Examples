unit gdkdmabuftexturebuilder;

interface

uses
  glib2, Cairo, common_GTK, gdktypes, gdktexture;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {GDK_DECLARE_INTERNAL_TYPE (GdkDmabufTextureBuilder, gdk_dmabuf_texture_builder, GDK, DMABUF_TEXTURE_BUILDER, GObject) }
type
  TGdkDmabufTextureBuilder = record
  end;
  PGdkDmabufTextureBuilder = ^TGdkDmabufTextureBuilder;

  TGdkDmabufTextureBuilderClass = record
  end;
  PGdkDmabufTextureBuilderClass = ^TGdkDmabufTextureBuilderClass;

function gdk_dmabuf_texture_builder_get_type: TGType; cdecl; external libgtk4;
function gdk_dmabuf_texture_builder_new: PGdkDmabufTextureBuilder; cdecl; external libgtk4;
function gdk_dmabuf_texture_builder_get_display(self: PGdkDmabufTextureBuilder): PGdkDisplay; cdecl; external libgtk4;
procedure gdk_dmabuf_texture_builder_set_display(self: PGdkDmabufTextureBuilder; display: PGdkDisplay); cdecl; external libgtk4;
function gdk_dmabuf_texture_builder_get_width(self: PGdkDmabufTextureBuilder): dword; cdecl; external libgtk4;
procedure gdk_dmabuf_texture_builder_set_width(self: PGdkDmabufTextureBuilder; Width: dword); cdecl; external libgtk4;
function gdk_dmabuf_texture_builder_get_height(self: PGdkDmabufTextureBuilder): dword; cdecl; external libgtk4;
procedure gdk_dmabuf_texture_builder_set_height(self: PGdkDmabufTextureBuilder; Height: dword); cdecl; external libgtk4;
function gdk_dmabuf_texture_builder_get_fourcc(self: PGdkDmabufTextureBuilder): Tguint32; cdecl; external libgtk4;
procedure gdk_dmabuf_texture_builder_set_fourcc(self: PGdkDmabufTextureBuilder; fourcc: Tguint32); cdecl; external libgtk4;
function gdk_dmabuf_texture_builder_get_modifier(self: PGdkDmabufTextureBuilder): Tguint64; cdecl; external libgtk4;
procedure gdk_dmabuf_texture_builder_set_modifier(self: PGdkDmabufTextureBuilder; modifier: Tguint64); cdecl; external libgtk4;
function gdk_dmabuf_texture_builder_get_premultiplied(self: PGdkDmabufTextureBuilder): Tgboolean; cdecl; external libgtk4;
procedure gdk_dmabuf_texture_builder_set_premultiplied(self: PGdkDmabufTextureBuilder; premultiplied: Tgboolean); cdecl; external libgtk4;
function gdk_dmabuf_texture_builder_get_n_planes(self: PGdkDmabufTextureBuilder): dword; cdecl; external libgtk4;
procedure gdk_dmabuf_texture_builder_set_n_planes(self: PGdkDmabufTextureBuilder; n_planes: dword); cdecl; external libgtk4;
function gdk_dmabuf_texture_builder_get_fd(self: PGdkDmabufTextureBuilder; plane: dword): longint; cdecl; external libgtk4;
procedure gdk_dmabuf_texture_builder_set_fd(self: PGdkDmabufTextureBuilder; plane: dword; fd: longint); cdecl; external libgtk4;
function gdk_dmabuf_texture_builder_get_stride(self: PGdkDmabufTextureBuilder; plane: dword): dword; cdecl; external libgtk4;
procedure gdk_dmabuf_texture_builder_set_stride(self: PGdkDmabufTextureBuilder; plane: dword; stride: dword); cdecl; external libgtk4;
function gdk_dmabuf_texture_builder_get_offset(self: PGdkDmabufTextureBuilder; plane: dword): dword; cdecl; external libgtk4;
procedure gdk_dmabuf_texture_builder_set_offset(self: PGdkDmabufTextureBuilder; plane: dword; offset: dword); cdecl; external libgtk4;
function gdk_dmabuf_texture_builder_get_update_texture(self: PGdkDmabufTextureBuilder): PGdkTexture; cdecl; external libgtk4;
procedure gdk_dmabuf_texture_builder_set_update_texture(self: PGdkDmabufTextureBuilder; texture: PGdkTexture); cdecl; external libgtk4;
function gdk_dmabuf_texture_builder_get_update_region(self: PGdkDmabufTextureBuilder): Pcairo_region_t; cdecl; external libgtk4;
procedure gdk_dmabuf_texture_builder_set_update_region(self: PGdkDmabufTextureBuilder; region: Pcairo_region_t); cdecl; external libgtk4;
function gdk_dmabuf_texture_builder_build(self: PGdkDmabufTextureBuilder; Destroy: TGDestroyNotify; Data: Tgpointer; error: PPGError): PGdkTexture; cdecl; external libgtk4;

// === Konventiert am: 31-7-24 16:22:50 ===

function GDK_TYPE_DMABUF_TEXTURE_BUILDER: TGType;
function GDK_DMABUF_TEXTURE_BUILDER(obj: Pointer): PGdkDmabufTextureBuilder;
function GDK_IS_DMABUF_TEXTURE_BUILDER(obj: Pointer): Tgboolean;
function GDK_DMABUF_TEXTURE_BUILDER_CLASS(klass: Pointer): PGdkDmabufTextureBuilderClass;
function GDK_IS_DMABUF_TEXTURE_BUILDER_CLASS(klass: Pointer): Tgboolean;
function GDK_DMABUF_TEXTURE_BUILDER_GET_CLASS(obj: Pointer): PGdkDmabufTextureBuilderClass;

implementation

function GDK_TYPE_DMABUF_TEXTURE_BUILDER: TGType;
begin
  Result := gdk_dmabuf_texture_builder_get_type;
end;

function GDK_DMABUF_TEXTURE_BUILDER(obj: Pointer): PGdkDmabufTextureBuilder;
begin
  Result := PGdkDmabufTextureBuilder(g_type_check_instance_cast(obj, GDK_TYPE_DMABUF_TEXTURE_BUILDER));
end;

function GDK_IS_DMABUF_TEXTURE_BUILDER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GDK_TYPE_DMABUF_TEXTURE_BUILDER);
end;

function GDK_DMABUF_TEXTURE_BUILDER_CLASS(klass: Pointer): PGdkDmabufTextureBuilderClass;
begin
  Result := PGdkDmabufTextureBuilderClass(g_type_check_class_cast(klass, GDK_TYPE_DMABUF_TEXTURE_BUILDER));
end;

function GDK_IS_DMABUF_TEXTURE_BUILDER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GDK_TYPE_DMABUF_TEXTURE_BUILDER);
end;

function GDK_DMABUF_TEXTURE_BUILDER_GET_CLASS(obj: Pointer): PGdkDmabufTextureBuilderClass;
begin
  Result := PGdkDmabufTextureBuilderClass(PGTypeInstance(obj)^.g_class);
end;




end.
