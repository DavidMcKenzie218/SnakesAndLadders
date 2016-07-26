require_relative("./game")
require_relative('./adjuster')

class GameRunner

  def initialize(game)
    @game = game
  end

  def run_game
    puts"Welcome to Snakes and Ladders."
    puts"First to square #{@game.target}"

    while(!@game.winner) do
      play_turn()
    end
    puts "#{@game.winner[:name]} wins the game."
  end

  def play_turn
    puts"#{@game.current_player()[:name]}, Press ENTER to roll dice. "
    gets
    info = @game.play_turn(rand(1..6))
    show_turn_info(info)
  end

  def show_turn_info(turn_info)
    puts "#{turn_info[:player_name]} rolled a #{turn_info[:roll]}"

    adjustment = turn_info[:adjustmenr]

    if(adjustment)
      if (adjustment >0)
        puts "Nice you hit a ladder, move forward #{turn_info[:roll]}"
      else
        puts "OOH you hit a snake!n Move back #{adjustment}"
    end
  end

    puts"#{turn_info[:player_name]} is now at position #{turn_info[:end_position]}"
    puts "\n"
  end
end

adjuster  = Adjuster.new({4 => 2, 7 => -5})
game = Game.new("Jay", "Tony", 10, adjuster)
runner = GameRunner.new(game)
runner.run_game()