#!/usr/bin/env python
import sys
import subprocess
import time
# import qtawesome as qta
from PyQt4 import QtCore
from PyQt4 import QtGui
from six import unichr
DEFAULT_STYLE = """
QProgressBar{
    border: 0;
    text-align: center
}

QProgressBar::chunk {
    background-color: #eee8d5;
    width: 10px;
    margin: 1px;
}
"""
class TimerMessageBox(QtGui.QMessageBox):
    def __init__(self, timeout=3, parent=None):
        super(TimerMessageBox, self).__init__(parent)
        font_id = QtGui.QFontDatabase.addApplicationFont("fontawesome-webfont.ttf")
        # if font_id is not -1:
        #     font_db = QtGui.QFontDatabase()
        #     self.font_styles = font_db.styles('FontAwesome')
        #     self.font_families = QtGui.QFontDatabase.applicationFontFamilies(font_id)
        #     for font_family in self.font_families:
        #         self.font = font_db.font(font_family, self.font_styles.first(), 24)
        volumen = subprocess.check_output("/usr/libexec/i3blocks/volume")
        s = ''.join(x for x in volumen if x.isdigit())
        self.setStyleSheet("background-color:#002b36; color:#eee8d5;font-size: 30pt");
        # self.setGeometry(0,0,400,59)

        # l = self.layout()
        # self.progress = QtGui.QProgressBar(self)
        # self.progress.setGeometry(200, 80, 250, 20)
        # self.progress.setValue(int(s)/100.0)
        # print int(s)/100.0
        # l.addWidget(self.progress,l.rowCount(), 0, 1, l.columnCount(), QtCore.Qt.AlignCenter )

        layout = self.layout()
        # self.setLayout(layout)

        # layout.setContentsMargins(0, 0, 0, 0)
        layout.setAlignment(QtCore.Qt.AlignTop)

        # icon = QtGui.QApplication.style().standardIcon(QtGui.QStyle.SP_FileIcon)
        self.label = QtGui.QLabel()
        self.label.setText(unichr(int('f028', 16)))
        # self.label.setPixmap(icon.pixmap(16, 16))
        # self.label2 = QtGui.QLabel("My Label")
        self.progress = QtGui.QProgressBar(self)
        self.progress.setValue(int(s))
        self.progress.setStyleSheet(DEFAULT_STYLE)
        # self.label2.setGeometry(200, 80, 20, 20)
        self.progress.setTextVisible(False);
        layout.addWidget(self.label,0,0)
        # layout.addWidget(self.progress)
        layout.addWidget(self.progress,layout.rowCount(), 0, 1, layout.columnCount(), QtCore.Qt.AlignCenter)

        self.setWindowTitle("wait")
        self.setWindowOpacity(0.5)
        self.time_to_wait = timeout
        # self.setText("volumen: " + s)
        # self.setText(unichr(int('f028', 16)))
        self.setStandardButtons(QtGui.QMessageBox.NoButton)
        self.timer = QtCore.QTimer(self)
        self.timer.setInterval(1000)
        self.timer.timeout.connect(self.changeContent)
        self.timer.start()

    def changeContent(self):
        # time.sleep(1)
        self.close()
        # self.setText("wait (closing automatically in {0} secondes.)".format(self.time_to_wait))
        # self.time_to_wait -= 1
        # if self.time_to_wait <= 0:
        #     self.close()

    def closeEvent(self, event):
        self.timer.stop()
        event.accept()



def main():
    # subprocess.call("ps -ef| grep search_pattern | awk '{print $2}' | xargs kill -9")
    app = QtGui.QApplication(sys.argv)
    ex = TimerMessageBox()
    ex.show()
    sys.exit(app.exec_())


if __name__ == '__main__':
    main()
