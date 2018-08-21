
import gtk

window = gtk.Window()
window.show()
window.connect("destroy", gtk.mainquit)
vbox = gtk.VBox(spacing=3)
window.add(vbox)
vbox.show()

dialog = gtk.MessageDialog(
    parent         = None,
    flags          = gtk.DIALOG_DESTROY_WITH_PARENT,
    type           = gtk.MESSAGE_INFO,
    buttons        = gtk.BUTTONS_OK,
    message_format = "Your message here")
dialog.set_title('You clicked me!')
dialog.connect('response', lambda dialog, response: dialog.destroy())

# show the message dialog when they click
button = gtk.Button("Click me")
button.show()
button.connect("clicked", lambda *args: dialog.show())
vbox.pack_start(button, expand=gtk.FALSE, fill=gtk.FALSE)

# quit the main dialog when they click
button = gtk.Button("Quit")
button.show()
button.connect("clicked", gtk.mainquit)
vbox.pack_start(button, expand=gtk.FALSE, fill=gtk.FALSE)

gtk.mainloop()
