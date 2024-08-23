#pragma once

#if (defined(_WIN32) || defined(__CYGWIN__)) && !defined(GDK_STATIC_COMPILATION)
#  define _GDK_EXPORT __declspec(dllexport)
#  define _GDK_IMPORT __declspec(dllimport)
#elif __GNUC__ >= 4
#  define _GDK_EXPORT __attribute__((visibility("default")))
#  define _GDK_IMPORT
#else
#  define _GDK_EXPORT
#  define _GDK_IMPORT
#endif
#ifdef GTK_COMPILATION
#  define _GDK_API _GDK_EXPORT
#else
#  define _GDK_API _GDK_IMPORT
#endif

#define _GDK_EXTERN _GDK_API extern

#define GDK_VAR _GDK_EXTERN
#define  _GDK_EXTERN

#ifdef GDK_DISABLE_DEPRECATION_WARNINGS
#define GDK_DEPRECATED _GDK_EXTERN
#define GDK_DEPRECATED_FOR(f) _GDK_EXTERN
#define GDK_UNAVAILABLE(maj,min) _GDK_EXTERN
#define GDK_UNAVAILABLE_STATIC_INLINE(maj,min)
#else
#define GDK_DEPRECATED G_DEPRECATED _GDK_EXTERN
#define GDK_DEPRECATED_FOR(f) G_DEPRECATED_FOR(f) _GDK_EXTERN
#define GDK_UNAVAILABLE(maj,min) G_UNAVAILABLE(maj,min) _GDK_EXTERN
#define GDK_UNAVAILABLE_STATIC_INLINE(maj,min) G_UNAVAILABLE(maj,min)
#endif

#if GDK_VERSION_MIN_REQUIRED >= GDK_VERSION_4_0
#define GDK_DEPRECATED_IN_4_0 GDK_DEPRECATED
#define GDK_DEPRECATED_IN_4_0_FOR(f) GDK_DEPRECATED_FOR (f)
#define GDK_DEPRECATED_MACRO_IN_4_0 GDK_DEPRECATED_MACRO
#define GDK_DEPRECATED_MACRO_IN_4_0_FOR(f) GDK_DEPRECATED_MACRO_FOR (f)
#define GDK_DEPRECATED_ENUMERATOR_IN_4_0 GDK_DEPRECATED_ENUMERATOR
#define GDK_DEPRECATED_ENUMERATOR_IN_4_0_FOR(f) GDK_DEPRECATED_ENUMERATOR_FOR (f)
#define GDK_DEPRECATED_TYPE_IN_4_0 GDK_DEPRECATED_TYPE
#define GDK_DEPRECATED_TYPE_IN_4_0_FOR(f) GDK_DEPRECATED_TYPE_FOR (f)
#else
#define GDK_DEPRECATED_IN_4_0 _GDK_EXTERN
#define GDK_DEPRECATED_IN_4_0_FOR(f) _GDK_EXTERN
#define GDK_DEPRECATED_MACRO_IN_4_0
#define GDK_DEPRECATED_MACRO_IN_4_0_FOR(f)
#define GDK_DEPRECATED_ENUMERATOR_IN_4_0
#define GDK_DEPRECATED_ENUMERATOR_IN_4_0_FOR(f)
#define GDK_DEPRECATED_TYPE_IN_4_0
#define GDK_DEPRECATED_TYPE_IN_4_0_FOR(f)
#endif

#if GDK_VERSION_MAX_ALLOWED < GDK_VERSION_4_0
#define GDK_AVAILABLE_IN_4_0 GDK_UNAVAILABLE (4, 0)
#define GDK_AVAILABLE_STATIC_INLINE_IN_4_0 GDK_UNAVAILABLE_STATIC_INLINE (4, 0)
#define GDK_AVAILABLE_MACRO_IN_4_0 GDK_UNAVAILABLE_MACRO (4, 0)
#define GDK_AVAILABLE_ENUMERATOR_IN_4_0 GDK_UNAVAILABLE_ENUMERATOR (4, 0)
#define GDK_AVAILABLE_TYPE_IN_4_0 GDK_UNAVAILABLE_TYPE (4, 0)
#else
#define GDK_AVAILABLE_IN_4_0 _GDK_EXTERN
#define GDK_AVAILABLE_STATIC_INLINE_IN_4_0
#define GDK_AVAILABLE_MACRO_IN_4_0
#define GDK_AVAILABLE_ENUMERATOR_IN_4_0
#define GDK_AVAILABLE_TYPE_IN_4_0
#endif

