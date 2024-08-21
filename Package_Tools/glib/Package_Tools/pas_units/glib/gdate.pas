unit gdate;

interface

uses
  common_GLIB, gtypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

type
  PGTime = ^TGTime;
  TGTime = Tgint32;

  PGDateYear = ^TGDateYear;
  TGDateYear = Tguint16;

  PGDateDay = ^TGDateDay;
  TGDateDay = Tguint8;

  PGDateDMY = ^TGDateDMY;
  TGDateDMY =  Longint;
  Const
    G_DATE_DAY = 0;
    G_DATE_MONTH = 1;
    G_DATE_YEAR = 2;
type
  PGDateWeekday = ^TGDateWeekday;
  TGDateWeekday =  Longint;
  Const
    G_DATE_BAD_WEEKDAY = 0;
    G_DATE_MONDAY = 1;
    G_DATE_TUESDAY = 2;
    G_DATE_WEDNESDAY = 3;
    G_DATE_THURSDAY = 4;
    G_DATE_FRIDAY = 5;
    G_DATE_SATURDAY = 6;
    G_DATE_SUNDAY = 7;

type
  PGDateMonth = ^TGDateMonth;
  TGDateMonth =  Longint;
  Const
    G_DATE_BAD_MONTH = 0;
    G_DATE_JANUARY = 1;
    G_DATE_FEBRUARY = 2;
    G_DATE_MARCH = 3;
    G_DATE_APRIL = 4;
    G_DATE_MAY = 5;
    G_DATE_JUNE = 6;
    G_DATE_JULY = 7;
    G_DATE_AUGUST = 8;
    G_DATE_SEPTEMBER = 9;
    G_DATE_OCTOBER = 10;
    G_DATE_NOVEMBER = 11;
    G_DATE_DECEMBER = 12;

  G_DATE_BAD_JULIAN = 0;  
  G_DATE_BAD_DAY = 0;  
  G_DATE_BAD_YEAR = 0;  


   //struct _GDate
   //{
   //  guint julian_days : 32; /* julian days representation - we use a
   //                           *  bitfield hoping that 64 bit platforms
   //                           *  will pack this whole struct in one big
   //                           *  int
   //                           */
   //
   //  guint julian : 1;    /* julian is valid */
   //  guint dmy    : 1;    /* dmy is valid */
   //
   //  /* DMY representation */
   //  guint day    : 6;
   //  guint month  : 4;
   //  guint year   : 16;
   //};

type
  TGDate = bitpacked record
    julian_days: Tguint32;
    julian: 0..1;
    dmy: 0..1;
    day: 0..63;
    month: 0..15;
    year: 0..65535;
  end;
  PGDate=^TGDate;

