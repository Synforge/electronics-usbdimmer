#!/usr/bin/env python

import socket
import json
import usb.core
import usb.util

HOST = ''
PORT = 1337

dimmer = usb.core.find(idVendor=0x16c0, idProduct=0x05dc)

# was it found?
if dimmer is None:
    raise ValueError('Dimmer not found')

#data = (0x00, 0x00, 0)
#dimmer.ctrl_transfer(0x21, 0x02, 0x00, 0x00, data)

sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
sock.bind((HOST, PORT))

while True:
	data, addr = sock.recvfrom(1024) # buffer size is 1024 bytes
	print(data)	
	dimmer.ctrl_transfer(0x21, data[0], 0x00, 0x00, data[1:])
