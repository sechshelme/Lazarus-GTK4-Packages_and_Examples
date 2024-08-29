// gcc main.c -o main `pkg-config --cflags --libs gstreamer-1.0 gstreamer-audio-1.0` -lncurses

#include <stdio.h>
#include <stdlib.h>
#include <gst/gst.h>
#include <glib.h>
#include <ncurses.h>

int main(int argc, char *argv[]) {
    initscr();             
    cbreak();              
    noecho();              
    keypad(stdscr, TRUE);  

    GstElement *pipeline;
    gboolean quit = FALSE;
    char ch;

    gst_init(&argc, &argv);

//    pipeline = gst_parse_launch("filesrc location=test.wav ! decodebin ! audioconvert ! autoaudiosink", NULL);

    pipeline = gst_parse_launch("filesrc location=test.wav ! wavparse ! audioconvert ! volume ! autoaudiosink", NULL);
    
    printw("<1> = stop;  <2> = play;  <3> = pause  <ESC> = break\n");

    while (!quit) {
        ch = getch(); 
        switch (ch) {
            case 27:
                quit = true;
                break;
            case '1':
                gst_element_set_state(pipeline, GST_STATE_READY);
                break;
            case '2':
                gst_element_set_state(pipeline, GST_STATE_PLAYING);
                break;
            case '3':
                gst_element_set_state(pipeline, GST_STATE_PAUSED);
                break;
        }
    }

    gst_element_set_state(pipeline, GST_STATE_NULL);
    gst_object_unref(pipeline);
    return 0;
}
