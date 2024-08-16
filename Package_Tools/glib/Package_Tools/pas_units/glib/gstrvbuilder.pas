unit gstrvbuilder;

interface

uses
  common_GLIB, gtypes, gstrfuncs;

type
  TGStrvBuilder = record
  end;
  PGStrvBuilder = ^TGStrvBuilder;

function g_strv_builder_new: PGStrvBuilder; cdecl; external libgobject2_0;
procedure g_strv_builder_unref(builder: PGStrvBuilder); cdecl; external libgobject2_0;
function g_strv_builder_ref(builder: PGStrvBuilder): PGStrvBuilder; cdecl; external libgobject2_0;
procedure g_strv_builder_add(builder: PGStrvBuilder; Value: PChar); cdecl; external libgobject2_0;
procedure g_strv_builder_addv(builder: PGStrvBuilder; Value: PPchar); cdecl; external libgobject2_0;
procedure g_strv_builder_add_many(builder: PGStrvBuilder; args: array of const); cdecl; external libgobject2_0;
procedure g_strv_builder_add_many(builder: PGStrvBuilder); cdecl; external libgobject2_0;
procedure g_strv_builder_take(builder: PGStrvBuilder; Value: PChar); cdecl; external libgobject2_0;
function g_strv_builder_end(builder: PGStrvBuilder): TGStrv; cdecl; external libgobject2_0;

// === Konventiert am: 11-8-24 19:33:10 ===


implementation



end.
