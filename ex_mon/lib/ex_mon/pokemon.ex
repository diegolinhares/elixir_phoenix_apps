defmodule ExMon.Pokemon do
  @keys [:id, :name, :weight, :types, :nickname]

  # Obriga a ter todas as chaves
  @enforce_keys @keys

  # Automaticamente a struct consegue ser encodada para JSON
  @derive Jason.Encoder

  # Struct com todas as chaves
  defstruct @keys

  def build(%{"id" => id, "name" => name, "weight" => weight, "types" => types, "nickname" => nickname}) do
    # Devolve uma struct com o nome do módulo
    %__MODULE__{
      id: id,
      name: name,
      weight: weight,
      types: parse_types(types),
      nickname: nickname
    }
  end

  defp parse_types(types), do: Enum.map(types, fn item -> item["type"]["name"] end)
end
