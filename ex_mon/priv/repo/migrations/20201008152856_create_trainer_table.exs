# Gerada pelo comando:
# mix ecto.gen.migration create_trainer_table

# Inserida no banco pelo comando:
# mix ecto.migrate

defmodule ExMon.Repo.Migrations.CreateTrainerTable do
  use Ecto.Migration

  def change do
    # No curso ele coloca primary_key como false para o phoenix não gerar inteiros
    # já que vai ser utilizado uuid.
    create table(:trainers, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string
      add :password_hash, :string
      timestamps()
    end
  end
end
