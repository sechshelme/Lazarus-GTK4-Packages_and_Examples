/* GLIB - Library of useful routines for C programming
 * Copyright (C) 1995-1997  Peter Mattis, Spencer Kimball and Josh MacDonald
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, see <http://www.gnu.org/licenses/>.
 */

/*
 * Modified by the GLib Team and others 1997-2000.  See the AUTHORS
 * file for a list of people on the GLib Team.  See the ChangeLog
 * files for a list of changes.  These files are distributed with
 * GLib at ftp://ftp.gtk.org/pub/gtk/.
 */

#ifndef __G_MESSAGES_H__
#define __G_MESSAGES_H__

#if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)
#error "Only <glib.h> can be included directly."
#endif

#include <stdarg.h>
#include <glib/gatomic.h>
#include <glib/gtypes.h>
#include <glib/gmacros.h>
#include <glib/gvariant.h>



/* calculate a string size, guaranteed to fit format + args.
 */

gsize	g_printf_string_upper_bound (const gchar* format,
				     va_list	  args) ;

/* Log level shift offset for user defined
 * log levels (0-7 are used by GLib).
 */
#define G_LOG_LEVEL_USER_SHIFT  (8)

/* Glib log levels and flags.
 */
typedef enum
{
  /* log flags */
  G_LOG_FLAG_RECURSION          = 1 << 0,
  G_LOG_FLAG_FATAL              = 1 << 1,

  /* GLib log levels */
  G_LOG_LEVEL_ERROR             = 1 << 2,       /* always fatal */
  G_LOG_LEVEL_CRITICAL          = 1 << 3,
  G_LOG_LEVEL_WARNING           = 1 << 4,
  G_LOG_LEVEL_MESSAGE           = 1 << 5,
  G_LOG_LEVEL_INFO              = 1 << 6,
  G_LOG_LEVEL_DEBUG             = 1 << 7,

  G_LOG_LEVEL_MASK              = ~(G_LOG_FLAG_RECURSION | G_LOG_FLAG_FATAL)
} GLogLevelFlags;

/* GLib log levels that are considered fatal by default */
#define G_LOG_FATAL_MASK        (G_LOG_FLAG_RECURSION | G_LOG_LEVEL_ERROR)

typedef void            (*GLogFunc)             (const gchar   *log_domain,
                                                 GLogLevelFlags log_level,
                                                 const gchar   *message,
                                                 gpointer       user_data);

/* Logging mechanism
 */

guint           g_log_set_handler       (const gchar    *log_domain,
                                         GLogLevelFlags  log_levels,
                                         GLogFunc        log_func,
                                         gpointer        user_data);

guint           g_log_set_handler_full  (const gchar    *log_domain,
                                         GLogLevelFlags  log_levels,
                                         GLogFunc        log_func,
                                         gpointer        user_data,
                                         GDestroyNotify  destroy);

void            g_log_remove_handler    (const gchar    *log_domain,
                                         guint           handler_id);

void            g_log_default_handler   (const gchar    *log_domain,
                                         GLogLevelFlags  log_level,
                                         const gchar    *message,
                                         gpointer        unused_data);

GLogFunc        g_log_set_default_handler (GLogFunc      log_func,
					   gpointer      user_data);

void            g_log                   (const gchar    *log_domain,
                                         GLogLevelFlags  log_level,
                                         const gchar    *format,
                                         ...);

void            g_logv                  (const gchar    *log_domain,
                                         GLogLevelFlags  log_level,
                                         const gchar    *format,
                                         va_list         args) ;

GLogLevelFlags  g_log_set_fatal_mask    (const gchar    *log_domain,
                                         GLogLevelFlags  fatal_mask);

GLogLevelFlags  g_log_set_always_fatal  (GLogLevelFlags  fatal_mask);

/* Structured logging mechanism. */

/**
 * GLogWriterOutput:
 * @G_LOG_WRITER_HANDLED: Log writer has handled the log entry.
 * @G_LOG_WRITER_UNHANDLED: Log writer could not handle the log entry.
 *
 * Return values from #GLogWriterFuncs to indicate whether the given log entry
 * was successfully handled by the writer, or whether there was an error in
 * handling it (and hence a fallback writer should be used).
 *
 * If a #GLogWriterFunc ignores a log entry, it should return
 * %G_LOG_WRITER_HANDLED.
 *
 * Since: 2.50
 */
