$(document).ready(function() {

	var socket = new WebSocket('ws://daedalus.synforge.com:8181');

	function change(evt) {
		var value = this.value;
		var channel = $(this).data('channel');

		socket.send(JSON.stringify({
			'value': value,
			'channel': parseInt(channel)
		}));
	}

	socket.addEventListener('message', function(evt) {
		var data = JSON.parse(evt.data);

		if(data.type == 'update') {
			$('.lightSlider[data-channel='+data.channel+']').val(data.value);
		}
	});

	$(function() {
		// Open the socket
		socket.onopen = function(event) {
			$('.lightSlider').change(change);
		};
	});

});