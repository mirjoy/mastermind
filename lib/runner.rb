require 'pry'
require 'time'
require_relative 'mastermind'
require_relative 'master_messages'

class Game
  attr_reader :msg, :mastermind, :guesses, :input

  def initialize
    @mastermind = Mastermind.new
    @msg = MasterMessage.new
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
        @guesses = 0
        start_time = Time.new
        mastermind.generate_secret_pins
        puts msg.game_instructions
        input = gets.chomp.downcase

        while input != mastermind.secret_pins
          until mastermind.guess_length_is_valid?(input) && mastermind.guess_colors_are_valid?(input)
            if input == 'q'
              break
            elsif mastermind.guess_length_is_valid?(input) == false
              puts msg.invalid_guess_length
              puts msg.make_guess
              input = gets.chomp.downcase
            elsif mastermind.guess_colors_are_valid?(input) == false
              puts msg.invalid_colors
              puts msg.make_guess
              input = gets.chomp.downcase
            end

          end
              @guesses += 1
              mastermind.check_correct_positions(input)
              mastermind.check_correct_colors(input)
              puts "You guessed #{input}. You have #{mastermind.correct_colors} of the correct elements with #{mastermind.correct_pin_places} in the correct positions.\nYou've taken #{guesses} guess(es)."
              puts msg.make_guess
              input = gets.chomp.downcase
              if input == 'q'
                break
              end
        end
        final_time = ((Time.now - Time.at(start_time)).to_i).divmod(60)
        puts "Congratulations you win! You guessed the sequence #{input} with #{guesses} guesses in #{final_time[0]} minutes, #{final_time[1]} seconds.
        \nDo you want to (p)lay again or (q)uit?"
        input = gets.chomp.downcase
      end

    end
  end

end

new_game = Game.new
new_game.play
