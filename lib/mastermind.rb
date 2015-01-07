require 'colored'

class Mastermind

  attr_reader   :msg

  attr_accessor :secret_pins,
                :start_time,
                :guesses,
                :level,
                :available_color_string,
                :num_pins,
                :available_colors

  def initialize
    @available_colors = ['r','g','b','y']
    @available_color_string = '(r)ed'.red+', ' +'(g)reen'.green + ', ' + '(b)lue'.blue + ', ' + '(y)ellow'.yellow
    @level = ''
    @num_pins = 4
  end

  def start
    @start_time = Time.new
    @guesses = 0
  end

  def winner?(input)
    secret_pins == input
  end

  def generate_secret_pins
    @secret_pins = (available_colors * 4).shuffle.sample(num_pins).join
  end

  def guess_length_is_valid?(input)
    input.length == num_pins
  end

  def guess_colors_are_valid?(input)
    input.chars.uniq.all? {|color| available_colors.include?(color)}
  end

  def everything_valid?(input)
    guess_length_is_valid?(input) && guess_colors_are_valid?(input)
  end

  def check_correct_positions(input)
    num_arr = (0..secret_pins.length - 1).to_a
    correct_positions = 0

    num_arr.each do |num|
      if secret_pins[num] == input[num]
        correct_positions += 1
      end
    end

    return correct_positions
  end

  def check_correct_colors(input)
    correct_colors = 0

    secret_pins.chars.uniq.each do |color|
      if input.chars.uniq.include?(color)
        correct_colors += 1
      end
    end

    return correct_colors
  end

  def guess(input)
      everything_valid?(input)
      @guesses += 1
      correct_color = check_correct_colors(input)
      correct_positions = check_correct_positions(input)
      [correct_color, correct_positions]
  end

  def game_time
    ((Time.now - Time.at(start_time)).to_i).divmod(60)
  end

  def select_level(input)
    case input
      when 'b'
        @level = "beginner"
      when 'i'
        @level = "intermediate"
        @available_colors.push('w')
        @available_color_string = available_color_string + ", " + "(w)hite".white
        @num_pins = 6
      when 'a'
        @level = "advanced"
        @available_colors.push('w', 'm')
        @available_color_string = available_color_string + "," + "(w)hite".white + "(m)agenta".magenta
        @num_pins = 8
      end
      generate_secret_pins
  end


end
