defmodule RealtimeChat.Repo.Migrations.CreateRoom do
  use Ecto.Migration

  def change do
    create table(:rooms) do
      add :user_id, :integer
      add :name, :string

      timestamps()
    end

  end
end
