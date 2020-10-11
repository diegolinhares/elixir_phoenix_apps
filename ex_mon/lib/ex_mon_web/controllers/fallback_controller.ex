defmodule ExMonWeb.FallbackController do
  use ExMonWeb, :controller

  # Recebe o erro
  def call(conn, {:error, result}) do
    conn
    |> put_status(:bad_request)
    # O nome da view é diferente do controller, por isso usamos o
    # put_view
    |> put_view(ExMonWeb.ErrorView)
    |> render("400.json", result: result)
  end
end
