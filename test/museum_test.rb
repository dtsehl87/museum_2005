require 'minitest/autorun'
require 'minitest/pride'
require './lib/patron'
require './lib/exhibit'
require './lib/museum'

class MuseumTest < Minitest::Test

  def test_it_exists
    dmns = Museum.new("Denver Museum of Nature and Science")
    assert_instance_of Museum, dmns
  end

  def test_it_has_a_name
    dmns = Museum.new("Denver Museum of Nature and Science")
    assert_equal "Denver Museum of Nature and Science", dmns.name
  end

  def test_it_defaults_to_no_exhibits
    dmns = Museum.new("Denver Museum of Nature and Science")
    assert_equal [], dmns.exhibits
  end

end
