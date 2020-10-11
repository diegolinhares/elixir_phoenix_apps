defmodule ExMonGame.GameTest do
  use ExUnit.Case

  alias ExMonGame.{Game, Player}

  describe "start/2" do
    test "starts the game state" do
      player = Player.build("Bolsonaro", :kick, :punch, :heal)
      computer = Player.build("Lula", :kick, :punch, :heal)

      assert {:ok, _pid} = Game.start(computer, player)
    end
  end

  describe "info/0" do
    test "returns the current game state" do
      player = Player.build("Bolsonaro", :kick, :punch, :heal)
      computer = Player.build("Lula", :kick, :punch, :heal)

      Game.start(computer, player)

      expected_response = %{
        computer: %ExMonGame.Player{
          life: 100,
          moves: %{average_move: :punch, heal_move: :heal, random_move: :kick},
          name: "Lula"
        },
        player: %ExMonGame.Player{
          life: 100,
          moves: %{average_move: :punch, heal_move: :heal, random_move: :kick},
          name: "Bolsonaro"
        },
        status: :started,
        turn: :player
      }

      assert Game.info() == expected_response
    end
  end

  describe "update/1" do
    test "returns the game state updated" do
      player = Player.build("Bolsonaro", :kick, :punch, :heal)
      computer = Player.build("Lula", :kick, :punch, :heal)

      Game.start(computer, player)

      expected_response = %{
        computer: %ExMonGame.Player{
          life: 100,
          moves: %{average_move: :punch, heal_move: :heal, random_move: :kick},
          name: "Lula"
        },
        player: %ExMonGame.Player{
          life: 100,
          moves: %{average_move: :punch, heal_move: :heal, random_move: :kick},
          name: "Bolsonaro"
        },
        status: :started,
        turn: :player
      }

      assert Game.info() == expected_response

      new_state = %{
        computer: %ExMonGame.Player{
          life: 85,
          moves: %{average_move: :punch, heal_move: :heal, random_move: :kick},
          name: "Lula"
        },
        player: %ExMonGame.Player{
          life: 50,
          moves: %{average_move: :punch, heal_move: :heal, random_move: :kick},
          name: "Bolsonaro"
        },
        status: :started,
        turn: :player
      }

      Game.update(new_state)

      expected_response = %{new_state | turn: :computer, status: :continue}

      assert Game.info() == expected_response
    end
  end
end