typedef enum
{
  G_LOG_WRITER_HANDLED = 1,
  G_LOG_WRITER_UNHANDLED = 0,
} GLogWriterOutput;

/**
 * GLogField:
 * @key: field name (UTF-8 string)
 * @value: field value (arbitrary bytes)
 * @length: length of @value, in bytes, or -1 if it is nul-terminated
 *
 * Structure representing a single field in a structured log entry. See
 * g_log_structured() for details.
 *
 * Log fields may contain arbitrary values, including binary with embedded nul
 * bytes. If the field contains a string, the string must be UTF-8 encoded and
 * have a trailing nul byte. Otherwise, @length must be set to a non-negative
 * value.
 *
 * Since: 2.50
 */
typedef struct _GLogField GLogField;
struct _GLogField
{
  const gchar *key;
  gconstpointer value;
  gssize length;
};

/**
 * GLogWriterFunc:
 * @log_level: log level of the message
 * @fields: (array length=n_fields): fields forming the message
 * @n_fields: number of @fields
 * @user_data: user data passed to g_log_set_writer_func()
 *
 * Writer function for log entries. A log entry is a collection of one or more
 * #GLogFields, using the standard [field names from journal
 * specification](https://www.freedesktop.org/software/systemd/man/systemd.journal-fields.html).
 * See g_log_structured() for more information.
 *
 * Writer functions must ignore fields which they do not recognise, unless they
 * can write arbitrary binary output, as field values may be arbitrary binary.
 *
 * @log_level is guaranteed to be included in @fields as the `PRIORITY` field,
 * but is provided separately for convenience of deciding whether or where to
 * output the log entry.
 *
 * Writer functions should return %G_LOG_WRITER_HANDLED if they handled the log
 * message successfully or if they deliberately ignored it. If there was an
 * error handling the message (for example, if the writer function is meant to
 * send messages to a remote logging server and there is a network error), it
 * should return %G_LOG_WRITER_UNHANDLED. This allows writer functions to be
 * chained and fall back to simpler handlers in case of failure.
 *
 * Returns: %G_LOG_WRITER_HANDLED if the log entry was handled successfully;
 *   %G_LOG_WRITER_UNHANDLED otherwise
 *
 * Since: 2.50
 */
typedef GLogWriterOutput (*GLogWriterFunc)     (GLogLevelFlags   log_level,
                                                const GLogField *fields,
                                                gsize            n_fields,
                                                gpointer         user_data);


void             g_log_structured              (const gchar     *log_domain,
                                                GLogLevelFlags   log_level,
                                                ...);

void             g_log_structured_array        (GLogLevelFlags   log_level,
                                                const GLogField *fields,
                                                gsize            n_fields);


void             g_log_variant                 (const gchar     *log_domain,
                                                GLogLevelFlags   log_level,
                                                GVariant        *fields);


void             g_log_set_writer_func         (GLogWriterFunc   func,
                                                gpointer         user_data,
                                                GDestroyNotify   user_data_free);


gboolean         g_log_writer_supports_color   (gint             output_fd);

gboolean         g_log_writer_is_journald      (gint             output_fd);


gchar           *g_log_writer_format_fields    (GLogLevelFlags   log_level,
                                                const GLogField *fields,
                                                gsize            n_fields,
                                                gboolean         use_color);


GLogWriterOutput g_log_writer_syslog           (GLogLevelFlags   log_level,
                                                const GLogField *fields,
                                                gsize            n_fields,
                                                gpointer         user_data);

GLogWriterOutput g_log_writer_journald         (GLogLevelFlags   log_level,
                                                const GLogField *fields,
                                                gsize            n_fields,
                                                gpointer         user_data);

GLogWriterOutput g_log_writer_standard_streams (GLogLevelFlags   log_level,
                                                const GLogField *fields,
                                                gsize            n_fields,
                                                gpointer         user_data);

GLogWriterOutput g_log_writer_default          (GLogLevelFlags   log_level,
                                                const GLogField *fields,
                                                gsize            n_fields,
                                                gpointer         user_data);


void            g_log_writer_default_set_use_stderr (gboolean use_stderr);

