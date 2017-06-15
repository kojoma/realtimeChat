import {Socket} from "phoenix"

var socket = new Socket("/socket");
socket.connect();
var channel = socket.channel("rooms:lobby", {});
channel.join();

$("#send-message").submit(function(e) {
    e.preventDefault();
    var room_id = parseInt($("#room-id").val(), 10);
    var content = $("#input-send-message").val();
    // TODO: user_idはユーザ機能を作るときに適切な値をいれる
    var message = {
        user_id: 0,
        room_id: room_id,
        content: content
    };
    channel.push("send_message", message);
    $("#input-send-message").val("");
});

channel.on("receive_message", function(dt) {
    var div =
        $("<div></div>", {"class": "received-message"})
        .text(dt.content);
    $("#received-messages").append(div);
});
