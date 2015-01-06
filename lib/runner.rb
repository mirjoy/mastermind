require 'pry'
require 'time'
require_relative 'mastermind'
require_relative 'master_messages'

class Game
  attr_reader :msg, :mastermind, :guesses, :input

  def initialize
    @mastermind = Mastermind.new
    @msg = MasterMessage.new
    @input = ''
    @guesses
  end

  def menu
    puts msg.welcome

    while input != 'q'
      puts msg.initial_instructions
      input = gets.chomp.downcase
      binding.pry

      case
      when input == 'i'
        puts msg.instructions
      when input == 'p'
        play
      when input == 'q'
        break
      when input != 'q' || input != 'i' || input != 'p'
        puts msg.invalid_menu_choice
      end
    end
  end

  def check_input_valid(input)
    until mastermind.everything_valid?(input)
      if !mastermind.guess_length_is_valid?(input)
        puts msg.invalid_guess_length
        puts msg.make_guess
        input = gets.chomp.downcase
        binding.pry
      else !mastermind.guess_colors_are_valid?(input)
        puts msg.invalid_colors
        puts msg.make_guess
        input = gets.chomp.downcase
      break if input == 'q'
      end
    end
  end

  def play
    start_time = Time.new
    guesses = 0

    mastermind.generate_secret_pins
    puts msg.game_instructions
    input = gets.chomp.downcase
    binding.pry

    until mastermind.winner?(input)
      break if input == 'q'
      check_input_valid(input)
      guesses += 1
      mastermind.check_correct_positions(input)
      mastermind.check_correct_colors(input)
      puts msg.feedback(mastermind.secret_pins, input, mastermind.correct_colors, mastermind.correct_pin_places, guesses)
      puts msg.make_guess
      input = gets.chomp.downcase
    end

    final_time = ((Time.now - Time.at(start_time)).to_i).divmod(60)
    if mastermind.winner?(input) then puts msg.congrats(@input, @guesses, final_time[0], final_time[1]) end
  end

end

new_game = Game.new
new_game.menu
