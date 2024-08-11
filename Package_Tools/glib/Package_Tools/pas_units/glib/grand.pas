unit grand;

interface

uses
  common_GLIB, gtypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGRand = record
  end;
  PGRand = ^TGRand;

function g_rand_new_with_seed(seed: Tguint32): PGRand; cdecl; external libglib2;
function g_rand_new_with_seed_array(seed: Pguint32; seed_length: Tguint): PGRand; cdecl; external libglib2;
function g_rand_new: PGRand; cdecl; external libglib2;
procedure g_rand_free(rand_: PGRand); cdecl; external libglib2;
function g_rand_copy(rand_: PGRand): PGRand; cdecl; external libglib2;
procedure g_rand_set_seed(rand_: PGRand; seed: Tguint32); cdecl; external libglib2;
procedure g_rand_set_seed_array(rand_: PGRand; seed: Pguint32; seed_length: Tguint); cdecl; external libglib2;

function g_rand_int(rand_: PGRand): Tguint32; cdecl; external libglib2;
function g_rand_int_range(rand_: PGRand; _begin: Tgint32; _end: Tgint32): Tgint32; cdecl; external libglib2;
function g_rand_double(rand_: PGRand): Tgdouble; cdecl; external libglib2;
function g_rand_double_range(rand_: PGRand; _begin: Tgdouble; _end: Tgdouble): Tgdouble; cdecl; external libglib2;
procedure g_random_set_seed(seed: Tguint32); cdecl; external libglib2;

function g_random_int: Tguint32; cdecl; external libglib2;
function g_random_int_range(_begin: Tgint32; _end: Tgint32): Tgint32; cdecl; external libglib2;
function g_random_double: Tgdouble; cdecl; external libglib2;
function g_random_double_range(_begin: Tgdouble; _end: Tgdouble): Tgdouble; cdecl; external libglib2;

function g_rand_boolean(rand_: PGRand): Tgboolean;
function g_random_boolean: Tgboolean;

// === Konventiert am: 11-8-24 15:34:22 ===


implementation


function g_rand_boolean(rand_: PGRand): Tgboolean;
begin
  g_rand_boolean := ((g_rand_int(rand_)) and (1 shl 15)) <> 0;
end;

function g_random_boolean: Tgboolean;
begin
  g_random_boolean := ((g_random_int) and (1 shl 15)) <> 0;
end;


end.