gboolean        g_log_writer_default_would_drop (GLogLevelFlags  log_level,
                                                 const char     *log_domain);

void            g_log_writer_default_set_debug_domains (const gchar * const *domains);


/* G_MESSAGES_DEBUG enablement */

gboolean         g_log_get_debug_enabled       (void);

void             g_log_set_debug_enabled       (gboolean         enabled);

/**
 * G_DEBUG_HERE:
 *
 * A convenience form of g_log_structured(), recommended to be added to
 * functions when debugging. It prints the current monotonic time and the code
 * location using %G_STRLOC.
 *
 * Since: 2.50
 */
/*
#define G_DEBUG_HERE()                                          \
  g_log_structured (G_LOG_DOMAIN, G_LOG_LEVEL_DEBUG,            \
                    "CODE_FILE", __FILE__,                      \
                    "CODE_LINE", G_STRINGIFY (__LINE__),        \
                    "CODE_FUNC", G_STRFUNC,                      \
                    "MESSAGE", "%" G_GINT64_FORMAT ": %s",      \
                    g_get_monotonic_time (), G_STRLOC)
*/

/* internal */
void	_g_log_fallback_handler	(const gchar   *log_domain,
						 GLogLevelFlags log_level,
						 const gchar   *message,
						 gpointer       unused_data);

/* Internal functions, used to implement the following macros */

void g_return_if_fail_warning (const char *log_domain,
			       const char *pretty_function,
			       const char *expression);

void g_warn_message           (const char     *domain,
                               const char     *file,
                               int             line,
                               const char     *func,
                               const char     *warnexpr) ;

void g_assert_warning         (const char *log_domain,
			       const char *file,
			       const int   line,
		               const char *pretty_function,
		               const char *expression);


void g_log_structured_standard (const gchar    *log_domain,
                                GLogLevelFlags  log_level,
                                const gchar    *file,
                                const gchar    *line,
                                const gchar    *func,
                                const gchar    *message_format,
                                ...) ;

