#!/usr/bin/env python

import socket
import json
from subprocess import call

TCP_IP = '127.0.0.1'
TCP_PORT = 9090
BUFFER_SIZE = 1024  # Normally 1024, but we want fast response

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect((TCP_IP, TCP_PORT))
 
while 1:
	data = s.recv(BUFFER_SIZE)
	if not data: break
	
	# JSON Decode the data
	jdata = json.loads(data)

	print jdata["method"]

	if jdata["method"] == 'Player.OnPlay':
		print "Playing"
		call(["/home/paul/dev/usb-dimmer/commandline/powerSwitch", "set", "0", "0"])
	

	if jdata["method"] == "Player.OnPause" or jdata["method"] == "Player.OnStop":
		print "Stopping or Pausing"
		call(["/home/paul/dev/usb-dimmer/commandline/powerSwitch", "set", "0", "255"])
	

conn.close()