#if GDK_VERSION_MIN_REQUIRED >= GDK_VERSION_4_2
#define GDK_DEPRECATED_IN_4_2 GDK_DEPRECATED
#define GDK_DEPRECATED_IN_4_2_FOR(f) GDK_DEPRECATED_FOR (f)
#define GDK_DEPRECATED_MACRO_IN_4_2 GDK_DEPRECATED_MACRO
#define GDK_DEPRECATED_MACRO_IN_4_2_FOR(f) GDK_DEPRECATED_MACRO_FOR (f)
#define GDK_DEPRECATED_ENUMERATOR_IN_4_2 GDK_DEPRECATED_ENUMERATOR
#define GDK_DEPRECATED_ENUMERATOR_IN_4_2_FOR(f) GDK_DEPRECATED_ENUMERATOR_FOR (f)
#define GDK_DEPRECATED_TYPE_IN_4_2 GDK_DEPRECATED_TYPE
#define GDK_DEPRECATED_TYPE_IN_4_2_FOR(f) GDK_DEPRECATED_TYPE_FOR (f)
#else
#define GDK_DEPRECATED_IN_4_2 _GDK_EXTERN
#define GDK_DEPRECATED_IN_4_2_FOR(f) _GDK_EXTERN
#define GDK_DEPRECATED_MACRO_IN_4_2
#define GDK_DEPRECATED_MACRO_IN_4_2_FOR(f)
#define GDK_DEPRECATED_ENUMERATOR_IN_4_2
#define GDK_DEPRECATED_ENUMERATOR_IN_4_2_FOR(f)
#define GDK_DEPRECATED_TYPE_IN_4_2
#define GDK_DEPRECATED_TYPE_IN_4_2_FOR(f)
#endif

#if GDK_VERSION_MAX_ALLOWED < GDK_VERSION_4_2
#define  GDK_UNAVAILABLE (4, 2)
#define GDK_AVAILABLE_STATIC_INLINE_IN_4_2 GDK_UNAVAILABLE_STATIC_INLINE (4, 2)
#define GDK_AVAILABLE_MACRO_IN_4_2 GDK_UNAVAILABLE_MACRO (4, 2)
#define GDK_AVAILABLE_ENUMERATOR_IN_4_2 GDK_UNAVAILABLE_ENUMERATOR (4, 2)
#define GDK_AVAILABLE_TYPE_IN_4_2 GDK_UNAVAILABLE_TYPE (4, 2)
#else
#define  _GDK_EXTERN
#define GDK_AVAILABLE_STATIC_INLINE_IN_4_2
#define GDK_AVAILABLE_MACRO_IN_4_2
#define GDK_AVAILABLE_ENUMERATOR_IN_4_2
#define GDK_AVAILABLE_TYPE_IN_4_2
#endif

#if GDK_VERSION_MIN_REQUIRED >= GDK_VERSION_4_4
#define GDK_DEPRECATED_IN_4_4 GDK_DEPRECATED
#define GDK_DEPRECATED_IN_4_4_FOR(f) GDK_DEPRECATED_FOR (f)
#define GDK_DEPRECATED_MACRO_IN_4_4 GDK_DEPRECATED_MACRO
#define GDK_DEPRECATED_MACRO_IN_4_4_FOR(f) GDK_DEPRECATED_MACRO_FOR (f)
#define GDK_DEPRECATED_ENUMERATOR_IN_4_4 GDK_DEPRECATED_ENUMERATOR
#define GDK_DEPRECATED_ENUMERATOR_IN_4_4_FOR(f) GDK_DEPRECATED_ENUMERATOR_FOR (f)
#define GDK_DEPRECATED_TYPE_IN_4_4 GDK_DEPRECATED_TYPE
#define GDK_DEPRECATED_TYPE_IN_4_4_FOR(f) GDK_DEPRECATED_TYPE_FOR (f)
#else
#define GDK_DEPRECATED_IN_4_4 _GDK_EXTERN
#define GDK_DEPRECATED_IN_4_4_FOR(f) _GDK_EXTERN
#define GDK_DEPRECATED_MACRO_IN_4_4
#define GDK_DEPRECATED_MACRO_IN_4_4_FOR(f)
#define GDK_DEPRECATED_ENUMERATOR_IN_4_4
#define GDK_DEPRECATED_ENUMERATOR_IN_4_4_FOR(f)
#define GDK_DEPRECATED_TYPE_IN_4_4
#define GDK_DEPRECATED_TYPE_IN_4_4_FOR(f)
#endif

