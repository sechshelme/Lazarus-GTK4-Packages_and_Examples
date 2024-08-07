unit gstring;

interface

uses
  common_GLIB, gtypes, gunicode, garray;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGString = record
    str: Pgchar;
    len: Tgsize;
    allocated_len: Tgsize;
  end;
  PGString = ^TGString;


function g_string_new(init: Pgchar): PGString; cdecl; external libglib2;
function g_string_new_take(init: Pgchar): PGString; cdecl; external libglib2;
function g_string_new_len(init: Pgchar; len: Tgssize): PGString; cdecl; external libglib2;
function g_string_sized_new(dfl_size: Tgsize): PGString; cdecl; external libglib2;
function g_string_free(_string: PGString; free_segment: Tgboolean): Pgchar; cdecl; external libglib2;
function g_string_free_and_steal(_string: PGString): Pgchar; cdecl; external libglib2;
function g_string_free_to_bytes(_string: PGString): PGBytes; cdecl; external libglib2;
function g_string_equal(v: PGString; v2: PGString): Tgboolean; cdecl; external libglib2;
function g_string_hash(str: PGString): Tguint; cdecl; external libglib2;
function g_string_assign(_string: PGString; rval: Pgchar): PGString; cdecl; external libglib2;
function g_string_truncate(_string: PGString; len: Tgsize): PGString; cdecl; external libglib2;
function g_string_set_size(_string: PGString; len: Tgsize): PGString; cdecl; external libglib2;
function g_string_insert_len(_string: PGString; pos: Tgssize; val: Pgchar; len: Tgssize): PGString; cdecl; external libglib2;
function g_string_append(_string: PGString; val: Pgchar): PGString; cdecl; external libglib2;
function g_string_append_len(_string: PGString; val: Pgchar; len: Tgssize): PGString; cdecl; external libglib2;
function g_string_append_c(_string: PGString; c: Tgchar): PGString; cdecl; external libglib2;
function g_string_append_unichar(_string: PGString; wc: Tgunichar): PGString; cdecl; external libglib2;
function g_string_prepend(_string: PGString; val: Pgchar): PGString; cdecl; external libglib2;
function g_string_prepend_c(_string: PGString; c: Tgchar): PGString; cdecl; external libglib2;
function g_string_prepend_unichar(_string: PGString; wc: Tgunichar): PGString; cdecl; external libglib2;
function g_string_prepend_len(_string: PGString; val: Pgchar; len: Tgssize): PGString; cdecl; external libglib2;
function g_string_insert(_string: PGString; pos: Tgssize; val: Pgchar): PGString; cdecl; external libglib2;
function g_string_insert_c(_string: PGString; pos: Tgssize; c: Tgchar): PGString; cdecl; external libglib2;
function g_string_insert_unichar(_string: PGString; pos: Tgssize; wc: Tgunichar): PGString; cdecl; external libglib2;
function g_string_overwrite(_string: PGString; pos: Tgsize; val: Pgchar): PGString; cdecl; external libglib2;
function g_string_overwrite_len(_string: PGString; pos: Tgsize; val: Pgchar; len: Tgssize): PGString; cdecl; external libglib2;
function g_string_erase(_string: PGString; pos: Tgssize; len: Tgssize): PGString; cdecl; external libglib2;
function g_string_replace(_string: PGString; find: Pgchar; replace: Pgchar; limit: Tguint): Tguint; cdecl; external libglib2;
function g_string_ascii_down(_string: PGString): PGString; cdecl; external libglib2;
function g_string_ascii_up(_string: PGString): PGString; cdecl; external libglib2;
procedure g_string_vprintf(_string: PGString; format: Pgchar; args: Tva_list); cdecl; external libglib2;
procedure g_string_printf(_string: PGString; format: Pgchar; args: array of const); cdecl; external libglib2;
procedure g_string_printf(_string: PGString; format: Pgchar); cdecl; external libglib2;
procedure g_string_append_vprintf(_string: PGString; format: Pgchar; args: Tva_list); cdecl; external libglib2;
procedure g_string_append_printf(_string: PGString; format: Pgchar; args: array of const); cdecl; external libglib2;
procedure g_string_append_printf(_string: PGString; format: Pgchar); cdecl; external libglib2;
function g_string_append_uri_escaped(_string: PGString; unescaped: Pgchar; reserved_chars_allowed: Pgchar; allow_utf8: Tgboolean): PGString; cdecl; external libglib2;


function g_string_down(_string: PGString): PGString; cdecl; external libglib2;
function g_string_up(_string: PGString): PGString; cdecl; external libglib2;
{#define  g_string_sprintf  g_string_printf _MACRO_IN_2_26_FOR(g_string_printf) }
{#define  g_string_sprintfa g_string_append_printf _MACRO_IN_2_26_FOR(g_string_append_printf) }


implementation


end.
