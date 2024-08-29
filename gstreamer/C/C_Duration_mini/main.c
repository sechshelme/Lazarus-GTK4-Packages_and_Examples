// gcc main.c -o main `pkg-config --cflags --libs gstreamer-1.0 gstreamer-audio-1.0`

#include <gst/gst.h>

int quit = 0;

static void test_cb(GstBus *bus, GstMessage *msg, gpointer data) {
    g_print("Message: %s\n", gst_message_type_get_name(msg->type));
    switch (GST_MESSAGE_TYPE(msg)) {
        case GST_MESSAGE_DURATION_CHANGED:
            g_print("Duration changed\n");
            break;
        case GST_MESSAGE_STATE_CHANGED:
            g_print("State changed\n");
            break;
        case GST_MESSAGE_EOS:
            g_print("Finish\n");
            quit = 1;
            break;
    }
}

int main(int argc, char *argv[]) {
    gst_init(&argc, &argv);

    GstElement *pipeline = gst_parse_launch("filesrc location=/home/tux/Schreibtisch/sound/test.wav ! decodebin ! audioconvert ! autoaudiosink", NULL);

    GstBus *bus = gst_element_get_bus(pipeline);
    gst_bus_add_signal_watch(bus);
    g_signal_connect(bus, "message", G_CALLBACK(test_cb), NULL);
    gst_object_unref(bus);

    gst_element_set_state(pipeline, GST_STATE_PLAYING);
    while (!quit) {
      g_main_context_iteration(0, 0);
    }
}