#if GDK_VERSION_MAX_ALLOWED < GDK_VERSION_4_4
#define  GDK_UNAVAILABLE (4, 4)
#define GDK_AVAILABLE_STATIC_INLINE_IN_4_4 GDK_UNAVAILABLE_STATIC_INLINE (4, 4)
#define GDK_AVAILABLE_MACRO_IN_4_4 GDK_UNAVAILABLE_MACRO (4, 4)
#define GDK_AVAILABLE_ENUMERATOR_IN_4_4 GDK_UNAVAILABLE_ENUMERATOR (4, 4)
#define GDK_AVAILABLE_TYPE_IN_4_4 GDK_UNAVAILABLE_TYPE (4, 4)
#else
#define  _GDK_EXTERN
#define GDK_AVAILABLE_STATIC_INLINE_IN_4_4
#define GDK_AVAILABLE_MACRO_IN_4_4
#define GDK_AVAILABLE_ENUMERATOR_IN_4_4
#define GDK_AVAILABLE_TYPE_IN_4_4
#endif

#if GDK_VERSION_MIN_REQUIRED >= GDK_VERSION_4_6
#define GDK_DEPRECATED_IN_4_6 GDK_DEPRECATED
#define GDK_DEPRECATED_IN_4_6_FOR(f) GDK_DEPRECATED_FOR (f)
#define GDK_DEPRECATED_MACRO_IN_4_6 GDK_DEPRECATED_MACRO
#define GDK_DEPRECATED_MACRO_IN_4_6_FOR(f) GDK_DEPRECATED_MACRO_FOR (f)
#define GDK_DEPRECATED_ENUMERATOR_IN_4_6 GDK_DEPRECATED_ENUMERATOR
#define GDK_DEPRECATED_ENUMERATOR_IN_4_6_FOR(f) GDK_DEPRECATED_ENUMERATOR_FOR (f)
#define GDK_DEPRECATED_TYPE_IN_4_6 GDK_DEPRECATED_TYPE
#define GDK_DEPRECATED_TYPE_IN_4_6_FOR(f) GDK_DEPRECATED_TYPE_FOR (f)
#else
#define GDK_DEPRECATED_IN_4_6 _GDK_EXTERN
#define GDK_DEPRECATED_IN_4_6_FOR(f) _GDK_EXTERN
#define GDK_DEPRECATED_MACRO_IN_4_6
#define GDK_DEPRECATED_MACRO_IN_4_6_FOR(f)
#define GDK_DEPRECATED_ENUMERATOR_IN_4_6
#define GDK_DEPRECATED_ENUMERATOR_IN_4_6_FOR(f)
#define GDK_DEPRECATED_TYPE_IN_4_6
#define GDK_DEPRECATED_TYPE_IN_4_6_FOR(f)
#endif

#if GDK_VERSION_MAX_ALLOWED < GDK_VERSION_4_6
#define  GDK_UNAVAILABLE (4, 6)
#define GDK_AVAILABLE_STATIC_INLINE_IN_4_6 GDK_UNAVAILABLE_STATIC_INLINE (4, 6)
#define GDK_AVAILABLE_MACRO_IN_4_6 GDK_UNAVAILABLE_MACRO (4, 6)
#define GDK_AVAILABLE_ENUMERATOR_IN_4_6 GDK_UNAVAILABLE_ENUMERATOR (4, 6)
#define GDK_AVAILABLE_TYPE_IN_4_6 GDK_UNAVAILABLE_TYPE (4, 6)
#else
#define  _GDK_EXTERN
#define GDK_AVAILABLE_STATIC_INLINE_IN_4_6
#define GDK_AVAILABLE_MACRO_IN_4_6
#define GDK_AVAILABLE_ENUMERATOR_IN_4_6
#define GDK_AVAILABLE_TYPE_IN_4_6
#endif

#if GDK_VERSION_MIN_REQUIRED >= GDK_VERSION_4_8
#define GDK_DEPRECATED_IN_4_8 GDK_DEPRECATED
#define GDK_DEPRECATED_IN_4_8_FOR(f) GDK_DEPRECATED_FOR (f)
#define GDK_DEPRECATED_MACRO_IN_4_8 GDK_DEPRECATED_MACRO
#define GDK_DEPRECATED_MACRO_IN_4_8_FOR(f) GDK_DEPRECATED_MACRO_FOR (f)
#define GDK_DEPRECATED_ENUMERATOR_IN_4_8 GDK_DEPRECATED_ENUMERATOR
#define GDK_DEPRECATED_ENUMERATOR_IN_4_8_FOR(f) GDK_DEPRECATED_ENUMERATOR_FOR (f)
#define GDK_DEPRECATED_TYPE_IN_4_8 GDK_DEPRECATED_TYPE
#define GDK_DEPRECATED_TYPE_IN_4_8_FOR(f) GDK_DEPRECATED_TYPE_FOR (f)
#else
#define GDK_DEPRECATED_IN_4_8 _GDK_EXTERN
#define GDK_DEPRECATED_IN_4_8_FOR(f) _GDK_EXTERN
#define GDK_DEPRECATED_MACRO_IN_4_8
#define GDK_DEPRECATED_MACRO_IN_4_8_FOR(f)
#define GDK_DEPRECATED_ENUMERATOR_IN_4_8
#define GDK_DEPRECATED_ENUMERATOR_IN_4_8_FOR(f)
#define GDK_DEPRECATED_TYPE_IN_4_8
#define GDK_DEPRECATED_TYPE_IN_4_8_FOR(f)
#endif

