defmodule ExMonGame.Game.Status do
  def print_round_message(%{status: :started} = info) do
    IO.puts("O jogo começou.")
    IO.inspect(info)
  end

  def print_round_message(%{status: :continue, turn: player} = info) do
    IO.puts("É a vez do #{player}.")
    IO.inspect(info)
  end

  def print_round_message(%{status: :game_over} = info) do
    IO.puts("Game Over!")
    IO.inspect(info)
  end

  def print_wrong_move_message(move) do
    IO.puts("Movimento #{move} inválido.")
  end

  def print_move_message(:computer, :attack, damage) do
    IO.puts("Player atacou computador dando #{damage} de dano.")
  end

  def print_move_message(:player, :attack, damage) do
    IO.puts("Computador atacou player dando #{damage} de dano.")
  end

  def print_move_message(player, :heal, life) do
    IO.puts("#{player} curou ele mesmo em #{life} pontos de vida.")
  end
end
