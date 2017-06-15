defmodule RealtimeChat.PageController do
  use RealtimeChat.Web, :controller

  alias RealtimeChat.Message

  def index(conn, _params) do
    # ロビーはroom_id=0
    messages = Message.find_by_room(Message, 0)
    render(conn, "index.html", messages: messages)
  end
end
