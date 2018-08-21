#!/usr/bin/env python
     
# message.py -- example program illustrating use of message dialog widget 
       
import pygtk
pygtk.require('2.0')
import gtk
import subprocess
import time

def timer(widget):
    time.sleep(1)
    gtk.main_quit()
    
if __name__ == "__main__":
    volumen = subprocess.check_output("/usr/libexec/i3blocks/volume")
    s = ''.join(x for x in volumen if x.isdigit())

    progressbar = gtk.ProgressBar(adjustment=None)
    progressbar.set_fraction(int(s)/100.0)
    progressbar.set_orientation(gtk.PROGRESS_LEFT_TO_RIGHT)
    message = gtk.Dialog(
            parent=None,
            flags=gtk.DIALOG_MODAL,

            )
    color = gtk.gdk.color_parse('#6c71c4')
    message.modify_bg(gtk.STATE_NORMAL,color)
    #progressbar.modify_style


    progressbar.modify_bg(gtk.STATE_PRELIGHT, gtk.gdk.color_parse("red"))

    label = gtk.Label()
    label.set_markup('<span fgcolor="#eee8d5" font_desc="FontAwesome 30">&#xf028;</span>')
    message.vbox.pack_start(label, True, True, 0)
    label.show()
    #message.set_markup('<span fgcolor="#7c8dde" font_desc="FontAwesome 30">&#xf069;</span>')
    message.set_opacity(0.5)
    message.get_content_area().pack_start(progressbar, True, True, 0)
    message.show_all()
    message.connect("destroy", timer)
    #message.run()
    gtk.main()
    #time.sleep(1)
    #gtk.main_quit()
