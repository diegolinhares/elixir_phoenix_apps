defmodule ExMonGameTest do
  use ExUnit.Case
  alias ExMonGame.Player
  import ExUnit.CaptureIO

  describe "create_player" do
    test "returns a player" do
      expected_response = %Player{
        life: 100,
        moves: %{average_move: :push, heal_move: :heal, random_move: :kick},
        name: "Lula"
      }

      assert expected_response == ExMonGame.create_player("Lula", :kick, :push, :heal)
    end
  end

  describe "start_game" do
    test "when the game is started, returns a message" do
      player = ExMonGame.create_player("Lula", :kick, :push, :heal)

      expected_response = %{
        computer: %ExMonGame.Player{
          life: 100,
          moves: %{average_move: :kick, heal_move: :heal, random_move: :punch},
          name: "Bolsonaro"
        },
        player: %ExMonGame.Player{
          life: 100,
          moves: %{average_move: :push, heal_move: :heal, random_move: :kick},
          name: "Lula"
        },
        status: :started,
        turn: :player
      }

      messages =
        capture_io(fn ->
          assert ExMonGame.start_game(player) == expected_response
        end)

      assert messages =~ "O jogo começou."
    end
  end

  describe "make_move/1" do
    setup do
      player = ExMonGame.create_player("Lula", :kick, :push, :heal)

      capture_io(fn ->
        ExMonGame.start_game(player)
      end)

      :ok
    end

    test "when the move is valid, do the move and the computer makes a move" do
      messages =
        capture_io(fn ->
          assert ExMonGame.make_move(:kick)
        end)

      assert messages =~ "Player atacou computado"
    end

    test "when the move is invalid, returns an error message" do
      messages =
        capture_io(fn ->
          assert ExMonGame.make_move(:kickado)
        end)

      assert messages =~ "inválido"
    end
  end
end
