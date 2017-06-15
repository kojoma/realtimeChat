defmodule RealtimeChat.RoomChannel do
  use Phoenix.Channel

  alias RealtimeChat.Repo
  alias RealtimeChat.Message

  def join("rooms:lobby", _auth_msg, socket) do
    {:ok, socket}
  end
  def join("rooms:" <> _private_rood, _auth_msg, _socket) do
    {:error, %{reason: "unauthorized"}}
  end

  def handle_in("send_message", %{"content" => content}, socket) do
    # TODO: user_id, room_idはそれぞれの機能を作るときに適切な値をいれるように修正する
    message = %Message{
      user_id: 0,
      room_id: 0,
      content: content,
    }
    {:ok, _inserted_message} = Repo.insert(message)

    broadcast! socket, "receive_message", %{content: content}
    {:noreply, socket}
  end
end
