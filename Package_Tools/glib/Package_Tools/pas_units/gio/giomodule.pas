unit giomodule;

interface

uses
  common_GLIB, gtypes, glist, gtype, giotypes, gobject, gioenums;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGIOModule = record
  end;
  PGIOModule = ^TGIOModule;

  TGIOModuleClass = record
  end;
  PGIOModuleClass = ^TGIOModuleClass;

  TGIOModuleScope = record
  end;
  PGIOModuleScope = ^TGIOModuleScope;

function g_io_module_scope_new(flags: TGIOModuleScopeFlags): PGIOModuleScope; cdecl; external libgio2;
procedure g_io_module_scope_free(scope: PGIOModuleScope); cdecl; external libgio2;
procedure g_io_module_scope_block(scope: PGIOModuleScope; basename: Pgchar); cdecl; external libgio2;

function g_io_module_get_type: TGType; cdecl; external libgio2;
function g_io_module_new(filename: Pgchar): PGIOModule; cdecl; external libgio2;
procedure g_io_modules_scan_all_in_directory(dirname: PChar); cdecl; external libgio2;
function g_io_modules_load_all_in_directory(dirname: Pgchar): PGList; cdecl; external libgio2;
procedure g_io_modules_scan_all_in_directory_with_scope(dirname: Pgchar; scope: PGIOModuleScope); cdecl; external libgio2;
function g_io_modules_load_all_in_directory_with_scope(dirname: Pgchar; scope: PGIOModuleScope): PGList; cdecl; external libgio2;
function g_io_extension_point_register(Name: PChar): PGIOExtensionPoint; cdecl; external libgio2;
function g_io_extension_point_lookup(Name: PChar): PGIOExtensionPoint; cdecl; external libgio2;
procedure g_io_extension_point_set_required_type(extension_point: PGIOExtensionPoint; _type: TGType); cdecl; external libgio2;
function g_io_extension_point_get_required_type(extension_point: PGIOExtensionPoint): TGType; cdecl; external libgio2;
function g_io_extension_point_get_extensions(extension_point: PGIOExtensionPoint): PGList; cdecl; external libgio2;
function g_io_extension_point_get_extension_by_name(extension_point: PGIOExtensionPoint; Name: PChar): PGIOExtension; cdecl; external libgio2;
function g_io_extension_point_implement(extension_point_name: PChar; _type: TGType; extension_name: PChar; priority: Tgint): PGIOExtension; cdecl; external libgio2;
function g_io_extension_get_type(extension: PGIOExtension): TGType; cdecl; external libgio2;
function g_io_extension_get_name(extension: PGIOExtension): PChar; cdecl; external libgio2;
function g_io_extension_get_priority(extension: PGIOExtension): Tgint; cdecl; external libgio2;
function g_io_extension_ref_class(extension: PGIOExtension): PGTypeClass; cdecl; external libgio2;
procedure g_io_module_load(module: PGIOModule); cdecl; external libgio2;
procedure g_io_module_unload(module: PGIOModule); cdecl; external libgio2;
function g_io_module_query: PPChar; cdecl; external libgio2;

// === Konventiert am: 20-8-24 15:33:46 ===

function G_IO_TYPE_MODULE: TGType;
function G_IO_MODULE(obj: Pointer): PGIOModule;
function G_IO_MODULE_CLASS(klass: Pointer): PGIOModuleClass;
function G_IO_IS_MODULE(obj: Pointer): Tgboolean;
function G_IO_IS_MODULE_CLASS(klass: Pointer): Tgboolean;
function G_IO_MODULE_GET_CLASS(obj: Pointer): PGIOModuleClass;

implementation

function G_IO_TYPE_MODULE: TGType;
begin
  G_IO_TYPE_MODULE := g_io_module_get_type;
end;

function G_IO_MODULE(obj: Pointer): PGIOModule;
begin
  Result := PGIOModule(g_type_check_instance_cast(obj, G_IO_TYPE_MODULE));
end;

function G_IO_MODULE_CLASS(klass: Pointer): PGIOModuleClass;
begin
  Result := PGIOModuleClass(g_type_check_class_cast(klass, G_IO_TYPE_MODULE));
end;

function G_IO_IS_MODULE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_IO_TYPE_MODULE);
end;

function G_IO_IS_MODULE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_IO_TYPE_MODULE);
end;

function G_IO_MODULE_GET_CLASS(obj: Pointer): PGIOModuleClass;
begin
  Result := PGIOModuleClass(PGTypeInstance(obj)^.g_class);
end;



end.
