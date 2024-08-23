unit gdkdmabufformats;

interface

uses
  glib2, common_GTK;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGdkDmabufFormats = record
  end;
  PGdkDmabufFormats = ^TGdkDmabufFormats;

function gdk_dmabuf_formats_get_type: TGType; cdecl; external libgtk4;
function gdk_dmabuf_formats_ref(formats: PGdkDmabufFormats): PGdkDmabufFormats; cdecl; external libgtk4;
procedure gdk_dmabuf_formats_unref(formats: PGdkDmabufFormats); cdecl; external libgtk4;
function gdk_dmabuf_formats_get_n_formats(formats: PGdkDmabufFormats): Tgsize; cdecl; external libgtk4;
procedure gdk_dmabuf_formats_get_format(formats: PGdkDmabufFormats; idx: Tgsize; fourcc: Pguint32; modifier: Pguint64); cdecl; external libgtk4;
function gdk_dmabuf_formats_contains(formats: PGdkDmabufFormats; fourcc: Tguint32; modifier: Tguint64): Tgboolean; cdecl; external libgtk4;
function gdk_dmabuf_formats_equal(formats1: PGdkDmabufFormats; formats2: PGdkDmabufFormats): Tgboolean; cdecl; external libgtk4;

// === Konventiert am: 2-8-24 17:10:02 ===

function GDK_TYPE_DMABUF_FORMATS: TGType;

implementation

function GDK_TYPE_DMABUF_FORMATS: TGType;
begin
  GDK_TYPE_DMABUF_FORMATS := gdk_dmabuf_formats_get_type;
end;



end.
