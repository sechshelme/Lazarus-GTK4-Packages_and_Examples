unit gdkcontentproviderimpl;

interface

uses
  glib2, common_GTK, gdktypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

function gdk_content_provider_new_for_value(Value: PGValue): PGdkContentProvider; cdecl; external libgtk4;
function gdk_content_provider_new_typed(_type: TGType): PGdkContentProvider; varargs cdecl; external libgtk4;
function gdk_content_provider_new_union(providers: PPGdkContentProvider; n_providers: Tgsize): PGdkContentProvider; cdecl; external libgtk4;
function gdk_content_provider_new_for_bytes(mime_type: PChar; bytes: PGBytes): PGdkContentProvider; cdecl; external libgtk4;

// === Konventiert am: 30-7-24 19:11:08 ===


implementation



end.
