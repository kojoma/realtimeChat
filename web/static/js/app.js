import {Socket} from "phoenix"

var socket = new Socket("/socket");
socket.connect();
var channel = socket.channel("rooms:lobby", {});
channel.join();

$("form").submit(function(e) {
    e.preventDefault();
    channel.push("send_message", {content: $("#input-send-message").val()});
    $("#input-send-message").val("");
});

channel.on("receive_message", function(dt) {
    var div =
        $("<div></div>", {"class": "received-message"})
        .text(dt.content);
    $("#received-messages").append(div);
});
