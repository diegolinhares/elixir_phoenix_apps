defmodule ExMonWeb.ErrorView do
  use ExMonWeb, :view

  # Importa a função do Ecto.Changeset que lida com mostrar os erros
  # amigáveis. Quando se importa apenas uma função você deve definir a aridade
  # que no caso é 2.
  import Ecto.Changeset, only: [traverse_errors: 2]

  def template_not_found(template, _assigns) do
    %{errors: %{detail: Phoenix.Controller.status_message_from_template(template)}}
  end

  # Aplicando pattern matching para um changeset
  def render("400.json", %{result: %Ecto.Changeset{} = result}) do
    %{message: translate_errors(result)}
  end

  def render("400.json", %{result: message}) do
    %{message: message}
  end

  # Método do Ecto
  defp translate_errors(changeset) do
    traverse_errors(changeset, fn {msg, opts} ->
      Enum.reduce(opts, msg, fn {key, value}, acc ->
        String.replace(acc, "%{#{key}}", to_string(value))
      end)
    end)
  end
end
