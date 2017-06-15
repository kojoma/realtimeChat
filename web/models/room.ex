defmodule RealtimeChat.Room do
  use RealtimeChat.Web, :model

  schema "rooms" do
    field :user_id, :integer
    field :name, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:user_id, :name])
    |> validate_required([:user_id, :name])
  end
end
