unit galloca;

interface

uses
  common_GLIB, gtypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

//function alloca:Pchar;cdecl;external libglib2;

//function g_alloca(size : SizeInt) : PChar;
//function g_alloca0(size : SizeInt) : PChar;
//function g_newa(struct_type,n_structs : longint) : Pstruct_type;
//function g_newa0(struct_type,n_structs : longint) : Pstruct_type;


// === Konventiert am: 10-8-24 19:22:50 ===


implementation


//function g_alloca(size: SizeInt): PChar;
//begin
//  g_alloca:=alloca(size);
//end;
//
//function g_alloca0(size: SizeInt): PChar;
//var
//   if_local1 : longint;
//(* result types are not known *)
//begin
//  if 0 then
//    if_local1:=NULL
//  else
//    if_local1:=memset(g_alloca(size),0,size);
//  g_alloca0:=size=(if_local1);
//end;

//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//function g_newa(struct_type,n_structs : longint) : Pstruct_type;
//begin
//  g_newa:=Pstruct_type(g_alloca((sizeof(struct_type))*(Tgsize(n_structs))));
//end;
//
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//function g_newa0(struct_type,n_structs : longint) : Pstruct_type;
//begin
//  g_newa0:=Pstruct_type(g_alloca0((sizeof(struct_type))*(Tgsize(n_structs))));
//end;


end.
