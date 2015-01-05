require 'pry'
require 'time'
require_relative 'mastermind'
require_relative 'master_messages'

class Game
  attr_reader :msg, :mm, :guesses, :input

  def initialize
    @mm = Mastermind.new
    @msg = MasterMessage.new
    @guesses = 0
  end

  def game_sequence
    while input != mm.secret_pins
      until mm.guess_length_is_valid?(input) && mm.guess_colors_are_valid?(input)
        if input == 'q'
          break
          break
        elsif mm.guess_length_is_valid?(input) == false
          puts msg.invalid_guess_length
          puts msg.make_guess
          input = gets.chomp.downcase
        elsif mm.guess_colors_are_valid?(input) == false
          puts msg.invalid_colors
          puts msg.make_guess
          input = gets.chomp.downcase
        end
      end
      @guesses += 1
      mm.check_correct_positions(input)
      mm.check_correct_colors(input)
      puts "You guessed #{input}. You have #{mm.correct_colors} of the correct elements with #{mm.correct_pin_places} in the correct positions.\nYou've taken #{guesses} guess(es)."
      puts msg.make_guess
      input = gets.chomp.downcase
      if input == 'q'
        break
      end
    end


  end

  def play
    puts msg.welcome
    input = gets.chomp.downcase
    while input != 'q'
      case
      when input == 'i'
        puts msg.instructions
        input = gets.chomp.downcase
      when input == 'q'
        break
      when input == 'p'
        start_time = Time.new
        mm.generate_secret_pins
        puts msg.game_instructions
        input = gets.chomp.downcase
        game_sequence
        final_time = ((Time.now - Time.at(start_time)).to_i).divmod(60)
        puts msg.winning_message
        input = gets.chomp.downcase
      end
    end
  end

end

new_game = Game.new
new_game.play
