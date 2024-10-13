/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 28-08-2024   15:47                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

const
  {$IFDEF Linux}
  libgtk4 = 'libgtk-4';
  libgio2 = 'libgio-2.0';
  libgobject2_0 = 'libgobject-2.0';
  {$ENDIF}

  {$IFDEF Windows}
  libgtk4 = 'libgtk-4.dll';
  libgio2 = 'libgio-2.0.dll';
  glibgobject2_0 = 'libgobject-2.0.dll';
  {$ENDIF}


  // ==== Fremdes 

type
  // === Exotisches
  Tsize_t = SizeUInt;

  Tva_list = Pointer; //  /usr/lib/gcc/x86_64-linux-gnu/11/include/stdarg.h

  Tgraphene_matrix_t = Pointer; //    /usr/include/graphene-1.0/graphene-matrix.h
  Pgraphene_matrix_t = ^Tgraphene_matrix_t;
  Tgraphene_rect_t = Pointer;
  Pgraphene_rect_t = ^Tgraphene_rect_t;
  Tgraphene_point_t = Pointer;
  Pgraphene_point_t = ^Tgraphene_point_t;
  Tgraphene_vec2_t = Pointer;        // /usr/include/graphene-1.0/graphene-vec3.h
  Pgraphene_vec2_t = ^Tgraphene_vec2_t;
  Tgraphene_vec3_t = Pointer;        // /usr/include/graphene-1.0/graphene-vec3.h
  Pgraphene_vec3_t = ^Tgraphene_vec3_t;
  Tgraphene_vec4_t = Pointer;        // /usr/include/graphene-1.0/graphene-vec4.h
  Pgraphene_vec4_t = ^Tgraphene_vec4_t;

  Tgraphene_size_t = record
    Width, Height: cfloat;
  end;
  Pgraphene_size_t = ^Tgraphene_size_t;  // /usr/include/graphene-1.0/graphene-size.h

  Tgraphene_point3d_t = record
    x, y, z: cfloat;
  end;
  Pgraphene_point3d_t = ^Tgraphene_point3d_t;

  Tcairo_content_t = cairo_content_t;

  // ==== Pango

  PPPangoFontDescription = ^PPangoFontDescription; // Pango Erweiterung
  PPPangoLanguage = ^PPangoLanguage;

  PPPangoAttrList = ^PPangoAttrList;


  // ==== ausgelagertes

  TGdkDevice = record
  end;
  PGdkDevice = ^TGdkDevice;

  TGdkDisplay = record
  end;
  PGdkDisplay = ^TGdkDisplay;

  TGdkEvent = record
  end;
  PGdkEvent = ^TGdkEvent;

  TGdkSurface = record
  end;
  PGdkSurface = ^TGdkSurface;

  TGdkContentProvider = record
    parent: TGObject;
  end;
  PGdkContentProvider = ^TGdkContentProvider;
  PPGdkContentProvider = ^PGdkContentProvider;

  // ====

const
  GDK_CURRENT_TIME = 0;


type
  TGdkKeymapKey = record
    keycode: Tguint;
    group: cint;
    level: cint;
  end;
  PGdkKeymapKey = ^TGdkKeymapKey;
  PPGdkKeymapKey = ^PGdkKeymapKey;


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
