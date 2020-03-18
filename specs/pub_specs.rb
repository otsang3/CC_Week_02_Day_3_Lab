require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../pub')
require_relative('../drinks')
require_relative('../customer')

class PubTest < MiniTest::Test

  def setup
    @drink1 = Drinks.new("Coke", 3.50)
    @drink2 = Drinks.new("Gin and Tonic", 4.50)
    @drink = [@drink1, @drink2]
    @pub = Pub.new("The One Bar", 50, @drink)
  end

  def test_get_name()
    assert_equal("The One Bar", @pub.name)
  end

  def test_add_to_till()
    @pub.add_to_till(6)
    assert_equal(56, @pub.till)
  end

  def test_remove_drink_from_pub()
    @pub.remove_drink(@drink1)
    assert_equal(1, @pub.drink_count)
  end

end
