defmodule RealtimeChat.Repo.Migrations.CreateMessage do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :user_id, :integer
      add :room_id, :integer
      add :content, :text

      timestamps()
    end

  end
end
