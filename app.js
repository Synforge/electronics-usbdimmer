var usb = require("usb");

var dev = usb.findByIds(0x16c0, 0x05dc);
dev.open();

var WebSocketServer = require('ws').Server;
var wss = new WebSocketServer({port: 8181});

wss.on('connection', function(ws) {
    ws.on('message', function(message) {
    	message = JSON.parse(message);

    	console.log('Channel: ' + message.channel + ', Value: ' + message.value);

     	data = Buffer([0x00, message.channel, message.value]);

		dev.controlTransfer(
			0x21, 0x02, 0x00, 0x00, data
		);

    });
});