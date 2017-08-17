# -*- coding: utf-8 -*-
#!/usr/bin/env python
import sys
import os

if __name__ == '__main__':
    #if 3 != len(sys.argv) :
    if 2 != len(sys.argv) :
        print sys.argv
        print 'ERR'
    else:
        #pwd = sys.argv[2]
        pwd = sys.argv[1]
        if 'Volumes/MacintoshHD/Users' in pwd:
            #print pwd.split("/")
            print "/".join(pwd.split("/")[5:])
        else:
            print ""