/*
#ifndef G_LOG_DOMAIN
#define G_LOG_DOMAIN    ((gchar*) 0)
#endif 

#if defined(G_HAVE_ISO_VARARGS) && !G_ANALYZER_ANALYZING
#if defined(G_LOG_USE_STRUCTURED) && GLIB_VERSION_MAX_ALLOWED >= GLIB_VERSION_2_56
#define g_error(...)  G_STMT_START {                                            \
                        g_log_structured_standard (G_LOG_DOMAIN, G_LOG_LEVEL_ERROR, \
                                                   __FILE__, G_STRINGIFY (__LINE__), \
                                                   G_STRFUNC, __VA_ARGS__); \
                        for (;;) ;                                              \
                      } G_STMT_END
#define g_message(...)  g_log_structured_standard (G_LOG_DOMAIN, G_LOG_LEVEL_MESSAGE, \
                                                   __FILE__, G_STRINGIFY (__LINE__), \
                                                   G_STRFUNC, __VA_ARGS__)
#define g_critical(...) g_log_structured_standard (G_LOG_DOMAIN, G_LOG_LEVEL_CRITICAL, \
                                                   __FILE__, G_STRINGIFY (__LINE__), \
                                                   G_STRFUNC, __VA_ARGS__)
#define g_warning(...)  g_log_structured_standard (G_LOG_DOMAIN, G_LOG_LEVEL_WARNING, \
                                                   __FILE__, G_STRINGIFY (__LINE__), \
                                                   G_STRFUNC, __VA_ARGS__)
#define g_info(...)     g_log_structured_standard (G_LOG_DOMAIN, G_LOG_LEVEL_INFO, \
                                                   __FILE__, G_STRINGIFY (__LINE__), \
                                                   G_STRFUNC, __VA_ARGS__)
#define g_debug(...)    g_log_structured_standard (G_LOG_DOMAIN, G_LOG_LEVEL_DEBUG, \
                                                   __FILE__, G_STRINGIFY (__LINE__), \
                                                   G_STRFUNC, __VA_ARGS__)
#else
#define g_error(...)  G_STMT_START {                 \
                        g_log (G_LOG_DOMAIN,         \
                               G_LOG_LEVEL_ERROR,    \
                               __VA_ARGS__);         \
                        for (;;) ;                   \
                      } G_STMT_END
#define g_message(...)  g_log (G_LOG_DOMAIN,         \
                               G_LOG_LEVEL_MESSAGE,  \
                               __VA_ARGS__)
#define g_critical(...) g_log (G_LOG_DOMAIN,         \
                               G_LOG_LEVEL_CRITICAL, \
                               __VA_ARGS__)
#define g_warning(...)  g_log (G_LOG_DOMAIN,         \
                               G_LOG_LEVEL_WARNING,  \
                               __VA_ARGS__)
#define g_info(...)     g_log (G_LOG_DOMAIN,         \
                               G_LOG_LEVEL_INFO,     \
                               __VA_ARGS__)
#define g_debug(...)    g_log (G_LOG_DOMAIN,         \
                               G_LOG_LEVEL_DEBUG,    \
                               __VA_ARGS__)
#endif
#elif defined(G_HAVE_GNUC_VARARGS)  && !G_ANALYZER_ANALYZING
#if defined(G_LOG_USE_STRUCTURED) && GLIB_VERSION_MAX_ALLOWED >= GLIB_VERSION_2_56
#define g_error(format...)   G_STMT_START {                                          \
                               g_log_structured_standard (G_LOG_DOMAIN, G_LOG_LEVEL_ERROR, \
                                                          __FILE__, G_STRINGIFY (__LINE__), \
                                                          G_STRFUNC, format); \
                               for (;;) ;                                            \
                             } G_STMT_END
#define g_message(format...)  g_log_structured_standard (G_LOG_DOMAIN, G_LOG_LEVEL_MESSAGE, \
                                                         __FILE__, G_STRINGIFY (__LINE__), \
                                                         G_STRFUNC, format)
#define g_critical(format...) g_log_structured_standard (G_LOG_DOMAIN, G_LOG_LEVEL_CRITICAL, \
                                                         __FILE__, G_STRINGIFY (__LINE__), \
                                                         G_STRFUNC, format)
#define g_warning(format...)  g_log_structured_standard (G_LOG_DOMAIN, G_LOG_LEVEL_WARNING, \
                                                         __FILE__, G_STRINGIFY (__LINE__), \
                                                         G_STRFUNC, format)
#define g_info(format...)     g_log_structured_standard (G_LOG_DOMAIN, G_LOG_LEVEL_INFO, \
                                                         __FILE__, G_STRINGIFY (__LINE__), \
                                                         G_STRFUNC, format)
#define g_debug(format...)    g_log_structured_standard (G_LOG_DOMAIN, G_LOG_LEVEL_DEBUG, \
                                                         __FILE__, G_STRINGIFY (__LINE__), \
                                                         G_STRFUNC, format)
#else
#define g_error(format...)    G_STMT_START {                 \
                                g_log (G_LOG_DOMAIN,         \
                                       G_LOG_LEVEL_ERROR,    \
                                       format);              \
                                for (;;) ;                   \
                              } G_STMT_END

#define g_message(format...)    g_log (G_LOG_DOMAIN,         \
                                       G_LOG_LEVEL_MESSAGE,  \
                                       format)
#define g_critical(format...)   g_log (G_LOG_DOMAIN,         \
                                       G_LOG_LEVEL_CRITICAL, \
                                       format)
#define g_warning(format...)    g_log (G_LOG_DOMAIN,         \
                                       G_LOG_LEVEL_WARNING,  \
                                       format)
#define g_info(format...)       g_log (G_LOG_DOMAIN,         \
                                       G_LOG_LEVEL_INFO,     \
                                       format)
#define g_debug(format...)      g_log (G_LOG_DOMAIN,         \
                                       G_LOG_LEVEL_DEBUG,    \
                                       format)
#endif
#else   */
  void g_error (const gchar *format, ...) ;
void g_critical (const gchar *format, ...) ;

