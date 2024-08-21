/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

function G_TIME_SPAN_DAY: int64;
function G_TIME_SPAN_HOUR: int64;
function G_TIME_SPAN_MINUTE: int64;
function G_TIME_SPAN_SECOND: int64;
function G_TIME_SPAN_MILLISECOND: int64;

type
  PGTimeSpan = ^TGTimeSpan;
  TGTimeSpan = Tgint64;

  TGDateTime = record
  end;
  PGDateTime = ^TGDateTime;
  PPGDateTime = ^PGDateTime;

procedure g_date_time_unref(datetime: PGDateTime); cdecl; external libglib2;
function g_date_time_ref(datetime: PGDateTime): PGDateTime; cdecl; external libglib2;
function g_date_time_new_now(tz: PGTimeZone): PGDateTime; cdecl; external libglib2;
function g_date_time_new_now_local: PGDateTime; cdecl; external libglib2;
function g_date_time_new_now_utc: PGDateTime; cdecl; external libglib2;
function g_date_time_new_from_unix_local(t: Tgint64): PGDateTime; cdecl; external libglib2;
function g_date_time_new_from_unix_utc(t: Tgint64): PGDateTime; cdecl; external libglib2;
function g_date_time_new_from_unix_local_usec(usecs: Tgint64): PGDateTime; cdecl; external libglib2;
function g_date_time_new_from_unix_utc_usec(usecs: Tgint64): PGDateTime; cdecl; external libglib2;
function g_date_time_new_from_timeval_local(tv: PGTimeVal): PGDateTime; cdecl; external libglib2;
function g_date_time_new_from_timeval_utc(tv: PGTimeVal): PGDateTime; cdecl; external libglib2;
function g_date_time_new_from_iso8601(Text: Pgchar; default_tz: PGTimeZone): PGDateTime; cdecl; external libglib2;
function g_date_time_new(tz: PGTimeZone; year: Tgint; month: Tgint; day: Tgint; hour: Tgint;
  minute: Tgint; seconds: Tgdouble): PGDateTime; cdecl; external libglib2;
function g_date_time_new_local(year: Tgint; month: Tgint; day: Tgint; hour: Tgint; minute: Tgint;
  seconds: Tgdouble): PGDateTime; cdecl; external libglib2;
function g_date_time_new_utc(year: Tgint; month: Tgint; day: Tgint; hour: Tgint; minute: Tgint;
  seconds: Tgdouble): PGDateTime; cdecl; external libglib2;
function g_date_time_add(datetime: PGDateTime; timespan: TGTimeSpan): PGDateTime; cdecl; external libglib2;
function g_date_time_add_years(datetime: PGDateTime; years: Tgint): PGDateTime; cdecl; external libglib2;
function g_date_time_add_months(datetime: PGDateTime; months: Tgint): PGDateTime; cdecl; external libglib2;
function g_date_time_add_weeks(datetime: PGDateTime; weeks: Tgint): PGDateTime; cdecl; external libglib2;
function g_date_time_add_days(datetime: PGDateTime; days: Tgint): PGDateTime; cdecl; external libglib2;
function g_date_time_add_hours(datetime: PGDateTime; hours: Tgint): PGDateTime; cdecl; external libglib2;
function g_date_time_add_minutes(datetime: PGDateTime; minutes: Tgint): PGDateTime; cdecl; external libglib2;
function g_date_time_add_seconds(datetime: PGDateTime; seconds: Tgdouble): PGDateTime; cdecl; external libglib2;
function g_date_time_add_full(datetime: PGDateTime; years: Tgint; months: Tgint; days: Tgint; hours: Tgint;
  minutes: Tgint; seconds: Tgdouble): PGDateTime; cdecl; external libglib2;
