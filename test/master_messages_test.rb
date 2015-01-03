require 'minitest/autorun'
require 'minitest/pride'
require './lib/master_messages'

class MasterMessagesTest
  def test_it_exists
    assert Message
  end

  def test_welcome
    assert.include?("Welcome") 
  end
end
