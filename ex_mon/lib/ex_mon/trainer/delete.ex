defmodule ExMon.Trainer.Delete do
  alias ExMon.{Trainer, Repo}
  alias Ecto.UUID

  def call(id) do
    id
    |> UUID.cast
    |> delete_trainer()
  end

  defp delete_trainer({:ok, uuid}), do: delete(uuid)

  defp delete_trainer(:error), do: {:error, "Invalid UUID"}

  defp delete(uuid) do
    Repo.get(Trainer, uuid)
    |> fetch_trainer()
  end

  defp fetch_trainer(nil), do: {:error, "Trainer not found!"}

  defp fetch_trainer(trainer), do: Repo.delete(trainer)
end
