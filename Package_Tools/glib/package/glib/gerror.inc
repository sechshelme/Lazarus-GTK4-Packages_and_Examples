/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}


type
  TGError = record
    domain: TGQuark;
    code: Tgint;
    message: Pgchar;
  end;
  PGError = ^TGError;
  PPGError = ^PGError;

{
#define G_DEFINE_EXTENDED_ERROR(ErrorType, error_type)                  \
static inline ErrorType ## Private *                                    \
error_type ## _get_private (const GError *error)                        \
                                                                       \
  const gsize sa = 2 * sizeof (gsize);                                  \
  const gsize as = (sizeof (ErrorType ## Private) + (sa - 1)) & -sa;    \
  g_return_val_if_fail (error != NULL, NULL);                           \
  g_return_val_if_fail (error->domain == error_type ## _quark (), NULL); \
  return (ErrorType ## Private *) (((guint8 *)error) - as); \
                                                                       \
                                                                        \
static void                                                             \
g_error_with_ ## error_type ## _private_init (GError *error)            \
                                                                       \
  ErrorType ## Private *priv = error_type ## _get_private (error);      \
  error_type ## _private_init (priv);                                   \
                                                                       \
                                                                        \
static void                                                             \
g_error_with_ ## error_type ## _private_copy (const GError *src_error,  \
                                              GError       *dest_error) \
                                                                       \
  const ErrorType ## Private *src_priv = error_type ## _get_private (src_error);  \
  ErrorType ## Private *dest_priv = error_type ## _get_private (dest_error); \
  error_type ## _private_copy (src_priv, dest_priv);                    \
                                                                       \
                                                                        \
static void                                                             \
g_error_with_ ## error_type ## _private_clear (GError *error)           \
                                                                       \
  ErrorType ## Private *priv = error_type ## _get_private (error);      \
  error_type ## _private_clear (priv);                                  \
                                                                       \
                                                                        \
GQuark                                                                  \
error_type ## _quark (void)                                             \
                                                                       \
  static GQuark q;                                                      \
  static gsize initialized = 0;                                         \
                                                                        \
  if (g_once_init_enter (&initialized))                                 \
                                                                       \
      q = g_error_domain_register_static (#ErrorType,                   \
                                          sizeof (ErrorType ## Private), \
                                          g_error_with_ ## error_type ## _private_init, \
                                          g_error_with_ ## error_type ## _private_copy, \
                                          g_error_with_ ## error_type ## _private_clear); \
      g_once_init_leave (&initialized, 1);                              \
                                                                       \
                                                                        \
  return q;                                                             \

 }

  TGErrorInitFunc = procedure(error: PGError); cdecl;
  TGErrorCopyFunc = procedure(src_error: PGError; dest_error: PGError); cdecl;
  TGErrorClearFunc = procedure(error: PGError); cdecl;

function g_error_domain_register_static(error_type_name: PChar; error_type_private_size: Tgsize; error_type_init: TGErrorInitFunc; error_type_copy: TGErrorCopyFunc; error_type_clear: TGErrorClearFunc): TGQuark; cdecl; external libglib2;
function g_error_domain_register(error_type_name: PChar; error_type_private_size: Tgsize; error_type_init: TGErrorInitFunc; error_type_copy: TGErrorCopyFunc; error_type_clear: TGErrorClearFunc): TGQuark; cdecl; external libglib2;
function g_error_new(domain: TGQuark; code: Tgint; format: Pgchar; args: array of const): PGError; cdecl; external libglib2;
function g_error_new(domain: TGQuark; code: Tgint; format: Pgchar): PGError; cdecl; external libglib2;
function g_error_new_literal(domain: TGQuark; code: Tgint; message: Pgchar): PGError; cdecl; external libglib2;
function g_error_new_valist(domain: TGQuark; code: Tgint; format: Pgchar; args: Tva_list): PGError; cdecl; external libglib2;
procedure g_error_free(error: PGError); cdecl; external libglib2;
function g_error_copy(error: PGError): PGError; cdecl; external libglib2;
function g_error_matches(error: PGError; domain: TGQuark; code: Tgint): Tgboolean; cdecl; external libglib2;
procedure g_set_error(err: PPGError; domain: TGQuark; code: Tgint; format: Pgchar; args: array of const); cdecl; external libglib2;
procedure g_set_error(err: PPGError; domain: TGQuark; code: Tgint; format: Pgchar); cdecl; external libglib2;
procedure g_set_error_literal(err: PPGError; domain: TGQuark; code: Tgint; message: Pgchar); cdecl; external libglib2;
procedure g_propagate_error(dest: PPGError; src: PGError); cdecl; external libglib2;
procedure g_clear_error(err: PPGError); cdecl; external libglib2;
procedure g_prefix_error(err: PPGError; format: Pgchar; args: array of const); cdecl; external libglib2;
procedure g_prefix_error(err: PPGError; format: Pgchar); cdecl; external libglib2;
procedure g_prefix_error_literal(err: PPGError; prefix: Pgchar); cdecl; external libglib2;
procedure g_propagate_prefixed_error(dest: PPGError; src: PGError; format: Pgchar; args: array of const); cdecl; external libglib2;
procedure g_propagate_prefixed_error(dest: PPGError; src: PGError; format: Pgchar); cdecl; external libglib2;

// === Konventiert am: 6-8-24 17:13:44 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
