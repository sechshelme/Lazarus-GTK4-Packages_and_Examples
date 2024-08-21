/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGStatBuf=Tstat;
  PGStatBuf=^TGStatBuf;

function g_access(filename:Pgchar; mode:longint):longint;cdecl;external libglib2;
function g_chdir(path:Pgchar):longint;cdecl;external libglib2;
function g_unlink(filename:Pgchar):longint;cdecl;external libglib2;
function g_rmdir(filename:Pgchar):longint;cdecl;external libglib2;

function g_chmod(filename:Pgchar; mode:longint):longint;cdecl;external libglib2;
function g_open(filename:Pgchar; flags:longint; mode:longint):longint;cdecl;external libglib2;
function g_creat(filename:Pgchar; mode:longint):longint;cdecl;external libglib2;
function g_rename(oldfilename:Pgchar; newfilename:Pgchar):longint;cdecl;external libglib2;
function g_mkdir(filename:Pgchar; mode:longint):longint;cdecl;external libglib2;
function g_stat(filename:Pgchar; buf:PGStatBuf):longint;cdecl;external libglib2;
function g_lstat(filename:Pgchar; buf:PGStatBuf):longint;cdecl;external libglib2;
function g_remove(filename:Pgchar):longint;cdecl;external libglib2;
function g_fopen(filename:Pgchar; mode:Pgchar):PFILE;cdecl;external libglib2;
function g_freopen(filename:Pgchar; mode:Pgchar; stream:PFILE):PFILE;cdecl;external libglib2;
function g_fsync(fd:Tgint):Tgint;cdecl;external libglib2;
type
  Tutimbuf = record
    end;
  Putimbuf = ^Tutimbuf;

function g_utime(filename:Pgchar; utb:Putimbuf):longint;cdecl;external libglib2;
function g_close(fd:Tgint; error:PPGError):Tgboolean;cdecl;external libglib2;
{
static inline gboolean
g_clear_fd (int     *fd_ptr,
            GError **error)

  int fd = *fd_ptr;

  *fd_ptr = -1;

  if (fd < 0)
    return TRUE;

  return g_close (fd, error);
  

 }
{ Not public API  }
{
static inline void
_g_clear_fd_ignore_error (int *fd_ptr)

  int errsv = errno;
  

  if (!g_clear_fd (fd_ptr, NULL))
    
    

  

  errno = errsv;

/*
#endif

#define g_autofd _GLIB_CLEANUP(_g_clear_fd_ignore_error) GLIB_AVAILABLE_MACRO_IN_2_76
#endif



#endif /* __G_STDIO_H__  }

// === Konventiert am: 10-8-24 19:22:55 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
