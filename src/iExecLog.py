from datetime import datetime

def loginfo(txt, showdate=True):
    now = datetime.now()
    if showdate is True:
        print("[ INFO ][" + now.strftime("%H:%M:%S.%f") + "]  " + str(txt) )
    else:
        print(txt)

def logcmd(txt):
    print("[  CMD ]  " + str(txt) )



class Log(object):



    def __init__(self,_filename):
        self.filename = _filename
        self.log = True
        if self.log:
            self.f = open(str(self.filename), "a")

    def add(self, txt, showdate=True):
        now = datetime.now()
        if self.log:
            if showdate is True:
                self.f.write("[" + now.strftime("%H:%M:%S.%f") + "]  " + txt + "\n")
            else:
                self.f.write(txt + "\n")
            self.f.flush()

    def close(self):
        if self.log:
            self.f.close()
