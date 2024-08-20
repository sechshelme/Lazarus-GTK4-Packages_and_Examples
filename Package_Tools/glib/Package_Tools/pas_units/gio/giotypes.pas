unit giotypes;

interface

uses
  common_GLIB, gtypes, gtype, gobject, gmain;

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

  TGDBusConnection = record
  end;
  PGDBusConnection = ^TGDBusConnection;

  TGDBusObjectManager = record
  end;
  PGDBusObjectManager = ^TGDBusObjectManager;

  TGDBusObjectManagerClientPrivate = record
  end;
  PGDBusObjectManagerClientPrivate = ^TGDBusObjectManagerClientPrivate;

  TGDBusObjectManagerClient = record
    parent_instance: TGObject;
    priv: PGDBusObjectManagerClientPrivate;
  end;
  PGDBusObjectManagerClient = ^TGDBusObjectManagerClient;

  TGCredentials = record
  end;
  PGCredentials = ^TGCredentials;

  TGCancellablePrivate = record
  end;
  PGCancellablePrivate = ^TGCancellablePrivate;

  TGCancellable = record
    parent_instance: TGObject;
    priv: PGCancellablePrivate;
  end;
  PGCancellable = ^TGCancellable;

  TGSocketControlMessagePrivate = record
  end;
  PGSocketControlMessagePrivate = ^TGSocketControlMessagePrivate;

  TGSocketControlMessage = record
    parent_instance: TGObject;
    priv: PGSocketControlMessagePrivate;
  end;
  PGSocketControlMessage = ^TGSocketControlMessage;
  PPGSocketControlMessage = ^PGSocketControlMessage;
  PPPGSocketControlMessage = ^PPGSocketControlMessage;

  TGFileInfo = record
  end;
  PGFileInfo = ^TGFileInfo;
  PPGFileInfo = ^PGFileInfo;

  TGFile = record
  end;
  PGFile = ^TGFile;
  PPGFile = ^PGFile;

  TGMount = record
  end;
  PGMount = ^TGMount;

  TGAppInfo = record
  end;
  PGAppInfo = ^TGAppInfo;

  TGIcon = record
  end;
  PGIcon = ^TGIcon;

  TGFileAttributeMatcher = record
  end;
  PGFileAttributeMatcher = ^TGFileAttributeMatcher;

  TGDBusAuthObserver = record
  end;
  PGDBusAuthObserver = ^TGDBusAuthObserver;

  TGDBusMessage = record
  end;
  PGDBusMessage = ^TGDBusMessage;

  TGDBusMethodInvocation = record
  end;
  PGDBusMethodInvocation = ^TGDBusMethodInvocation;

  TGBytesIcon = record
  end;
  PGBytesIcon = ^TGBytesIcon;

  TGSocketConnectable = record
  end;
  PGSocketConnectable = ^TGSocketConnectable;

  TGTlsDatabasePrivate = record
  end;
  PGTlsDatabasePrivate = ^TGTlsDatabasePrivate;

  TGTlsDatabase = record
    parent_instance: TGObject;
    priv: PGTlsDatabasePrivate;
  end;
  PGTlsDatabase = ^TGTlsDatabase;

  TGTlsInteractionPrivate = record
  end;
  PGTlsInteractionPrivate = ^TGTlsInteractionPrivate;

  TGTlsInteraction = record
    parent_instance: TGObject;
    priv: PGTlsInteractionPrivate;
  end;
  PGTlsInteraction = ^TGTlsInteraction;

  TGDrive = record
  end;
  PGDrive = ^TGDrive;

  TGProxyResolver = record
  end;
  PGProxyResolver = ^TGProxyResolver;

  TGIOExtensionPoint = record
  end;
  PGIOExtensionPoint = ^TGIOExtensionPoint;

  TGIOExtension = record
  end;
  PGIOExtension = ^TGIOExtension;

  TGSimpleAction = record
  end;
  PGSimpleAction = ^TGSimpleAction;

  TGDBusObject=record
      end;
  PGDBusObject=^TGDBusObject;

  TGDBusInterface=record
      end;
  PGDBusInterface=^TGDBusInterface;

  // =====


type
  TGDatagramBased = record
  end;
  PGDatagramBased = ^TGDatagramBased;

  TGAsyncResult = record
  end;
  PGAsyncResult = ^TGAsyncResult;

  TGIOSchedulerJob = record
  end;
  PGIOSchedulerJob = ^TGIOSchedulerJob;

  TGSimpleAsyncResult = record
  end;
  PGSimpleAsyncResult = ^TGSimpleAsyncResult;

  TGAsyncReadyCallback = procedure(source_object: PGObject; res: PGAsyncResult; Data: Tgpointer); cdecl;
  TGFileProgressCallback = procedure(current_num_bytes: Tgoffset; total_num_bytes: Tgoffset; Data: Tgpointer); cdecl;
  TGFileReadMoreCallback = function(file_contents: PChar; file_size: Tgoffset; callback_data: Tgpointer): Tgboolean; cdecl;
  TGFileMeasureProgressCallback = procedure(reporting: Tgboolean; current_size: Tguint64; num_dirs: Tguint64; num_files: Tguint64; Data: Tgpointer); cdecl;
  TGIOSchedulerJobFunc = function(job: PGIOSchedulerJob; cancellable: PGCancellable; Data: Tgpointer): Tgboolean; cdecl;
  TGSimpleAsyncThreadFunc = procedure(res: PGSimpleAsyncResult; obj: PGObject; cancellable: PGCancellable); cdecl;
  TGSocketSourceFunc = function(socket: PGSocket; condition: TGIOCondition; Data: Tgpointer): Tgboolean; cdecl;
  TGDatagramBasedSourceFunc = function(datagram_based: PGDatagramBased; condition: TGIOCondition; Data: Tgpointer): Tgboolean; cdecl;
  PGInputVector = ^TGInputVector;

  TGInputVector = record
    buffer: Tgpointer;
    size: Tgsize;
  end;

  PGInputMessage = ^TGInputMessage;

  TGInputMessage = record
    address: ^PGSocketAddress;
    vectors: PGInputVector;
    num_vectors: Tguint;
    bytes_received: Tgsize;
    flags: Tgint;
    control_messages: PPPGSocketControlMessage;
    num_control_messages: Pguint;
  end;
  PGOutputVector = ^TGOutputVector;

  TGOutputVector = record
    buffer: Tgconstpointer;
    size: Tgsize;
  end;

  PGOutputMessage = ^TGOutputMessage;

  TGOutputMessage = record
    address: PGSocketAddress;
    vectors: PGOutputVector;
    num_vectors: Tguint;
    bytes_sent: Tguint;
    control_messages: ^PGSocketControlMessage;
    num_control_messages: Tguint;
  end;


  TGCancellableSourceFunc = function(cancellable: PGCancellable; Data: Tgpointer): Tgboolean; cdecl;
  TGPollableSourceFunc = function(pollable_stream: PGObject; Data: Tgpointer): Tgboolean; cdecl;
  TGDBusProxyTypeFunc = function(manager: PGDBusObjectManagerClient; object_path: Pgchar; interface_name: Pgchar; Data: Tgpointer): TGType; cdecl;

  // === Konventiert am: 16-8-24 19:32:54 ===


implementation



end.
