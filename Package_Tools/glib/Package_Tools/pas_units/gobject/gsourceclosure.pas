unit gsourceclosure;

interface

uses
  common_GLIB, gtypes, gmain, gclosure;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

procedure g_source_set_closure(Source: PGSource; closure: PGClosure); cdecl; external libglib2;
procedure g_source_set_dummy_callback(Source: PGSource); cdecl; external libglib2;

// === Konventiert am: 15-8-24 19:51:31 ===


implementation



end.
