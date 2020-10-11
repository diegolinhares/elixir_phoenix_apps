defmodule ExMon.PokeApi.Client do
  use Tesla

  # O que é o plug?
  # É um mecanismo que o Elixir usa para ter vários módulos que agem com uma
  # conexão http. Vem do Elixir não do Phoenix.

  # O que é o Middleware?
  # É um mecanismo do Tesla para fazermos configurações e modificarmos nossa
  # requisição. Vale para requests e responses.

  # Não precisaremos fazer encode e decode de JSON.

  plug Tesla.Middleware.BaseUrl, "https://pokeapi.co/api/v2"
  plug Tesla.Middleware.JSON

  def get_pokemon(name) do
    "/pokemon/#{name}"
    |> get()
    |> handle_get()
  end

  defp handle_get({:ok, %Tesla.Env{status: 200, body: body}}), do: {:ok, body}
  defp handle_get({:ok, %Tesla.Env{status: 404}}), do: {:error, "Pokemon not found!"}
  defp handle_get({:error, _reason}), do: {:error}
end
