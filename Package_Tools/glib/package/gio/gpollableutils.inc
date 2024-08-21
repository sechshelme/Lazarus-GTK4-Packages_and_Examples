/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

function g_pollable_source_new(pollable_stream: PGObject): PGSource; cdecl; external libgio2;
function g_pollable_source_new_full(pollable_stream: Tgpointer; child_source: PGSource; cancellable: PGCancellable): PGSource; cdecl; external libgio2;
function g_pollable_stream_read(stream: PGInputStream; buffer: pointer; Count: Tgsize; blocking: Tgboolean; cancellable: PGCancellable;
  error: PPGError): Tgssize; cdecl; external libgio2;
function g_pollable_stream_write(stream: PGOutputStream; buffer: pointer; Count: Tgsize; blocking: Tgboolean; cancellable: PGCancellable;
  error: PPGError): Tgssize; cdecl; external libgio2;
function g_pollable_stream_write_all(stream: PGOutputStream; buffer: pointer; Count: Tgsize; blocking: Tgboolean; bytes_written: Pgsize;
  cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libgio2;

// === Konventiert am: 21-8-24 16:11:40 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
