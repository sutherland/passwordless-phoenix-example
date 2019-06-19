defmodule Passwordless.Repo.Migrations.CreateLoginRequests do
  use Ecto.Migration

  def change do
    create table(:login_requests) do
      add :user_id, references(:users, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:login_requests, [:user_id])
  end
end
