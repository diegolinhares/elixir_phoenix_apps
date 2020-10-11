defmodule ExMonWeb.Router do
  use ExMonWeb, :router

  # Todas as rotas que utilizam esse pipeline, só aceitam o formato JSON.
  pipeline :api do
    # Plug pega a requisição modifica sua conexão antes de entrar na action do controller.
    plug :accepts, ["json"]
  end

  # Rotas ficam aqui
  scope "/api", ExMonWeb do
    pipe_through :api

    resources "/trainers", TrainersController, only: [:create, :show, :delete, :update]
    get "/pokemons/:name", PokemonsController, :show
    resources "/trainer_pokemons", TrainerPokemonsController, only: [:create, :show, :delete, :update]
  end

  scope "/", ExMonWeb do
    pipe_through :api

    get "/", WelcomeController, :index
  end
end
