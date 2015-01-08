require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/play_game'

class MenuTest < Minitest::Test
  attr_reader :menu

  def setup
    @menu = Menu.new
  end

  def test_it_exists
    assert Menu
  end

end
