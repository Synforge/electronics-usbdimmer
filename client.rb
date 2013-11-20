#!/usr/bin/ruby

require 'socket'

s = UDPSocket.new

s.send(0x01.chr + 0x01.chr + 0x01.chr + 0xFF.chr, 0, 'localhost', 1234)