/*
static inline void
g_error (const gchar *format,
         ...)
{
  va_list args;
  va_start (args, format);
  g_logv (G_LOG_DOMAIN, G_LOG_LEVEL_ERROR, format, args);
  va_end (args);

  for(;;) ;
}
static inline void
g_message (const gchar *format,
           ...)
{
  va_list args;
  va_start (args, format);
  g_logv (G_LOG_DOMAIN, G_LOG_LEVEL_MESSAGE, format, args);
  va_end (args);
}
static inline void
g_critical (const gchar *format,
            ...)
{
  va_list args;
  va_start (args, format);
  g_logv (G_LOG_DOMAIN, G_LOG_LEVEL_CRITICAL, format, args);
  va_end (args);
}
static inline void
g_warning (const gchar *format,
           ...)
{
  va_list args;
  va_start (args, format);
  g_logv (G_LOG_DOMAIN, G_LOG_LEVEL_WARNING, format, args);
  va_end (args);
}
static inline void
g_info (const gchar *format,
        ...)
{
  va_list args;
  va_start (args, format);
  g_logv (G_LOG_DOMAIN, G_LOG_LEVEL_INFO, format, args);
  va_end (args);
}
static inline void
g_debug (const gchar *format,
         ...)
{
  va_list args;
  va_start (args, format);
  g_logv (G_LOG_DOMAIN, G_LOG_LEVEL_DEBUG, format, args);
  va_end (args);
}
#endif  */

/**
 * g_warning_once:
 * @...: format string, followed by parameters to insert
 *     into the format string (as with printf())
 *
 * Logs a warning only once.
 *
 * g_warning_once() calls g_warning() with the passed message the first time
 * the statement is executed; subsequent times it is a no-op.
 *
 * Note! On platforms where the compiler doesn't support variadic macros, the
 * warning is printed each time instead of only once.
 *
 * Since: 2.64
 */
/*
#if defined(G_HAVE_ISO_VARARGS) && !G_ANALYZER_ANALYZING
#define g_warning_once(...) \
  G_STMT_START { \
    static int G_PASTE (_GWarningOnceBoolean, __LINE__) = 0;   \
    if (g_atomic_int_compare_and_exchange (&G_PASTE (_GWarningOnceBoolean, __LINE__), \
                                           0, 1)) \
      g_warning (__VA_ARGS__); \
  } G_STMT_END \
  GLIB_AVAILABLE_MACRO_IN_2_64
#elif defined(G_HAVE_GNUC_VARARGS)  && !G_ANALYZER_ANALYZING
#define g_warning_once(format...) \
  G_STMT_START { \
    static int G_PASTE (_GWarningOnceBoolean, __LINE__) = 0;   \
    if (g_atomic_int_compare_and_exchange (&G_PASTE (_GWarningOnceBoolean, __LINE__), \
                                           0, 1)) \
      g_warning (format); \
  } G_STMT_END \
  GLIB_AVAILABLE_MACRO_IN_2_64
#else
#define g_warning_once g_warning
#endif
*/
/**
 * GPrintFunc:
 * @string: the message to output
 *
 * Specifies the type of the print handler functions.
 * These are called with the complete formatted string to output.
 */
typedef void    (*GPrintFunc)           (const gchar    *string);

void            g_print                 (const gchar    *format,
                                         ...) ;

GPrintFunc      g_set_print_handler     (GPrintFunc      func);

void            g_printerr              (const gchar    *format,
                                         ...) ;

GPrintFunc      g_set_printerr_handler  (GPrintFunc      func);

/**
 * g_warn_if_reached:
 *
 * Logs a warning.
 *
 * Since: 2.16
 */
//#define g_warn_if_reached() \
//  do { \
//    g_warn_message (G_LOG_DOMAIN, __FILE__, __LINE__, G_STRFUNC, NULL); \
//  } while (0)

/**
 * g_warn_if_fail:
 * @expr: the expression to check
 *
 * Logs a warning if the expression is not true.
 *
 * Unlike g_return_if_fail(), the expression is always evaluated, even if
 * checks and assertions are disabled.
 *
 * Since: 2.16
 */
//#define g_warn_if_fail(expr) \
//  do { \
//    if G_LIKELY (expr) ; \
//    else g_warn_message (G_LOG_DOMAIN, __FILE__, __LINE__, G_STRFUNC, #expr); \
//  } while (0)

//#ifdef G_DISABLE_CHECKS

