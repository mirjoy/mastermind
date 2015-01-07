require 'pry'
require 'time'
require_relative 'mastermind'
require_relative 'master_messages'

class Game
  attr_reader :msg, :mastermind

  def initialize
    @mastermind = Mastermind.new
    @msg = MasterMessage.new
  end

  def get_input
    gets.chomp.downcase
  end

  def menu
    puts msg.welcome
    input = ""

    while input != 'q'
      puts msg.initial_instructions
      input = get_input

      case input
      when 'i'
        puts msg.instructions
      when 'p'
        play
      when 'q'
        puts "Seeya"
        break
      else
        puts msg.invalid_menu_choice
      end
    end
  end

  def quitting?(input)
    ["exit", "q", "quit", "die!"].include?(input)
  end

  def play
    mastermind.start
    puts msg.game_instructions

    input = get_input

    until mastermind.winner?(input) || quitting?(input)
      feedback = mastermind.guess(input)
      if feedback
        correct_colors = feedback[0]
        correct_positions = feedback[1]

        puts msg.feedback(mastermind.secret_pins,
                          input,
                          correct_colors,
                          correct_positions,
                          mastermind.guesses)
      end

      puts msg.make_guess
      input = get_input
    end

    if mastermind.winner?(input)
      final_time = mastermind.game_time
      puts msg.congrats(@input, @guesses, final_time[0], final_time[1])
    end
  end
end

new_game = Game.new
new_game.menu
