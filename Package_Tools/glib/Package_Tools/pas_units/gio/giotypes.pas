unit giotypes;

interface

uses
  common_GLIB, gtypes, gobject, gmain, gcancellable, gsocketcontrolmessage;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

// ==== Ausgelagertes
type
  TGSocketPrivate = record
  end;

  PGSocketPrivate = ^TGSocketPrivate;
    TGSocket = record
    parent_instance: TGObject;
    priv: PGSocketPrivate;
  end;
  PGSocket = ^TGSocket;

  TGSocketAddress = record
    parent_instance: TGObject;
  end;
  PGSocketAddress = ^TGSocketAddress;
  PPGSocketAddress = ^PGSocketAddress;

  // =====


type
  TGDatagramBased=record
    end;
  PGDatagramBased=^TGDatagramBased;

  TGAsyncResult=record
        end;
  PGAsyncResult=^TGAsyncResult;

  TGIOSchedulerJob=record
        end;
  PGIOSchedulerJob=^TGIOSchedulerJob;

  TGSimpleAsyncResult=record
        end;
  PGSimpleAsyncResult=^TGSimpleAsyncResult;

  TGAsyncReadyCallback = procedure (source_object:PGObject; res:PGAsyncResult; data:Tgpointer);cdecl;
  TGFileProgressCallback = procedure (current_num_bytes:Tgoffset; total_num_bytes:Tgoffset; data:Tgpointer);cdecl;
  TGFileReadMoreCallback = function (file_contents:Pchar; file_size:Tgoffset; callback_data:Tgpointer):Tgboolean;cdecl;
  TGFileMeasureProgressCallback = procedure (reporting:Tgboolean; current_size:Tguint64; num_dirs:Tguint64; num_files:Tguint64; data:Tgpointer);cdecl;
  TGIOSchedulerJobFunc = function (job:PGIOSchedulerJob; cancellable:PGCancellable; data:Tgpointer):Tgboolean;cdecl;
  TGSimpleAsyncThreadFunc = procedure (res:PGSimpleAsyncResult; obj:PGObject; cancellable:PGCancellable);cdecl;
  TGSocketSourceFunc = function (socket:PGSocket; condition:TGIOCondition; data:Tgpointer):Tgboolean;cdecl;
  TGDatagramBasedSourceFunc = function (datagram_based:PGDatagramBased; condition:TGIOCondition; data:Tgpointer):Tgboolean;cdecl;
  PGInputVector = ^TGInputVector;
  TGInputVector = record
      buffer : Tgpointer;
      size : Tgsize;
    end;

  PGInputMessage = ^TGInputMessage;
  TGInputMessage = record
      address : ^PGSocketAddress;
      vectors : PGInputVector;
      num_vectors : Tguint;
      bytes_received : Tgsize;
      flags : Tgint;
      control_messages : PPPGSocketControlMessage;
      num_control_messages : Pguint;
    end;
  PGOutputVector = ^TGOutputVector;
  TGOutputVector = record
      buffer : Tgconstpointer;
      size : Tgsize;
    end;

  PGOutputMessage = ^TGOutputMessage;
  TGOutputMessage = record
      address : PGSocketAddress;
      vectors : PGOutputVector;
      num_vectors : Tguint;
      bytes_sent : Tguint;
      control_messages : ^PGSocketControlMessage;
      num_control_messages : Tguint;
    end;


  TGCancellableSourceFunc = function (cancellable:PGCancellable; data:Tgpointer):Tgboolean;cdecl;
  TGPollableSourceFunc = function (pollable_stream:PGObject; data:Tgpointer):Tgboolean;cdecl;
  TGDBusProxyTypeFunc = function (manager:PGDBusObjectManagerClient; object_path:Pgchar; interface_name:Pgchar; data:Tgpointer):TGType;cdecl;

// === Konventiert am: 16-8-24 19:32:54 ===


implementation



end.