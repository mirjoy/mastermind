
class Mastermind

  attr_reader :msg, :correct_pin_places, :correct_colors, :available_colors
  attr_accessor :secret_pins, :guessed_pins

  def initialize
    @available_colors = ['r','g','b','y']
  end

  def winner?(input)
    secret_pins == guessed_pins
  end

  def generate_secret_pins
    @secret_pins = (available_colors * 4).shuffle.sample(4).join
  end

  def guess_length_is_valid?(input)
    guessed_pins.length == secret_pins.length
  end

  def guess_colors_are_valid?(input)
    input.chars.uniq.all? {|color| available_colors.include?(color)}
  end

  def everything_valid?(input)
    guess_length_is_valid?(input) && guess_colors_are_valid?(input)
  end

  def check_correct_positions(input)
    num_arr = (0..secret_pins.length - 1).to_a
    @correct_pin_places = 0

    num_arr.each do |num|
      if secret_pins[num] == guessed_pins[num]
        @correct_pin_places += 1
      end
    end
  end

  def check_correct_colors(input)
    @correct_colors = 0

    secret_pins.chars.uniq.each do |color|
      if guessed_pins.chars.uniq.include?(color)
        @correct_colors += 1
      end
    end
  end



end
