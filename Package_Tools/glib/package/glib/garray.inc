/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGBytes = record
  end;
  PGBytes = ^TGBytes;
  PPGBytes = ^PGBytes;

  TGArray = record
    Data: Pgchar;
    len: Tguint;
  end;
  PGArray = ^TGArray;

  TGByteArray = record
    Data: Pguint8;
    len: Tguint;
  end;
  PGByteArray = ^TGByteArray;

  TGPtrArray = record
    pdata: Pgpointer;
    len: Tguint;
  end;
  PGPtrArray = ^TGPtrArray;


{ #define g_array_index(a,t,i)      (((t*) (void *) (a)->data) [(i)]) }
function g_array_new(zero_terminated: Tgboolean; clear_: Tgboolean; element_size: Tguint): PGArray; cdecl; external libglib2;
function g_array_new_take(Data: Tgpointer; len: Tgsize; Clear: Tgboolean; element_size: Tgsize): PGArray; cdecl; external libglib2;
function g_array_new_take_zero_terminated(Data: Tgpointer; Clear: Tgboolean; element_size: Tgsize): PGArray; cdecl; external libglib2;
function g_array_steal(_array: PGArray; len: Pgsize): Tgpointer; cdecl; external libglib2;
function g_array_sized_new(zero_terminated: Tgboolean; clear_: Tgboolean; element_size: Tguint; reserved_size: Tguint): PGArray; cdecl; external libglib2;
function g_array_copy(_array: PGArray): PGArray; cdecl; external libglib2;
function g_array_free(_array: PGArray; free_segment: Tgboolean): Pgchar; cdecl; external libglib2;
function g_array_ref(_array: PGArray): PGArray; cdecl; external libglib2;
procedure g_array_unref(_array: PGArray); cdecl; external libglib2;
function g_array_get_element_size(_array: PGArray): Tguint; cdecl; external libglib2;
function g_array_append_vals(_array: PGArray; Data: Tgconstpointer; len: Tguint): PGArray; cdecl; external libglib2;
function g_array_prepend_vals(_array: PGArray; Data: Tgconstpointer; len: Tguint): PGArray; cdecl; external libglib2;
function g_array_insert_vals(_array: PGArray; index_: Tguint; Data: Tgconstpointer; len: Tguint): PGArray; cdecl; external libglib2;
function g_array_set_size(_array: PGArray; length: Tguint): PGArray; cdecl; external libglib2;
function g_array_remove_index(_array: PGArray; index_: Tguint): PGArray; cdecl; external libglib2;
function g_array_remove_index_fast(_array: PGArray; index_: Tguint): PGArray; cdecl; external libglib2;
function g_array_remove_range(_array: PGArray; index_: Tguint; length: Tguint): PGArray; cdecl; external libglib2;
procedure g_array_sort(_array: PGArray; compare_func: TGCompareFunc); cdecl; external libglib2;
procedure g_array_sort_with_data(_array: PGArray; compare_func: TGCompareDataFunc; user_data: Tgpointer); cdecl; external libglib2;
function g_array_binary_search(_array: PGArray; target: Tgconstpointer; compare_func: TGCompareFunc; out_match_index: Pguint): Tgboolean; cdecl; external libglib2;
procedure g_array_set_clear_func(_array: PGArray; clear_func: TGDestroyNotify); cdecl; external libglib2;
function g_ptr_array_new: PGPtrArray; cdecl; external libglib2;
function g_ptr_array_new_with_free_func(element_free_func: TGDestroyNotify): PGPtrArray; cdecl; external libglib2;
function g_ptr_array_new_take(Data: Pgpointer; len: Tgsize; element_free_func: TGDestroyNotify): PGPtrArray; cdecl; external libglib2;
function g_ptr_array_new_from_array(Data: Pgpointer; len: Tgsize; copy_func: TGCopyFunc; copy_func_user_data: Tgpointer; element_free_func: TGDestroyNotify): PGPtrArray; cdecl; external libglib2;
function g_ptr_array_steal(_array: PGPtrArray; len: Pgsize): Pgpointer; cdecl; external libglib2;
function g_ptr_array_copy(_array: PGPtrArray; func: TGCopyFunc; user_data: Tgpointer): PGPtrArray; cdecl; external libglib2;
function g_ptr_array_sized_new(reserved_size: Tguint): PGPtrArray; cdecl; external libglib2;
function g_ptr_array_new_full(reserved_size: Tguint; element_free_func: TGDestroyNotify): PGPtrArray; cdecl; external libglib2;
function g_ptr_array_new_null_terminated(reserved_size: Tguint; element_free_func: TGDestroyNotify; null_terminated: Tgboolean): PGPtrArray; cdecl; external libglib2;
function g_ptr_array_new_take_null_terminated(Data: Pgpointer; element_free_func: TGDestroyNotify): PGPtrArray; cdecl; external libglib2;
function g_ptr_array_new_from_null_terminated_array(Data: Pgpointer; copy_func: TGCopyFunc; copy_func_user_data: Tgpointer; element_free_func: TGDestroyNotify): PGPtrArray; cdecl; external libglib2;
function g_ptr_array_free(_array: PGPtrArray; free_seg: Tgboolean): Pgpointer; cdecl; external libglib2;
function g_ptr_array_ref(_array: PGPtrArray): PGPtrArray; cdecl; external libglib2;
procedure g_ptr_array_unref(_array: PGPtrArray); cdecl; external libglib2;
procedure g_ptr_array_set_free_func(_array: PGPtrArray; element_free_func: TGDestroyNotify); cdecl; external libglib2;
procedure g_ptr_array_set_size(_array: PGPtrArray; length: Tgint); cdecl; external libglib2;
function g_ptr_array_remove_index(_array: PGPtrArray; index_: Tguint): Tgpointer; cdecl; external libglib2;
function g_ptr_array_remove_index_fast(_array: PGPtrArray; index_: Tguint): Tgpointer; cdecl; external libglib2;
function g_ptr_array_steal_index(_array: PGPtrArray; index_: Tguint): Tgpointer; cdecl; external libglib2;
function g_ptr_array_steal_index_fast(_array: PGPtrArray; index_: Tguint): Tgpointer; cdecl; external libglib2;
function g_ptr_array_remove(_array: PGPtrArray; Data: Tgpointer): Tgboolean; cdecl; external libglib2;
function g_ptr_array_remove_fast(_array: PGPtrArray; Data: Tgpointer): Tgboolean; cdecl; external libglib2;
function g_ptr_array_remove_range(_array: PGPtrArray; index_: Tguint; length: Tguint): PGPtrArray; cdecl; external libglib2;
procedure g_ptr_array_add(_array: PGPtrArray; Data: Tgpointer); cdecl; external libglib2;
procedure g_ptr_array_extend(array_to_extend: PGPtrArray; _array: PGPtrArray; func: TGCopyFunc; user_data: Tgpointer); cdecl; external libglib2;
procedure g_ptr_array_extend_and_steal(array_to_extend: PGPtrArray; _array: PGPtrArray); cdecl; external libglib2;
procedure g_ptr_array_insert(_array: PGPtrArray; index_: Tgint; Data: Tgpointer); cdecl; external libglib2;
procedure g_ptr_array_sort(_array: PGPtrArray; compare_func: TGCompareFunc); cdecl; external libglib2;
procedure g_ptr_array_sort_with_data(_array: PGPtrArray; compare_func: TGCompareDataFunc; user_data: Tgpointer); cdecl; external libglib2;
procedure g_ptr_array_sort_values(_array: PGPtrArray; compare_func: TGCompareFunc); cdecl; external libglib2;
procedure g_ptr_array_sort_values_with_data(_array: PGPtrArray; compare_func: TGCompareDataFunc; user_data: Tgpointer); cdecl; external libglib2;
procedure g_ptr_array_foreach(_array: PGPtrArray; func: TGFunc; user_data: Tgpointer); cdecl; external libglib2;
function g_ptr_array_find(haystack: PGPtrArray; needle: Tgconstpointer; index_: Pguint): Tgboolean; cdecl; external libglib2;
function g_ptr_array_find_with_equal_func(haystack: PGPtrArray; needle: Tgconstpointer; equal_func: TGEqualFunc; index_: Pguint): Tgboolean; cdecl; external libglib2;
function g_ptr_array_is_null_terminated(_array: PGPtrArray): Tgboolean; cdecl; external libglib2;
function g_byte_array_new: PGByteArray; cdecl; external libglib2;
function g_byte_array_new_take(Data: Pguint8; len: Tgsize): PGByteArray; cdecl; external libglib2;
function g_byte_array_steal(_array: PGByteArray; len: Pgsize): Pguint8; cdecl; external libglib2;
function g_byte_array_sized_new(reserved_size: Tguint): PGByteArray; cdecl; external libglib2;
function g_byte_array_free(_array: PGByteArray; free_segment: Tgboolean): Pguint8; cdecl; external libglib2;
function g_byte_array_free_to_bytes(_array: PGByteArray): PGBytes; cdecl; external libglib2;
function g_byte_array_ref(_array: PGByteArray): PGByteArray; cdecl; external libglib2;
procedure g_byte_array_unref(_array: PGByteArray); cdecl; external libglib2;
function g_byte_array_append(_array: PGByteArray; Data: Pguint8; len: Tguint): PGByteArray; cdecl; external libglib2;
function g_byte_array_prepend(_array: PGByteArray; Data: Pguint8; len: Tguint): PGByteArray; cdecl; external libglib2;
function g_byte_array_set_size(_array: PGByteArray; length: Tguint): PGByteArray; cdecl; external libglib2;
function g_byte_array_remove_index(_array: PGByteArray; index_: Tguint): PGByteArray; cdecl; external libglib2;
function g_byte_array_remove_index_fast(_array: PGByteArray; index_: Tguint): PGByteArray; cdecl; external libglib2;
function g_byte_array_remove_range(_array: PGByteArray; index_: Tguint; length: Tguint): PGByteArray; cdecl; external libglib2;
procedure g_byte_array_sort(_array: PGByteArray; compare_func: TGCompareFunc); cdecl; external libglib2;
procedure g_byte_array_sort_with_data(_array: PGByteArray; compare_func: TGCompareDataFunc; user_data: Tgpointer); cdecl; external libglib2;

function g_array_append_val(a: PGArray; v: Tgconstpointer): PGArray;
function g_array_prepend_val(a: PGArray; v: Tgconstpointer): PGArray;
function g_array_insert_val(a: PGArray; i: Tguint; v: Tgconstpointer): PGArray;
function g_ptr_array_index (parray: PGPtrArray; index: Tguint): Tgpointer;

// === Konventiert am: 6-8-24 16:27:59 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

{ #define g_array_index(a,t,i)      (((t*) (void *) (a)->data) [(i)]) }



function g_array_append_val(a: PGArray; v: Tgconstpointer): PGArray;
begin
  g_array_append_val := g_array_append_vals(a, @(v), 1);
end;

function g_array_prepend_val(a: PGArray; v: Tgconstpointer): PGArray;
begin
  g_array_prepend_val := g_array_prepend_vals(a, @(v), 1);
end;

function g_array_insert_val(a: PGArray; i: Tguint; v: Tgconstpointer): PGArray;
begin
  g_array_insert_val := g_array_insert_vals(a, i, @(v), 1);
end;

function g_ptr_array_index(parray: PGPtrArray; index: Tguint): Tgpointer;
begin
  g_ptr_array_index := parray^.pdata[index];
end;

{$ENDIF read_implementation}
