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
        document.getElementById('chat').onkeydown = null;
        Console.log('Info: WebSocket closed.');
    };

    Chat.socket.onmessage = function (message) {
        Console.log(message.data);
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
    var message = attack;
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