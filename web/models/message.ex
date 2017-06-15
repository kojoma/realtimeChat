defmodule RealtimeChat.Message do
  use RealtimeChat.Web, :model

  schema "messages" do
    field :user_id, :integer
    field :room_id, :integer
    field :content, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:user_id, :room_id, :content])
    |> validate_required([:user_id, :room_id, :content])
  end
end
