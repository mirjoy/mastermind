require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/game'
require './lib/mastermind'


class GameTest < Minitest::Test
  attr_reader :game

  def setup
    @game = Game.new
  end

  def test_it_exists
    assert Game
  end

  def test_it_quits
    assert game.quitting?('q')
  end

  def test_it_doesnt_quit
    refute game.quitting?('a')
  end

  def test_input_valid
    game.mastermind.generate_secret_pins
    assert game.check_input_valid("rrrr")
  end

end
