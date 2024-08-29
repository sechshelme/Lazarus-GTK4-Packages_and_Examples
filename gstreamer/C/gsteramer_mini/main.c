// gcc main.c -o main `pkg-config --cflags --libs gstreamer-1.0 gstreamer-audio-1.0`

// x86_64-w64-mingw32-gcc  main.c -o main `pkg-config --cflags --libs gstreamer-1.0 gstreamer-audio-1.0

// x86_64-w64-mingw32-gcc  main.c -o main -lgstreamer-1.0-0 -Ldll

#include <stdio.h>

extern void	  gst_init(int *argc, char **argv[]);
extern void * gst_parse_launch(const char * pipeline_description, void ** error) ;
extern int    gst_element_set_state(void *element, int state);

int main (int argc, char *argv[]) {
  gst_init (&argc, &argv); 

  void * pipeline = gst_parse_launch("'filesrc location=/home/tux/Schreibtisch/sound/test.mp3 ! decodebin ! audioconvert ! audioresample ! autoaudiosink", NULL);
  gst_element_set_state(pipeline, 4);

  printf("<CTRL+C> = stop\n");
  while (1) {  }
}
