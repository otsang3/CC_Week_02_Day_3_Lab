require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../pub')
require_relative('../drinks')
require_relative('../customer')

class CustomerTest < MiniTest::Test

  def setup()
    @customer1=Customer.new("Paddy", 100, [], 45)
    @customer2=Customer.new("Paddy Jr", 20, [], 16)
    @drink1 = Drinks.new("Coke", 3.50)
    @drink2 = Drinks.new("Gin and Tonic", 4.50)
    @drinks = [@drink1, @drink2]
    @pub = Pub.new("The One Bar", 50, @drinks)
  end

  def test_customer_name()
    assert_equal("Paddy", @customer1.name)
  end

  def test_check_legal_drinking_age()
    assert_equal(true, @customer1.check_legal_drinking_age)
  end

  def test_money_spent_from_wallet()
    @customer1.money_spent_from_wallet(6)
    assert_equal(94, @customer1.wallet)
  end

  def test_add_drink_to_customer()
    @customer1.add_drink_to_customer(@drink2)
    assert_equal(1, @customer1.count_drinks)
  end

  def test_customer_takes_drink_from_pub()
    @customer1.customer_buys_drink(@pub, @drink2)
    assert_equal(1, @customer1.count_drinks)
    assert_equal(1, @pub.drink_count)
    assert_equal(95.5, @customer1.wallet)
    assert_equal(54.5, @pub.till)
  end

  def test_customer2_takes_drink_from_pub()
    @customer2.customer_buys_drink(@pub, @drink2)
    assert_equal(0, @customer2.count_drinks)
    assert_equal(2, @pub.drink_count)
    assert_equal(20, @customer2.wallet)
    assert_equal(50, @pub.till)
  end








end
