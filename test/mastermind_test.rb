require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/mastermind'

class MastermindTest < Minitest::Test
  attr_reader :msg, :mastermind

  def setup
    @mastermind = Mastermind.new
  end

  def test_it_exists
    assert Mastermind
  end

  def test_it_starts_with_zero_guesses
    mastermind.start
    assert_equal 0, mastermind.guesses
  end

  def test_it_wins
    mastermind.secret_pins = "BBGB"
    assert mastermind.winner?("BBGB")
  end

  def test_it_loses
    mastermind.secret_pins = "BBGB"
    refute mastermind.winner?("BGGB")
  end

  def test_it_generates_pins
    pins = mastermind.generate_secret_pins
    assert_equal 4, pins.length
    assert pins.include?('r' || 'y' || 'g' || 'b')
  end

  def test_guess_length_is_valid
    mastermind.secret_pins = "BBGY"
    assert mastermind.guess_length_is_valid?("RRRY")
  end

  def test_guess_length_is_invalid
    mastermind.secret_pins = "BBGY"
    refute mastermind.guess_length_is_valid?("RRBRY")
  end

  def test_guess_colors_are_valid
    assert mastermind.guess_colors_are_valid?("rybg")
  end

  def test_guess_colors_are_invalid
    refute mastermind.guess_colors_are_valid?("rxbg")
  end

  def test_everything_valid
    mastermind.secret_pins = "rgrg"
    assert mastermind.everything_valid?("rggb")
  end

  def test_everything_not_valid
    mastermind.secret_pins = "rgrg"
    refute mastermind.everything_valid?("rxgbg")
  end

  def test_it_knows_how_many_positions_are_right
    mastermind.secret_pins = "BBGB"
    assert_equal 3, mastermind.check_correct_positions("BBBB")

  end

  def test_it_knows_how_many_colors_are_right
    mastermind.secret_pins = "BBGY"
    assert_equal 1, mastermind.check_correct_colors("RRBR")
  end

  def test_game_time
    mastermind.start_time = Time.now
    assert_equal [0,0], mastermind.game_time
  end

  def test_level_chosen
    mastermind.select_level("i")
    assert_equal 6, mastermind.num_pins
  end
end