#if GDK_VERSION_MAX_ALLOWED < GDK_VERSION_4_8
#define  GDK_UNAVAILABLE (4, 8)
#define GDK_AVAILABLE_STATIC_INLINE_IN_4_8 GDK_UNAVAILABLE_STATIC_INLINE (4, 8)
#define GDK_AVAILABLE_MACRO_IN_4_8 GDK_UNAVAILABLE_MACRO (4, 8)
#define GDK_AVAILABLE_ENUMERATOR_IN_4_8 GDK_UNAVAILABLE_ENUMERATOR (4, 8)
#define GDK_AVAILABLE_TYPE_IN_4_8 GDK_UNAVAILABLE_TYPE (4, 8)
#else
#define  _GDK_EXTERN
#define GDK_AVAILABLE_STATIC_INLINE_IN_4_8
#define GDK_AVAILABLE_MACRO_IN_4_8
#define GDK_AVAILABLE_ENUMERATOR_IN_4_8
#define GDK_AVAILABLE_TYPE_IN_4_8
#endif

#if GDK_VERSION_MIN_REQUIRED >= GDK_VERSION_4_10
#define  GDK_DEPRECATED
#define _FOR(f) GDK_DEPRECATED_FOR (f)
#define GDK_DEPRECATED_MACRO_IN_4_10 GDK_DEPRECATED_MACRO
#define GDK_DEPRECATED_MACRO_IN_4_10_FOR(f) GDK_DEPRECATED_MACRO_FOR (f)
#define GDK_DEPRECATED_ENUMERATOR_IN_4_10 GDK_DEPRECATED_ENUMERATOR
#define GDK_DEPRECATED_ENUMERATOR_IN_4_10_FOR(f) GDK_DEPRECATED_ENUMERATOR_FOR (f)
#define GDK_DEPRECATED_TYPE_IN_4_10 GDK_DEPRECATED_TYPE
#define GDK_DEPRECATED_TYPE_IN_4_10_FOR(f) GDK_DEPRECATED_TYPE_FOR (f)
#else
#define  _GDK_EXTERN
#define _FOR(f) _GDK_EXTERN
#define GDK_DEPRECATED_MACRO_IN_4_10
#define GDK_DEPRECATED_MACRO_IN_4_10_FOR(f)
#define GDK_DEPRECATED_ENUMERATOR_IN_4_10
#define GDK_DEPRECATED_ENUMERATOR_IN_4_10_FOR(f)
#define GDK_DEPRECATED_TYPE_IN_4_10
#define GDK_DEPRECATED_TYPE_IN_4_10_FOR(f)
#endif

#if GDK_VERSION_MAX_ALLOWED < GDK_VERSION_4_10
#define  GDK_UNAVAILABLE (4, 10)
#define GDK_AVAILABLE_STATIC_INLINE_IN_4_10 GDK_UNAVAILABLE_STATIC_INLINE (4, 10)
#define GDK_AVAILABLE_MACRO_IN_4_10 GDK_UNAVAILABLE_MACRO (4, 10)
#define  GDK_UNAVAILABLE_ENUMERATOR (4, 10)
#define GDK_AVAILABLE_TYPE_IN_4_10 GDK_UNAVAILABLE_TYPE (4, 10)
#else
#define  _GDK_EXTERN
#define GDK_AVAILABLE_STATIC_INLINE_IN_4_10
#define GDK_AVAILABLE_MACRO_IN_4_10
#define 
#define GDK_AVAILABLE_TYPE_IN_4_10
#endif

