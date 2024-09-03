//
// gcc main.c -o main
// gcc main.c -o main `pkg-config gtk4 --libs --cflags`
//

#include <glib-object.h>

typedef struct _TDouble {
    GObject parent_instance;  
    double value;             
} TDouble;

typedef struct _TDoubleClass {
    GObjectClass parent_class; 
} TDoubleClass;

G_DEFINE_TYPE(TDouble, t_double, G_TYPE_OBJECT)

static void t_double_class_init(TDoubleClass *klass) {
}

static void t_double_init(TDouble *self) {
    self->value = 0.0; 
}

int main(int argc, char *argv[]) {
    g_type_init(); 

    TDouble *my_double = g_object_new(t_double_get_type(), NULL);

    g_object_unref(my_double); 
    return 0;
}

// ====================


typedef struct _TDouble {
    GObject parent_instance;
    double value;
} TDouble;

typedef struct _TDoubleClass {
    GObjectClass parent_class;
} TDoubleClass;

static void t_double_init (TDouble *self); 
static void t_double_class_init (TDoubleClass *klass); 
static GType t_double_get_type_once (void); 
static gpointer t_double_parent_class = 

((void *)0)

static gint TDouble_private_offset; 
static void t_double_class_intern_init (gpointer klass) 
{ 
  t_double_parent_class = g_type_class_peek_parent (klass); 
  if (TDouble_private_offset != 0) g_type_class_adjust_private_offset (klass, &TDouble_private_offset); 
  t_double_class_init ((TDoubleClass*) klass); 
} 

static inline gpointer t_double_get_instance_private (TDouble *self) 
{ 
  return (((gpointer) ((guint8*) (self) + (glong) (TDouble_private_offset)))); 
} 

GType t_double_get_type (void) 
{ 
  static GType static_g_define_type_id = 0; 
  if ((__extension__ (
  { 
    _Static_assert (sizeof *(&static_g_define_type_id) == sizeof (gpointer), "Expression evaluates to false"); 
    (void) (0 ? (gpointer) * (&static_g_define_type_id) : ((void *)0)); 
    (!(__extension__ (
    { 
      _Static_assert (sizeof *(&static_g_define_type_id) == sizeof (gpointer), "Expression evaluates to false");
      __typeof__ (*(&static_g_define_type_id)) gapg_temp_newval; 
      __typeof__ ((&static_g_define_type_id)) gapg_temp_atomic = (&static_g_define_type_id); 
      __atomic_load (gapg_temp_atomic, &gapg_temp_newval, 5); 
      gapg_temp_newval; 
    }
    )) && g_once_init_enter_pointer (&static_g_define_type_id)); 
  }
  )) ) 
  { 
    GType g_define_type_id = t_double_get_type_once (); 
    (__extension__ (
    { 
      _Static_assert (sizeof *(&static_g_define_type_id) == sizeof (gpointer), "Expression evaluates to false"); 
      0 ? (void) (*(&static_g_define_type_id) = (g_define_type_id)) : (void) 0; 
      g_once_init_leave_pointer ((&static_g_define_type_id), (gpointer) (guintptr) (g_define_type_id)); 
    }
    )) ; 
  } 
  return static_g_define_type_id;
 } 

__attribute__ ((__noinline__)) static GType t_double_get_type_once (void) 
{ 
  GType g_define_type_id = g_type_register_static_simple (((GType) ((20) << (2))), g_intern_static_string ("TDouble"), sizeof (TDoubleClass), (GClassInitFunc)(void (*)(void)) t_double_class_intern_init, sizeof (TDouble), (GInstanceInitFunc)(void (*)(void)) t_double_init, (GTypeFlags) 0); 
  { 
    {
      {
      };
    } 
  } 
 return g_define_type_id; 
}



int main(int argc, char *argv[]) {
    g_type_init();

    TDouble *my_double = g_object_new(t_double_get_type(), 
# 24 "main2.c" 3 4
                                                          ((void *)0)
# 24 "main2.c"
                                                              );


    g_object_unref(my_double);
    return 0;
}



