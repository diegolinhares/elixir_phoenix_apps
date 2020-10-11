defmodule ExMonWeb.WelcomeController do
  # O use define que esse "arquivo" terá funcionalidades de um controller.
  use ExMonWeb, :controller

  # Toda action espera dois parâmetros
  def index(conn, _params) do
    text(conn, "Bem-vindo a ExMon API!")
  end
end
