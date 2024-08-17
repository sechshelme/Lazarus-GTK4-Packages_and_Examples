unit gcompletion;

interface

uses
  common_GLIB, gtypes, glist;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type

  PGCompletionFunc = ^TGCompletionFunc;
  TGCompletionFunc = function(item: Tgpointer): Pgchar; cdecl;

  TGCompletionStrncmpFunc = function(s1: Pgchar; s2: Pgchar; n: Tgsize): Tgint; cdecl;
  TGCompletion = record
    items: PGList;
    func: TGCompletionFunc;
    prefix: Pgchar;
    cache: PGList;
    strncmp_func: TGCompletionStrncmpFunc;
  end;
  PGCompletion = ^TGCompletion;


function g_completion_new(func: TGCompletionFunc): PGCompletion; cdecl; external libglib2;
procedure g_completion_add_items(cmp: PGCompletion; items: PGList); cdecl; external libglib2;
procedure g_completion_remove_items(cmp: PGCompletion; items: PGList); cdecl; external libglib2;
procedure g_completion_clear_items(cmp: PGCompletion); cdecl; external libglib2;
function g_completion_complete(cmp: PGCompletion; prefix: Pgchar; new_prefix: PPgchar): PGList; cdecl; external libglib2;
function g_completion_complete_utf8(cmp: PGCompletion; prefix: Pgchar; new_prefix: PPgchar): PGList; cdecl; external libglib2;
procedure g_completion_set_compare(cmp: PGCompletion; strncmp_func: TGCompletionStrncmpFunc); cdecl; external libglib2;
procedure g_completion_free(cmp: PGCompletion); cdecl; external libglib2;

// === Konventiert am: 11-8-24 20:08:21 ===


implementation



end.
