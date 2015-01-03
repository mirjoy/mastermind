require 'pry'
require_relative 'mastermind'
require_relative 'master_messages'

class Game
  attr_reader :msg, :mm, :guesses

  def initialize
    @mm = Mastermind.new
    @msg = MasterMessage.new
    @guesses = 0
  end

  def play
  #   while input != 'q'
  #     puts msg.welcome
  #     binding.pry
  #
  #     input = gets.chomp.downcase
  #     if input == 'i'
  #       puts msg.instructions
  #     else
  #       mm.generate_secret_pins
  #       puts msg.game_instructions
  #
  #       while guessed_pins != secret_pins
  #         puts msg.feedback
  #         input = guessed_pins
  #
  #         until guess_length_is_valid? && guess_colors_are_valid?
  #           if guess_length_is_valid? == false
  #             puts msg.invalid_guess_length
  #           else
  #             puts msg.invalid_colors
  #           end
  #           @guesses += 1
  #         end
  #       end
  #
  #     end
  #   end
  end

end

new_game = Game.new
new_game.play
