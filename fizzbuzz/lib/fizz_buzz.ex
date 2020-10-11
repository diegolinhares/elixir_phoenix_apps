defmodule FizzBuzz do
  def build(file_name) do
    file_name
    |> File.read()
    |> handle_file_read()
  end

  defp handle_file_read({:ok, file_content}) do
    file_content =
      file_content
      |> String.split(",")
      # Se precisar criar uma função que já existe e não quiser usar
      # uma anônima. Usa-se esse & e a aridade.
      |> Enum.map(&convert_and_evaluate_numbers/1)

    {:ok, file_content}
  end

  defp handle_file_read({:error, reason}), do: {:error, "Error reading the file: #{reason}"}

  defp convert_and_evaluate_numbers(number) do
    number
    |> String.to_integer()
    |> evaluate_numbers()
  end

  # Pattern Matching é sequencial
  defp evaluate_numbers(number) when rem(number, 3) == 0 and rem(number, 5) == 0, do: :fizzbuzz
  defp evaluate_numbers(number) when rem(number, 3) == 0, do: :fizz
  defp evaluate_numbers(number) when rem(number, 5) == 0, do: :buzz
  defp evaluate_numbers(number), do: number
end
