#!/usr/bin/ruby

require 'libusb'
require 'socket'

begin
	@usb = LIBUSB::Context.new.devices(
		:idVendor  => 0x16c0,
		:idProduct => 0x05dc
	).first.open.claim_interface(0)
rescue LIBUSB::ERROR_ACCESS
	abort("No permission to access USB device!")
rescue LIBUSB::ERROR_BUSY
	abort("The USB device is busy!")
rescue NoMethodError
	abort("Could not find USB device!")
end

s = UDPSocket.new
s.bind(nil, 1234)

while true
	mesg, sender = s.recvfrom(4)
	
	@usb.control_transfer(
		:bmRequestType	=> 0x21,
		:bRequest 		=> 0x01,
		:wValue			=> 0x00,
		:wIndex			=> 0x00,
		:dataOut		=> mesg
	)

end