#if GDK_VERSION_MIN_REQUIRED >= GDK_VERSION_4_12
#define  GDK_DEPRECATED
#define _FOR(f) GDK_DEPRECATED_FOR (f)
#define GDK_DEPRECATED_MACRO_IN_4_12 GDK_DEPRECATED_MACRO
#define GDK_DEPRECATED_MACRO_IN_4_12_FOR(f) GDK_DEPRECATED_MACRO_FOR (f)
#define GDK_DEPRECATED_ENUMERATOR_IN_4_12 GDK_DEPRECATED_ENUMERATOR
#define GDK_DEPRECATED_ENUMERATOR_IN_4_12_FOR(f) GDK_DEPRECATED_ENUMERATOR_FOR (f)
#define GDK_DEPRECATED_TYPE_IN_4_12 GDK_DEPRECATED_TYPE
#define GDK_DEPRECATED_TYPE_IN_4_12_FOR(f) GDK_DEPRECATED_TYPE_FOR (f)
#else
#define  _GDK_EXTERN
#define _FOR(f) _GDK_EXTERN
#define GDK_DEPRECATED_MACRO_IN_4_12
#define GDK_DEPRECATED_MACRO_IN_4_12_FOR(f)
#define GDK_DEPRECATED_ENUMERATOR_IN_4_12
#define GDK_DEPRECATED_ENUMERATOR_IN_4_12_FOR(f)
#define GDK_DEPRECATED_TYPE_IN_4_12
#define GDK_DEPRECATED_TYPE_IN_4_12_FOR(f)
#endif

#if GDK_VERSION_MAX_ALLOWED < GDK_VERSION_4_12
#define  GDK_UNAVAILABLE (4, 12)
#define GDK_AVAILABLE_STATIC_INLINE_IN_4_12 GDK_UNAVAILABLE_STATIC_INLINE (4, 12)
#define GDK_AVAILABLE_MACRO_IN_4_12 GDK_UNAVAILABLE_MACRO (4, 12)
#define  GDK_UNAVAILABLE_ENUMERATOR (4, 12)
#define GDK_AVAILABLE_TYPE_IN_4_12 GDK_UNAVAILABLE_TYPE (4, 12)
#else
#define  _GDK_EXTERN
#define GDK_AVAILABLE_STATIC_INLINE_IN_4_12
#define GDK_AVAILABLE_MACRO_IN_4_12
#define 
#define GDK_AVAILABLE_TYPE_IN_4_12
#endif

#if GDK_VERSION_MIN_REQUIRED >= GDK_VERSION_4_14
#define  GDK_DEPRECATED
#define _FOR(f) GDK_DEPRECATED_FOR (f)
#define GDK_DEPRECATED_MACRO_IN_4_14 GDK_DEPRECATED_MACRO
#define GDK_DEPRECATED_MACRO_IN_4_14_FOR(f) GDK_DEPRECATED_MACRO_FOR (f)
#define GDK_DEPRECATED_ENUMERATOR_IN_4_14 GDK_DEPRECATED_ENUMERATOR
#define GDK_DEPRECATED_ENUMERATOR_IN_4_14_FOR(f) GDK_DEPRECATED_ENUMERATOR_FOR (f)
#define GDK_DEPRECATED_TYPE_IN_4_14 GDK_DEPRECATED_TYPE
#define GDK_DEPRECATED_TYPE_IN_4_14_FOR(f) GDK_DEPRECATED_TYPE_FOR (f)
#else
#define  _GDK_EXTERN
#define _FOR(f) _GDK_EXTERN
#define GDK_DEPRECATED_MACRO_IN_4_14
#define GDK_DEPRECATED_MACRO_IN_4_14_FOR(f)
#define GDK_DEPRECATED_ENUMERATOR_IN_4_14
#define GDK_DEPRECATED_ENUMERATOR_IN_4_14_FOR(f)
#define GDK_DEPRECATED_TYPE_IN_4_14
#define GDK_DEPRECATED_TYPE_IN_4_14_FOR(f)
#endif

#if GDK_VERSION_MAX_ALLOWED < GDK_VERSION_4_14
#define  GDK_UNAVAILABLE (4, 14)
#define GDK_AVAILABLE_STATIC_INLINE_IN_4_14 GDK_UNAVAILABLE_STATIC_INLINE (4, 14)
#define GDK_AVAILABLE_MACRO_IN_4_14 GDK_UNAVAILABLE_MACRO (4, 14)
#define  GDK_UNAVAILABLE_ENUMERATOR (4, 14)
#define GDK_AVAILABLE_TYPE_IN_4_14 GDK_UNAVAILABLE_TYPE (4, 14)
#else
#define  _GDK_EXTERN
#define GDK_AVAILABLE_STATIC_INLINE_IN_4_14
#define GDK_AVAILABLE_MACRO_IN_4_14
#define 
#define GDK_AVAILABLE_TYPE_IN_4_14
#endif
