#! /usr/bin/python

import pygtk
pygtk.require('2.0')
import gtk

window1 = gtk.Window()
window2 = gtk.Window(gtk.WINDOW_POPUP)
dummy_layout = gtk.Entry()
dummy_layout.text = "Window 2"
window2.add(dummy_layout)
window3 = gtk.MessageDialog(parent=window1,message_format="W INDOW 3!!!!")

window1.show()
#window2.show()
window3.show()

gtk.main()
