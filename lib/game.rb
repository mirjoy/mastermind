require 'pry'
require 'time'
require 'colored'
require './lib/mastermind'
require './lib/master_messages'

class Game
  attr_reader :msg, :mastermind

  def initialize
    @mastermind = Mastermind.new
    @msg = MasterMessage.new
  end

  def get_input
    gets.chomp.downcase
  end

  def quitting?(input)
    ["exit", "q", "quit", "die!"].include?(input)
  end

  def check_input_valid(input)
    until mastermind.everything_valid?(input)
      if !mastermind.guess_length_is_valid?(input)
        puts msg.invalid_guess_length(mastermind.num_pins)
      else !mastermind.guess_colors_are_valid?(mastermind.available_color_string)
        puts msg.invalid_colors(mastermind.available_color_string)
      end
      puts msg.make_guess
      input = get_input
    end
    input
  end

  def play
    mastermind.start

    puts msg.choose_level
    input = get_input
    mastermind.select_level(input)

    puts msg.game_instructions(mastermind.level,
                              mastermind.num_pins,
                              mastermind.available_color_string)
    input = get_input

    until mastermind.winner?(input) || quitting?(input)
      check_input_valid(input)

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
