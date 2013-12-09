var usb = require("usb");

var dev = usb.findByIds(0x16c0, 0x05dc);
dev.open();

var WebSocketServer = require('ws').Server;
var wss = new WebSocketServer({port: 8181});

wss.broadcastAll = function(data) {
    for(var i in this.clients)
        this.clients[i].send(data);
};

wss.broadcastOthers = function(ws, data) {
    for(var i in wss.clients) {
        if(wss.clients[i] !== ws) {
            wss.clients[i].send(data);
        }
    }
}

const SPEED_MAX = 10000;
const SPEED_MIN = 2000;

var speed = 6000;
var states = [
    [0,0,0,0,0,0],
    [0,0,0,0,0,0],
    [0,0,0,0,0,0],
    [0,0,0,0,0,0],
    [0,0,0,0,0,0],
    [0,0,0,0,0,0]
];

var timebox = 0;

function updateStates() {
    if(timebox == 0) {
        wss.broadcastAll(JSON.stringify({
            type: 'timesync',
            speed: speed
        }));
    }

    for(i in states) {
        if(states[i][timebox] == 1) {
            if(timebox == 0 || (timebox > 0 && states[i][timebox-1] != 1)) {
                setChannel(i, 255);
            }
        } else {
            if(timebox == 0 || (timebox > 0 && states[i][timebox-1] != 0)) {
                setChannel(i, 0);
            }
        }
    }

    if(++timebox > 11) {
        timebox = 0;
    }

    setTimeout(updateStates, (speed / 10));
}
updateStates();

function setChannel(channel, value) {
    data = Buffer([0x00, channel, value]);
    dev.controlTransfer(
        0x21, 0x02, 0x00, 0x00, data
    );
}

wss.on('connection', function(ws) {
    console.log('New client connected, sending states');

    ws.send(JSON.stringify({
        type: 'updateStates',
        states: states
    }));

    //Reset the channels
    for(var i = 0; i < 8; i++) {
        setChannel(i, 0);
    }

    ws.on('message', function(message) {
    	var parsedMessage = JSON.parse(message);

        if(parsedMessage['type'] == 'setState') {
            //TODO: Needs validation
            states = parsedMessage['states'];

            console.log('User set state: ', states);

            wss.broadcastOthers(ws, JSON.stringify({
                type: 'updateStates',
                states: states
            }));
        } else if(parsedMessage['type'] == 'setSpeed') {
            var p = parsedMessage['speed'];

            if(p > 100 || p < 0) {
                return;
            }

            speed = Math.abs((((SPEED_MIN - SPEED_MAX) / 100) * p) + SPEED_MAX);

            wss.broadcastOthers(ws, JSON.stringify({
                type: 'updateSpeed',
                speed: p
            }));
        }

    });
});