function g_date_new:PGDate;cdecl;external libglib2;
function g_date_new_dmy(day:TGDateDay; month:TGDateMonth; year:TGDateYear):PGDate;cdecl;external libglib2;
function g_date_new_julian(julian_day:Tguint32):PGDate;cdecl;external libglib2;
procedure g_date_free(date:PGDate);cdecl;external libglib2;
function g_date_copy(date:PGDate):PGDate;cdecl;external libglib2;
function g_date_valid(date:PGDate):Tgboolean;cdecl;external libglib2;
function g_date_valid_day(day:TGDateDay):Tgboolean;cdecl;external libglib2;
function g_date_valid_month(month:TGDateMonth):Tgboolean;cdecl;external libglib2;
function g_date_valid_year(year:TGDateYear):Tgboolean;cdecl;external libglib2;
function g_date_valid_weekday(weekday:TGDateWeekday):Tgboolean;cdecl;external libglib2;
function g_date_valid_julian(julian_date:Tguint32):Tgboolean;cdecl;external libglib2;
function g_date_valid_dmy(day:TGDateDay; month:TGDateMonth; year:TGDateYear):Tgboolean;cdecl;external libglib2;
function g_date_get_weekday(date:PGDate):TGDateWeekday;cdecl;external libglib2;
function g_date_get_month(date:PGDate):TGDateMonth;cdecl;external libglib2;
function g_date_get_year(date:PGDate):TGDateYear;cdecl;external libglib2;
function g_date_get_day(date:PGDate):TGDateDay;cdecl;external libglib2;
function g_date_get_julian(date:PGDate):Tguint32;cdecl;external libglib2;
function g_date_get_day_of_year(date:PGDate):Tguint;cdecl;external libglib2;
function g_date_get_monday_week_of_year(date:PGDate):Tguint;cdecl;external libglib2;
function g_date_get_sunday_week_of_year(date:PGDate):Tguint;cdecl;external libglib2;
function g_date_get_iso8601_week_of_year(date:PGDate):Tguint;cdecl;external libglib2;
procedure g_date_clear(date:PGDate; n_dates:Tguint);cdecl;external libglib2;
procedure g_date_set_parse(date:PGDate; str:Pgchar);cdecl;external libglib2;
procedure g_date_set_time_t(date:PGDate; timet:Ttime_t);cdecl;external libglib2;
procedure g_date_set_time_val(date:PGDate; timeval:PGTimeVal);cdecl;external libglib2;
procedure g_date_set_time(date:PGDate; time_:TGTime);cdecl;external libglib2;
procedure g_date_set_month(date:PGDate; month:TGDateMonth);cdecl;external libglib2;
procedure g_date_set_day(date:PGDate; day:TGDateDay);cdecl;external libglib2;
procedure g_date_set_year(date:PGDate; year:TGDateYear);cdecl;external libglib2;
procedure g_date_set_dmy(date:PGDate; day:TGDateDay; month:TGDateMonth; y:TGDateYear);cdecl;external libglib2;
procedure g_date_set_julian(date:PGDate; julian_date:Tguint32);cdecl;external libglib2;
function g_date_is_first_of_month(date:PGDate):Tgboolean;cdecl;external libglib2;
function g_date_is_last_of_month(date:PGDate):Tgboolean;cdecl;external libglib2;
procedure g_date_add_days(date:PGDate; n_days:Tguint);cdecl;external libglib2;
procedure g_date_subtract_days(date:PGDate; n_days:Tguint);cdecl;external libglib2;
procedure g_date_add_months(date:PGDate; n_months:Tguint);cdecl;external libglib2;
procedure g_date_subtract_months(date:PGDate; n_months:Tguint);cdecl;external libglib2;
procedure g_date_add_years(date:PGDate; n_years:Tguint);cdecl;external libglib2;
procedure g_date_subtract_years(date:PGDate; n_years:Tguint);cdecl;external libglib2;
function g_date_is_leap_year(year:TGDateYear):Tgboolean;cdecl;external libglib2;
function g_date_get_days_in_month(month:TGDateMonth; year:TGDateYear):Tguint8;cdecl;external libglib2;
function g_date_get_monday_weeks_in_year(year:TGDateYear):Tguint8;cdecl;external libglib2;
function g_date_get_sunday_weeks_in_year(year:TGDateYear):Tguint8;cdecl;external libglib2;
function g_date_days_between(date1:PGDate; date2:PGDate):Tgint;cdecl;external libglib2;
function g_date_compare(lhs:PGDate; rhs:PGDate):Tgint;cdecl;external libglib2;
procedure g_date_to_struct_tm(date:PGDate; tm:Ptm);cdecl;external libglib2;
procedure g_date_clamp(date:PGDate; min_date:PGDate; max_date:PGDate);cdecl;external libglib2;
procedure g_date_order(date1:PGDate; date2:PGDate);cdecl;external libglib2;
function g_date_strftime(s:Pgchar; slen:Tgsize; format:Pgchar; date:PGDate):Tgsize;cdecl;external libglib2;

//   GLIB_DEPRECATED_MACRO_IN_2_26_FOR
//const
//  g_date_weekday = g_date_get_weekday;  
//  g_date_month = g_date_get_month;  
//  g_date_year = g_date_get_year;  
//  g_date_day = g_date_get_day;  
//  g_date_julian = g_date_get_julian;  
//  g_date_day_of_year = g_date_get_day_of_year;  
//  g_date_monday_week_of_year = g_date_get_monday_week_of_year;  
//  g_date_sunday_week_of_year = g_date_get_sunday_week_of_year;  
//  g_date_days_in_month = g_date_get_days_in_month;  
//  g_date_monday_weeks_in_year = g_date_get_monday_weeks_in_year;  
//  g_date_sunday_weeks_in_year = g_date_get_sunday_weeks_in_year;  

// === Konventiert am: 9-8-24 16:09:40 ===


implementation


end.