/**
 * g_return_if_fail:
 * @expr: the expression to check
 *
 * Verifies that the expression @expr, usually representing a precondition,
 * evaluates to %TRUE. If the function returns a value, use
 * g_return_val_if_fail() instead.
 *
 * If @expr evaluates to %FALSE, the current function should be considered to
 * have undefined behaviour (a programmer error). The only correct solution
 * to such an error is to change the module that is calling the current
 * function, so that it avoids this incorrect call.
 *
 * To make this undefined behaviour visible, if @expr evaluates to %FALSE,
 * the result is usually that a critical message is logged and the current
 * function returns.
 *
 * If `G_DISABLE_CHECKS` is defined then the check is not performed.  You
 * should therefore not depend on any side effects of @expr.
 *
 * To debug failure of a g_return_if_fail() check, run the code under a debugger
 * with `G_DEBUG=fatal-criticals` or `G_DEBUG=fatal-warnings` defined in the
 * environment (see [Running GLib Applications](glib-running.html)):
 *
 * |[
 *   G_DEBUG=fatal-warnings gdb ./my-program
 * ]|
 *
 * Any unrelated failures can be skipped over in
 * [gdb](https://www.gnu.org/software/gdb/) using the `continue` command.
 */
//#define g_return_if_fail(expr) G_STMT_START{ (void)0; }G_STMT_END

/**
 * g_return_val_if_fail:
 * @expr: the expression to check
 * @val: the value to return from the current function
 *       if the expression is not true
 *
 * Verifies that the expression @expr, usually representing a precondition,
 * evaluates to %TRUE. If the function does not return a value, use
 * g_return_if_fail() instead.
 *
 * If @expr evaluates to %FALSE, the current function should be considered to
 * have undefined behaviour (a programmer error). The only correct solution
 * to such an error is to change the module that is calling the current
 * function, so that it avoids this incorrect call.
 *
 * To make this undefined behaviour visible, if @expr evaluates to %FALSE,
 * the result is usually that a critical message is logged and @val is
 * returned from the current function.
 *
 * If `G_DISABLE_CHECKS` is defined then the check is not performed.  You
 * should therefore not depend on any side effects of @expr.
 *
 * See g_return_if_fail() for guidance on how to debug failure of this check.
 */
//#define g_return_val_if_fail(expr,val) G_STMT_START{ (void)0; }G_STMT_END

/**
 * g_return_if_reached:
 *
 * Logs a critical message and returns from the current function.
 * This can only be used in functions which do not return a value.
 *
 * See g_return_if_fail() for guidance on how to debug failure of this check.
 */
//#define g_return_if_reached() G_STMT_START{ return; }G_STMT_END

/**
 * g_return_val_if_reached:
 * @val: the value to return from the current function
 *
 * Logs a critical message and returns @val.
 *
 * See g_return_if_fail() for guidance on how to debug failure of this check.
 */
//#define g_return_val_if_reached(val) G_STMT_START{ return (val); }G_STMT_END

//#else /* !G_DISABLE_CHECKS */

/*
#define g_return_if_fail(expr) \
  G_STMT_START { \
    if (G_LIKELY (expr)) \
      { } \
    else \
      { \
        g_return_if_fail_warning (G_LOG_DOMAIN, \
                                  G_STRFUNC, \
                                  #expr); \
        return; \
      } \
  } G_STMT_END

#define g_return_val_if_fail(expr, val) \
  G_STMT_START { \
    if (G_LIKELY (expr)) \
      { } \
    else \
      { \
        g_return_if_fail_warning (G_LOG_DOMAIN, \
                                  G_STRFUNC, \
                                  #expr); \
        return (val); \
      } \
  } G_STMT_END

#define g_return_if_reached() \
  G_STMT_START { \
    g_log (G_LOG_DOMAIN, \
           G_LOG_LEVEL_CRITICAL, \
           "file %s: line %d (%s): should not be reached", \
           __FILE__, \
           __LINE__, \
           G_STRFUNC); \
    return; \
  } G_STMT_END

#define g_return_val_if_reached(val) \
  G_STMT_START { \
    g_log (G_LOG_DOMAIN, \
           G_LOG_LEVEL_CRITICAL, \
           "file %s: line %d (%s): should not be reached", \
           __FILE__, \
           __LINE__, \
           G_STRFUNC); \
    return (val); \
  } G_STMT_END

#endif*/



#endif /* __G_MESSAGES_H__ */
