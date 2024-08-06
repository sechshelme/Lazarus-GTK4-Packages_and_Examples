unit gtkshow;

interface

uses
  common_GTK, gtkwindow;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

procedure gtk_show_uri_full(parent: PGtkWindow; uri: PChar; timestamp: Tguint32; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
  user_data: Tgpointer); cdecl; external libgtk4;
function gtk_show_uri_full_finish(parent: PGtkWindow; Result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libgtk4;
procedure gtk_show_uri(parent: PGtkWindow; uri: PChar; timestamp: Tguint32); cdecl; external libgtk4;

implementation


end.