function g_date_time_compare(dt1: Tgconstpointer; dt2: Tgconstpointer): Tgint; cdecl; external libglib2;
function g_date_time_difference(_end: PGDateTime; _begin: PGDateTime): TGTimeSpan; cdecl; external libglib2;
function g_date_time_hash(datetime: Tgconstpointer): Tguint; cdecl; external libglib2;
function g_date_time_equal(dt1: Tgconstpointer; dt2: Tgconstpointer): Tgboolean; cdecl; external libglib2;
procedure g_date_time_get_ymd(datetime: PGDateTime; year: Pgint; month: Pgint; day: Pgint); cdecl; external libglib2;
function g_date_time_get_year(datetime: PGDateTime): Tgint; cdecl; external libglib2;
function g_date_time_get_month(datetime: PGDateTime): Tgint; cdecl; external libglib2;
function g_date_time_get_day_of_month(datetime: PGDateTime): Tgint; cdecl; external libglib2;
function g_date_time_get_week_numbering_year(datetime: PGDateTime): Tgint; cdecl; external libglib2;
function g_date_time_get_week_of_year(datetime: PGDateTime): Tgint; cdecl; external libglib2;
function g_date_time_get_day_of_week(datetime: PGDateTime): Tgint; cdecl; external libglib2;
function g_date_time_get_day_of_year(datetime: PGDateTime): Tgint; cdecl; external libglib2;
function g_date_time_get_hour(datetime: PGDateTime): Tgint; cdecl; external libglib2;
function g_date_time_get_minute(datetime: PGDateTime): Tgint; cdecl; external libglib2;
function g_date_time_get_second(datetime: PGDateTime): Tgint; cdecl; external libglib2;
function g_date_time_get_microsecond(datetime: PGDateTime): Tgint; cdecl; external libglib2;
function g_date_time_get_seconds(datetime: PGDateTime): Tgdouble; cdecl; external libglib2;
function g_date_time_to_unix(datetime: PGDateTime): Tgint64; cdecl; external libglib2;
function g_date_time_to_unix_usec(datetime: PGDateTime): Tgint64; cdecl; external libglib2;
function g_date_time_to_timeval(datetime: PGDateTime; tv: PGTimeVal): Tgboolean; cdecl; external libglib2;
function g_date_time_get_utc_offset(datetime: PGDateTime): TGTimeSpan; cdecl; external libglib2;
function g_date_time_get_timezone(datetime: PGDateTime): PGTimeZone; cdecl; external libglib2;
function g_date_time_get_timezone_abbreviation(datetime: PGDateTime): Pgchar; cdecl; external libglib2;
function g_date_time_is_daylight_savings(datetime: PGDateTime): Tgboolean; cdecl; external libglib2;
function g_date_time_to_timezone(datetime: PGDateTime; tz: PGTimeZone): PGDateTime; cdecl; external libglib2;
function g_date_time_to_local(datetime: PGDateTime): PGDateTime; cdecl; external libglib2;
function g_date_time_to_utc(datetime: PGDateTime): PGDateTime; cdecl; external libglib2;
function g_date_time_format(datetime: PGDateTime; format: Pgchar): Pgchar; cdecl; external libglib2;
function g_date_time_format_iso8601(datetime: PGDateTime): Pgchar; cdecl; external libglib2;

// === Konventiert am: 7-8-24 15:48:09 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_TIME_SPAN_DAY: int64;
begin
  G_TIME_SPAN_DAY := 86400000000;
end;

function G_TIME_SPAN_HOUR: int64;
begin
  G_TIME_SPAN_HOUR := 3600000000;
end;

function G_TIME_SPAN_MINUTE: int64;
begin
  G_TIME_SPAN_MINUTE := 60000000;
end;

function G_TIME_SPAN_SECOND: int64;
begin
  G_TIME_SPAN_SECOND := 1000000;
end;

function G_TIME_SPAN_MILLISECOND: int64;
begin
  G_TIME_SPAN_MILLISECOND := 1000;
end;


{$ENDIF read_implementation}
