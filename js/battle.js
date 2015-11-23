var Chat = {};
var attack;

Chat.socket = null;

Chat.connect = (function(host) {
    if ('WebSocket' in window) {
        Chat.socket = new WebSocket(host);
    } else if ('MozWebSocket' in window) {
        Chat.socket = new MozWebSocket(host);
    } else {
        Console.log('Error: WebSocket is not supported by this browser.');
        return;
    }

    Chat.socket.onopen = function () {
        Console.log('A battle has started.');
    };

    Chat.socket.onclose = function () {
        $('#info-stuff').html("The battle has ended...");
        Console.log('Battle has ended.');
    };

    Chat.socket.onmessage = function (message) {
        var resp = JSON.parse(message.data);
        if(typeof resp.myHealth !== 'undefined'){
            $('#myHealth').html(resp.myHealth);
            $('#hisHealth').html(resp.hisHealth);
            $('#mainHealth').val(resp.myHealth);
            $('#oponHealth').val(resp.hisHealth);
            $('#info-stuff').html("Pick one attack...");
            if(resp.myHealth < 1 || resp.hisHealth < 1){
                window.location = "./setBattles";
            }
        }
        Console.log(resp.respuesta);
    };
});

Chat.initialize = function() {
    if (window.location.protocol == 'http:') {
        Chat.connect('ws://' + window.location.host + '/PokemonBattleRoyale2/battling');
    } else {
        Chat.connect('wss://' + window.location.host + '/PokemonBattleRoyale2/battling');
    }
};

Chat.sendMessage = (function() {
    var hisHealth = $('#oponHealth').val();
    var hisLevel = $('#oponLevel').val();
    var hisId = $('#oponPokeId').val();
    var myId = $('#mainPokeId').val();
    var message = attack + "," + hisHealth + "," + hisLevel + "," + hisId + "," + myId;
    $('#info-stuff').html("Waiting for other user command...");
    if (message != '') {
        Chat.socket.send(message);
    }
});

function setAttack(name){
    attack = name;
    Chat.sendMessage();
}

var Console = {};

Console.log = (function(message) {
    var console = document.getElementById('battle-log');
    console.innerHTML += message + '&#10;' + '&#13;';
    console.scrollTop = console.scrollHeight;
});

Chat.initialize();

document.addEventListener("DOMContentLoaded", function() {
    var noscripts = document.getElementsByClassName("noscript");
    for (var i = 0; i < noscripts.length; i++) {
        noscripts[i].parentNode.removeChild(noscripts[i]);
    }
}, false);