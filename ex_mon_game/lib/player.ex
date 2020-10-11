defmodule ExMonGame.Player do
  # Variáveis de Módulo (Constante)
  @required_keys [:life, :name, :moves]
  @max_life 100

  # Torna obrigatório as chaves
  @enforce_keys @required_keys
  # As chaves que a struct tem
  defstruct @required_keys

  def build(name, random_move, average_move, heal_move) do
    %__MODULE__{
      life: @max_life,
      name: name,
      moves: %{
        average_move: average_move,
        heal_move: heal_move,
        random_move: random_move
      }
    }
  end
end
