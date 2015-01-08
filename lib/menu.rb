require './lib/master_messages'
require './lib/game_runner'

class Menu
  attr_reader :msg, :game

  def initialize
    @msg = MasterMessage.new
    @game = Game.new
  end

  def game_menu
    puts msg.welcome
    input = ""

    while input != 'q'
      puts msg.initial_instructions
      input = game.get_input

      case input
      when 'i'
        puts msg.instructions
      when 'p'
        game.play
      when 'q'
        puts "Hasta la bye bye."
        break
      end
    end
  end
end
#
# new_game = Menu.new
# new_game.game_menu
