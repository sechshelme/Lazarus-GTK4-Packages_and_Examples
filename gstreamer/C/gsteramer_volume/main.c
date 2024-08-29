// gcc main.c -o main `pkg-config --cflags --libs gstreamer-1.0 gstreamer-audio-1.0`

#include <stdio.h>
#include <gst/gst.h>
#include <gst/audio/streamvolume.h>
#include <gst/audio/audio.h>

int main (int argc, char *argv[]) {
  gst_init (&argc, &argv); 

  GstElement * pipeline = gst_parse_launch("'filesrc location=/home/tux/Schreibtisch/sound/test.mp3 ! decodebin ! audioconvert ! audioresample ! volume ! autoaudiosink", NULL);

  GstElement * volume    = gst_bin_get_by_interface(GST_BIN(pipeline), GST_TYPE_STREAM_VOLUME);

  printf("filter\n");


  g_object_set(volume, "volume", 0.2, NULL);
  g_object_set(equalizer, "band1", -6.0, NULL);


  gst_element_set_state(pipeline, GST_STATE_PLAYING);

  printf("<CTRL+C> = stop\n");
  while (1) {  }
}
