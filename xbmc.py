#!/usr/bin/env python

import socket
import json
from subprocess import call

TCP_IP = '127.0.0.1'
TCP_PORT = 9090
BUFFER_SIZE = 1024

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
		call(["usbdim", "--set", "-l", "0", "-i", "0"])
	

	if jdata["method"] == "Player.OnPause" or jdata["method"] == "Player.OnStop":
		print "Stopping or Pausing"
		call(["usbdim", "--set", "-l", "255", "-i", "0"])
	

conn.close()