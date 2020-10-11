defmodule ExMonWeb.PokemonsController do
  use ExMonWeb, :controller

  # Investigar mais sobre action_fallback
  action_fallback ExMonWeb.FallbackController

  def show(conn, %{"name" => name}) do
    name
    |> ExMon.fetch_pokemon()
    |> handle_response(conn)
  end

  defp handle_response({:ok, pokemon}, conn) do
    conn
    |> put_status(:ok)
    # Parser dele com a struct feito com o parser, logo não precisa da view
    # As estruturas nativas do Elixir já conseguem ser encodadas para JSON.
    # Uma struct não consegue isso, mas, no caso como usamos o Tesla não precisamos.
    |> json(pokemon)
  end

  defp handle_response({:error, _reason} = error, _conn), do: error
end
