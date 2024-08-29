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
