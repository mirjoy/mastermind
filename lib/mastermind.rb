require './lib/master_messages'

class Mastermind

  attr_reader :msg, :correct_pin_places, :correct_colors, :available_colors
  attr_accessor :secret_pins, :guessed_pins

  def initialize
    @msg = MasterMessage.new
    @correct_pin_places = 0
    @correct_colors = 0
    @available_colors = ['r','g','b','y']
  end

  def generate_secret_pins
    secret_pins = (available_colors * 4).shuffle.sample(4).join
  end

  def guess_pin_places
    guessed_pins = gets.chomp.downcase
  end

  def guessed_pins_unique
    guessed_pins.chars.uniq
  end

  def guess_length_is_valid?
    guessed_pins.length == secret_pins.length
  end

  def guess_colors_are_valid?
    guessed_pins_unique.all? {|color| available_colors.include?(color)}
  end

  def check_correct_positions
    num_arr = (0..secret_pins.length - 1).to_a

    num_arr.each do |num|
      if secret_pins[num] == guessed_pins[num]
        @correct_pin_places += 1
      end
    end
  end

  def check_correct_colors
    secret_pins.chars.uniq.each do |color|
      if guessed_pins_unique.include?(color)
        @correct_colors += 1
      end
    end
  end

  def execute(input)
    if input == secret_pins
       msg.game_end
    else
       msg.make_guess
    end
  end
end
