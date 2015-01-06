require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/mastermind'

class MastermindTest < Minitest::Test
  attr_reader :msg, :mastermind

  def setup
    @mastermind = Mastermind.new
  end

  def test_it_exists
    assert Mastermind
  end

  def test_it_wins
    mastermind.secret_pins = "BBGB"
    mastermind.input = "BBGB"
    assert mastermind.winner?(mastermind.input)
  end

  def test_it_loses
    mastermind.secret_pins = "BBGB"
    mastermind.input = "BGGB"
    refute mastermind.winner?(mastermind.input)
  end

  def test_it_knows_how_many_positions_are_right
    mastermind.secret_pins = "BBGB"
    mastermind.guessed_pins = "BBBB"
    mastermind.check_correct_positions(mastermind.guessed_pins)
    assert_equal 3, mastermind.correct_pin_places
  end

  def test_it_knows_how_many_colors_are_right
    mastermind.secret_pins = "BBGY"
    mastermind.guessed_pins = "RRBR"
    mastermind.check_correct_colors(mastermind.guessed_pins)
    assert_equal 1, mastermind.correct_colors
  end

  def test_guess_length_is_valid
    mastermind.secret_pins = "BBGY"
    mastermind.guessed_pins = "RRRY"
    assert mastermind.guess_length_is_valid?(mastermind.guessed_pins)
  end

  def test_guess_length_is_invalid
    mastermind.secret_pins = "BBGY"
    mastermind.guessed_pins = "RRBRY"
    refute mastermind.guess_length_is_valid?(mastermind.guessed_pins)
  end

  def test_guess_colors_are_valid
    mastermind.guessed_pins = "rybg"
    assert mastermind.guess_colors_are_valid?(mastermind.guessed_pins)
  end

  def test_guess_colors_are_invalid
    mastermind.guessed_pins = "rxbg"
    refute mastermind.guess_colors_are_valid?(mastermind.guessed_pins)
  end

  def test_everything_valid
    mastermind.input = "rggb"
    mastermind.secret_pins = "rgrg"
    assert mastermind.everything_valid?(mastermind.input)
  end

  def test_everything_not_valid
    mastermind.input = "rxgbg"
    mastermind.secret_pins = "rgrg"
    refute mastermind.everything_valid?(mastermind.input)
  end

end
