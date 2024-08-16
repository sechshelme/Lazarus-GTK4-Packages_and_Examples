unit gsourceclosure;

interface

uses
  common_GLIB, gtypes, gmain, gclosure;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

procedure g_source_set_closure(Source: PGSource; closure: PGClosure); cdecl; external libgobject2_0;
procedure g_source_set_dummy_callback(Source: PGSource); cdecl; external libgobject2_0;

// === Konventiert am: 15-8-24 19:51:31 ===


implementation



end.
