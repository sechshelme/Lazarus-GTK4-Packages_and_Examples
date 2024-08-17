unit gtimezone;

interface

uses
  common_GLIB, gtypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type

  PGTimeType = ^TGTimeType;
  TGTimeType = longint;

const
  G_TIME_TYPE_STANDARD = 0;
  G_TIME_TYPE_DAYLIGHT = 1;
  G_TIME_TYPE_UNIVERSAL = 2;

type
  TGTimeZone = record
  end;
  PGTimeZone = ^TGTimeZone;

function g_time_zone_new(identifier: Pgchar): PGTimeZone; cdecl; external libglib2;
function g_time_zone_new_identifier(identifier: Pgchar): PGTimeZone; cdecl; external libglib2;
function g_time_zone_new_utc: PGTimeZone; cdecl; external libglib2;
function g_time_zone_new_local: PGTimeZone; cdecl; external libglib2;
function g_time_zone_new_offset(seconds: Tgint32): PGTimeZone; cdecl; external libglib2;
function g_time_zone_ref(tz: PGTimeZone): PGTimeZone; cdecl; external libglib2;
procedure g_time_zone_unref(tz: PGTimeZone); cdecl; external libglib2;
function g_time_zone_find_interval(tz: PGTimeZone; _type: TGTimeType; time_: Tgint64): Tgint; cdecl; external libglib2;
function g_time_zone_adjust_time(tz: PGTimeZone; _type: TGTimeType; time_: Pgint64): Tgint; cdecl; external libglib2;
function g_time_zone_get_abbreviation(tz: PGTimeZone; interval: Tgint): Pgchar; cdecl; external libglib2;
function g_time_zone_get_offset(tz: PGTimeZone; interval: Tgint): Tgint32; cdecl; external libglib2;
function g_time_zone_is_dst(tz: PGTimeZone; interval: Tgint): Tgboolean; cdecl; external libglib2;
function g_time_zone_get_identifier(tz: PGTimeZone): Pgchar; cdecl; external libglib2;

// === Konventiert am: 7-8-24 15:54:15 ===


implementation



end.
