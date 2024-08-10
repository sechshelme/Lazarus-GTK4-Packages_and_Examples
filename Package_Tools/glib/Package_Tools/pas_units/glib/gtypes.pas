unit gtypes;

interface

uses
  ctypes, common_GLIB;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PPPgchar = ^PPgchar;
  PPgchar = ^Pgchar;
  Pgchar = ^Tgchar;
  Tgchar = char;

  Pgshort = ^Tgshort;
  Tgshort = smallint;

  Pglong = ^Tglong;
  Tglong = longint;

  Pgint = ^Tgint;
  Tgint = longint;

  Pgboolean = ^Tgboolean;
  //  Tgboolean = Tgint;
  Tgboolean = Boolean32;

  Pguchar = ^Tguchar;
  Tguchar = byte;

  Pgushort = ^Tgushort;
  Tgushort = word;

  Pgulong = ^Tgulong;
  Tgulong = dword;

  Pguint = ^Tguint;
  Tguint = cuint;

  Pgfloat = ^Tgfloat;
  Tgfloat = single;

  Pgdouble = ^Tgdouble;
  Tgdouble = Tdouble;

  Pgpointer = ^Tgpointer;
  Tgpointer = pointer;

  Pgconstpointer = ^Tgconstpointer;
  Tgconstpointer = pointer;

  TGCompareFunc = function(a: Tgconstpointer; b: Tgconstpointer): Tgint; cdecl;
  TGCompareDataFunc = function(a: Tgconstpointer; b: Tgconstpointer; user_data: Tgpointer): Tgint; cdecl;
  TGEqualFunc = function(a: Tgconstpointer; b: Tgconstpointer): Tgboolean; cdecl;
  TGEqualFuncFull = function(a: Tgconstpointer; b: Tgconstpointer; user_data: Tgpointer): Tgboolean; cdecl;
  TGDestroyNotify = procedure(Data: Tgpointer); cdecl;
  PGDestroyNotify = ^TGDestroyNotify;
  TGFunc = procedure(Data: Tgpointer; user_data: Tgpointer); cdecl;
  TGHashFunc = function(key: Tgconstpointer): Tguint; cdecl;
  TGHFunc = procedure(key: Tgpointer; Value: Tgpointer; user_data: Tgpointer); cdecl;
  TGCopyFunc = function(src: Tgconstpointer; Data: Tgpointer): Tgpointer; cdecl;
  TGFreeFunc = procedure(Data: Tgpointer); cdecl;
  TGTranslateFunc = function(str: Pgchar; Data: Tgpointer): Pgchar; cdecl;
  PGTranslateFunc = ^TGTranslateFunc;

const
  G_E = 2.7182818284590452353602874713526624977572470937000;
  G_LN2 = 0.69314718055994530941723212145817656807550013436026;
  G_LN10 = 2.3025850929940456840179914546843642076011014886288;
  G_PI = 3.1415926535897932384626433832795028841971693993751;
  G_PI_2 = 1.5707963267948966192313216916397514420985846996876;
  G_PI_4 = 0.78539816339744830961566084581987572104929234984378;
  G_SQRT2 = 1.4142135623730950488016887242096980785696718753769;

  G_LITTLE_ENDIAN = 1234;
  G_BIG_ENDIAN = 4321;


const
  G_IEEE754_FLOAT_BIAS = 127;
  G_IEEE754_DOUBLE_BIAS = 1023;
  G_LOG_2_BASE_10 = 0.30102999566398119521;

type
  PGFloatIEEE754 = ^TGFloatIEEE754;
  TGFloatIEEE754 = record
    case longint of
      0: (v_float: Tgfloat);
      1: (mpn: record
          flag0: longint;
          end);
  end;


const
  bm_TGFloatIEEE754_mantissa = $7FFFFF;
  bp_TGFloatIEEE754_mantissa = 0;
  bm_TGFloatIEEE754_biased_exponent = $7F800000;
  bp_TGFloatIEEE754_biased_exponent = 23;
  bm_TGFloatIEEE754_sign = $80000000;
  bp_TGFloatIEEE754_sign = 31;

type
  PGDoubleIEEE754 = ^TGDoubleIEEE754;
  TGDoubleIEEE754 = record
    case longint of
      0: (v_double: Tgdouble);
      1: (mpn: record
          flag0: longint;
          flag1: longint;
          end);
  end;


const
  bm_TGDoubleIEEE754_mantissa_low = $FFFFFFFF;
  bp_TGDoubleIEEE754_mantissa_low = 0;
  bm_TGDoubleIEEE754_mantissa_high = $FFFFF;
  bp_TGDoubleIEEE754_mantissa_high = 0;
  bm_TGDoubleIEEE754_biased_exponent = $7FF00000;
  bp_TGDoubleIEEE754_biased_exponent = 20;
  bm_TGDoubleIEEE754_sign = $80000000;
  bp_TGDoubleIEEE754_sign = 31;

type
  PGTimeVal = ^TGTimeVal;

  TGTimeVal = record
    tv_sec: Tglong;
    tv_usec: Tglong;
  end;

  Tgrefcount = Tgint;
  Pgrefcount = ^Tgrefcount;

  Tgatomicrefcount = Tgint;
  Pgatomicrefcount = ^Tgatomicrefcount;




  // === Konventiert am: 6-8-24 15:51:59 ===

function GUINT16_SWAP_LE_BE_CONSTANT(val: Tguint16): Tguint16;
function GUINT32_SWAP_LE_BE_CONSTANT(val: Tguint32): Tguint32;
function GUINT64_SWAP_LE_BE_CONSTANT(val: Tguint64): Tguint64;


implementation

function GUINT16_SWAP_LE_BE_CONSTANT(val: Tguint16): Tguint16;
begin
  Result := ((val and $ff) shl 8) or ((val and $ff00) shr 8);
end;

function GUINT32_SWAP_LE_BE_CONSTANT(val: Tguint32): Tguint32;
begin
  Result :=
    ((val and $000000ff) shl 24) or
    ((val and $0000ff00) shl 8) or
    ((val and $00ff0000) shr 8) or
    ((val and $ff000000) shr 24);
end;

function GUINT64_SWAP_LE_BE_CONSTANT(val: Tguint64): Tguint64;
begin
  Result :=
    ((val and $00000000000000ff) shl 56) or
    ((val and $000000000000ff00) shl 40) or
    ((val and $0000000000ff0000) shl 24) or
    ((val and $00000000ff000000) shl 8) or

    ((val and $00000000000000ff00000000) shr 8) or
    ((val and $000000000000ff0000000000) shr 24) or
    ((val and $0000000000ff000000000000) shr 40) or
    ((val and $00000000ff00000000000000) shr 56);
end;

end.
