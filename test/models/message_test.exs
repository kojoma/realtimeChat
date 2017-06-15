defmodule RealtimeChat.MessageTest do
  use RealtimeChat.ModelCase

  alias RealtimeChat.Message

  @valid_attrs %{content: "some content", room_id: 42, user_id: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Message.changeset(%Message{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Message.changeset(%Message{}, @invalid_attrs)
    refute changeset.valid?
  end
end
