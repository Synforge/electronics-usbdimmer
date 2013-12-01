var usb = require("usb");

var dev = usb.findByIds(0x16c0, 0x05dc);
dev.open();

var WebSocketServer = require('ws').Server;
var wss = new WebSocketServer({port: 8181});

wss.broadcast = function(data) {
    for(var i in this.clients)
        this.clients[i].send(data);
};

wss.on('connection', function(ws) {
    console.log('New client connected');

    ws.on('message', function(message) {
    	var parsedMessage = JSON.parse(message);

        var channel = parsedMessage.channel;
        var value = parsedMessage.value;

        if(channel >= 0 && channel <= 7 && value >= 0 && value <= 255) {
            data = Buffer([0x00, channel, value]);

            dev.controlTransfer(
                0x21, 0x02, 0x00, 0x00, data
            );

            var broadcast = {
                type: 'update',
                channel: channel,
                value: value
            };

            //Broadcast the update to other clients.
            for(var i in wss.clients) {
                if(wss.clients[i] !== ws) {
                    wss.clients[i].send(JSON.stringify(broadcast));
                }
            }
        }

    });
});