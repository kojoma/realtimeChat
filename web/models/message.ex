defmodule RealtimeChat.Message do
  use RealtimeChat.Web, :model

  import Ecto.Query

  alias RealtimeChat.Repo

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

  @spec find_by_room(Ecto.Queryable.t, integer) :: [Message]
  def find_by_room(query, id) do
    query
    |> where(room_id: ^id)
    |> Repo.all
  end
end
