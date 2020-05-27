require 'minitest/autorun'
require 'minitest/pride'
require './lib/patron'
require './lib/exhibit'

class PatronTest < Minitest::Test

  def test_it_exists
    patron_1 = Patron.new("Bob", 20)
    assert_instance_of Patron, patron_1
  end

end
